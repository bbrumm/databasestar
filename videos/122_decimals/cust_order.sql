CREATE TABLE cust_order (
  order_id INT,
  customer_id INT,
  total_order_amount DECIMAL(8, 2)
);

INSERT INTO cust_order (order_id, customer_id, total_order_amount) VALUES
(1, 4, 128.45),
(2, 18, 302.99),
(3, 2, 683.43),
(4, 13, 28.26);