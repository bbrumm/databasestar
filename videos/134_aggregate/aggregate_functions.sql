/*
Aggregate functions
*/

SELECT
order_id,
order_date,
customer_id,
shipping_method_id,
dest_address_id
FROM cust_order;

SELECT COUNT(*)
FROM cust_order;

SELECT COUNT(*) AS count_rows
FROM cust_order;

SELECT SUM(price) AS total_price
FROM order_line;

SELECT MAX(order_date)
FROM cust_order;

SELECT
MAX(order_date),
MAX(order_id)
FROM cust_order;

SELECT
MAX(order_date) AS max_order_date,
MAX(order_id) AS max_order_id
FROM cust_order;

SELECT MIN(order_date)
FROM cust_order;

SELECT AVG(price)
FROM order_line;

SELECT
order_id,
order_date,
customer_id
FROM cust_order;

SELECT
customer_id,
COUNT(*)
FROM cust_order;

SELECT
customer_id,
COUNT(*)
FROM cust_order
GROUP BY customer_id;

SELECT
customer_id,
COUNT(*)
FROM cust_order
WHERE order_date > '20230101'
GROUP BY customer_id;

SELECT
customer_id,
COUNT(*)
FROM cust_order
WHERE order_date > '20230101'
AND COUNT(*) > 1
GROUP BY customer_id;

SELECT
customer_id,
COUNT(*)
FROM cust_order
WHERE order_date > '20230101'
GROUP BY customer_id
HAVING COUNT(*) > 1;