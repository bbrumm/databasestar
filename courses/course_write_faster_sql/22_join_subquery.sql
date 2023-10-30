SELECT
co.order_id,
co.order_date,
c.first_name,
c.last_name,
c.email
FROM cust_order co
INNER JOIN customer c ON co.customer_id = c.customer_id
WHERE co.shipping_method_id IN (
	SELECT method_id
    FROM shipping_method
    WHERE method_name = 'International'
);




SELECT
co.order_id,
co.order_date,
c.first_name,
c.last_name,
c.email
FROM cust_order co
INNER JOIN customer c ON co.customer_id = c.customer_id
INNER JOIN shipping_method sm ON co.shipping_method_id = sm.method_id
WHERE method_name = 'International';
