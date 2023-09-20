
/*
Order Details - New
*/
SELECT
co.order_id,
co.order_date,
c.first_name,
c.last_name,
s.method_name,
a.city
FROM cust_order co
INNER JOIN customer c ON co.customer_id = c.customer_id
INNER JOIN shipping_method s ON co.shipping_method_id = s.method_id
INNER JOIN address a ON co.dest_address_id = a.address_id
WHERE s.cost IN (8.90, 24.50);


