/*
A query with extra columns
*/

SELECT
co.order_id,
co.order_date,
c.customer_id,
c.email
FROM cust_order co
INNER JOIN customer c ON co.customer_id = c.customer_id
WHERE co.order_date > '2022-06-01';


/*
A query with extra tables
*/

SELECT
co.order_id,
co.order_date,
c.customer_id,
c.first_name,
c.last_name,
c.email
FROM cust_order co
INNER JOIN customer c ON co.customer_id = c.customer_id
WHERE co.order_date > '2022-06-01'
AND co.shipping_method_id = 1;


SELECT
co.order_id,
co.order_date,
c.customer_id,
c.first_name,
c.last_name,
c.email
FROM cust_order co
INNER JOIN customer c ON co.customer_id = c.customer_id
WHERE co.order_date > '2022-06-01'
AND co.shipping_method_id = 1;

CREATE INDEX idx_co_shipmthid ON cust_order (shipping_method_id);

DROP INDEX idx_co_shipmthid;