-- Video 339, Section 9: Updating and Deleting Data
-- Run the statements in order. Generated from the section script.


-- ---- Section 9: Updating and Deleting Data ----
USE online_store;


-- ---- UPDATE ----
UPDATE customers
SET email = 'alice.johnson@example.com'
WHERE customer_id = 1;

SELECT * FROM customers;

UPDATE customers
SET email = 'bob.smith@example.com'
WHERE customer_id = 2;

UPDATE customers
SET email = 'carol.white@example.com'
WHERE customer_id = 3;


-- ---- Updating Several Columns ----
ALTER TABLE products
ADD COLUMN product_id INT PRIMARY KEY AUTO_INCREMENT FIRST;

UPDATE products
SET price = 1499.00, stock_quantity = 10
WHERE product_id = 1;

UPDATE products
SET price = 29.95, stock_quantity = 80
WHERE product_id = 2;

UPDATE products
SET price = 89.00, stock_quantity = 45
WHERE product_id = 3;

-- EXPECTED ERROR (commented out so the file runs cleanly). Uncomment to demo it.
-- Blocked by Safe Updates (error 1175). WARNING: with Safe Updates off, this changes EVERY customer's city.
-- -- ---- Always Use WHERE with UPDATE ----
-- UPDATE customers
-- SET city = 'Sydney';


-- ---- Updating Several Rows at Once ----
INSERT INTO customers (name, email, city) VALUES
  ('Test Customer 1', 'test1@example.com', 'Hobart'),
  ('Test Customer 2', 'test2@example.com', 'Hobart'),
  ('Test Customer 3', 'test3@example.com', 'Hobart');

UPDATE customers
SET city = 'Adelaide'
WHERE customer_id > 8;


-- ---- DELETE ----
DELETE FROM customers
WHERE customer_id = 9;

-- EXPECTED ERROR (commented out so the file runs cleanly). Uncomment to demo it.
-- Blocked by Safe Updates (error 1175). WARNING: with Safe Updates off, this deletes EVERY customer.
-- -- ---- Always Use WHERE with DELETE ----
-- DELETE FROM customers;


-- ---- Safe Delete Patterns ----
SELECT * FROM customers
WHERE customer_id > 8;

DELETE FROM customers
WHERE customer_id > 8;


-- ---- Mini-Challenge ----
INSERT INTO products (name, price, stock_quantity)
VALUES ('Test Product', 9.99, 5);

SELECT * FROM products;

UPDATE products
SET price = 49.95
WHERE product_id = 10;

SELECT * FROM products
WHERE product_id = 11;

DELETE FROM products
WHERE product_id = 11;

SELECT * FROM products;
