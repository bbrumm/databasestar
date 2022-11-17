/*
Sample data for Window Functions
*/

CREATE TABLE orders (
  order_id INT,
  order_date DATE,
  order_total INT
);

INSERT INTO orders (order_id, order_date, order_total) VALUES
(1, '2022-04-03', 100),
(2, '2022-04-03', 250),
(3, '2022-04-04', 80),
(4, '2022-04-05', 10);

SELECT order_id, order_date, order_total
FROM orders;