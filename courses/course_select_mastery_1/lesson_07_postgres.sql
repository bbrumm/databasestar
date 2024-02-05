/*
Lesson 07
Postgres
*/

SELECT TO_CHAR(order_date, 'MON') AS months,
COUNT(*) AS number_of_Orders,
SUM(order_value) AS total_Order
FROM sales_order
WHERE order_date >= '2020-01-01' AND order_date < '2021-01-01'
GROUP BY TO_CHAR(order_date, 'MON')
ORDER BY EXTRACT(MONTH FROM MIN(order_date));