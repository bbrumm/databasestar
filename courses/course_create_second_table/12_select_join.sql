/*
Lesson 12
*/

SELECT first_name, last_name, company_id,
company_name, city, num_employees
FROM person
INNER JOIN company
ON person.company_id = company.company_id;


SELECT
person.first_name,
person.last_name,
company.company_id,
company.company_name,
company.city,
company.num_employees
FROM person
INNER JOIN company
ON person.company_id = company.company_id;
