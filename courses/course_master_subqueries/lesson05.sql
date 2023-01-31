/*
Show all orders that were sent to the same city and country that the customer of an ID of 88 has lived in.
*/

/*
Record for customer
*/

SELECT
customer_id,
first_name,
last_name,
email
FROM customer
WHERE customer_id = 26;

/*
Find customers by city and country
*/
SELECT
ca.customer_id,
a.city,
co.country_name
FROM address a
INNER JOIN customer_address ca ON a.address_id = ca.address_id
INNER JOIN country co ON a.country_id = co.country_id
ORDER BY ca.customer_id;



/*
Find addresses for customer
*/

SELECT
a.address_id,
a.street_number,
a.street_name,
a.city,
co.country_name
FROM address a
INNER JOIN customer_address ca ON a.address_id = ca.address_id
INNER JOIN country co ON a.country_id = co.country_id
WHERE ca.customer_id = 26;

/*
Find all orders with addresses
*/

SELECT
co.order_id,
co.order_date,
co.customer_id,
a.address_id,
a.street_number,
a.street_name,
a.city,
c.country_name
FROM cust_order co
INNER JOIN address a ON co.dest_address_id = a.address_id
INNER JOIN country c ON a.country_id = c.country_id;

/*
Find orders matching city and country
*/

SELECT
co.order_id,
co.order_date,
co.customer_id,
a.address_id,
a.street_number,
a.street_name,
a.city,
c.country_name
FROM cust_order co
INNER JOIN address a ON co.dest_address_id = a.address_id
INNER JOIN country c ON a.country_id = c.country_id
WHERE (a.city, c.country_name) IN (
	SELECT
	a.city,
	co.country_name
	FROM address a
	INNER JOIN customer_address ca ON a.address_id = ca.address_id
	INNER JOIN country co ON a.country_id = co.country_id
	WHERE ca.customer_id = 26
);


