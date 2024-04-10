/*
Lesson 24
*/

--SQL 01
ALTER TABLE supplier
ADD COLUMN supplier_id INT;

--SQL 02
ALTER TABLE supplier
ADD CONSTRAINT pk_supplier PRIMARY KEY (supplier_id);

--SQL 03
UPDATE supplier SET supplier_id = 1 WHERE supplier_name = 'Quality Goods';
UPDATE supplier SET supplier_id = 2 WHERE supplier_name = 'ABC Clothing';

--SQL 04
ALTER TABLE product
ADD COLUMN supplier_id INT;

--SQL 05
ALTER TABLE product
ADD CONSTRAINT fk_prod_supplierid
FOREIGN KEY (supplier_id)
REFERENCES supplier (supplier_id);

--SQL 06
UPDATE product
SET supplier_id = 1
WHERE product_id IN (1, 2, 4, 8, 12, 14, 18, 22);

UPDATE product
SET supplier_id = 2
WHERE product_id IN (3, 5, 6, 9, 13, 15, 17, 19, 20, 24);

--SQL 07
SELECT product_id, supplier_id, product_name, price
FROM product;
SELECT supplier_id, supplier_name, start_date
FROM supplier;