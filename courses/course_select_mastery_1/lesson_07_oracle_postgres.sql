/*
Lesson 07
Oracle
*/

SELECT
TO_CHAR(order_date, 'MON') AS month_name,
COUNT(*) AS num_orders,
SUM(order_value) AS total_order_value
FROM sales_order
WHERE order_date < '20210101'
AND order_date >= '20200101'
GROUP BY TO_CHAR(order_date, 'MON')
ORDER BY TO_CHAR(order_date, 'M') ASC;

