/*
Introduction to PostgreSQL Lesson 3
*/

/*
Set up the table
*/

CREATE TABLE product (
  product_name VARCHAR(200),
  price INTEGER
);

INSERT INTO product (product_name, price)
VALUES ('Jeans', 100);

INSERT INTO product (product_name, price)
VALUES ('Dress', 100);

INSERT INTO product (product_name, price)
VALUES ('Shirt', 40);

INSERT INTO product (product_name, price)
VALUES ('Running shoes', 120);

INSERT INTO product (product_name, price)
VALUES ('T-shirt', 20);

SELECT product_name, price
FROM product;

/*
Create the table
*/
CREATE TABLE product (
  product_name VARCHAR(200),
  price INTEGER,
  in_stock VARCHAR(3)
);

/*
Alter table
*/
ALTER TABLE product ADD COLUMN in_stock VARCHAR(3);

SELECT product_name, price, in_stock
FROM product;

UPDATE product
SET in_stock = 'Yes'
WHERE product_name = 'Jeans'
OR product_name = 'Shirt';

ALTER TABLE product MODIFY COLUMN in_stock INTEGER;

UPDATE product
SET in_stock = 10
WHERE product_name = 'Jeans';

UPDATE product
SET in_stock = 4
WHERE product_name = 'Shirt';

ALTER TABLE product ALTER COLUMN in_stock TYPE INTEGER USING in_stock::integer;