/*
Lesson 18
*/

--SQL 01
SELECT product_name, price
FROM product
WHERE product_name = 'Jacket';

--SQL 02
SELECT product_name, price
FROM product
WHERE product_name = 'J';

--SQL 03
SELECT product_name, price
FROM product
WHERE product_name LIKE 'J';

--SQL 04
SELECT product_name, price
FROM product
WHERE product_name LIKE 'J%';

--SQL 05
SELECT product_name, price
FROM product
WHERE product_name LIKE '%s';

--SQL 06
SELECT product_name, price
FROM product
WHERE product_name LIKE '%S';

--SQL 07
SELECT product_name, price
FROM product
WHERE product_name LIKE '%e%';

--SQL 08
SELECT product_name, price
FROM product
WHERE product_name LIKE '_oots';