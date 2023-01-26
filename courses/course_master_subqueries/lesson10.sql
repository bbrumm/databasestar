/*
Order details
*/

SELECT
DATE(order_date) AS order_date_only,
COUNT(*)
FROM cust_order
GROUP BY DATE(order_date)
ORDER BY DATE(order_date) ASC;

/*
SQL Server
*/
SELECT
CONVERT(date, order_date) AS order_date_only,
COUNT(*)
FROM cust_order
GROUP BY CONVERT(date, order_date)
ORDER BY CONVERT(date, order_date) ASC;

/*
Where avg, has error
*/

SELECT
DATE(order_date) AS order_date_only,
COUNT(*)
FROM cust_order
WHERE COUNT(*) >= (
	SELECT COUNT(*)
	FROM cust_order
	WHERE DATE(order_date) = '2020-01-01'
)
GROUP BY DATE(order_date)
ORDER BY DATE(order_date) ASC;

/*
Use having
*/
SELECT
DATE(order_date) AS order_date_only,
COUNT(*)
FROM cust_order
GROUP BY DATE(order_date)
HAVING COUNT(*) >= (
	SELECT COUNT(*)
	FROM cust_order
	WHERE DATE(order_date) = '2020-01-01'
)

ORDER BY DATE(order_date) ASC;


SELECT COUNT(*)
	FROM cust_order
	WHERE DATE(order_date) = '2020-01-01';