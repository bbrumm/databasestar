/*
Lesson 43
*/

--SQL 01
SELECT
p.product_id,
p.product_name,
p.price,
p.supplier_id,
p.category_id,
c.cat_count
FROM product p
INNER JOIN (
  SELECT
  category_id,
  COUNT(*) AS cat_count
  FROM product
  GROUP BY category_id
) c ON p.category_id = c.category_id;

--SQL 02
WITH category_count AS (
  SELECT
  category_id,
  COUNT(*) AS cat_count
  FROM product
  GROUP BY category_id
)
SELECT
p.product_id,
p.product_name,
p.price,
p.supplier_id,
p.category_id,
c.cat_count
FROM product p
INNER JOIN category_count c ON p.category_id = c.category_id;




