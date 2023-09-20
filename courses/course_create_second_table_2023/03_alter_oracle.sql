/*
Alter table to add a supplier
Oracle
*/

ALTER TABLE product
ADD supplier_name VARCHAR2(200);

SELECT product_name, price, supplier_name
FROM product;
