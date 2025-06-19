INSERT INTO test_json (id, some_data)
VALUES (2, '{"color":"blue", "size":"large"}');


SELECT id, some_data
FROM test_json;


INSERT INTO test_json (id, some_data)
VALUES (3, '{"color":"white", "in_stock":"true"}');


SELECT id, some_data
FROM test_json;


INSERT INTO test_json (id, some_data)
VALUES (4, '{"color":"white", "in_stock":"false", "supplier":{"supplier_name":"ABC Corp", "email":"orders@abccorp.com"}}');