/*
Lesson 21
*/

--SQL 01
SELECT product_name, price
FROM product;

--SQL 02 - Oracle
CREATE TABLE supplier (
  supplier_name VARCHAR2(200),
  start_date DATE
);

--SQL 03
INSERT INTO supplier (supplier_name, start_date)
VALUES ('Quality Goods', '20-MAR-2012');

--SQL 04
SELECT value
FROM SYS.NLS_DATABASE_PARAMETERS
WHERE parameter = 'NLS_DATE_FORMAT';

--SQL 05
INSERT INTO supplier (supplier_name, start_date) VALUES
('ABC Clothing', DATE '2018-06-11');

--SQL 06
SELECT supplier_name, start_date
FROM supplier;

--SQL 07 - SQL Server, MySQL, Postgres
CREATE TABLE supplier (
  supplier_name VARCHAR(200),
  start_date DATE
);

--SQL 08 - SQL Server
INSERT INTO supplier (supplier_name, start_date) VALUES
('Quality Goods', '20120320');
INSERT INTO supplier (supplier_name, start_date) VALUES
('ABC Clothing', '20180611');

--SQL 09 - MySQL, Postgres
INSERT INTO supplier (supplier_name, start_date) VALUES
('Quality Goods', '2012-03-20');
INSERT INTO supplier (supplier_name, start_date) VALUES
('ABC Clothing', '2018-06-11');