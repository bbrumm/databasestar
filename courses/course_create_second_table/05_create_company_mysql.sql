/*
Lesson 05
MySQL
*/

CREATE TABLE company (
    company_name VARCHAR(200),
    city VARCHAR(200),
    num_employees INT
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