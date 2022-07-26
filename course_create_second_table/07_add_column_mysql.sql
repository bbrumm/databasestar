/*
Lesson 07
MySQL
*/

ALTER TABLE company
ADD company_id INT;

SELECT
company_id,
company_name,
city,
num_employees
FROM company;
