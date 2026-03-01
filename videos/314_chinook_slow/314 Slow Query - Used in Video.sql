-- Intentionally slow but explainable:
-- Big join + GROUP BY + COUNT(DISTINCT ...) + ORDER BY aggregate
--Takes about 2.5 seconds to run

SELECT
  ar.name AS artist,
  c.country,
  COUNT(DISTINCT t.track_id) AS distinct_tracks_bought,
  SUM(il.unit_price * il.quantity) AS revenue
FROM customer c
JOIN invoice i       ON i.customer_id = c.customer_id
JOIN invoice_line il ON il.invoice_id = i.invoice_id
JOIN track t         ON t.track_id = il.track_id
JOIN album a         ON a.album_id = t.album_id
JOIN artist ar       ON ar.artist_id = a.artist_id
WHERE
  c.company IS NOT NULL
  AND i.invoice_date >= '2013-01-01'
GROUP BY
  ar.name,
  c.country
ORDER BY
  revenue DESC
LIMIT 100;

/*
 This has a bunch of Seq Scans on tables: invoice_line, invoice, customer, track, album, artist
 Unsure if any indexes are being used. Indexes exist on FKs
 What about index on invoice_date? Yes, but it is not used
 What about index on c.company? No, but what kind of index would help? Bitmap?
 */

SELECT 'Null' AS rowtype, COUNT(*) AS rowcount
FROM customer
WHERE company IS NULL
UNION ALL
SELECT 'Not Null' AS rowtype, COUNT(*) AS rowcount
FROM customer
WHERE company IS NOT NULL;

--There are 35k out of 50k rows that have a null company. So we are not excluding many rows at all.
--How about country?
SELECT country, COUNT(*)
FROM customer
GROUP BY country;

SELECT * FROM customer LIMIT 100;

--All of the extra rows are based in UK or Ireland.
--Can I filter on a city?

SELECT city, COUNT(*)
FROM customer
GROUP BY city
ORDER BY count(*) DESC;

--This could work, some cities have 5k, some have 2k, and the rest have 2 or 1.
--Maybe all orders in a city: London?

SELECT
  ar.name AS artist,
  COUNT(DISTINCT t.track_id) AS distinct_tracks_bought,
  SUM(il.unit_price * il.quantity) AS revenue
FROM customer c
JOIN invoice i       ON i.customer_id = c.customer_id
JOIN invoice_line il ON il.invoice_id = i.invoice_id
JOIN track t         ON t.track_id = il.track_id
JOIN album a         ON a.album_id = t.album_id
JOIN artist ar       ON ar.artist_id = a.artist_id
WHERE
  c.city = 'London'
  AND i.invoice_date >= '2013-01-01'
GROUP BY
  ar.name
ORDER BY
  revenue DESC
LIMIT 100;


--Orders seem to be all for a single artist.
--Was there an issue populating the extra data?

SELECT * FROM invoice ORDER BY invoice_id DESC LIMIT 100;

SELECT *
FROM invoice_line
ORDER BY invoice_id DESC
LIMIT 100;


  SELECT COUNT(*) FROM track;
--3503


SELECT
    i.invoice_id,
    t.track_id,
    (random() * (3503 - 1))::int AS random_track_id,
    t.unit_price,
    (1 + (random()*2)::int) AS quantity
  FROM invoice i
  CROSS JOIN generate_series(1, 5) ln
  -- Pick a random track by offset: fast enough for demos; for very large Track use other strategies
  JOIN LATERAL (
    SELECT track_id, unit_price
    FROM track
    OFFSET (random() * (3503 - 1))::int
    LIMIT 1
  ) t ON true;

--The same track ID is used for all rows

SELECT
    sub.invoice_id,
    sub.random_track_id AS track_id,
    t.unit_price,
    sub.quantity
FROM (SELECT i.invoice_id,
             (random() * (3503 - 1))::int AS random_track_id,
             (1 + (random() * 2)::int)    AS quantity
      FROM invoice i
               CROSS JOIN generate_series(1, 5) ln) sub
INNER JOIN track t ON sub.random_track_id = t.track_id;

--Find the invoice lines inserted for the original batch
SELECT track_id, count(*)
FROM invoice_line
GROUP BY track_id
ORDER BY count(*) DESC;

--Delete records for track ID 695
--SELECT *
DELETE
FROM invoice_line
WHERE track_id = 695
AND invoice_line_id > 2000;


--New query
--Runs in about 4 seconds
SELECT
  ar.name AS artist,
  COUNT(DISTINCT t.track_id) AS distinct_tracks_bought,
  SUM(il.unit_price * il.quantity) AS revenue
FROM customer c
JOIN invoice i       ON i.customer_id = c.customer_id
JOIN invoice_line il ON il.invoice_id = i.invoice_id
JOIN track t         ON t.track_id = il.track_id
JOIN album a         ON a.album_id = t.album_id
JOIN artist ar       ON ar.artist_id = a.artist_id
WHERE
  c.city = 'London'
  AND i.invoice_date >= '2013-01-01'
GROUP BY
  ar.name
ORDER BY
  revenue DESC
LIMIT 100;

/*
 Updated analysis:
 index scan on invoice_line which is good
 Full scan on all other tables
 Try adding an index on city
 */

 CREATE INDEX idx_customer_city ON customer(city);

/*
 Now it dows a Bitmap Index Scan on this new index
 Why does it not use an index on invoice_date?
 */

SELECT COUNT(*)
FROM invoice;
--500k rows total
--What is the distribution by year?

SELECT
    EXTRACT(YEAR FROM invoice_date) AS inv_year,
    COUNT(*)
FROM invoice
GROUP BY EXTRACT(YEAR FROM invoice_date);

/*
All invoices are from 2021 to 2026


Updated query
Runs in 2.3 s
*/

SELECT
  ar.name AS artist,
  COUNT(DISTINCT t.track_id) AS distinct_tracks_bought,
  SUM(il.unit_price * il.quantity) AS revenue
FROM customer c
JOIN invoice i       ON i.customer_id = c.customer_id
JOIN invoice_line il ON il.invoice_id = i.invoice_id
JOIN track t         ON t.track_id = il.track_id
JOIN album a         ON a.album_id = t.album_id
JOIN artist ar       ON ar.artist_id = a.artist_id
WHERE
  c.city = 'London'
  AND i.invoice_date >= '2024-01-01'
GROUP BY
  ar.name
ORDER BY
  revenue DESC
LIMIT 100;

/*
 Index scan on invoice line
 Bitmap index scan on city
 Full scan on invoice: probably low selectivity. This is good to keep as it's a good concept to demo

 From 2024 onwards, there are 215k invoices out of about 500k invoices.
So filtering on 2024 gets about 45% of records. Could be why the index is not used.

 Could we try a composite index?
 invoice - customer ID and invoice date
 customer ID is in the FK, adding invoice date may help
 */

 CREATE INDEX idx_invoice_customer_date
ON invoice (customer_id, invoice_date);

/*
 Same thing - no index used on invoice

 */


 SELECT count(*) FROM invoice;
SELECT count(*) FROM invoice WHERE invoice_date >= DATE '2024-01-01';
SELECT count(*)
FROM invoice i
JOIN customer c ON c.customer_id=i.customer_id
WHERE c.city='London' AND i.invoice_date >= DATE '2024-01-01';

/*
 This shows that only a certain percentage of rows match the filters
 Not selective enough for the database to use the index
 What can we do?

 View the execution plan again, a lot of invoice_line probes
invoice to invoice_line nested loop
 May create a covering index on all columns needed from this table
 */

/*
EXPLAIN (ANALYZE, BUFFERS)
SELECT
  ar.name AS artist,
  COUNT(DISTINCT t.track_id) AS distinct_tracks_bought,
  SUM(il.unit_price * il.quantity) AS revenue
FROM customer c
JOIN invoice i       ON i.customer_id = c.customer_id
JOIN invoice_line il ON il.invoice_id = i.invoice_id
JOIN track t         ON t.track_id = il.track_id
JOIN album a         ON a.album_id = t.album_id
JOIN artist ar       ON ar.artist_id = a.artist_id
WHERE
  c.city = 'London'
  AND i.invoice_date >= DATE '2024-01-01'
GROUP BY
  ar.name
ORDER BY
  revenue DESC
LIMIT 100;
 */


--Try the covering index:
CREATE INDEX idx_invoice_line_invoice_id_cover
ON invoice_line (invoice_id)
INCLUDE (track_id, unit_price, quantity);

/*
 New plan uses this index
 Total cost is now 48,417
 Before it was...?
Runs in about 1.6s
 Original was 2.3 seconds

 Is there a way we can restructure the query?

 Try pre-aggregate the invoices
 */

 WITH filtered_invoices AS (
  SELECT i.invoice_id
  FROM invoice i
  JOIN customer c ON c.customer_id = i.customer_id
  WHERE c.city = 'Paris'
    AND i.invoice_date >= DATE '2024-01-01'
)
SELECT
  ar.name AS artist,
  COUNT(DISTINCT t.track_id) AS distinct_tracks_bought,
  SUM(il.unit_price * il.quantity) AS revenue
FROM filtered_invoices fi
JOIN invoice_line il ON il.invoice_id = fi.invoice_id
JOIN track t         ON t.track_id = il.track_id
JOIN album a         ON a.album_id = t.album_id
JOIN artist ar       ON ar.artist_id = a.artist_id
GROUP BY ar.name
ORDER BY revenue DESC
LIMIT 100;


/*
 Runtime is about the same
 Cost of plan is about the same
 */

/*
 Lessons learned so far:
 Adding indexes can help a little, but the selectivity can impact whether an index is used or not
 Rewriting the query did not help in this case because maybe Postgres would handle it in the same way

 Final query had a small improvement, but not much because of selectivity
 Other filters, perhaps on other cities, would perform better, assuming it is a parameter
 Belfast or Paris
 Belfast, similar plan, high cost
 Paris, much lower cost, more selective, lots of indexes used
 */