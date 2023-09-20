/*
Create and populate the supplier table
SQL Server
*/

CREATE TABLE company (
  supplier_name VARCHAR(200),
  city VARCHAR(200),
  num_employees INT
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
