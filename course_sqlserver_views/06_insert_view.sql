--Inserting into a View

person_summary -- 200,000

--Existing view
CREATE VIEW person_summary AS
SELECT id, full_name, gender
FROM person;

INSERT INTO person_summary (id, full_name, gender)
VALUES (200000, 'John Test', 'M');

SELECT * FROM person_summary
WHERE id = 200000;
