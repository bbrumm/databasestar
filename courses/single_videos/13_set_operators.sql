

SELECT first_name, last_name
FROM customer;

SELECT first_name, last_name
FROM employee;

--UNION
SELECT first_name, last_name, 'Customer' AS tablename
FROM customer
UNION
SELECT first_name, last_name, 'Employee'
FROM employee;


--UNION ALL
SELECT first_name, last_name
FROM customer
UNION ALL
SELECT first_name, last_name
FROM employee;


--INTERSECT
SELECT first_name, last_name
FROM customer
INTERSECT
SELECT first_name, last_name
FROM employee;

--MINUS
SELECT first_name, last_name
FROM customer
MINUS
SELECT first_name, last_name
FROM employee;


--UNION ALL with ORDER BY
SELECT first_name, last_name
FROM customer
UNION ALL
SELECT first_name, last_name
FROM employee
ORDER BY first_name, last_name;

--Number of columns don't match
SELECT first_name, last_name, first_name || ' ' || last_name
FROM customer 
UNION ALL
SELECT first_name, last_name, first_name || ' ' || last_name
FROM employee;

--Type of columns don't match
SELECT ROWNUM, last_name
FROM customer
UNION ALL
SELECT first_name, last_name
FROM employee;
