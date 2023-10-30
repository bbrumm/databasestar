SELECT
c.customer_id,
c.first_name,
c.last_name,
c.email
FROM customer c
WHERE c.customer_id IN (
	SELECT customer_id
    FROM (
		SELECT
		customer_id,
		COUNT(*) AS address_count
		FROM customer_address
		GROUP BY customer_id
		HAVING COUNT(*) > 1
	) AS sub
);





WITH cust_multi_address AS (
	SELECT
	customer_id,
	COUNT(*) AS address_count
	FROM customer_address
	GROUP BY customer_id
	HAVING COUNT(*) > 1
)
SELECT
c.customer_id,
c.first_name,
c.last_name,
c.email
FROM customer c
WHERE c.customer_id IN (
	SELECT customer_id
    FROM cust_multi_address
);

