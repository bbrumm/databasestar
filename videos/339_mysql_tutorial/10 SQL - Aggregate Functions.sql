-- Video 339, Section 10: Aggregate Functions
-- Run the statements in order. Generated from the section script.


-- ---- Section 10: Aggregate Functions ----
USE online_store;


-- ---- COUNT ----
SELECT COUNT(*) AS customer_count
FROM customers;

SELECT COUNT(*) AS melbourne_customers
FROM customers
WHERE city = 'Melbourne';


-- ---- COUNT(*) vs COUNT(column) ----
INSERT INTO customers (name, city)
VALUES ('Test Customer', 'Hobart');

SELECT COUNT(*) AS all_customers,
       COUNT(email) AS customers_with_email
FROM customers;

DELETE FROM customers
WHERE customer_id = 12;


-- ---- SUM, AVG, MIN, and MAX ----
SELECT SUM(stock_quantity) AS total_units_in_stock
FROM products;

SELECT MIN(price) AS cheapest,
       MAX(price) AS most_expensive,
       AVG(price) AS average_price
FROM products;

SELECT ROUND(AVG(price), 2) AS average_price
FROM products;


-- ---- GROUP BY ----
SELECT city, COUNT(*) AS customer_count
FROM customers
GROUP BY city
ORDER BY customer_count DESC, city;


-- ---- Setting Up a Category Column ----
ALTER TABLE products
ADD COLUMN category VARCHAR(50);

UPDATE products SET category = 'Computers' WHERE product_id IN (1, 6);
UPDATE products SET category = 'Accessories' WHERE product_id IN (2, 3, 4, 5, 9);
UPDATE products SET category = 'Audio and Video' WHERE product_id IN (7, 8);
UPDATE products SET category = 'Office' WHERE product_id = 10;

SELECT category,
       COUNT(*) AS product_count,
       SUM(stock_quantity) AS units_in_stock,
       ROUND(AVG(price), 2) AS avg_price
FROM products
GROUP BY category
ORDER BY avg_price DESC;

-- EXPECTED ERROR (commented out so the file runs cleanly). Uncomment to demo it.
-- Error 1111: Invalid use of group function (aggregates belong in HAVING, not WHERE)
-- -- ---- HAVING ----
-- SELECT category, COUNT(*) AS product_count
-- FROM products
-- WHERE COUNT(*) > 1
-- GROUP BY category;

SELECT category, COUNT(*) AS product_count
FROM products
GROUP BY category
HAVING COUNT(*) > 1;


-- ---- WHERE vs HAVING ----
SELECT category, COUNT(*) AS product_count
FROM products
WHERE price < 100
GROUP BY category;

SELECT category, COUNT(*) AS product_count
FROM products
WHERE price < 100
GROUP BY category
HAVING COUNT(*) > 1;


-- ---- Mini-Challenge ----
SELECT category,
       MIN(price) AS lowest_price,
       MAX(price) AS highest_price
FROM products
GROUP BY category
HAVING COUNT(*) > 1;

SELECT SUM(stock_quantity) AS total_stock
FROM products
WHERE price < 100;

SELECT city, COUNT(*) AS customer_count
FROM customers
GROUP BY city
HAVING COUNT(*) >= 2;
