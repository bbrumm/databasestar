/*
Alter the supplier table
SQL Server
*/

ALTER TABLE supplier
ADD supplier_id INT;

SELECT
supplier_id,
supplier_name,
city,
num_employees
FROM supplier;