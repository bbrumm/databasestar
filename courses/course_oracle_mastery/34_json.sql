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

COMMIT;