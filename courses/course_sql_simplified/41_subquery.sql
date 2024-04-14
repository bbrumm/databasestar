/*
Lesson 41
*/

--SQL 01
SELECT AVG(price)
FROM product;

--SQL 02
SELECT product_id, product_name, price
FROM product
WHERE price > X;

--SQL 03
SELECT product_id, product_name, price
FROM product
WHERE price > (
    SELECT AVG(price)
    FROM product
);