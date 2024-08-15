/*
DDL in Transactions - Transaction 1
*/

--SQL 01
START TRANSACTION;

--SQL 02
CREATE TABLE my_new_table (
	id INTEGER
);

--SQL 03
INSERT INTO my_new_table (id) VALUES (1);

--SQL 04
SELECT id
FROM my_new_table;

--SQL 05
ROLLBACK;

--SQL 06
SELECT id
FROM my_new_table;