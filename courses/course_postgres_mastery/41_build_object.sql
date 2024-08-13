/*
Build Object
*/

--SQL 00
INSERT INTO test_jsonb (id, some_data)
VALUES (3, '{"color":"blue", "size":"large"}');

--SQL 01
SELECT JSONB_BUILD_OBJECT('id', 4, 'name', 'Jacket');

--SQL 02
INSERT INTO test_jsonb (id, some_data)
VALUES (7, JSONB_BUILD_OBJECT('id', 4, 'name', 'Jacket'));

--SQL 03
SELECT id, some_data
FROM test_jsonb;

--SQL 04
SELECT JSONB_BUILD_OBJECT('id', 5, 'name', 'Shoes', 'price');

--SQL 05
SELECT
method_id,
method_name,
cost,
JSONB_BUILD_OBJECT('method_id', method_id, 'method_name', method_name, 'cost', cost) AS row_as_json
FROM shipping_method;

