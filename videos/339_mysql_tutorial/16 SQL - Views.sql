-- Video 339, Section 16: Views
-- Run the statements in order. Generated from the section script.


-- ---- Section 16: Views ----
USE online_store;


-- ---- CREATE VIEW ----
CREATE VIEW order_details AS
SELECT o.order_id,
       c.name AS customer_name,
       p.name AS product_name,
       oi.quantity,
       p.price * oi.quantity AS line_total
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id
INNER JOIN order_items oi ON o.order_id = oi.order_id
INNER JOIN products p ON oi.product_id = p.product_id;


-- ---- Querying a View ----
SELECT *
FROM order_details
ORDER BY order_id, product_name;

SELECT *
FROM order_details
WHERE customer_name = 'Alice Johnson'
ORDER BY order_id, product_name;

SELECT customer_name, SUM(line_total) AS total_spent
FROM order_details
GROUP BY customer_name
ORDER BY total_spent DESC;

SHOW FULL TABLES;

-- ---- CREATE OR REPLACE VIEW ----
-- EXPECTED ERROR (commented out so the file runs cleanly). Uncomment to demo it.
-- Error 1050: Table 'order_details' already exists (use CREATE OR REPLACE VIEW)
-- CREATE VIEW order_details AS
-- SELECT o.order_id, o.status AS order_status
-- FROM orders o;

CREATE OR REPLACE VIEW order_details AS
SELECT o.order_id,
       o.status AS order_status,
       c.name AS customer_name,
       p.name AS product_name,
       oi.quantity,
       p.price * oi.quantity AS line_total
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id
INNER JOIN order_items oi ON o.order_id = oi.order_id
INNER JOIN products p ON oi.product_id = p.product_id;

SELECT *
FROM order_details
WHERE order_status = 'Pending'
ORDER BY order_id;


-- ---- DROP VIEW ----
CREATE VIEW customer_cities AS
SELECT name, city
FROM customers;

DROP VIEW customer_cities;


-- ---- Mini-Challenge ----
CREATE VIEW customer_order_counts AS
SELECT c.customer_id,
       c.name,
       COUNT(o.order_id) AS order_count
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name;

SELECT *
FROM customer_order_counts
WHERE order_count >= 2;
