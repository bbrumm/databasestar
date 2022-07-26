/*
Lesson 06
Postgres
*/

CREATE TABLE person (
  person_id INTEGER SERIAL,
  company_id INTEGER,
  first_name CHARACTER VARYING(100),
  last_name CHARACTER VARYING(100),
  CONSTRAINT pk_person PRIMARY KEY (person_id),
  CONSTRAINT fk_person_cid FOREIGN KEY (company_id) REFERENCES company(company_id)
);


CREATE TABLE person (
  person_id INTEGER GENERATED ALWAYS AS IDENTITY,
  company_id INTEGER,
  first_name CHARACTER VARYING(100),
  last_name CHARACTER VARYING(100),
  CONSTRAINT pk_person PRIMARY KEY (person_id),
  CONSTRAINT fk_person_cid FOREIGN KEY (company_id) REFERENCES company(company_id)
);


DROP TABLE person;

CREATE TABLE person (
  person_id INT IDENTITY(1, 1),
  company_id INT,
  first_name VARCHAR(100),
  last_name VARCHAR(100),
  CONSTRAINT pk_person PRIMARY KEY (person_id),
  CONSTRAINT fk_person_cid FOREIGN KEY (company_id) REFERENCES company(company_id)
);
