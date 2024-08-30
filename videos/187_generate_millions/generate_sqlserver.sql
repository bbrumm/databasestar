DROP TABLE test_data;

--SQL 01
CREATE TABLE test_data (
  test_num INT,
  test_text VARCHAR(100),
  test_datetime DATETIME
);

SELECT *
FROM test_data;

TRUNCATE TABLE test_data;

--SQL 02
SELECT
FLOOR(RAND() * 1000000) AS test_num,
SUBSTRING(CONVERT(NVARCHAR(32), HashBytes('MD5', STR(RAND() * 1000000)), 2), 1, 20) AS test_text,
DATEADD(day, FLOOR(RAND() * 365 * 20), '2000-01-01') AS test_date;


INSERT INTO test_data (test_num, test_text, test_datetime)
SELECT
FLOOR(RAND() * 1000000),
SUBSTRING(CONVERT(NVARCHAR(32), HashBytes('MD5', STR(RAND() * 1000000)), 2), 1, 20),
DATEADD(day, FLOOR(RAND() * 365 * 20), '2000-01-01');

/*
Stored procedure
*/
GO;

--SQL 03
CREATE OR ALTER PROCEDURE generate_sample_data
  @number_of_rows INT
AS
  DECLARE @loop_counter INT = 1;
BEGIN
  SET NOCOUNT ON;
  WHILE (@loop_counter <= @number_of_rows)
  BEGIN
    INSERT INTO test_data (test_num, test_text, test_datetime)
    SELECT
	  FLOOR(RAND() * 1000000),
	  SUBSTRING(CONVERT(NVARCHAR(32), HashBytes('MD5', STR(RAND() * 1000000)), 2), 1, 20),
	  DATEADD(day, FLOOR(RAND() * 365 * 20), '2000-01-01');

	SET @loop_counter = @loop_counter + 1;
  END;
END;


/*
Call the procedure
*/

--SQL 04
EXECUTE generate_sample_data 1000000;

/*
Use a CTE
*/

WITH dummy_rows AS (
  SELECT 1 AS id
  UNION ALL
  SELECT id + 1
  FROM dummy_rows
  WHERE id < 10
)
SELECT id
FROM dummy_rows;

/* This can only generate up to 32,767 rows due to the max of MAXRECURSION */

--SQL 05
WITH dummy_rows AS (
  SELECT 1 AS id
  UNION ALL
  SELECT id + 1
  FROM dummy_rows
  WHERE id < 10
)
INSERT INTO test_data (test_num, test_text, test_datetime)
SELECT
FLOOR(RAND() * 1000000),
SUBSTRING(CONVERT(NVARCHAR(32), HashBytes('MD5', STR(RAND() * 1000000)), 2), 1, 20),
DATEADD(day, FLOOR(RAND() * 365 * 20), '2000-01-01')
FROM dummy_rows
OPTION (MAXRECURSION 1000001);

/*
Try SELECT TOP with an inbuilt table
*/

--SQL 06
WITH dummy_rows_a AS (
  SELECT TOP 10 object_id
  FROM sys.all_columns
),
dummy_rows_b AS (
  SELECT TOP 1 object_id
  FROM sys.all_columns
)
INSERT INTO test_data (test_num, test_text, test_datetime)
SELECT
FLOOR(RAND() * 1000000),
SUBSTRING(CONVERT(NVARCHAR(32), HashBytes('MD5', STR(RAND() * 1000000)), 2), 1, 20),
DATEADD(day, FLOOR(RAND() * 365 * 20), '2000-01-01')
FROM dummy_rows_a
CROSS JOIN dummy_rows_b;


SELECT COUNT(*)
FROM test_data;