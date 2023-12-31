CREATE TABLE cust_order (
	order_id INT,
	customer_id INT,
	total_order_amount DECIMAL(8, 2)
);

INSERT INTO cust_order (order_id, customer_id, total_order_amount) VALUES
(1, 5, 120.15),
(2, 3, 68.69),
(3, 15, 240.41),
(4, 31, 629.55),
(5, 4, 89.12);

SELECT order_id, customer_id, total_order_amount
FROM cust_order;
