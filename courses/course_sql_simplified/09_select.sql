/*
Lesson 09
*/

SELECT *
FROM product;


INSERT INTO product (product_name, price)
VALUES ('Dress', 200);

INSERT INTO product (product_name)
VALUES ('Black Shoes');

SELECT product_name, price
FROM product;

SELECT price, product_name
FROM product;

SELECT price
FROM product;