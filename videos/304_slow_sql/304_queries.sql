--SQL 01

SELECT
    customer_id,
    customer_name
FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM orders
);


--SQL 02
SELECT DISTINCT
    c.customer_id,
    c.customer_name
FROM customers c
INNER JOIN orders o ON o.customer_id = c.customer_id;


--SQL 03
SELECT
    c.customer_id,
    c.customer_name,
    o.order_id,
    o.order_date,
    oi.product_name,
    oi.quantity
FROM customers c
INNER JOIN orders o ON o.customer_id = c.customer_id
INNER JOIN order_items oi ON oi.order_id = o.order_id
WHERE oi.product_name = 'Laptop'
  AND o.order_date >= CURRENT_DATE - INTERVAL '30' DAY;


--SQL 04
SELECT
    o.order_id,
    o.order_date,
    o.status,
    c.customer_id,
    c.customer_name,
    c.email,
    oi.order_item_id,
    oi.product_name,
    oi.quantity,
    oi.unit_price
FROM orders o
INNER JOIN customers c ON c.customer_id = o.customer_id
INNER JOIN order_items oi ON oi.order_id = o.order_id
WHERE o.order_id = 1001;

--SQL 05
SELECT
    c.customer_id,
    c.customer_name,
    o.order_id,
    o.order_date,
    oi.product_name,
    oi.quantity,
    ca.attribute_name,
    ca.attribute_value
FROM customers c
INNER JOIN orders o ON o.customer_id = c.customer_id
INNER JOIN order_items oi ON oi.order_id = o.order_id
INNER JOIN customer_attributes ca ON ca.customer_id = c.customer_id
WHERE oi.product_name = 'Laptop'
  AND o.order_date >= CURRENT_DATE - INTERVAL '30' DAY
  AND ca.attribute_name = 'Is Active';