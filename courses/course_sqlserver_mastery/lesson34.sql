CREATE TABLE test_json (
  id INT,
  some_data NVARCHAR(1000)
);


INSERT INTO test_json (id, some_data)
VALUES (1, '{"color":"blue"}');


SELECT id, some_data
FROM test_json;

