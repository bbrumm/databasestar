/*
Lesson 33
*/

--SQL 01 - MySQL, Postgres
SELECT CURRENT_DATE();

--SQL 02
SELECT NOW();

--SQL 03
SELECT
supplier_id,
supplier_name,
start_date
FROM supplier;

--SQL 04
SELECT
supplier_id,
supplier_name,
start_date,
YEAR(start_date)
FROM supplier;

--SQL 05 - Postgres
SELECT LOCALTIMESTAMP();

--SQL 06 - Postgres
SELECT
supplier_id,
supplier_name,
start_date,
EXTRACT('Year' FROM start_date)
FROM supplier;

--SQL 07 - Oracle
SELECT SYSDATE
FROM dual;

--SQL 08 - Oracle
SELECT TO_CHAR(SYSDATE, 'DD-MM-YYYY hh:mi:ss');

--SQL 09 - Oracle
SELECT supplier_id, supplier_name, start_date,
EXTRACT(YEAR FROM start_date)
FROM supplier;

--SQL 10 - SQL Server
SELECT SYSDATETIME();

--SQL 11
SELECT CONVERT(date, SYSDATETIME());