CREATE TEMPORARY TABLE query_original AS
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
WHERE s.cost BETWEEN 6 AND 30;

CREATE TEMPORARY TABLE query_new AS
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




SELECT
'Original' AS query_name,
order_id,
order_date,
first_name,
last_name,
method_name,
city
FROM query_original qo
WHERE NOT EXISTS (
	SELECT 1
	FROM query_new qn
	WHERE qn.order_id = qo.order_id
	AND qn.order_date = qo.order_date
	AND qn.first_name = qo.first_name
	AND qn.last_name = qo.last_name
	AND qn.method_name = qo.method_name
	AND qn.city = qo.city
)
UNION ALL

SELECT
'New',
order_id,
order_date,
first_name,
last_name,
method_name,
city
FROM query_new qn
WHERE NOT EXISTS (
	SELECT 1
	FROM query_original qo
	WHERE qn.order_id = qo.order_id
	AND qn.order_date = qo.order_date
	AND qn.first_name = qo.first_name
	AND qn.last_name = qo.last_name
	AND qn.method_name = qo.method_name
	AND qn.city = qo.city
);

