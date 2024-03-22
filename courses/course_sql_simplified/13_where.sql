/*
Lesson 13
*/

SELECT product_name, price
FROM product;

SELECT product_name, price
FROM product
WHERE product_name = 'Dress'

SELECT product_name, price
FROM product
WHERE product_name != 'Dress'

SELECT product_name, price
FROM product
WHERE product_name <> 'Dress'


SELECT product_name, price
FROM product
WHERE price = 50;

SELECT product_name, price
FROM product
WHERE price > 50;

SELECT product_name, price
FROM product
WHERE price >= 50;


SELECT product_name, price
FROM product
WHERE price < 100;

SELECT product_name, price
FROM product
WHERE price <= 100;