/*
Set up the data to reflect the end of Lesson 3.
*/

CREATE TABLE product (
  product_name VARCHAR(200),
  price INTEGER,
  in_stock INTEGER
);

INSERT INTO product (product_name, price, in_stock)
VALUES ('Jeans', 100, 10);

INSERT INTO product (product_name, price, in_stock)
VALUES ('Dress', 100, NULL);

INSERT INTO product (product_name, price, in_stock)
VALUES ('Shirt', 40, 4);

INSERT INTO product (product_name, price, in_stock)
VALUES ('Running shoes', 120, NULL);

INSERT INTO product (product_name, price, in_stock)
VALUES ('T-shirt', 20, NULL);