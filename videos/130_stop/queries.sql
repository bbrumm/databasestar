/*
Queries for Video 130
*/

SELECT
cust_order.order_id,
cust_order.order_date,
customer.customer_id,
customer.first_name,
customer.email
FROM cust_order, customer
WHERE cust_order.customer_id = customer.customer_id;
