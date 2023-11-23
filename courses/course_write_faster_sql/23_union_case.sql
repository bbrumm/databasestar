/*
Find orders with Express shipping and orders sent to Canada
*/

SELECT
'Group A' AS order_group,
co.order_id,
co.order_date,
c.customer_id,
c.email,
ct.country_name
FROM cust_order co
INNER JOIN shipping_method sm ON co.shipping_method_id = sm.method_id
INNER JOIN customer c ON co.customer_id = c.customer_id
INNER JOIN address a ON co.dest_address_id = a.address_id
INNER JOIN country ct ON a.country_id = ct.country_id
WHERE sm.method_name = 'Express'

UNION ALL

SELECT
'Group B' AS order_group,
co.order_id,
co.order_date,
c.customer_id,
c.email,
ct.country_name
FROM cust_order co
INNER JOIN shipping_method sm ON co.shipping_method_id = sm.method_id
INNER JOIN customer c ON co.customer_id = c.customer_id
INNER JOIN address a ON co.dest_address_id = a.address_id
INNER JOIN country ct ON a.country_id = ct.country_id
WHERE ct.country_name = 'Canada'
ORDER BY order_id ASC;


/*
Updated query
*/

SELECT
CASE
	WHEN sm.method_name = 'Express' THEN 'Group A'
	WHEN ct.country_name = 'Canada' THEN 'Group B'
END AS order_group,
co.order_id,
co.order_date,
c.customer_id,
c.email,
ct.country_name
FROM cust_order co
INNER JOIN shipping_method sm ON co.shipping_method_id = sm.method_id
INNER JOIN customer c ON co.customer_id = c.customer_id
INNER JOIN address a ON co.dest_address_id = a.address_id
INNER JOIN country ct ON a.country_id = ct.country_id
WHERE sm.method_name = 'Express' OR ct.country_name = 'Canada'
ORDER BY co.order_id ASC;