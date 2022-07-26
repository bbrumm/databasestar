/*
Lesson 10
*/

ALTER TABLE company
ADD CONSTRAINT uc_company_name
UNIQUE (company_name);

SELECT
company_id,
company_name
FROM company
ORDER BY company_name ASC;

UPDATE company
SET company_name = 'Paul Murray Group'
WHERE id = 7;

ALTER TABLE company
ADD CONSTRAINT uc_company_name
UNIQUE (company_name);

INSERT INTO company (company_id, company_name)
VALUES (8, 'ABC Company');

INSERT INTO company (company_id, company_name)
VALUES (8, 'ABC Co');