-- Video 339, Section 7: Selecting Data
-- Run the statements in order. Generated from the section script.


USE online_store;

-- ---- Section 7: Selecting Data ----
SELECT * FROM customers;


-- ---- SELECT * vs Selecting Specific Columns ----
SELECT name, city FROM customers;


-- ---- Column Aliases with AS ----
SELECT name AS customer_name, city FROM customers;


-- ---- ORDER BY ----
SELECT name, city FROM customers
ORDER BY name;

SELECT name, city FROM customers
ORDER BY name DESC;

SELECT name, city FROM customers
ORDER BY name ASC;

SELECT name, city FROM customers
ORDER BY city, name;


-- ---- LIMIT and OFFSET ----
SELECT name, city FROM customers
ORDER BY name
LIMIT 3;

SELECT name, city FROM customers
ORDER BY name
LIMIT 3 OFFSET 3;


-- ---- DISTINCT ----
SELECT city FROM customers;

SELECT DISTINCT city FROM customers;


-- ---- Mini-Challenge ----
INSERT INTO products (name, price, stock_quantity) VALUES ('Monitor', 249.00, 15);
INSERT INTO products (name, price, stock_quantity) VALUES ('Webcam', 79.95, 40);
INSERT INTO products (name, price, stock_quantity) VALUES ('Headphones', 129.00, 25);
INSERT INTO products (name, price, stock_quantity) VALUES ('USB Hub', 34.50, 60);
INSERT INTO products (name, price, stock_quantity) VALUES ('Desk Lamp', 45.00, 30);

SELECT name, price FROM products ORDER BY price DESC;

SELECT name, price FROM products ORDER BY price DESC LIMIT 3;

SELECT name, price AS unit_price FROM products;
