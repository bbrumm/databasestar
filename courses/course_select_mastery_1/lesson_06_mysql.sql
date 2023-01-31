/*
Lesson 06
MySQL
*/

SELECT
DATE_FORMAT(order_date, '%M'),
COUNT(*)
FROM sales_order
GROUP BY DATE_FORMAT(order_date, '%M')
ORDER BY DATE_FORMAT(order_date, '%M');
