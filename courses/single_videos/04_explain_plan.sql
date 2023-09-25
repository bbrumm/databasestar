SELECT COUNT(*) FROM all_customers;

--Table Access Full
SELECT * FROM all_customers;

EXPLAIN PLAN FOR
SELECT * FROM all_customers;

SELECT * FROM table (dbms_xplan.display);

--WHERE clause
SELECT *
FROM all_customers
WHERE first_name = 'Julia';

--WHERE clause on PK
SELECT *
FROM all_customers
WHERE customer_id = 15;

--Index Range Scan
SELECT first_name, last_name
FROM all_customers
WHERE first_name = 'William';

--Order
SELECT *
FROM all_customers
WHERE first_name = 'Andrew'
ORDER BY last_name;

--Distinct
SELECT DISTINCT created_date
FROM all_customers;

--SUM
SELECT SUM(max_credit)
FROM all_customers;

--Join
SELECT
c.customer_id,
c.first_name,
c.last_name,
o.order_id,
o.order_date
FROM all_customers c
INNER JOIN customer_order o ON c.customer_id = o.customer_id;

--Another Join
SELECT e.*, d.*
FROM employee e
LEFT JOIN department d ON e.department_id = d.department_id
WHERE e.salary > 1000;

