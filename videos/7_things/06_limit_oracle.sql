/*
Row Limiting - Oracle
*/
SELECT cust_id, SUM(order_value)
FROM cust_order
GROUP BY cust_id
ORDER BY SUM(order_value) DESC
FETCH FIRST 5 ROWS ONLY;