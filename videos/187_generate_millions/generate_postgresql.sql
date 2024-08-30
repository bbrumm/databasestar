/* SQL 01 */
CREATE TABLE test_data (
  test_num INTEGER,
  test_text TEXT,
  test_datetime TIMESTAMP WITH TIME ZONE
);

SELECT *
FROM test_data;

TRUNCATE test_data;

/* SQL 02 */
SELECT 
FLOOR(RANDOM() * 1000000), 
SUBSTRING(md5(random()::text), 1, 20), 
'2000-01-01'::date + trunc(random() * 365 * 20)::int;

/*
SQL 03
Stored proc
*/
CREATE OR REPLACE PROCEDURE generate_sample_data(
  IN number_of_rows INTEGER
)
LANGUAGE plpgsql
AS $$
BEGIN 
   FOR loop_increment IN 1..number_of_rows LOOP
      INSERT INTO test_data (test_num, test_text, test_datetime)
	    SELECT 
		FLOOR(RANDOM() * 1000000), 
		SUBSTRING(md5(random()::text), 1, 20), 
		'2000-01-01'::date + trunc(random() * 365 * 20)::int;
   END LOOP;
END; $$

/* SQL 04 */
CALL generate_sample_data(1000000);


/*
Recursive CTE
*/
WITH RECURSIVE dummy_rows(id) AS (
  SELECT 1 AS id
  UNION ALL
  SELECT id + 1
  FROM dummy_rows
  WHERE id < 10
)
SELECT id
FROM dummy_rows;

/* SQL 05 */
INSERT INTO test_data (test_num, test_text, test_datetime)
WITH RECURSIVE dummy_rows(id) AS (
  SELECT 1 AS id
  UNION ALL
  SELECT id + 1
  FROM dummy_rows
  WHERE id < 1000000
)
SELECT 
FLOOR(RANDOM() * 1000000), 
SUBSTRING(md5(random()::text), 1, 20), 
'2000-01-01'::date + trunc(random() * 365 * 20)::int
FROM dummy_rows;



/*
SQL 06
CTE with a cross join
*/
INSERT INTO test_data (test_num, test_text, test_datetime)
WITH dummy_rows_a  AS (
  SELECT 1
  FROM information_schema.columns
  LIMIT 10
),
dummy_rows_b AS (
 SELECT 1
  FROM information_schema.columns
  LIMIT 1
),
dummy_rows_c AS (
 SELECT 1
  FROM information_schema.columns
  LIMIT 1
)
SELECT
FLOOR(RANDOM() * 1000000), 
SUBSTRING(md5(random()::text), 1, 20), 
'2000-01-01'::date + trunc(random() * 365 * 20)::int
FROM dummy_rows_a
CROSS JOIN dummy_rows_b
CROSS JOIN dummy_rows_c;

/* SQL 07 */
SELECT generate_series(1,10);



/*
SQL 08
 * Insert using generate_series
 */
INSERT INTO test_data (test_num, test_text, test_datetime)
SELECT 
FLOOR(RANDOM() * 1000000) , 
SUBSTRING(md5(random()::text), 1, 20), 
'2000-01-01'::date + trunc(random() * 365 * 20)::int
FROM (
	SELECT generate_series(1,1000000)
) s;



