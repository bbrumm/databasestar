/*
Lesson 37
*/

--SQL 01
SELECT
supplier_id,
COUNT(*)
FROM product
GROUP BY supplier_id;

--SQL 02
SELECT
supplier_id,
COUNT(*)
FROM product
WHERE COUNT(*) >= 10
GROUP BY supplier_id;

--SQL 03
SELECT
supplier_id,
COUNT(*)
FROM product
GROUP BY supplier_id
HAVING COUNT(*) >= 10;