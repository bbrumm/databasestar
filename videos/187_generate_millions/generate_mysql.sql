/* SQL 01 */
CREATE TABLE test_data (
  test_num INT,
  test_text VARCHAR(100),
  test_datetime TIMESTAMP
);

/* SQL 02 */
SELECT
FLOOR(RAND() * 1000000),
substring(MD5(RAND()),1,20),
DATE_ADD('2000-01-01 00:00:00', INTERVAL 1 +  FLOOR(RAND() * 365 * 20) DAY);

/*FROM_UNIXTIME(UNIX_TIMESTAMP('2000-01-01 01:00:00') + FLOOR(RAND() * 60 * 60 * 24 * 365 * 20))*/

/* Insert a single row */
INSERT INTO test_data (test_num, test_text, test_datetime)
VALUES (
FLOOR(RAND() * 1000000),
substring(MD5(RAND()),1,20),
DATE_ADD('2000-01-01 00:00:00', INTERVAL 1 +  FLOOR(RAND() * 365 * 20) DAY)
);

SELECT *
FROM test_data;

TRUNCATE test_data;


/* Create a procedure to run it many times
 highlight all of this code and run it */
 /* SQL 03 */
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
	DATE_ADD('2000-01-01 00:00:00', INTERVAL 1 +  FLOOR(RAND() * 365 * 20) DAY)
	);
    SET loop_increment = loop_increment + 1;
  END WHILE;
END$$
DELIMITER ;

/* Run the procedure with different numbers */
CALL generate_sample_data(1000000);

/* What about a recursive CTE? */
WITH RECURSIVE dummy_rows(id) AS (
  SELECT 1 AS id
  UNION ALL
  SELECT id + 1
  FROM dummy_rows
  WHERE id < 10
)
SELECT id
FROM dummy_rows;

/* Update the CTE to generate an INSERT statement
#Try this for different volumes */

/* SQL 04 */
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
DATE_ADD('2000-01-01 00:00:00', INTERVAL 1 +  FLOOR(RAND() * 365 * 20) DAY)
FROM dummy_rows;

/* SQL 05 */
SET SESSION cte_max_recursion_depth=10000001;

/*
CTE with Cross Join
*/
SELECT COUNT(*)
FROM information_schema.columns;

SELECT * FROM information_schema.tables;

/* SQL 06 */
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
)
SELECT
FLOOR(RAND() * 1000000),
substring(MD5(RAND()),1,20),
DATE_ADD('2000-01-01 00:00:00', INTERVAL 1 +  FLOOR(RAND() * 365 * 20) DAY)
FROM dummy_rows_a
CROSS JOIN dummy_rows_b;



INSERT INTO test_data (test_num, test_text, test_datetime)
WITH dummy_rows_a  AS (
  SELECT 1
  FROM information_schema.columns
  LIMIT 1000
),
dummy_rows_b AS (
 SELECT 1
  FROM information_schema.columns
  LIMIT 1000
),
dummy_rows_c AS (
 SELECT 1
  FROM information_schema.columns
  LIMIT 10
)
SELECT
FLOOR(RAND() * 1000000),
substring(MD5(RAND()),1,20),
DATE_ADD('2000-01-01 00:00:00', INTERVAL 1 +  FLOOR(RAND() * 365 * 20) DAY)
FROM dummy_rows_a
CROSS JOIN dummy_rows_b
CROSS JOIN dummy_rows_c;

