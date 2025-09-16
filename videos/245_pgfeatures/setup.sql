--Set up tables


--Feature 1
SELECT
COUNT(CASE WHEN status = 'cancelled' THEN 1 ELSE NULL END) AS cancelled_orders
FROM cust_order;


SELECT
COUNT(*) FILTER (WHERE status = 'cancelled') AS cancelled_orders
FROM cust_order;