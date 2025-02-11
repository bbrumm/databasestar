/*
Date and time
*/
DROP TABLE date_test;

--SQL 01
CREATE TABLE date_test (
  id NUMBER,
  my_date DATE
);

--SQL 02
SELECT *
FROM NLS_SESSION_PARAMETERS
WHERE parameter = 'NLS_DATE_FORMAT';

--SQL 03
INSERT INTO date_test (id, my_date)
VALUES (1, '01/08/24');

--SQL 04
SELECT id, my_date
FROM date_test;

--SQL 05
INSERT INTO date_test (id, my_date)
VALUES (2, SYSDATE);

--SQL 06
INSERT INTO date_test (id, my_date)
VALUES (3, TO_DATE('2024-08-03', 'YYYY-MM-DD'));

--SQL 07
INSERT INTO date_test (id, my_date)
VALUES (4, DATE'2024-08-04');

--SQL 08
SELECT
id,
my_date,
TO_CHAR(my_date, 'YYYY-MM-DD HH:MI:SS AM') AS my_datetime
FROM date_test;


--SQL 09
CREATE TABLE timestamp_test (
  id NUMBER,
  my_timestamp TIMESTAMP WITH TIME ZONE
);

-- SQL 10
INSERT INTO timestamp_test (id, my_timestamp)
VALUES (1, CURRENT_TIMESTAMP);

--SQL 11
SELECT id, my_timestamp
FROM timestamp_test;

--SQL 12
INSERT INTO timestamp_test (id, my_timestamp)
VALUES (2, TIMESTAMP '2024-09-14 08:45:11 -7:00');

/*
--SQL 09
SELECT
id,
my_timestamp,
my_timestamp AT TIME ZONE 'UTC' AS utc_value
FROM timestamp_test;

--SQL 10
SELECT
id,
my_timestamp,
my_timestamp AT TIME ZONE 'America/New_York' AS ny_time
FROM timestamp_test;
*/
