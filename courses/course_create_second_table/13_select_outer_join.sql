/*
Lesson 13
*/

SELECT
person.first_name,
person.last_name,
company.company_id,
company.company_name,
company.city,
company.num_employees
FROM person
LEFT JOIN company
ON person.company_id = company.company_id;


SELECT
person.first_name,
person.last_name,
company.company_id,
company.company_name,
company.city,
company.num_employees
FROM person
RIGHT JOIN company
ON person.company_id = company.company_id;


SELECT
person.first_name,
person.last_name,
company.company_id,
company.company_name,
company.city,
company.num_employees
FROM person
FULL JOIN company
ON person.company_id = company.company_id;

