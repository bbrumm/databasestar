/*
Lesson 06
MySQL
*/

SELECT
DATE_FORMAT(order_date, 'MON'),
COUNT(*)
FROM sales_order
GROUP BY DATE_FORMAT(order_date, 'MON');
