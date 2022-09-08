/*
Lesson 03
SQL Server
*/

ALTER TABLE person
ADD company_name VARCHAR(200);

SELECT first_name, last_name, company_name
FROM person;
