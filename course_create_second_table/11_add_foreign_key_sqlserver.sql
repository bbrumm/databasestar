/*
Lesson 11
SQL Server
*/

ALTER TABLE person
ADD company_id INT;

ALTER TABLE person
ADD CONSTRAINT fk_person_companyid
FOREIGN KEY (company_id)
REFERENCES company (company_id);


UPDATE person
SET company_id = 1
WHERE first_name = 'John';

UPDATE person
SET company_id = 4
WHERE first_name = 'Sarah';

UPDATE person
SET company_id = 1
WHERE first_name = 'Claire';

UPDATE person
SET company_id = 3
WHERE first_name = 'Peter';

UPDATE person
SET company_id = 2
WHERE first_name = 'Naomi';

UPDATE person
SET company_id = 5
WHERE first_name = 'Anna';


SELECT
first_name,
last_name,
company_name,
company_id
FROM person;

ALTER TABLE person
DROP COLUMN company_name;


SELECT
first_name,
last_name,
company_id
FROM person;

