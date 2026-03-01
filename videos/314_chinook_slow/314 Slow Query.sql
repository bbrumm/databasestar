-- Intentionally slow but explainable:
-- Big join + GROUP BY + COUNT(DISTINCT ...) + ORDER BY aggregate

SELECT
  ar.name AS artist,
  c.country,
  COUNT(DISTINCT t.trackid) AS distinct_tracks_bought,
  SUM(il.unitprice * il.quantity) AS revenue
FROM customer c
JOIN invoice i       ON i.customerid = c.customerid
JOIN invoice_line il ON il.invoiceid = i.invoiceid
JOIN track t         ON t.trackid = il.trackid
JOIN album a         ON a.albumid = t.albumid
JOIN artist ar       ON ar.artistid = a.artistid
WHERE
  c.email ILIKE '%gmail%'                     -- wildcard match
  AND EXTRACT(YEAR FROM i.invoicedate) = 2012 -- function on date column
GROUP BY
  ar.name,
  c.country
ORDER BY
  revenue DESC
LIMIT 50;