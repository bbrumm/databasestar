/*
Example
*/
SELECT state, COUNT(*)
FROM customer
GROUP BY state;

SELECT first_name, last_name, state, COUNT(*)
FROM customer
GROUP BY state;

/*
Analytic query
*/
SELECT first_name, last_name, address_state,
COUNT(*) OVER (PARTITION BY address_state) AS state_count
FROM customer
GROUP BY state;

SELECT product_id, product_name, price, department_id,
SUM(price) OVER (PARTITION BY department_id) AS sumprice
FROM product;

SELECT product_id, product_name, price, department_id,
RANK() OVER (PARTITION BY department_id ORDER BY price DESC) AS rankval
FROM product;

