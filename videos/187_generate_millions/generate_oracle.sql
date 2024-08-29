CREATE TABLE test_data (
  test_num INT,
  test_text VARCHAR2(100),
  test_datetime TIMESTAMP WITH TIME ZONE
);

SELECT *
FROM test_data;

TRUNCATE TABLE test_data;

ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MON-YYYY HH24:MI:SS';

SELECT
FLOOR(DBMS_RANDOM.VALUE * 1000000) AS test_num,
DBMS_RANDOM.STRING('a', 20) AS test_text,
TO_DATE('2000-01-01', 'YYYY-MM-DD') + (DBMS_RANDOM.VALUE * 365 * 20) AS test_date
FROM dual;

/* Create stored proc */

CREATE OR REPLACE PROCEDURE generate_sample_data (number_of_rows IN INTEGER)
AS
BEGIN
  FOR row_increment IN 1 .. number_of_rows LOOP
    INSERT INTO test_data (test_num, test_text, test_datetime)
    SELECT
    FLOOR(DBMS_RANDOM.VALUE * 1000000),
    DBMS_RANDOM.STRING('a', 20),
    TO_DATE('2000-01-01', 'YYYY-MM-DD') + (TRUNC(DBMS_RANDOM.VALUE) * 365 * 20)
    FROM dual;
  END LOOP;
END;
/

CALL generate_sample_data(1000000);

/*
Use connect by
*/

select
FLOOR(DBMS_RANDOM.VALUE * 1000000),
DBMS_RANDOM.STRING('a', 20),
TO_DATE('2000-01-01', 'YYYY-MM-DD') + (TRUNC(DBMS_RANDOM.VALUE) * 365 * 20)
from   dual
connect by level < 10;


INSERT INTO test_data (test_num, test_text, test_datetime)
SELECT
FLOOR(DBMS_RANDOM.VALUE * 1000000),
DBMS_RANDOM.STRING('a', 20),
TO_DATE('2000-01-01', 'YYYY-MM-DD') + (TRUNC(DBMS_RANDOM.VALUE) * 365 * 20)
FROM dual
CONNECT BY LEVEL <= 1000000;

