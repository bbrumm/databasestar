CREATE TABLE test_data (
  test_num INTEGER,
  test_text TEXT,
  test_datetime TIMESTAMP WITH TIME ZONE
);

SELECT *
FROM test_data;

TRUNCATE test_data;

/*
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


/*
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

CALL generate_sample_data(1000000);