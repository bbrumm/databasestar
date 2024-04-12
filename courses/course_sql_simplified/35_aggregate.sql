/*
Lesson 35
*/

--SQL 01
SELECT MAX(price)
FROM product;

--SQL 02
SELECT *
FROM product;

--SQL 03
SELECT MIN(price)
FROM product;

--SQL 04
SELECT
MIN(start_date),
MAX(start_date)
FROM supplier;

--SQL 05
SELECT AVG(price)
FROM product;

--SQL 06
SELECT SUM(price)
FROM product;