/*
Lesson 40
*/

--SQL 01 - Oracle
CREATE TABLE customer (
    customer_id INTEGER,
    customer_name VARCHAR2(100)
);

--SQL 02
INSERT INTO customer (customer_id, customer_name)
VALUES (1, 'John Smith');
INSERT INTO customer (customer_id, customer_name)
VALUES (2, 'Quality Goods');
INSERT INTO customer (customer_id, customer_name)
VALUES (3, 'AA Deals');

--SQL 03
SELECT
customer_name,
supplier_name
FROM customer
INNER JOIN supplier ON ... ;

--SQL 04
SELECT customer_name FROM customer
UNION
SELECT supplier_name FROM supplier;

--SQL 05
SELECT customer_name FROM customer
UNION ALL
SELECT supplier_name FROM supplier;

--SQL 06
SELECT customer_name FROM customer
MINUS
SELECT supplier_name FROM supplier;

--SQL 07
SELECT customer_name FROM customer
INTERSECT
SELECT supplier_name FROM supplier;

--SQL 08 - SQL Server, MySQL, Postgres
CREATE TABLE customer (
    customer_id INT,
    customer_name VARCHAR(100)
);

--SQL 09
SELECT customer_name FROM customer
EXCEPT
SELECT supplier_name FROM supplier;