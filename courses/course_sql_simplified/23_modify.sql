/*
Lesson 23
*/

--SQL 01
ALTER TABLE product
ADD COLUMN product_id INT;

--SQL 02
ALTER TABLE product
ADD CONSTRAINT pk_product PRIMARY KEY (product_id);

--SQL 03
SELECT product_id, product_name, price
FROM product;

--SQL 04
UPDATE product
SET product_id = 1
WHERE product_name = 'Jacket';

--SQL 05
UPDATE product SET product_id = 2 WHERE product_name = 'Black Shoes';
UPDATE product SET product_id = 3 WHERE product_name = 'Shirt';
UPDATE product SET product_id = 4 WHERE product_name = 'Dress';
UPDATE product SET product_id = 5 WHERE product_name = 'Running shoes';
UPDATE product SET product_id = 6 WHERE product_name = 'Kids shoes';
UPDATE product SET product_id = 7 WHERE product_name = 'Black jumper';
UPDATE product SET product_id = 8 WHERE product_name = 'Red jumper';
UPDATE product SET product_id = 9 WHERE product_name = 'Dark blue jeans';
UPDATE product SET product_id = 10 WHERE product_name = 'Light blue jeans';
UPDATE product SET product_id = 11 WHERE product_name = 'Wide-brim hat';
UPDATE product SET product_id = 12 WHERE product_name = 'Long socks 2pk';
UPDATE product SET product_id = 13 WHERE product_name = 'Ankle socks 2pk';
UPDATE product SET product_id = 14 WHERE product_name = 'Ankle socks 5pk';
UPDATE product SET product_id = 15 WHERE product_name = 'Skirt, grey';
UPDATE product SET product_id = 16 WHERE product_name = 'Skirt, blue';
UPDATE product SET product_id = 17 WHERE product_name = 'Running shoes red';
UPDATE product SET product_id = 18 WHERE product_name = 'T-shirt black';
UPDATE product SET product_id = 19 WHERE product_name = 'T-shirt white';
UPDATE product SET product_id = 20 WHERE product_name = 'Long dress';
UPDATE product SET product_id = 21 WHERE product_name = 'Trenchcoat';
UPDATE product SET product_id = 22 WHERE product_name = 'Leather jacket';
UPDATE product SET product_id = 23 WHERE product_name = 'Boots';
UPDATE product SET product_id = 24 WHERE product_name = 'Brown boots';

--SQL 06
UPDATE product
SET product_id = 3
WHERE product_name = 'Jacket';

--SQL 07 - Oracle
ALTER TABLE product
ADD product_id NUMBER;

--SQL 08 - SQL Server
ALTER TABLE product
ALTER COLUMN product_id INT NOT NULL;