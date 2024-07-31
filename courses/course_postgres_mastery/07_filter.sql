/*
Filter
*/

--SQL 01
SELECT
order_year,
COUNT(*) AS count_all_orders,
SUM(is_express) AS count_express_orders
FROM (
	SELECT
	EXTRACT('year' FROM co.order_date) AS order_year,
	s.method_name,
	CASE WHEN s.method_name = 'Express' THEN 1 ELSE 0 END AS is_express
	FROM cust_order co
	INNER JOIN shipping_method s ON co.shipping_method_id = s.method_id
) sub
GROUP BY order_year
ORDER BY order_year ASC;


--SQL 02
SELECT
EXTRACT('year' FROM co.order_date) AS order_year,
COUNT(*) AS count_all_orders,
COUNT(*) FILTER (WHERE s.method_name = 'Express') AS count_express_orders
FROM cust_order co
INNER JOIN shipping_method s ON co.shipping_method_id = s.method_id
GROUP BY order_year
ORDER BY order_year ASC;

--SQL 03
SELECT
EXTRACT('year' FROM co.order_date) AS order_year,
COUNT(*) AS count_all_orders,
COUNT(*) FILTER (WHERE s.method_name = 'Express') AS count_express_orders,
COUNT(*) FILTER (WHERE s.method_name = 'Standard') AS count_standard_orders
FROM cust_order co
INNER JOIN shipping_method s ON co.shipping_method_id = s.method_id
GROUP BY order_year
ORDER BY order_year ASC;

--SQL 04
SELECT
EXTRACT('year' FROM co.order_date) AS order_year,
COUNT(*) AS count_all_orders,
COUNT(*) FILTER (WHERE s.method_name = 'Express') AS count_express_orders,
COUNT(*) FILTER (WHERE s.method_name = 'Standard') AS count_standard_orders
FROM cust_order co
INNER JOIN shipping_method s ON co.shipping_method_id = s.method_id
WHERE co.customer_id > 1000
GROUP BY order_year
ORDER BY order_year ASC;

SELECT *
FROM address_status;