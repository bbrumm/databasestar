/*
Lesson 02
Oracle
*/

CREATE TABLE company (
  company_id NUMBER(20),
  company_name VARCHAR2(200),
  city VARCHAR2(200),
  num_employees NUMBER(8),
  CONSTRAINT pk_company PRIMARY KEY (company_id)
);

CREATE TABLE person (
  person_id NUMBER(20),
  company_id NUMBER(20),
  first_name VARCHAR2(100),
  last_name VARCHAR2(100),
  CONSTRAINT pk_person PRIMARY KEY (person_id),
  CONSTRAINT fk_person_cid FOREIGN KEY (company_id)  
  REFERENCES company(company_id)
);


INSERT INTO company (company_id, company_name, city, num_employees)
VALUES (1, 'ABC Company', 'Chicago', 20);
INSERT INTO company (company_id, company_name, city, num_employees)
VALUES (2, 'Carpet Central', NULL, 150);
INSERT INTO company (company_id, company_name, city, num_employees)
VALUES (3, 'PM and Co', 'Portland', NULL);
INSERT INTO company (company_id, company_name, city, num_employees)
VALUES (4, 'DE Consulting', 'New York City', 3200);
INSERT INTO company (company_id, company_name, city, num_employees)
VALUES (5, 'Big Store Electricians', 'Miami', 15);
INSERT INTO company (company_id, company_name, city, num_employees)
VALUES (6, 'Wands R Us', 'Miami', 80);

INSERT INTO person (person_id, first_name, last_name, company_id) VALUES (1, 'John', 'Smith', 1);
INSERT INTO person (person_id, first_name, last_name, company_id) VALUES (2, 'Sarah', 'Jones', 4);
INSERT INTO person (person_id, first_name, last_name) VALUES (3, 'Steven', 'Brown');
INSERT INTO person (person_id, first_name, last_name) VALUES (4, 'Rupert', NULL);
INSERT INTO person (person_id, first_name, last_name, company_id) VALUES (5, 'Claire', 'Johnson', 1);
INSERT INTO person (person_id, first_name, last_name) VALUES (6, 'Jack', 'Anderson');
INSERT INTO person (person_id, first_name, last_name, company_id) VALUES (7, 'Peter', 'Smith', 3);
INSERT INTO person (person_id, first_name, last_name, company_id) VALUES (8, 'Naomi', 'Broad', 2);
INSERT INTO person (person_id, first_name, last_name) VALUES (9, 'Mary', 'Watson');
INSERT INTO person (person_id, first_name, last_name, company_id) VALUES (10, 'Anna', 'Storm', 5);




SELECT
person_id,
first_name,
last_name,
company_id
FROM person;


SELECT
company_id,
company_name,
city,
num_employees
FROM company;
