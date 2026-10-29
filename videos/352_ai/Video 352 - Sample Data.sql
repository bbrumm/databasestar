-- Video 352: 7 Ways Developers Use AI With Their Database
-- Sample data for PostgreSQL
--
-- Before you run this, create an empty database and connect to it:
--   CREATE DATABASE sampledata;
-- The tables go in the public schema, so the queries in the video run exactly as shown
-- (customer, orders, returns), without clashing with Chinook or other demo tables.
--
-- Tables:
--   customer  100,000 rows (some names repeat, emails are unique)
--   orders    2,000,000 rows, spread over the last 3 years up to today
--   returns   about 40,000 rows (roughly 2% of orders)
--
-- There is deliberately no index on orders.customer_id. That's the slow query in Way 3.
--
-- Run the whole script in one session. It takes about a minute.


SELECT setseed(0.352);

SET search_path TO video352;

DROP TABLE IF EXISTS returns;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customer;

CREATE TABLE customer (
  customer_id   INT PRIMARY KEY,
  customer_name VARCHAR(100),
  email         VARCHAR(100)
);

CREATE TABLE orders (
  order_id    INT PRIMARY KEY,
  customer_id INT REFERENCES customer(customer_id),
  order_date  DATE,
  order_total NUMERIC(10,2)
);

CREATE TABLE returns (
  return_id   INT PRIMARY KEY,
  order_id    INT NOT NULL REFERENCES orders(order_id),
  customer_id INT NOT NULL REFERENCES customer(customer_id),
  return_date DATE NOT NULL,
  reason      VARCHAR(100)
);

-- =====================================================================
-- customer: 100,000 fake people
-- =====================================================================

INSERT INTO customer (customer_id, customer_name, email)
SELECT g.id,
       n.first_name || ' ' || n.last_name,
       LOWER(n.first_name || '.' || n.last_name || g.id) || '@example.com'
FROM generate_series(1, 100000) AS g(id)
CROSS JOIN LATERAL (
  SELECT (ARRAY['Olivia','Liam','Charlotte','Noah','Amelia','Jack','Isla','William',
                'Mia','Oliver','Ava','Henry','Grace','Leo','Chloe','Thomas',
                'Sophie','James','Ruby','Lucas','Emily','Ethan','Zoe','Samuel',
                'Priya','Arjun','Mei','Wei','Sofia','Mateo','Aisha','Omar'])
           [1 + floor(random() * 32)::int + (g.id * 0)] AS first_name,
         (ARRAY['Smith','Jones','Williams','Brown','Wilson','Taylor','Nguyen','Johnson',
                'Martin','White','Anderson','Walker','Thompson','Harris','Lee','Ryan',
                'Robinson','Kelly','King','Davis','Wright','Evans','Patel','Singh',
                'Chen','Wang','Garcia','Lopez','Murphy','Clarke','Hughes','Scott'])
           [1 + floor(random() * 32)::int] AS last_name
) AS n;

-- =====================================================================
-- orders: 2,000,000 orders over the last 3 years
-- Dates are relative to today, so "the last 90 days" always has data
-- =====================================================================

INSERT INTO orders (order_id, customer_id, order_date, order_total)
SELECT g.id,
       1 + floor(random() * 100000)::int,
       CURRENT_DATE - floor(random() * 1095)::int,
       ROUND((10 + random() * 490)::numeric, 2)
FROM generate_series(1, 2000000) AS g(id);

-- =====================================================================
-- returns: about 2% of orders, returned 1 to 30 days after the order
-- =====================================================================

INSERT INTO returns (return_id, order_id, customer_id, return_date, reason)
SELECT ROW_NUMBER() OVER (ORDER BY o.order_id),
       o.order_id,
       o.customer_id,
       LEAST(o.order_date + 1 + floor(random() * 30)::int, CURRENT_DATE),
       (ARRAY['Damaged','Wrong item','Changed mind','Too late','Not as described'])
         [1 + floor(random() * 5)::int]
FROM orders o
WHERE random() < 0.02;

ANALYZE customer;
ANALYZE orders;
ANALYZE returns;

-- Quick check of the row counts
SELECT 'customer' AS table_name, COUNT(*) AS row_count FROM customer
UNION ALL
SELECT 'orders', COUNT(*) FROM orders
UNION ALL
SELECT 'returns', COUNT(*) FROM returns;
