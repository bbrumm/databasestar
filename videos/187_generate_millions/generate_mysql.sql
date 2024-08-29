CREATE TABLE test_data (
  test_num INT(10),
  test_text VARCHAR(100),
  test_datetime TIMESTAMP
);

#This works. Next, wrap this in a procedure with a loop

#Insert a single row
INSERT INTO test_data (test_num, test_text, test_datetime)
VALUES (
FLOOR(RAND() * 1000000),
substring(MD5(RAND()),1,20),
FROM_UNIXTIME(UNIX_TIMESTAMP('2000-01-01 01:00:00') + FLOOR(RAND() * 60 * 60 * 24 * 365 * 20))
);

SELECT *
FROM test_data;

TRUNCATE test_data;


#Create a procedure to run it many times
#highlight all of this code and run it
DELIMITER $$
CREATE PROCEDURE generate_sample_data(
  IN number_of_rows INT
)
BEGIN
  DECLARE loop_increment INT DEFAULT 0;
  WHILE loop_increment < number_of_rows DO
    INSERT INTO test_data (test_num, test_text, test_datetime)
	VALUES (
	FLOOR(RAND() * 1000000),
	substring(MD5(RAND()),1,20),
	FROM_UNIXTIME(UNIX_TIMESTAMP('2000-01-01 01:00:00') + FLOOR(RAND() * 60 * 60 * 24 * 365 * 20))
	);
    SET loop_increment = loop_increment + 1;
  END WHILE;
END$$
DELIMITER ;

#Run the procedure with different numbers
CALL generate_sample_data(1000000);

#What about a recursive CTE?
#This selects the values from 1-10
WITH RECURSIVE dummy_rows(id) AS (
  SELECT 1 AS id
  UNION ALL
  SELECT id + 1
  FROM dummy_rows
  WHERE id < 10
)
SELECT id
FROM dummy_rows;

#Update the CTE to generate an INSERT statement
#Try this for different volumes
INSERT INTO test_data (test_num, test_text, test_datetime)
WITH RECURSIVE dummy_rows(id) AS (
  SELECT 1 AS id
  UNION ALL
  SELECT id + 1
  FROM dummy_rows
  WHERE id < 1000000
)
SELECT
FLOOR(RAND() * 1000000),
substring(MD5(RAND()),1,20),
FROM_UNIXTIME(UNIX_TIMESTAMP('2000-01-01 01:00:00') + FLOOR(RAND() * 60 * 60 * 24 * 365 * 20))
FROM dummy_rows;

SET SESSION cte_max_recursion_depth=10000000;