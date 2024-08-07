/*
DDL in Transactions - Transaction 1
*/

--SQL 01
CREATE TABLE my_new_table (
	id INTEGER
);

--SQL 02
INSERT INTO my_new_table (id) VALUES (1);

--SQL 03
SELECT id
FROM my_new_table;

--SQL 04
COMMIT;