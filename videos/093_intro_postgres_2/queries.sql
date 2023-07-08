/*
Queries from Introduction to PostgreSQL Part 2
*/

SELECT *
FROM product;

SELECT product_name, price
FROM product;

SELECT product_name
FROM product;

SELECT price
FROM product;

SELECT product_name, price
FROM product
WHERE product_name = 'Jeans';

SELECT product_name, price
FROM product
WHERE price > 80;

UPDATE product
SET price = 60;

UPDATE product
SET price = 100
WHERE product_name = 'Dress';

DELETE FROM product
WHERE product_name = 'Jeans';
