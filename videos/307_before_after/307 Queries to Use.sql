
--SQL 01
--Original query. Runs in 6 mins 55 seconds.
SELECT
t.name AS track,
COUNT(*) AS near_price_pair_count
FROM invoice_line il1
INNER JOIN invoice_line il2
  ON il1.track_id = il2.track_id
 AND il1.invoice_line_id < il2.invoice_line_id
 AND ABS(il1.unit_price - il2.unit_price) <= 1.00
INNER JOIN track t
  ON t.track_id = il1.track_id
GROUP BY t.name
ORDER BY near_price_pair_count DESC
LIMIT 50;

--SQL 02

