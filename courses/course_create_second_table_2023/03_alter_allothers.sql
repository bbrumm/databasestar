/*
Alter table to add a supplier
MySQL, SQL Server, Postgres
*/

ALTER TABLE product
ADD supplier_name VARCHAR(200);

SELECT product_name, price, supplier_name
FROM product;
