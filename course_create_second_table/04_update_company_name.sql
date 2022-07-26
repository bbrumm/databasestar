/*
Lesson 04
*/

UPDATE person
SET company_name = 'ABC Company'
WHERE first_name = 'John';

UPDATE person
SET company_name = 'DE Consulting'
WHERE first_name = 'Sarah';

UPDATE person
SET company_name = 'ABC Company'
WHERE first_name = 'Claire';

UPDATE person
SET company_name = 'Big Store Electricians'
WHERE first_name = 'Anna';

UPDATE person
SET company_name = 'Carpet Central'
WHERE first_name = 'Naomi';

UPDATE person
SET company_name = 'PM and Co'
WHERE first_name = 'Peter';


SELECT first_name, last_name, company_name
FROM person;
