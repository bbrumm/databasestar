-- Video 339, Section 12: Joins
-- Run the statements in order. Generated from the section script.


-- ---- Section 12: Joins ----
USE online_store;

SELECT * FROM orders;


-- ---- INNER JOIN ----
SELECT orders.order_id, customers.name, orders.status
FROM orders
INNER JOIN customers ON orders.customer_id = customers.customer_id
ORDER BY orders.order_id;

SELECT customers.name, orders.order_id
FROM customers
INNER JOIN orders ON customers.customer_id = orders.customer_id
ORDER BY customers.customer_id, orders.order_id;


-- ---- LEFT JOIN ----
SELECT customers.name, orders.order_id, orders.status
FROM customers
LEFT JOIN orders ON customers.customer_id = orders.customer_id
ORDER BY customers.customer_id, orders.order_id;

SELECT customers.name
FROM customers
LEFT JOIN orders ON customers.customer_id = orders.customer_id
WHERE orders.order_id IS NULL;


-- ---- RIGHT JOIN ----
SELECT customers.name, orders.order_id, orders.status
FROM orders
RIGHT JOIN customers ON orders.customer_id = customers.customer_id
ORDER BY customers.customer_id, orders.order_id;


-- ---- Joining More Than 2 Tables ----
SELECT orders.order_id,
       customers.name AS customer_name,
       products.name AS product_name,
       order_items.quantity,
       products.price * order_items.quantity AS line_total
FROM orders
INNER JOIN customers ON orders.customer_id = customers.customer_id
INNER JOIN order_items ON orders.order_id = order_items.order_id
INNER JOIN products ON order_items.product_id = products.product_id
ORDER BY orders.order_id, products.name;


-- ---- Table Aliases ----
SELECT o.order_id,
       c.name AS customer_name,
       p.name AS product_name,
       oi.quantity,
       p.price * oi.quantity AS line_total
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id
INNER JOIN order_items oi ON o.order_id = oi.order_id
INNER JOIN products p ON oi.product_id = p.product_id
ORDER BY o.order_id, p.name;

-- EXPECTED ERROR (commented out so the file runs cleanly). Uncomment to demo it.
-- Error 1052: Column 'customer_id' is ambiguous (use o.customer_id or c.customer_id)
-- SELECT customer_id, c.name
-- FROM orders o
-- INNER JOIN customers c ON o.customer_id = c.customer_id;


-- ---- Common Mistakes ----
SELECT COUNT(*) AS row_count
FROM customers
INNER JOIN orders;

SELECT o.order_id, c.name
FROM orders o
INNER JOIN customers c ON o.order_id = c.customer_id
ORDER BY o.order_id;


-- ---- Mini-Challenge ----
SELECT o.order_id, c.name, o.status
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id
WHERE o.status = 'Pending';

SELECT p.name, SUM(oi.quantity) AS total_sold
FROM products p
INNER JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.name
ORDER BY total_sold DESC, p.name;
