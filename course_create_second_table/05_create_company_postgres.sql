/*
Lesson 05
Postgres
*/

CREATE TABLE company (
    company_name CHARACTER VARYING(200),
    city CHARACTER VARYING(200),
    num_employees INTEGER
);

INSERT INTO company (company_name, city, num_employees)
VALUES ('ABC Company', 'Chicago', 20);
INSERT INTO company (company_name, city, num_employees)
VALUES ('Carpet Central', null, 150);
INSERT INTO company (company_name, city, num_employees)
VALUES ('PM and Co', 'Portland', null);
INSERT INTO company (company_name, city, num_employees)
VALUES ('DE Consulting', 'New York City', 3200);
INSERT INTO company (company_name, city, num_employees)
VALUES ('Big Store Electricians', 'Miami', 15);
INSERT INTO company (company_name, city, num_employees)
VALUES ('Wands R Us', 'Miami', 80);


SELECT company_name, city, num_employees
FROM company;