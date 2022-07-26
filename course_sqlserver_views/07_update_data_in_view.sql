--Updating data in a view
SELECT * FROM person_summary
WHERE id = 200000;

UPDATE person_summary
SET full_name = 'Sam Test'
WHERE id = 200000;

SELECT * FROM person_summary
WHERE id = 200000;

SELECT * FROM person;
WHERE id = 200000;

UPDATE person_summary
SET full_name = 'Sarah Test',
gender = 'F'
WHERE id = 200000;
