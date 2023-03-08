/*
Add primary key
*/

ALTER TABLE supplier
ADD CONSTRAINT pk_supplier_id
PRIMARY KEY (supplier_id);

SELECT
supplier_id,
supplier_name,
city,
num_employees
FROM supplier;