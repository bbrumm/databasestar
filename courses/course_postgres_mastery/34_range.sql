/*
Ranges
*/

TRUNCATE TABLE test_range;

--SQL 01
CREATE TABLE test_range (
  id INTEGER,
  valid_range DATERANGE
);

--SQL 02
INSERT INTO test_range (id, valid_range)
VALUES (1, '[2024-07-10, 2024-07-13]');

--SQL 03
SELECT
id,
valid_range
FROM test_range;

--SQL 04
INSERT INTO test_range (id, valid_range)
VALUES (2, '[2024-07-10, 2024-07-13)');

--SQL 05
INSERT INTO test_range (id, valid_range)
VALUES (3, '(2024-07-10, 2024-07-13)');

--SQL 06
SELECT
id,
valid_range,
valid_range @> '2024-07-13'::date AS check_date_1
FROM test_range;

--SQL 07
SELECT
id,
valid_range,
valid_range @> '2024-07-11'::date AS check_date_1
FROM test_range;


