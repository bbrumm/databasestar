/*
Lesson 09
*/

SELECT product_name, price
FROM product
WHERE product_name = 'Shirt';


SELECT product_name, price
FROM product
WHERE product_name != 'Shirt';

SELECT product_name, price
FROM product
WHERE product_name <> 'Shirt';

SELECT product_name, price
FROM product
WHERE product_name = 'Shir';