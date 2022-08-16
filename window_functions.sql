/*
SQL code for the YouTube video on Window Functions
This should work on Oracle, SQL Server, MySQL, and PostgreSQL,
but the data types for the tables may need to be adjusted
*/

/*
Set up data
*/

CREATE TABLE orders (
  order_id INT,
  order_date DATE,
  order_total INT
);

INSERT INTO orders (order_id, order_date, order_total) VALUES
(1, '2020-04-03', 100),
(2, '2020-04-03', 250),
(3, '2020-04-04', 80),
(4, '2020-04-05', 10);

/*
Select data
*/

SELECT
order_id,
order_date,
order_total
FROM orders;

/*
First window function example
*/

SELECT
order_id,
order_date,
order_total,
SUM(order_total) OVER (
  ORDER BY order_id ASC
) AS running_total
FROM orders
ORDER BY order_id ASC;

/*
Add more data
*/

INSERT INTO orders (order_id, order_date, order_total) VALUES
(5, '2020-04-03', 120),
(6, '2020-04-04', 90),
(7, '2020-04-04', 50),
(8, '2020-04-04', 15);

/*
Use a partition clause
*/

SELECT
order_id,
order_date,
order_total,
SUM(order_total) OVER (
  PARTITION BY order_date 
  ORDER BY order_id ASC) AS running_total
FROM orders
ORDER BY order_id ASC;

/*
Update the order by clause
*/

SELECT
order_id,
order_date,
order_total,
SUM(order_total) OVER (
  PARTITION BY order_date 
  ORDER BY order_id ASC) AS running_total
FROM orders
ORDER BY order_date ASC;
