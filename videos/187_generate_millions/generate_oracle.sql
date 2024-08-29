
--SQL 01
CREATE TABLE test_data (
  test_num INT,
  test_text VARCHAR2(100),
  test_datetime DATE
);

SELECT *
FROM test_data;

TRUNCATE TABLE test_data;

ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MON-YYYY HH24:MI:SS';

--SQL 02
SELECT
FLOOR(DBMS_RANDOM.VALUE * 1000000) AS test_num,
DBMS_RANDOM.STRING('a', 20) AS test_text,
TO_DATE('2000-01-01', 'YYYY-MM-DD') + (DBMS_RANDOM.VALUE * 365 * 20) AS test_date
FROM dual;

/* Create stored proc */
--SQL 03
CREATE OR REPLACE PROCEDURE generate_sample_data (number_of_rows IN INTEGER)
AS
BEGIN
  FOR row_increment IN 1 .. number_of_rows LOOP
    INSERT INTO test_data (test_num, test_text, test_datetime)
    SELECT
    FLOOR(DBMS_RANDOM.VALUE * 1000000),
    DBMS_RANDOM.STRING('a', 20),
    TO_DATE('2000-01-01', 'YYYY-MM-DD') + (DBMS_RANDOM.VALUE * 365 * 20)
    FROM dual;
  END LOOP;
END;
/

--SQL 04
CALL generate_sample_data(10);

/*
Use connect by
*/

--SQL 05
SELECT
FLOOR(DBMS_RANDOM.VALUE * 1000000),
DBMS_RANDOM.STRING('a', 20),
TO_DATE('2000-01-01', 'YYYY-MM-DD') + (DBMS_RANDOM.VALUE * 365 * 20)
FROM dual
CONNECT BY LEVEL <= 10;

--SQL 06
INSERT INTO test_data (test_num, test_text, test_datetime)
SELECT
FLOOR(DBMS_RANDOM.VALUE * 1000000),
DBMS_RANDOM.STRING('a', 20),
TO_DATE('2000-01-01', 'YYYY-MM-DD') + (DBMS_RANDOM.VALUE * 365 * 20)
FROM dual
CONNECT BY LEVEL <= 1000000;

/*
Recursive CTE
*/

--SQL 07
WITH dummy_rows (id) AS (
  SELECT 1 AS id
  FROM dual
  UNION ALL
  SELECT id + 1
  FROM dummy_rows
  WHERE id < 10
)
SELECT id
FROM dummy_rows;

--SQL 08
INSERT INTO test_data (test_num, test_text, test_datetime)
WITH dummy_rows (id) AS (
  SELECT 1 AS id
  FROM dual
  UNION ALL
  SELECT id + 1
  FROM dummy_rows
  WHERE id < 1000000
)
SELECT
FLOOR(DBMS_RANDOM.VALUE * 1000000),
DBMS_RANDOM.STRING('a', 20),
TO_DATE('2000-01-01', 'YYYY-MM-DD') + (DBMS_RANDOM.VALUE * 365 * 20)
FROM dummy_rows;


/*
CTE with Cross Join
*/
--SQL 09
WITH dummy_rows_a AS (
  SELECT column_name
  FROM all_tab_cols
  FETCH FIRST 10 ROW ONLY
),
dummy_rows_b AS (
  SELECT column_name
  FROM all_tab_cols
  FETCH FIRST 10 ROW ONLY
)
SELECT
FLOOR(DBMS_RANDOM.VALUE * 1000000),
DBMS_RANDOM.STRING('a', 20),
TO_DATE('2000-01-01', 'YYYY-MM-DD') + (DBMS_RANDOM.VALUE * 365 * 20)
FROM dummy_rows_a
CROSS JOIN dummy_rows_b;


--SQL 10
INSERT INTO test_data (test_num, test_text, test_datetime)
WITH dummy_rows_a AS (
  SELECT column_name
  FROM all_tab_cols
  FETCH FIRST 1000 ROW ONLY
),
dummy_rows_b AS (
  SELECT column_name
  FROM all_tab_cols
  FETCH FIRST 1000 ROW ONLY
)
SELECT
FLOOR(DBMS_RANDOM.VALUE * 1000000),
DBMS_RANDOM.STRING('a', 20),
TO_DATE('2000-01-01', 'YYYY-MM-DD') + (DBMS_RANDOM.VALUE * 365 * 20)
FROM dummy_rows_a
CROSS JOIN dummy_rows_b;