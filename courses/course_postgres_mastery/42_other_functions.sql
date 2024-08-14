/*
Other Functions
*/

--SQL 01
SELECT
method_name,
TO_JSON(method_name),
TO_JSONB(method_name)
FROM shipping_method;

--SQL 02
SELECT
method_id,
method_name,
cost 
FROM shipping_method;

--SQL 03
SELECT
ROW_TO_JSON(sm) AS shipping_records
FROM (
  SELECT method_id, method_name, cost
  FROM shipping_method
) sm;

--SQL 04
SELECT
JSON_BUILD_ARRAY(1, 3, 78, 12);

--SQL 05
SELECT
id,
some_data,
JSONB_PRETTY(some_data) AS formatted_json
FROM test_jsonb;
