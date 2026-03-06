
--SQL 01
--Original query. Runs in 6 mins 55 seconds when grouping by track name.
--Runs in X when grouping by track id and track name.
SELECT
t.track_id,
t.name AS track,
COUNT(*) AS near_price_pair_count
FROM invoice_line il1
INNER JOIN invoice_line il2
  ON il1.track_id = il2.track_id
 AND il1.invoice_line_id < il2.invoice_line_id
 AND ABS(il1.unit_price - il2.unit_price) <= 1.00
INNER JOIN track t
  ON t.track_id = il1.track_id
GROUP BY t.track_id, t.name
ORDER BY near_price_pair_count DESC
LIMIT 50;

--SQL 02
SELECT
t.track_id,
t.name AS track,
COUNT(*) AS near_price_pair_count
FROM invoice_line il1
INNER JOIN invoice_line il2
  ON il1.track_id = il2.track_id
 AND il1.invoice_line_id < il2.invoice_line_id
AND il2.unit_price >= il1.unit_price - 1.00
AND il2.unit_price <= il1.unit_price + 1.00
INNER JOIN track t
  ON t.track_id = il1.track_id
GROUP BY t.track_id, t.name
ORDER BY near_price_pair_count DESC
LIMIT 50;

--SQL 03
CREATE INDEX idx_invoiceline_unitprice
ON invoice_line (unit_price);

--SQL 04
CREATE INDEX idx_invoice_line_cover
ON invoice_line (track_id)
INCLUDE (invoice_line_id, unit_price);

ANALYZE invoice_line;

--Try this rewrite:
WITH price_counts AS (
  SELECT
    track_id,
    unit_price,
    COUNT(*) AS count_price
  FROM invoice_line
  GROUP BY track_id, unit_price
),
pairs AS (
  SELECT
    pc1.track_id,
    SUM(
      CASE
        WHEN pc2.unit_price = pc1.unit_price
          THEN pc1.count_price * (pc1.count_price - 1) / 2         -- combinations within same price
        ELSE pc1.count_price * pc2.count_price                      -- cross-price pairs
      END
    ) AS near_price_pair_count
  FROM price_counts pc1
  JOIN price_counts pc2
    ON pc2.track_id = pc1.track_id
   AND pc2.unit_price >= pc1.unit_price
   AND pc2.unit_price <= pc1.unit_price + 1.00
  GROUP BY pc1.track_id
)
SELECT
  t.name AS track,
  p.near_price_pair_count
FROM pairs p
JOIN track t
  ON t.track_id = p.track_id
ORDER BY p.near_price_pair_count DESC
LIMIT 50;

--Test

SELECT name, COUNT(*) AS track_ids
FROM track
GROUP BY name
HAVING COUNT(*) > 1
ORDER BY track_ids DESC, name;


SELECT track_id, name
FROM track
WHERE name IN ('Iron Maiden', 'Mão Na Cabeça')
ORDER BY name, track_id;

SElECT *
FROM track
WHERE name = 'Iron Maiden';

SELECT a.*
FROM album a
INNER JOIN track t ON t.album_id = a.album_id
WHERE t.name = 'Iron Maiden';

SELECT * FROM artist
WHERE artist_id IN (90, 117);


--Rewrite v2
WITH price_counts AS (
  SELECT
    track_id,
    unit_price,
    COUNT(*) AS count_price
  FROM invoice_line
  GROUP BY track_id, unit_price
),
pairs AS (
  SELECT
    pc1.track_id,
    SUM(
      CASE
        WHEN pc2.unit_price = pc1.unit_price
          THEN pc1.count_price * (pc1.count_price - 1) / 2         -- combinations within same price
        ELSE pc1.count_price * pc2.count_price                      -- cross-price pairs
      END
    ) AS near_price_pair_count
  FROM price_counts pc1
  JOIN price_counts pc2
    ON pc2.track_id = pc1.track_id
   AND pc2.unit_price >= pc1.unit_price
   AND pc2.unit_price <= pc1.unit_price + 1.00
  GROUP BY pc1.track_id
)
SELECT
  t.track_id,
  t.name AS track,
  SUM(p.near_price_pair_count) AS near_price_pair_count
FROM pairs p
JOIN track t
  ON t.track_id = p.track_id
GROUP BY t.track_id, t.name
ORDER BY near_price_pair_count DESC
LIMIT 50;