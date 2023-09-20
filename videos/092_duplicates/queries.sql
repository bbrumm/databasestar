CREATE TABLE person (
    id SERIAL PRIMARY KEY,
	first_name VARCHAR(200),
	last_name VARCHAR(200),
	date_of_birth DATE
);

INSERT INTO person (first_name, last_name, date_of_birth)
VALUES ('Sarah', 'Jones', '1985-03-01');
INSERT INTO person (first_name, last_name, date_of_birth)
VALUES ('Michael', 'Anderson', '1982-05-20');

SELECT
id,
first_name,
last_name,
date_of_birth
FROM person;

INSERT INTO person (first_name, last_name, date_of_birth)
VALUES ('John', 'Smith', '1980-01-01');
INSERT INTO person (first_name, last_name, date_of_birth)
VALUES ('John', 'Smith', '1980-01-01');

ALTER TABLE person 
ADD CONSTRAINT uc_person UNIQUE (first_name, last_name, date_of_birth);

UPDATE person
SET first_name = 'Jonathan'
WHERE id = 4;