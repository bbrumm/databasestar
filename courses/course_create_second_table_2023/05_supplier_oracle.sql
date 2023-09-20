/*
Create and populate the supplier table
Oracle
*/

CREATE TABLE supplier (
  supplier_name VARCHAR2(200),
  city VARCHAR2(200),
  num_employees NUMBER(8)
);


INSERT INTO supplier (supplier_name, city, num_employees)
VALUES ('Smith', 'Chicago', 20);
INSERT INTO supplier (supplier_name, city, num_employees)
VALUES ('Hush', null, 150);
INSERT INTO supplier (supplier_name, city, num_employees)
VALUES ('Ralph Lauren', 'Portland', null);
INSERT INTO supplier (supplier_name, city, num_employees)
VALUES ('Nike', 'New York City', 3200);
INSERT INTO supplier (supplier_name, city, num_employees)
VALUES ('Adidas', 'Miami', 15);
INSERT INTO supplier (supplier_name, city, num_employees)
VALUES ('Harrods', 'Miami', 80);


SELECT supplier_name, city, num_employees
FROM supplier;

