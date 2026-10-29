-- Video 339, Section 18: Mini-Project
-- Run the statements in order. Generated from the section script.


-- ---- Step 1: Create the Database ----
CREATE DATABASE store_project;
USE store_project;


-- ---- Step 2: Create the Tables ----
CREATE TABLE customers (
  customer_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(255) NOT NULL,
  city VARCHAR(100)
);

CREATE TABLE products (
  product_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  category VARCHAR(50) NOT NULL,
  price DECIMAL(10,2) NOT NULL
);

CREATE TABLE orders (
  order_id INT PRIMARY KEY AUTO_INCREMENT,
  customer_id INT NOT NULL,
  order_date DATE NOT NULL,
  status VARCHAR(20) NOT NULL DEFAULT 'Pending',
  FOREIGN KEY (customer_id) REFERENCES customers (customer_id)
);

CREATE TABLE order_items (
  order_item_id INT PRIMARY KEY AUTO_INCREMENT,
  order_id INT NOT NULL,
  product_id INT NOT NULL,
  quantity INT NOT NULL,
  FOREIGN KEY (order_id) REFERENCES orders (order_id),
  FOREIGN KEY (product_id) REFERENCES products (product_id)
);


-- ---- Step 3: Insert the Data ----
INSERT INTO customers (name, email, city) VALUES
  ('Priya Sharma', 'priya.sharma@example.com', 'Melbourne'),
  ('Liam Connor', 'liam.connor@example.com', 'Sydney'),
  ('Mei Tanaka', 'mei.tanaka@example.com', 'Brisbane'),
  ('Jack Wilson', 'jack.wilson@example.com', 'Melbourne'),
  ('Sofia Rossi', 'sofia.rossi@example.com', 'Perth'),
  ('Noah Kim', 'noah.kim@example.com', 'Sydney'),
  ('Zoe Martin', 'zoe.martin@example.com', 'Adelaide'),
  ('Ethan Brown', 'ethan.brown@example.com', 'Melbourne');

INSERT INTO products (name, category, price) VALUES
  ('Wireless Mouse', 'Accessories', 29.95),
  ('Mechanical Keyboard', 'Accessories', 119.00),
  ('27-inch Monitor', 'Computers', 329.00),
  ('Laptop Stand', 'Accessories', 59.00),
  ('USB-C Hub', 'Accessories', 44.50),
  ('Noise-Cancelling Headphones', 'Audio', 249.00),
  ('Webcam HD', 'Audio', 89.95),
  ('Desk Lamp', 'Office', 39.95);

INSERT INTO orders (customer_id, order_date, status) VALUES
  (1, '2026-07-03', 'Delivered'),
  (2, '2026-07-09', 'Delivered'),
  (3, '2026-07-17', 'Delivered'),
  (1, '2026-07-28', 'Delivered'),
  (4, '2026-08-05', 'Delivered'),
  (5, '2026-08-12', 'Delivered'),
  (2, '2026-08-19', 'Delivered'),
  (6, '2026-08-26', 'Delivered'),
  (1, '2026-09-02', 'Delivered'),
  (3, '2026-09-10', 'Shipped'),
  (7, '2026-09-18', 'Pending'),
  (4, '2026-09-25', 'Pending');

INSERT INTO order_items (order_id, product_id, quantity) VALUES
  (1, 3, 1), (1, 1, 1),
  (2, 6, 1),
  (3, 2, 1), (3, 4, 1),
  (4, 5, 2),
  (5, 3, 1), (5, 5, 1),
  (6, 6, 1), (6, 1, 2),
  (7, 2, 1),
  (8, 4, 2),
  (9, 6, 1), (9, 2, 1),
  (10, 1, 3),
  (11, 5, 1), (11, 4, 1),
  (12, 3, 1);


-- ---- Step 4: Answer the Business Questions ----
SELECT p.name AS product,
       SUM(oi.quantity) AS units_sold,
       SUM(p.price * oi.quantity) AS revenue
FROM products p
INNER JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.name
ORDER BY revenue DESC;

SELECT c.name,
       SUM(p.price * oi.quantity) AS total_spent
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
INNER JOIN order_items oi ON o.order_id = oi.order_id
INNER JOIN products p ON oi.product_id = p.product_id
GROUP BY c.customer_id, c.name
ORDER BY total_spent DESC
LIMIT 5;

SELECT p.name, p.category
FROM products p
LEFT JOIN order_items oi ON p.product_id = oi.product_id
WHERE oi.order_item_id IS NULL;


-- ---- Step 5: Create a View ----
CREATE VIEW order_totals AS
SELECT o.order_id,
       o.customer_id,
       o.order_date,
       SUM(p.price * oi.quantity) AS order_total
FROM orders o
INNER JOIN order_items oi ON o.order_id = oi.order_id
INNER JOIN products p ON oi.product_id = p.product_id
GROUP BY o.order_id, o.customer_id, o.order_date;

SELECT YEAR(order_date) AS order_year,
       MONTH(order_date) AS order_month,
       COUNT(*) AS order_count,
       ROUND(AVG(order_total), 2) AS avg_order_value
FROM order_totals
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY order_year, order_month;

SELECT c.name,
       COUNT(*) AS orders,
       SUM(ot.order_total) AS total_spent
FROM customers c
INNER JOIN order_totals ot ON c.customer_id = ot.customer_id
GROUP BY c.customer_id, c.name
ORDER BY total_spent DESC
LIMIT 5;


-- ---- Step 6: Add an Index ----
CREATE INDEX idx_order_date
ON orders (order_date);

SHOW INDEX FROM orders;


-- ---- Bonus Challenge ----
SELECT c.city,
       SUM(ot.order_total) AS revenue
FROM customers c
INNER JOIN order_totals ot ON c.customer_id = ot.customer_id
GROUP BY c.city
ORDER BY revenue DESC;
