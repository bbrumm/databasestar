INSERT INTO test_json (id, some_data)
VALUES (3, '{"color":"blue", "size":"large"}');


SELECT JSON_OBJECT('id':4, 'name':'Jacket');


INSERT INTO test_json (id, some_data)
VALUES (7, JSON_OBJECT('id':4, 'name':'Jacket'));


SELECT id, some_data
FROM test_json;


SELECT JSON_OBJECT('id':5, 'name':'Shoes', 'price');


SELECT
method_id,
method_name,
cost,
JSON_OBJECT(
    'method_id':method_id, 
    'method_name':method_name,
    'cost':cost
) AS row_as_json
FROM shipping_method;