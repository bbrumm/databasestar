/*
Alter the supplier table
Oracle
*/

ALTER TABLE supplier
ADD supplier_id NUMBER(20);

SELECT
supplier_id,
supplier_name,
city,
num_employees
FROM supplier;