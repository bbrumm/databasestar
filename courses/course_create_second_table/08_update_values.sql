/*
Lesson 08
*/

UPDATE company
SET company_id = 1
WHERE company_name = 'ABC Company';

UPDATE company
SET company_id = 2
WHERE company_name = 'Carpet Central';

UPDATE company
SET company_id = 3
WHERE company_name = 'PM and Co';

UPDATE company
SET company_id = 4
WHERE company_name = 'DE Consulting';

UPDATE company
SET company_id = 5
WHERE company_name = 'Big Store Electricians';

UPDATE company
SET company_id = 6
WHERE company_name = 'Wands R Us';


SELECT
company_id,
company_name,
city,
num_employees
FROM company;
