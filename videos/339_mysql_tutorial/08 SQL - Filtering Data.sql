-- Video 339, Section 8: Filtering Data
-- Run the statements in order. Generated from the section script.


-- ---- Section 8: Filtering Data ----
USE online_store;


-- ---- WHERE: The Basics ----
SELECT name, city
FROM customers
WHERE city = 'Sydney';


-- ---- Comparison Operators ----
SELECT name, price
FROM products
WHERE price > 50;

SELECT name, price
FROM products
WHERE price <= 45;

SELECT name, city
FROM customers
WHERE city != 'Melbourne';


-- ---- AND, OR, and NOT ----
SELECT name, price
FROM products
WHERE price > 30 AND price < 100;

SELECT name, city
FROM customers
WHERE city = 'Sydney' OR city = 'Perth';

SELECT name, city
FROM customers
WHERE NOT city = 'Melbourne';

SELECT name, price, stock_quantity
FROM products
WHERE price < 30 OR price > 200 AND stock_quantity < 20;

SELECT name, price, stock_quantity
FROM products
WHERE (price < 30 OR price > 200) AND stock_quantity < 20;


-- ---- IN and NOT IN ----
SELECT name, city
FROM customers
WHERE city IN ('Sydney', 'Perth');

SELECT name, city
FROM customers
WHERE city NOT IN ('Melbourne', 'Sydney');


-- ---- BETWEEN ----
SELECT name, price
FROM products
WHERE price BETWEEN 45 AND 129;


-- ---- IS NULL and IS NOT NULL ----
SELECT name, email
FROM customers
WHERE email = NULL;

SELECT name, email
FROM customers
WHERE email IS NULL;

SELECT name, email
FROM customers
WHERE email IS NOT NULL;

SELECT name, price
FROM products
WHERE price IS NULL;


-- ---- LIKE and Wildcards ----
SELECT name
FROM customers
WHERE name LIKE 'A%';

SELECT name
FROM customers
WHERE name LIKE '%son';

SELECT name
FROM products
WHERE name LIKE '%Lap%';

SELECT name
FROM products
WHERE name LIKE 'M_use';


-- ---- Mini-Challenge ----
SELECT name, city, email
FROM customers
WHERE city = 'Melbourne' AND email IS NULL;

SELECT name
FROM products
WHERE name LIKE 'L%';

SELECT name, stock_quantity
FROM products
WHERE stock_quantity BETWEEN 20 AND 40;
