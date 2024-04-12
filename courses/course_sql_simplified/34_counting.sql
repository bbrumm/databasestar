/*
Lesson 34
*/

--SQL 01
SELECT *
FROM product;

--SQL 02
SELECT
COUNT(product_id)
FROM product;

--SQL 03
SELECT
COUNT(product_name)
FROM product;

--SQL 04
SELECT
product_id,
product_name
FROM product;

--SQL 05
SELECT
COUNT(*)
FROM product;

--SQL 06
SELECT
COUNT(1)
FROM product;

--SQL 07
SELECT product_id, product_name, price
FROM product
WHERE price > 100;

--SQL 08
SELECT COUNT(*)
FROM product
WHERE price > 100;
