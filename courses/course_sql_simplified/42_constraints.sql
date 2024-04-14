/*
Lesson 42
*/

--SQL 01
DROP TABLE customer;

--SQL 02
CREATE TABLE customer (
  customer_id INT,
  customer_name VARCHAR(100),
  start_date DATE
);

--SQL 03
CREATE TABLE customer (
  customer_id INT,
  customer_name VARCHAR(100) UNIQUE,
  start_date DATE
);

--SQL 04
INSERT INTO customer (customer_id, customer_name, start_date)
VALUES (1, 'ABC Company', '2023-04-02');

--SQL 05
INSERT INTO customer (customer_id, customer_name, start_date)
VALUES (2, 'Bags R Us', '2023-09-24');

--SQL 06
INSERT INTO customer (customer_id, customer_name, start_date)
VALUES (3, 'ABC Company', '2023-05-29');

--SQL 07
CREATE TABLE customer (
  customer_id INT,
  customer_name VARCHAR(100),
  start_date DATE,
  CONSTRAINT uc_customer_custname UNIQUE (customer_name)
);

--SQL 07
CREATE TABLE customer (
  customer_id INT,
  customer_name VARCHAR(100) NOT NULL,
  start_date DATE
);

--SQL 08
INSERT INTO customer (customer_id, customer_name, start_date)
VALUES (2, NULL, '2023-04-03');

--SQL 09
INSERT INTO customer (customer_id, start_date)
VALUES (2, '2023-04-03');

--SQL 10
CREATE TABLE customer (
  customer_id INT,
  customer_name VARCHAR(100),
  start_date DATE CHECK (start_date > '20200101')
);

--SQL 11
CREATE TABLE customer (
  customer_id INT,
  customer_name VARCHAR(100),
  start_date DATE,
  CONSTRAINT ck_customer_startdate CHECK (start_date > '20200101')
);

--SQL 12
INSERT INTO customer (customer_id, customer_name, start_date)
VALUES (1, 'ABC Company', '2023-05-29');

--SQL 13
INSERT INTO customer (customer_id, customer_name, start_date)
VALUES (2, 'Bags R Us', '2019-09-24');

--SQL 14 - Oracle
CREATE TABLE customer (
  customer_id INTEGER,
  customer_name VARCHAR2(100),
  start_date DATE,
  CONSTRAINT uc_customer_custname UNIQUE (customer_name)
);

--SQL 15
INSERT INTO customer (customer_id, customer_name, start_date)
VALUES (1, 'ABC Company', '2023-04-02');

--SQL 16
INSERT INTO customer (customer_id, customer_name, start_date)
VALUES (3, 'ABC Company', '2023-05-29');

--SQL 17 - Oracle
CREATE TABLE customer (
  customer_id INTEGER,
  customer_name VARCHAR2(100) NOT NULL,
  start_date DATE
);

--SQL 18 - Oracle
CREATE TABLE customer (
  customer_id INTEGER,
  customer_name VARCHAR2(100),
  start_date DATE,
  CONSTRAINT ck_customer_startdate CHECK (start_date > DATE '20200101')
);