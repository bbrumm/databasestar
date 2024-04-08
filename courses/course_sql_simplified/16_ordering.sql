/*
Lesson 16
*/

-- SQL 01
SELECT product_name, price
FROM product;

-- SQL 02
SELECT product_name, price
FROM product
ORDER BY price ASC;

-- SQL 03
SELECT product_name, price
FROM product
ORDER BY price DESC;

-- SQL 04
SELECT product_name, price
FROM product
ORDER BY product_name ASC;

-- SQL 05
SELECT product_name, price
FROM product
ORDER BY 2 ASC;

-- SQL 06
SELECT price. product_name
FROM product
ORDER BY 2 ASC;

-- SQL 07
SELECT product_name, price
FROM product
ORDER BY price ASC, product_name ASC;