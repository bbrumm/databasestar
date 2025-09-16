--Set up tables
DROP TABLE cust_order;
DROP TABLE customers;

CREATE TABLE cust_order (
    id INT,
    status VARCHAR(200),
    customer_id INT,
    order_date DATE,
    total INT
);

CREATE TABLE customers (
    id SERIAL,
    name VARCHAR(200),
    email VARCHAR(400)
);

--Feature 1
SELECT
COUNT(CASE WHEN status = 'cancelled' THEN 1 ELSE NULL END) AS cancelled_orders
FROM cust_order;


SELECT
COUNT(*) FILTER (WHERE status = 'cancelled') AS cancelled_orders
FROM cust_order;


SELECT
COUNT(*) FILTER (WHERE status = 'cancelled') AS cancelled_orders,
COUNT(*) FILTER (WHERE status = 'completed') AS completed_orders
FROM cust_order;


--Feature 2
SELECT DISTINCT ON (customer_id)
  customer_id,
  order_date,
  total
FROM cust_order
ORDER BY customer_id, order_date DESC;

--Feature 3

INSERT INTO customers (name, email)
VALUES ('Ben', 'ben@example.com')
RETURNING id;

--Feature 4
CREATE TABLE new_users (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  ip_address INET,
  balance MONEY
);

--Feature 5
BEGIN;
CREATE TABLE test_table (id INT);
ROLLBACK;