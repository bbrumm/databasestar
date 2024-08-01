/*
Nested CTE
*/

--most valuable customers and their active addresses?


SELECT
c.customer_id,
c.first_name,
c.last_name,
c.email,
cn.country_name,
cs.total_order_amount,
cs.avg_order_amount
FROM customer c
INNER JOIN customer_address ca ON c.customer_id = ca.customer_id 
INNER JOIN address a ON ca.address_id = a.address_id
INNER JOIN address_status s ON ca.status_id = s.status_id
INNER JOIN country cn ON a.country_id = cn.country_id 
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
WHERE s.address_status = 'Active'
ORDER BY cs.total_order_amount DESC;


--without addresses
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
