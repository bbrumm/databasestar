/*
Date and time
*/

--SQL 01
CREATE TABLE date_test (
  id INTEGER,
  my_date DATE
);

--SQL 02
INSERT INTO date_test (id, my_date)
VALUES (1, '2024-08-01');

--SQL 03
SELECT id, my_date
FROM date_test;

--SQL 04
INSERT INTO date_test (id, my_date)
VALUES (2, CURRENT_DATE);

--SQL 05
CREATE TABLE timestamp_test (
  id INTEGER,
  my_timestamp TIMESTAMP WITH TIME ZONE
);

-- SQL 06
INSERT INTO timestamp_test (id, my_timestamp)
VALUES (1, CURRENT_TIMESTAMP);

--SQL 07
SELECT id, my_timestamp
FROM timestamp_test;

--SQL 08
INSERT INTO timestamp_test (id, my_timestamp)
VALUES (2, '2024-07-28 08:45:11 -7:00');

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
