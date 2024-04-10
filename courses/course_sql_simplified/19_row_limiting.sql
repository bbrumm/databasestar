/*
Lesson 19
*/

--SQL 01
SELECT product_name, price
FROM product
WHERE price > 40;

--SQL 02
SELECT product_name, price
FROM product;

--SQL 03
SELECT product_name, price
FROM product
LIMIT 10;

--SQL 04
SELECT product_name, price
FROM product
ORDER BY price ASC
LIMIT 10;

--SQL 05
SELECT product_name, price
FROM product
ORDER BY price ASC
LIMIT 10 OFFSET 10;

--SQL 06
SELECT product_name, price
FROM product
ORDER BY price ASC
LIMIT 10 OFFSET 5;

--SQL 07 Oracle
SELECT product_name, price
FROM product
ORDER BY price ASC
FETCH FIRST 10 ROWS ONLY;

--SQL 08 Oracle
SELECT product_name, price
FROM product
ORDER BY price ASC
OFFSET 5 ROWS FETCH FIRST 10 ROWS ONLY;

--SQL 09 SQL Server
SELECT TOP 10 product_name, price
FROM product
ORDER BY price ASC;

--SQL 10 SQL Server
SELECT product_name, price
FROM product
ORDER BY price ASC
FETCH FIRST 10 ROWS ONLY;

SELECT product_name, price
FROM product
ORDER BY price ASC
OFFSET 0 ROWS
FETCH FIRST 10 ROWS ONLY;

--SQL 11 SQL Server
SELECT product_name, price
FROM product
ORDER BY price ASC
OFFSET 5 ROWS
FETCH FIRST 10 ROWS ONLY;

--SQL 12 MySQL
SELECT product_name, price
FROM product
ORDER BY price ASC
LIMIT 10;

--SQL 13 MySQL
SELECT product_name, price
FROM product
ORDER BY price ASC
LIMIT 5, 10;