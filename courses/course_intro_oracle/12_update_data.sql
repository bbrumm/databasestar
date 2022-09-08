/*
Lesson 12
*/

UPDATE person
SET last_name = 'Smithton'
WHERE last_name = 'Smith';


SELECT first_name, last_name
FROM person;

SELECT first_name, last_name
FROM person
WHERE last_name = 'Smithton';

SELECT first_name, last_name
FROM person
WHERE last_name = 'Smith';