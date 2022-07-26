/*
Lesson 07
Postgres
*/

ALTER TABLE company
ADD company_id INTEGER;

SELECT
company_id,
company_name,
city,
num_employees
FROM company;
