-- Video 339, Section 17: Indexes
-- Run the statements in order. Generated from the section script.


-- ---- Section 17: Indexes ----
USE online_store;


-- ---- Indexes You Already Have ----
SHOW INDEX FROM customers;

SHOW INDEX FROM orders;


-- ---- Building a Bigger Table ----
CREATE TABLE index_demo (
  demo_id INT PRIMARY KEY AUTO_INCREMENT,
  customer_ref INT,
  amount DECIMAL(10,2)
);

SET SESSION cte_max_recursion_depth = 100000;

INSERT INTO index_demo (customer_ref, amount)
WITH RECURSIVE numbers AS (
  SELECT 1 AS n
  UNION ALL
  SELECT n + 1 FROM numbers WHERE n < 100000
)
SELECT FLOOR(1 + RAND() * 5000), ROUND(RAND() * 500, 2)
FROM numbers;

SELECT * FROM index_demo
WHERE customer_ref = 1234;


-- ---- EXPLAIN ----
EXPLAIN SELECT * FROM index_demo
WHERE customer_ref = 1234;


-- ---- CREATE INDEX ----
CREATE INDEX idx_customer_ref
ON index_demo (customer_ref);

EXPLAIN SELECT * FROM index_demo
WHERE customer_ref = 1234;

DROP TABLE index_demo;


-- ---- Mini-Challenge ----
SHOW INDEX FROM order_items;
