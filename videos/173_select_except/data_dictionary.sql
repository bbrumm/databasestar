/*
Query the data dictionary to find all columns in a table
MySQL, SSMS, Postgres
*/

SELECT CONCAT(column_name, ',')
FROM information_schema.columns
WHERE table_name = 'car_prices';
/*
Oracle
*/

SELECT CONCAT(column_name, ',')
FROM all_tab_cols
WHERE table_name = 'EMPLOYEES';