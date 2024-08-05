/*
JSON
*/

--SQL 01
CREATE TABLE test_json (
  id INTEGER,
  some_data JSON
);

--SQL 02
INSERT INTO test_json (id, some_data)
VALUES (1, '{"color":"blue"}');

--SQL 03
SELECT id, some_data
FROM test_json;

--SQL 04
CREATE TABLE test_jsonb (
  id INTEGER,
  some_data JSONB
);

--SQL 05
INSERT INTO test_jsonb (id, some_data)
VALUES (1, '{"color":"blue"}');

--SQL 06
SELECT id, some_data
FROM test_jsonb;


