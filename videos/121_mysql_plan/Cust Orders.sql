SELECT
cust_order.order_id,
cust_order.order_date,
customer.customer_id,
customer.first_name,
customer.last_name,
address.city,
country.country_name
FROM cust_order
INNER JOIN customer ON customer.customer_id = cust_order.customer_id
INNER JOIN address ON cust_order.dest_address_id = address.address_id
INNER JOIN country ON address.country_id = country.country_id
WHERE country_name = 'Canada';
