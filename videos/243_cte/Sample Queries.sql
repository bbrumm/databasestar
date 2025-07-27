CREATE TABLE customers (
    id INTEGER,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    CONSTRAINT pk_customers PRIMARY KEY (id)
);

CREATE TABLE orders (
    id INTEGER,
    customer_id INTEGER,
    order_total INTEGER,
    CONSTRAINT pk_orders PRIMARY KEY (id),
    CONSTRAINT fk_order_customer
        FOREIGN KEY (customer_id)
        REFERENCES customers (id)
);

INSERT INTO customers (id, first_name, last_name) VALUES
(1, 'Sarah', 'Jones'),
(2, 'Mark', 'Williamson'),
(3, 'Tony', 'Stark');

INSERT INTO orders (id, customer_id, order_total) VALUES
(1, 2, 510),
(2, 3, 100),
(3, 1, 300),
(4, 1, 800),
(5, 3, 650),
(6, 2, 200),
(7, 3, 180);


--Subquery
SELECT *
FROM customers
WHERE id IN (
  SELECT customer_id
  FROM orders
  GROUP BY customer_id
  HAVING SUM(order_total) > 1000
);

--View
DROP VIEW top_customers;

CREATE VIEW top_customers AS
SELECT customers.id,
       customers.first_name,
       customers.last_name,
       SUM(order_total) AS total_spent
FROM orders
INNER JOIN customers ON orders.customer_id = customers.id
GROUP BY customers.id,
       customers.first_name,
       customers.last_name
HAVING SUM(order_total) > 1000;

SELECT *
FROM top_customers;

--CTE
WITH order_totals AS (
  SELECT customer_id, SUM(order_total) AS total_spent
  FROM orders
  GROUP BY customer_id
)
SELECT c.id, c.first_name, c.last_name, o.total_spent
FROM customers c
JOIN order_totals o ON c.id = o.customer_id
WHERE o.total_spent > 1000;

/*
 Subquery: one off, simple logic
 View: reuse logic across multiple queries
 CTE: break your query into steps, reuse within a query
 */