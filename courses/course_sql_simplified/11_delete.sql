/*
Lesson 11
*/

DELETE FROM product
WHERE product_name = 'Dress';

SELECT product_name, price
FROM product;

TRUNCATE TABLE product;

INSERT INTO product (product_name, price)
VALUES ('Shirt', 50);
INSERT INTO product (product_name, price)
VALUES ('Dress', 200);
INSERT INTO product (product_name)
VALUES ('Black Shoes');