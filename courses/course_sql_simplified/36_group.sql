/*
Lesson 36
*/

--SQL 01
SELECT
product_id,
product_name,
price,
supplier_id
FROM product;

--SQL 02
SELECT COUNT(*)
FROM product;

--SQL 03
SELECT
product_id,
product_name,
price,
supplier_id,
COUNT(*)
FROM product;

--SQL 04
SELECT
supplier_id,
COUNT(*)
FROM product;

--SQL 05
SELECT
supplier_id,
COUNT(*)
FROM product
GROUP BY supplier_id;

--SQL 06
SELECT
s.supplier_id,
s.supplier_name,
p.product_id
FROM product p
INNER JOIN supplier s ON p.supplier_id = s.supplier_id;


--SQL 07
SELECT
s.supplier_id,
s.supplier_name,
COUNT(*)
FROM product p
INNER JOIN supplier s ON p.supplier_id = s.supplier_id
GROUP BY s.supplier_id, s.supplier_name;