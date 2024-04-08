/*
Lesson 17
*/

--SQL 01
SELECT product_name, price
FROM product
WHERE price >= 100
AND price <= 200

--SQL 02
SELECT product_name, price
FROM product
WHERE price BETWEEN 100 AND 200;