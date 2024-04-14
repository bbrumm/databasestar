/*
Lesson 31
*/

--SQL 01
SELECT ROUND(4.6);

--SQL 02
SELECT ROUND(4.6)
FROM dual;

--SQL 03
SELECT ROUND(4.3)
FROM dual;

--SQL 04
SELECT ROUND(price)
FROM product;

--SQL 05
SELECT price, ROUND(price)
FROM product;

--SQL 06
SELECT price, ROUND(price, -1)
FROM product;

--SQL 07
SELECT price, ROUND(price, -1) AS price_rounded
FROM product;

--SQL 08 - SQL Server
SELECT ROUND(4.6, 0);

--SQL 09 - SQL Server
SELECT ROUND(4.3, 0);

--SQL 10
SELECT price, ROUND(price, -1)
FROM product;

--SQL 11
SELECT
price,
price + 10,
price - 3
price * 5,
price / 2
FROM product;