/*
MySQL, Postgres
*/
SELECT
co.order_id,
co.order_date,
c.customer_id,
c.first_name,
c.last_name,
sm.method_name
FROM cust_order co
INNER JOIN customer c ON c.customer_id = co.customer_id
INNER JOIN shipping_method sm ON co.shipping_method_id = sm.method_id
WHERE co.order_date > '2021-01-01'
ORDER BY co.order_date ASC;

/*
Oracle
*/
SELECT
co.order_id,
co.order_date,
c.customer_id,
c.first_name,
c.last_name,
sm.method_name
FROM cust_order co
INNER JOIN customer c ON c.customer_id = co.customer_id
INNER JOIN shipping_method sm ON co.shipping_method_id = sm.method_id
WHERE co.order_date > TO_DATE('2021-01-01', 'YYYY-MM-DD')
ORDER BY co.order_date ASC;