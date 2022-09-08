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
  active_status VARCHAR2(10),
  CONSTRAINT pk_person PRIMARY KEY (person_id),
  CONSTRAINT fk_person_cid FOREIGN KEY (company_id) REFERENCES company(company_id)
);

CREATE TABLE sales_order (
  id NUMBER(20),
  person_id NUMBER(20),
  order_date DATE,
  order_value NUMBER(6),
  CONSTRAINT pk_salesorder PRIMARY KEY (id),
  CONSTRAINT fk_salesorder_per FOREIGN KEY (person_id) REFERENCES person(person_id)
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
VALUES (7, 'Things and Stuff', 'Miami', 5);
INSERT INTO company (company_id, company_name, city, num_employees)
VALUES (8, 'Paper Co', 'Portland', 21);

--Insert Person
INSERT INTO person (person_id, first_name, last_name, company_id, active_status)
VALUES (1, 'John', 'Smith', 1, 'Active');
INSERT INTO person (person_id, first_name, last_name, company_id, active_status)
VALUES (2, 'Sarah', 'Jones', 4, 'Active');
INSERT INTO person (person_id, first_name, last_name, active_status)
VALUES (3, 'Steven', 'Brown', 'Inactive');
INSERT INTO person (person_id, first_name, last_name, active_status)
VALUES (4, 'Rupert', NULL, NULL);
INSERT INTO person (person_id, first_name, last_name, company_id, active_status)
VALUES (5, 'Claire', 'Johnson', 1, 'Active');
INSERT INTO person (person_id, first_name, last_name)
VALUES (6, 'Jack', 'Anderson');
INSERT INTO person (person_id, first_name, last_name, company_id, active_status)
VALUES (7, 'Peter', 'Smith', 3, 'Inactive');
INSERT INTO person (person_id, first_name, last_name, company_id, active_status)
VALUES (8, 'Naomi', 'Broad', 2, 'Active');
INSERT INTO person (person_id, first_name, last_name, active_status)
VALUES (9, 'Mary', 'Watson', 'Active');
INSERT INTO person (person_id, first_name, last_name, company_id, active_status)
VALUES (10, 'Anna', 'Storm', 5, 'Active');
INSERT INTO person (person_id, first_name, last_name, company_id, active_status)
VALUES (11, 'Steph', 'Donaldson', 8, 'Active');
INSERT INTO person (person_id, first_name, last_name, company_id, active_status)
VALUES (12, 'Matthew', 'Jones', 7, 'Active');


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
INSERT INTO sales_order (id, person_id, order_date, order_value) VALUES (31, 11, DATE '2020-7-8', 151);
INSERT INTO sales_order (id, person_id, order_date, order_value) VALUES (32, 12, DATE '2020-6-5', 46);
INSERT INTO sales_order (id, person_id, order_date, order_value) VALUES (33, 11, DATE '2020-4-13', 85);
INSERT INTO sales_order (id, person_id, order_date, order_value) VALUES (34, 12, DATE '2020-5-21', 310);
INSERT INTO sales_order (id, person_id, order_date, order_value) VALUES (35, 12, DATE '2020-2-19', 110);
