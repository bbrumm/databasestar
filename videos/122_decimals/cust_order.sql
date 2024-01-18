DROP TABLE cust_order;

CREATE TABLE cust_order (
  order_id INT,
  customer_id INT,
  total_order_amount INT
);

INSERT INTO cust_order (order_id, customer_id, total_order_amount) VALUES
(1, 4, 12845),
(2, 18, 30299),
(3, 2, 68343),
(4, 13, 2826);

SELECT
order_id,
customer_id,
total_order_amount,
total_order_amount / 100 AS amount_dollars
FROM cust_order;