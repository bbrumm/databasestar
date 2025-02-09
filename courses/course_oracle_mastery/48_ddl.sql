/*
DDL in Transactions
*/

--SQL 01
CREATE TABLE my_new_table (
	id NUMBER
);

--SQL 02
INSERT INTO my_new_table (id) VALUES (1);

--SQL 03
SELECT id
FROM my_new_table;

--SQL 04
CREATE TABLE my_second_table (
    some_id NUMBER
);

--SQL 05
INSERT INTO my_new_table (id) VALUES (2);

--SQL 06
SELECT id
FROM my_new_table;

--SQL 07
ROLLBACK;

--SQL 08   
SELECT id
FROM my_new_table;