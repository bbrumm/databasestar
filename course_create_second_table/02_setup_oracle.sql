/*
Lesson 02
Oracle
*/

CREATE TABLE person (
  first_name VARCHAR2(100),
  last_name VARCHAR2(100)
);

INSERT INTO person (first_name, last_name) VALUES ('John', 'Smith');
INSERT INTO person (first_name, last_name) VALUES ('Sarah', 'Jones');
INSERT INTO person (first_name, last_name) VALUES ('Steven', 'Brown');
INSERT INTO person (first_name, last_name) VALUES ('Rupert', NULL);
INSERT INTO person (first_name, last_name) VALUES ('Claire', 'Johnson');
INSERT INTO person (first_name, last_name) VALUES ('Jack', 'Anderson');
INSERT INTO person (first_name, last_name) VALUES ('Peter', 'Smith');
INSERT INTO person (first_name, last_name) VALUES ('Naomi', 'Broad');
INSERT INTO person (first_name, last_name) VALUES ('Mary', 'Watson');
INSERT INTO person (first_name, last_name) VALUES ('Anna', 'Storm');

SELECT first_name, last_name
FROM person;
