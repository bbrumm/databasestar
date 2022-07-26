/*
Lesson 07
Oracle
*/

ALTER TABLE company
ADD company_id NUMBER(20);

SELECT
company_id,
company_name,
city,
num_employees
FROM company;
