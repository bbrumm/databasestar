/*
Build Object
*/

--SQL 00
INSERT INTO test_json (id, some_data)
VALUES (3, '{"color":"blue", "size":"large"}');

--SQL 01
SELECT JSON_OBJECT(KEY 'id' VALUE 4, KEY 'name' VALUE 'Jacket');

--SQL 02
INSERT INTO test_json (id, some_data)
VALUES (7, JSON_OBJECT(KEY 'id' VALUE 4, KEY 'name' VALUE 'Jacket'));

--SQL 03
SELECT id, some_data
FROM test_json;

--SQL 04
SELECT JSON_OBJECT(KEY 'id' VALUE 5, KEY 'name' VALUE 'Shoes', KEY 'price');



--SQL 05
SELECT
method_id,
method_name,
cost,
JSON_OBJECT(
    KEY 'method_id' VALUE method_id, 
    KEY 'method_name' VALUE method_name,
    KEY 'cost' VALUE cost
) AS row_as_json
FROM shipping_method;

COMMIT;