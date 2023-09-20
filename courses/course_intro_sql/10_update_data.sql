/*
Lesson 10
*/

UPDATE product
SET price = 80
WHERE product_name = 'Shirt';

SELECT product_name, price
FROM product;


SELECT product_name, price
FROM product
WHERE price = 80;


SELECT product_name, price
FROM product
WHERE price = 50;