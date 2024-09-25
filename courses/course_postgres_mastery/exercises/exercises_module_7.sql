/*
Exercises from the PostgreSQL Mastery course
Module 7
*/

/* 49-01 */

SELECT
c.customer_id,
c.first_name,
c.last_name,
c.email,
s.order_id,
s.order_date
FROM customer c
JOIN LATERAL (
	SELECT co.*
	FROM cust_order co
	WHERE co.customer_id = c.customer_id
	ORDER BY co.order_date ASC
	FETCH FIRST 3 ROWS ONLY
) s ON TRUE
ORDER BY c.customer_id ASC;

/* 51-01 */

SELECT
c.customer_id,
c.first_name,
c.last_name,
c.email,
s.order_id,
s.order_date
FROM customer c
LEFT JOIN LATERAL (
	SELECT co.*
	FROM cust_order co
	WHERE co.customer_id = c.customer_id
	ORDER BY co.order_date ASC
	FETCH FIRST 3 ROWS ONLY
) s ON TRUE
ORDER BY c.customer_id ASC;