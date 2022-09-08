--Create
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
  CONSTRAINT fk_person_cid FOREIGN KEY (company_id) REFERENCES company(company_id)
);

/*
Note: FK constraint to Person removed for this course,
due to person data not being inserted yet.
*/
CREATE TABLE sales_order (
  id NUMBER(20),
  person_id NUMBER(20),
  order_date DATE,
  order_value NUMBER(6),
  CONSTRAINT pk_salesorder PRIMARY KEY (id)
);


--Insert Company
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
INSERT INTO company (company_id, company_name, city, num_employees)
VALUES (7, 'Pear Inc.', 'Houston', 2050);
INSERT INTO company (company_id, company_name, city, num_employees)
VALUES (8, 'Nile River Construction', 'New York City', 18);
INSERT INTO company (company_id, company_name, city, num_employees)
VALUES (9, 'Maxisoft', 'Portland', 150);
INSERT INTO company (company_id, company_name, city, num_employees)
VALUES (10, 'YourPlace', 'Austin', 90);
INSERT INTO company (company_id, company_name, city, num_employees)
VALUES (11, 'Waterworld', 'Miami', 200);
INSERT INTO company (company_id, company_name, city, num_employees)
VALUES (12, 'TRA Travel', 'Boston', 25);
INSERT INTO company (company_id, company_name, city, num_employees)
VALUES (13, 'Commerce Solutions', 'New Orleans', 100);
INSERT INTO company (company_id, company_name, city, num_employees)
VALUES (14, 'World Studios', 'San Diego', 450);
INSERT INTO company (company_id, company_name, city, num_employees)
VALUES (15, 'Big Smoothies', 'Los Angeles', 2);
INSERT INTO company (company_id, company_name, city, num_employees)
VALUES (16, 'Extra', 'Seattle', 5);
INSERT INTO company (company_id, company_name, city, num_employees)
VALUES (17, 'Magical Hotels Inc', 'Minneapolis', 300);
INSERT INTO company (company_id, company_name, city, num_employees)
VALUES (18, 'WBC Water', 'Kansas City', 80);
INSERT INTO company (company_id, company_name, city, num_employees)
VALUES (19, 'Express Cleaning Solutions', 'Salt Lake City', 12);
INSERT INTO company (company_id, company_name, city, num_employees)
VALUES (20, 'Wonderful Bakery', 'Denver', 6);

--Sales Order
INSERT INTO sales_order (id, person_id, order_date, order_value) VALUES (1, 2, DATE '2020-12-5', 120);
INSERT INTO sales_order (id, person_id, order_date, order_value) VALUES (2, 5, DATE '2020-12-7', 82);
INSERT INTO sales_order (id, person_id, order_date, order_value) VALUES (3, 10, DATE '2020-12-8', 165);
INSERT INTO sales_order (id, person_id, order_date, order_value) VALUES (4, 8, DATE '2020-12-12', 239);
INSERT INTO sales_order (id, person_id, order_date, order_value) VALUES (5, 6, DATE '2020-12-15', 54);
INSERT INTO sales_order (id, person_id, order_date, order_value) VALUES (6, 2, DATE '2020-9-1', 103);
INSERT INTO sales_order (id, person_id, order_date, order_value) VALUES (7, 6, DATE '2021-1-9', 82);
INSERT INTO sales_order (id, person_id, order_date, order_value) VALUES (8, 10, DATE '2020-8-10', 63);
INSERT INTO sales_order (id, person_id, order_date, order_value) VALUES (9, 4, DATE '2019-12-15', 78);
INSERT INTO sales_order (id, person_id, order_date, order_value) VALUES (10, 5, DATE '2020-8-21', 97);
INSERT INTO sales_order (id, person_id, order_date, order_value) VALUES (11, 10, DATE '2019-12-15', 93);
INSERT INTO sales_order (id, person_id, order_date, order_value) VALUES (12, 1, DATE '2020-7-17', 52);
INSERT INTO sales_order (id, person_id, order_date, order_value) VALUES (13, 9, DATE '2020-5-30', 108);
INSERT INTO sales_order (id, person_id, order_date, order_value) VALUES (14, 8, DATE '2020-4-15', 128);
INSERT INTO sales_order (id, person_id, order_date, order_value) VALUES (15, 8, DATE '2020-9-11', 196);
INSERT INTO sales_order (id, person_id, order_date, order_value) VALUES (16, 1, DATE '2020-5-18', 193);
INSERT INTO sales_order (id, person_id, order_date, order_value) VALUES (17, 5, DATE '2020-1-18', 79);
INSERT INTO sales_order (id, person_id, order_date, order_value) VALUES (18, 6, DATE '2020-3-2', 60);
INSERT INTO sales_order (id, person_id, order_date, order_value) VALUES (19, 5, DATE '2020-7-14', 48);
INSERT INTO sales_order (id, person_id, order_date, order_value) VALUES (20, 1, DATE '2020-4-15', 149);
INSERT INTO sales_order (id, person_id, order_date, order_value) VALUES (21, 1, DATE '2020-12-26', 100);
INSERT INTO sales_order (id, person_id, order_date, order_value) VALUES (22, 8, DATE '2020-9-8', 43);
INSERT INTO sales_order (id, person_id, order_date, order_value) VALUES (23, 3, DATE '2020-8-27', 146);
INSERT INTO sales_order (id, person_id, order_date, order_value) VALUES (24, 6, DATE '2020-4-4', 161);
INSERT INTO sales_order (id, person_id, order_date, order_value) VALUES (25, 7, DATE '2020-8-24', 193);
INSERT INTO sales_order (id, person_id, order_date, order_value) VALUES (26, 4, DATE '2020-2-29', 128);
INSERT INTO sales_order (id, person_id, order_date, order_value) VALUES (27, 5, DATE '2020-6-3', 77);
INSERT INTO sales_order (id, person_id, order_date, order_value) VALUES (28, 9, DATE '2020-4-3', 154);
INSERT INTO sales_order (id, person_id, order_date, order_value) VALUES (29, 10, DATE '2019-11-24', 50);
INSERT INTO sales_order (id, person_id, order_date, order_value) VALUES (30, 5, DATE '2020-7-17', 62);
