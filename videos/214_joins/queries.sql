/*
Setup
*/

CREATE DATABASE jointest;

CREATE TABLE supplier (
  supplier_id INT,
  supplier_name VARCHAR(200),
  CONSTRAINT pk_supplier
    PRIMARY KEY (supplier_id)
);


CREATE TABLE product (
  product_id INT,
  product_name VARCHAR(200),
  supplier_id INT,
  price INT,
  CONSTRAINT pk_product
    PRIMARY KEY (product_id),
  CONSTRAINT fk_prod_supp
    FOREIGN KEY (supplier_id)
    REFERENCES supplier (supplier_id)
);



INSERT INTO supplier (supplier_id, supplier_name) VALUES
(1, 'Quality Goods');
INSERT INTO supplier (supplier_id, supplier_name) VALUES
(2, 'ABC Clothing');


INSERT INTO product (product_id, product_name, supplier_id, price)
VALUES (1, 'Shirt', 2, 50);

INSERT INTO product (product_id, product_name, supplier_id, price)
VALUES (2, 'Jeans', 1, 200);

INSERT INTO product (product_id, product_name, supplier_id, price)
VALUES (3, 'Jumper', 2, 100);

INSERT INTO product (product_id, product_name, supplier_id, price)
VALUES (4, 'Brown dress shoes', NULL, 180);

/* SQL 01 */

SELECT
product_name,
price,
supplier_name
FROM product
INNER JOIN supplier ON product.supplier_id = supplier.supplier_id;

/* SQL 02 */

SELECT
product_name,
price,
supplier_name
FROM product
INNER JOIN supplier USING (supplier_id);

/* SQL 03 */

ALTER TABLE supplier RENAME supplier_id TO id;

ALTER TABLE supplier RENAME id TO supplier_id;