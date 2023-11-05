CREATE INDEX idx_cust_fn
ON customer (first_name);

DROP INDEX idx_cust_fn;

SELECT
customer_id,
first_name,
last_name,
email
FROM customer
WHERE first_name = 'JANE';


SELECT
customer_id,
first_name,
last_name,
email
FROM customer
WHERE UPPER(first_name) = 'JANE';

SELECT
customer_id,
first_name,
last_name,
email
FROM customer
WHERE first_name = 'Jane' OR first_name = 'JANE';


SELECT
customer_id,
first_name,
last_name,
email
FROM customer
WHERE first_name IN ('Jane', 'JANE');


SELECT
customer_id,
first_name,
last_name,
email
FROM customer
WHERE UPPER(first_name) = 'JANE';

CREATE INDEX idx_cust_fnupper
ON customer (UPPER(first_name));

/*
Reset
*/
DROP INDEX idx_cust_fnupper;

