CREATE TABLE product (
  product_name VARCHAR(200),
  price INTEGER
);

INSERT INTO product (product_name, price)
VALUES (Jeans, 100);

INSERT INTO product (product_name, price)
VALUES ('Jeans', 100);


INSERT INTO product (product_name, price)
VALUES ('Dress', 100);

SELECT *
FROM product;