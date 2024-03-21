/*
Lesson 10
*/

SELECT product_name, price
FROM product;

UPDATE product
SET price = 80;

UPDATE product
SET price = 120
WHERE product_name = 'Shirt';

