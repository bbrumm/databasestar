/*
Lesson 06
Oracle and Postgres
*/

SELECT
TO_CHAR(order_date, 'MON'),
COUNT(*)
FROM sales_order
GROUP BY TO_CHAR(order_date, 'MON');


