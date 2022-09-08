/*
Lesson 06
SQL Server
*/

SELECT
FORMAT(order_date, 'MMM'),
COUNT(*)
FROM sales_order
GROUP BY FORMAT(order_date, 'MMM');

/*
With an alias
*/

SELECT
FORMAT(order_date, 'MMM') AS month_name,
COUNT(*)
FROM sales_order
GROUP BY FORMAT(order_date, 'MMM');