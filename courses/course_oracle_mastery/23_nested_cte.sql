/*
Nested CTE
*/

--SQL 01
--Most Valuable Customers
SELECT
c.customer_id,
c.first_name,
c.last_name,
c.email,
cs.total_order_amount,
cs.avg_order_amount
FROM customer c
INNER JOIN (
	--customer ID and their stats
	SELECT
	o.customer_id,
	SUM(o.order_amount) AS total_order_amount,
	ROUND(AVG(o.order_amount), 2) AS avg_order_amount
	FROM (
		--order amounts
		SELECT
		co.customer_id,
		co.order_id,
		SUM(ol.price) AS order_amount
		FROM cust_order co 
		INNER JOIN order_line ol ON co.order_id = ol.order_id
		GROUP BY co.customer_id, co.order_id
	) o
	GROUP BY o.customer_id
) cs ON c.customer_id = cs.customer_id
ORDER BY cs.total_order_amount DESC;

--SQL 02
WITH order_value AS (
	SELECT
	co.customer_id,
	co.order_id,
	SUM(ol.price) AS order_amount
	FROM cust_order co 
	INNER JOIN order_line ol ON co.order_id = ol.order_id
	GROUP BY co.customer_id, co.order_id
)
SELECT
c.customer_id,
c.first_name,
c.last_name,
c.email,
cs.total_order_amount,
cs.avg_order_amount
FROM customer c
INNER JOIN (
	--customer ID and their stats
	SELECT
	o.customer_id,
	SUM(o.order_amount) AS total_order_amount,
	ROUND(AVG(o.order_amount), 2) AS avg_order_amount
	FROM order_value o
	GROUP BY o.customer_id
) cs ON c.customer_id = cs.customer_id
ORDER BY cs.total_order_amount DESC;


--SQL 03
WITH order_value AS (
	SELECT
	co.customer_id,
	co.order_id,
	SUM(ol.price) AS order_amount
	FROM cust_order co 
	INNER JOIN order_line ol ON co.order_id = ol.order_id
	GROUP BY co.customer_id, co.order_id
),
customer_order_stats AS (
	SELECT
	o.customer_id,
	SUM(o.order_amount) AS total_order_amount,
	ROUND(AVG(o.order_amount), 2) AS avg_order_amount
	FROM order_value o
	GROUP BY o.customer_id
)
SELECT
c.customer_id,
c.first_name,
c.last_name,
c.email,
cs.total_order_amount,
cs.avg_order_amount
FROM customer c
INNER JOIN customer_order_stats cs ON c.customer_id = cs.customer_id
ORDER BY cs.total_order_amount DESC;
