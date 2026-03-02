-- Intentionally slow but explainable:
-- Big join + GROUP BY + COUNT(DISTINCT ...) + ORDER BY aggregate
--New query
--Runs in about 4 seconds

--SQL 01
SELECT
  ar.name AS artist,
  COUNT(DISTINCT t.track_id) AS distinct_tracks_bought,
  SUM(il.unit_price * il.quantity) AS revenue
FROM customer c
INNER JOIN invoice i ON i.customer_id = c.customer_id
INNER JOIN invoice_line il ON il.invoice_id = i.invoice_id
INNER JOIN track t ON t.track_id = il.track_id
INNER JOIN album a ON a.album_id = t.album_id
INNER JOIN artist ar ON ar.artist_id = a.artist_id
WHERE c.city = 'London'
AND i.invoice_date >= '2024-01-01'
GROUP BY ar.name
ORDER BY revenue DESC
LIMIT 100;

/*
 Execution Plan analysis:
 index scan on invoice_line which is good
 Full scan on all other tables
 Try adding an index on city
 */

--SQL 02
 CREATE INDEX idx_customer_city ON customer(city);

/*
Run the query, see run time, see execution plan
 Now it dows a Bitmap Index Scan on this new index
 Why does it not use an index on invoice_date?
 */

--SQL 03
SELECT COUNT(*)
FROM invoice;
--500k rows total
--What is the distribution by year?

--SQL 04
SELECT
    EXTRACT(YEAR FROM invoice_date) AS inv_year,
    COUNT(*)
FROM invoice
GROUP BY EXTRACT(YEAR FROM invoice_date);


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

--SQL 05
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


--SQL 06
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

--SQL 07
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

--SQL 08
SELECT city, COUNT(*)
FROM customer
GROUP BY city
ORDER BY count(*) DESC;

/*
Reset
*/

DROP INDEX idx_invoice_line_invoice_id_cover;
DROP INDEX idx_invoice_customer_date;
DROP INDEX idx_customer_city;