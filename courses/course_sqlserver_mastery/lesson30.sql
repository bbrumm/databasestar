CREATE TABLE test_boolean (
	customer_name VARCHAR(20),
	is_active BIT
);


INSERT INTO test_boolean (customer_name, is_active)
VALUES ('John', 1);


INSERT INTO test_boolean (customer_name, is_active)
VALUES ('Sarah', 0);


SELECT customer_name, is_active
FROM test_boolean;