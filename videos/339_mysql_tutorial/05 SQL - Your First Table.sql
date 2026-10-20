-- Video 339, Section 5: Your First Table
-- Run the statements in order. Generated from the section script.


-- ---- Section 5: Your First Table ----
USE online_store;


-- ---- CREATE TABLE ----
CREATE TABLE customers (
  name VARCHAR(100)
);


-- ---- DESCRIBE ----
DESCRIBE customers;


-- ---- SHOW TABLES ----
SHOW TABLES;


-- ---- INSERT INTO ----
INSERT INTO customers (name)
VALUES ('Alice Johnson');

INSERT INTO customers (name)
VALUES ('Bob Smith');

INSERT INTO customers (name)
VALUES ('Carol White');


-- ---- SELECT ----
SELECT * FROM customers;


-- ---- DROP TABLE ----
CREATE TABLE temp_test (
  name VARCHAR(100)
);

DROP TABLE temp_test;


-- ---- Mini-Challenge ----
CREATE TABLE products (
  name VARCHAR(100)
);

INSERT INTO products (name) VALUES ('Laptop');
INSERT INTO products (name) VALUES ('Mouse');
INSERT INTO products (name) VALUES ('Keyboard');

SELECT * FROM products;
