CREATE TABLE customer (
  customer_id INT,
  customer_name VARCHAR(100)
);

CREATE TABLE product_order (
  order_id INT,
  customer_id INT,
  order_date DATE
);

INSERT INTO customer (customer_id, customer_name) VALUES
(1, 'ABC Co'),
(2, 'Toy Shop Central'),
(3, 'XYZ Manufacturing');

INSERT INTO product_order (order_id, customer_id, order_date) VALUES
(3, 1, '2024-05-12'),
(5, 3, '2024-05-14'),
(6, NULL, '2024-05-17'),
(9, NULL, '2024-05-18');

SELECT * FROM customer;
SELECT * FROM product_order;

SELECT
customer.customer_id,
customer.customer_name,
product_order.order_id,
product_order.order_date
FROM customer
INNER JOIN product_order ON customer.customer_id = product_order.customer_id;



SELECT
customer.customer_id,
customer.customer_name,
product_order.order_id,
product_order.order_date
FROM customer
LEFT JOIN product_order ON customer.customer_id = product_order.customer_id;


SELECT
customer.customer_id,
customer.customer_name,
product_order.order_id,
product_order.order_date
FROM customer
RIGHT JOIN product_order ON customer.customer_id = product_order.customer_id;