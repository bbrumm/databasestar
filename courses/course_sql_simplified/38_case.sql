/*
Lesson 38
*/

--SQL 01
SELECT
p.product_id,
p.product_name,
p.price,
c.category_id,
c.category_name,
s.supplier_id,
s.supplier_name
FROM product p
INNER JOIN product_category c ON p.category_id = c.category_id
INNER JOIN supplier s ON p.supplier_id = s.supplier_id;

--SQL 02
SELECT
p.product_id,
p.product_name,
p.price,
c.category_id,
c.category_name,
s.supplier_id,
s.supplier_name,
CASE
WHEN price < 100 THEN 'Affordable'
WHEN price >= 100 AND price <= 200 THEN 'Reasonable'
WHEN price > 200 THEN 'Expensive'
END AS price_rating
FROM product p
INNER JOIN product_category c ON p.category_id = c.category_id
INNER JOIN supplier s ON p.supplier_id = s.supplier_id;