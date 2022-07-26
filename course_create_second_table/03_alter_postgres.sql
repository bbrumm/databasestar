/*
Lesson 03
Postgres
*/

ALTER TABLE person
ADD company_name CHARACTER VARYING(200);

SELECT first_name, last_name, company_name
FROM person;
