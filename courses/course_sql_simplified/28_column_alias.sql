/*
Lesson 28
*/

--SQL 01
SELECT
p.product_id,
p.product_name,
p.price,
s.supplier_id, 
s.supplier_name,
s.start_date
FROM product p
INNER JOIN supplier s ON p.supplier_id = s.supplier_id;

--SQL 02
SELECT
product_id,
product_name,
price
FROM product;

--SQL 03
SELECT
product_id,
product_name,
price AS sale_price
FROM product;


--SQL 04
SELECT
product_id,
product_name,
price AS "Sale Price"
FROM product;

--SQL 05
SELECT
product_id,
product_name,
price sale_price
FROM product;

--SQL 06
SELECT product_id,
product_name
price
FROM product;