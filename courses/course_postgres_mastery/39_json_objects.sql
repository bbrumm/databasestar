/*
JSON Objects
*/

--SQL 01
INSERT INTO test_jsonb (id, some_data)
VALUES (2, '{"color":"blue", "size":"large"}');

--SQL 02
SELECT id, some_data
FROM test_jsonb;

--SQL 03
INSERT INTO test_jsonb (id, some_data)
VALUES (3, '{"color":"white", "in_stock":"true"}');

--SQL 04
INSERT INTO test_jsonb (id, some_data)
VALUES (4, '{"color":"white", "in_stock":"false", "supplier":{"supplier_name":"ABC Corp", "email":"orders@abccorp.com"}}');
