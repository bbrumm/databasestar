/*
Lesson 07
MySQL
*/

SELECT
DATE_FORMAT(order_date, 'MON') AS month_name,
COUNT(*) AS num_orders,
SUM(order_value) AS total_order_value
FROM sales_order
WHERE order_date < '20210101'
AND order_date >= '20200101'
GROUP BY DATE_FORMAT(order_date, 'MON')
ORDER BY DATE_FORMAT(order_date, 'M') ASC;