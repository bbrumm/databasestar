/*
Lesson 32
*/

--SQL 01
SELECT
product_name,
UPPER(product_name)
FROM product;

--SQL 02
SELECT
product_name,
LOWER(product_name)
FROM product;

--SQL 03
SELECT
product_id,
product_name,
price,
supplier_id,
category_id
FROM product
WHERE UPPER(product_name) = 'SHIRT';