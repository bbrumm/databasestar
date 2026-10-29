-- Video 352: 7 Ways Developers Use AI With Their Database
-- Demo queries for PostgreSQL, in the order they appear in the script.
-- Run "Video 352 - Sample Data.sql" first, in the video352 database.

-- =====================================================================
-- Way 1: Explain a query or schema you didn't write (Demo 2.1)
-- Paste this into explain_me.sql and ask Copilot to explain it.
-- You don't run it in the video. If you do want to run it, create the
-- index from Way 3 first: without it, the COUNT(*) subquery scans all
-- 2 million orders for every row and takes a very long time.
-- =====================================================================

SELECT c.customer_name,
  o.order_id,
  o.order_total,
  (SELECT COUNT(*)
   FROM orders o2
   WHERE o2.customer_id = c.customer_id) AS order_count
FROM customer c
JOIN orders o ON o.customer_id = c.customer_id
WHERE o.order_date >= CURRENT_DATE - INTERVAL '90 days'
  AND o.order_total > (SELECT AVG(order_total) FROM orders)
  AND c.customer_id NOT IN (SELECT customer_id FROM returns)
ORDER BY o.order_total DESC;

-- =====================================================================
-- Way 2: Draft a query from plain English (Demos 3.1 and 3.2)
-- schema.sql for Demo 3.2 is the customer and orders CREATE TABLE
-- statements from the script (also at the top of the Sample Data file).
--
-- Prompt: "Write a PostgreSQL query that shows each customer's name and
-- their total spend in the last 90 days, only for customers with more
-- than 3 orders in that period."
--
-- This is a correct answer to compare the AI's draft against.
-- Run it and the AI's version: they should return the same rows.
-- =====================================================================

SELECT c.customer_name,
       SUM(o.order_total) AS total_spend
FROM customer c
JOIN orders o ON o.customer_id = c.customer_id
WHERE o.order_date >= CURRENT_DATE - INTERVAL '90 days'
GROUP BY c.customer_id, c.customer_name
HAVING COUNT(o.order_id) > 3
ORDER BY total_spend DESC;

-- =====================================================================
-- Way 3: Review and tune a slow query (Demo 4.1)
-- One customer's order history. orders.customer_id has no index
-- (PostgreSQL doesn't index foreign key columns for you), so the plan
-- shows a scan of all 2 million orders to find this customer's ~20.
-- =====================================================================

-- Step 1: the slow query and its plan
EXPLAIN (ANALYZE)
SELECT c.customer_name,
       o.order_id,
       o.order_date,
       o.order_total
FROM customer c
JOIN orders o ON o.customer_id = c.customer_id
WHERE c.customer_id = 4821
ORDER BY o.order_date DESC;

-- Step 2: the likely AI suggestion. Apply it, then run Step 1 again
-- and compare the two plans side by side.
CREATE INDEX idx_orders_customer_id ON orders (customer_id);

-- Reset for another take: remove the index, then run Step 1 again
DROP INDEX IF EXISTS idx_orders_customer_id;

-- =====================================================================
-- Way 4: Debug an error message (Slide 8)
-- This produces the error on the slide:
--   ERROR: column "c.customer_name" must appear in the GROUP BY clause
--   or be used in an aggregate function
-- =====================================================================

-- Note: it groups by o.customer_id (from orders). Grouping by c.customer_id,
-- the primary key of customer, would NOT error in PostgreSQL, because
-- customer_name depends on that key.
SELECT o.customer_id,
       c.customer_name,
       SUM(o.order_total) AS total_spend
FROM customer c
JOIN orders o ON o.customer_id = c.customer_id
GROUP BY o.customer_id;

-- The fix: group by every column you select that isn't aggregated
SELECT o.customer_id,
       c.customer_name,
       SUM(o.order_total) AS total_spend
FROM customer c
JOIN orders o ON o.customer_id = c.customer_id
GROUP BY o.customer_id, c.customer_name;
