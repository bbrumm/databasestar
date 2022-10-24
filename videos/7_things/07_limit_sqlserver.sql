/*
Row Limiting - SQL Server
*/

SELECT TOP 5 cust_id, SUM(order_value)
FROM cust_order
GROUP BY cust_id
ORDER BY SUM(order_value) DESC;