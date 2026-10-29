-- Video 339, Section 15: Subqueries
-- Run the statements in order. Generated from the section script.


-- ---- Section 15: Subqueries ----
USE online_store;


-- ---- A Subquery That Returns a Single Value ----
SELECT AVG(price) FROM products;

SELECT name, price
FROM products
WHERE price > (SELECT AVG(price) FROM products);


-- ---- A Subquery That Returns a List ----
SELECT name
FROM customers
WHERE customer_id IN (SELECT customer_id FROM orders);

SELECT name
FROM customers
WHERE customer_id NOT IN (SELECT customer_id FROM orders);


-- ---- A Subquery in the SELECT ----
SELECT c.name,
       (SELECT COUNT(*)
        FROM orders o
        WHERE o.customer_id = c.customer_id) AS order_count
FROM customers c;


-- ---- Subquery or Join? ----
SELECT c.name, COUNT(o.order_id) AS order_count
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name;


-- ---- Mini-Challenge ----
SELECT (SELECT COUNT(*) FROM orders) / (SELECT COUNT(*) FROM customers) AS avg_orders_per_customer;

SELECT c.name, COUNT(*) AS order_count
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
HAVING COUNT(*) > (SELECT COUNT(*) FROM orders) / (SELECT COUNT(*) FROM customers);
