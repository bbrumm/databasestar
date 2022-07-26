/*
Lesson 14
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
LEFT JOIN company
ON person.company_id = company.company_id
ORDER BY person.last_name ASC;


SELECT
person.first_name,
person.last_name,
company.company_id,
company.company_name,
company.city,
company.num_employees
FROM person
LEFT JOIN company
ON person.company_id = company.company_id
ORDER BY person.last_name DESC;