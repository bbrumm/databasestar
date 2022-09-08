/*
Lesson 06
Oracle
*/

CREATE SEQUENCE person_seq;

SELECT
person_seq.NEXTVAL
...
;


CREATE TABLE person (
  person_id NUMBER(20) GENERATED ALWAYS AS IDENTITY,
  company_id NUMBER(20),
  first_name VARCHAR2(100),
  last_name VARCHAR2(100),
  CONSTRAINT pk_person PRIMARY KEY (person_id),
  CONSTRAINT fk_person_cid FOREIGN KEY (company_id) REFERENCES company(company_id)
);
