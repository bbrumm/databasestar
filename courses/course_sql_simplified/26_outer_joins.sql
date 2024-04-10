/*
Lesson 26
*/

--SQL 01
SELECT
product.product_id,
product.product_name,
product.price,
supplier.supplier_id, 
supplier.supplier_name,
supplier.start_date
FROM product
INNER JOIN supplier ON product.supplier_id = supplier.supplier_id;

--SQL 02
INSERT INTO supplier (supplier_id, supplier_name, start_date) VALUES
(3, 'XYZ Corp', '2021-03-20');

--SQL 03
SELECT
product.product_id,
product.product_name,
product.price,
supplier.supplier_id, 
supplier.supplier_name,
supplier.start_date
FROM product
LEFT JOIN supplier ON product.supplier_id = supplier.supplier_id;

--SQL 04
SELECT
product.product_id,
product.product_name,
product.price,
supplier.supplier_id, 
supplier.supplier_name,
supplier.start_date
FROM product
RIGHT JOIN supplier ON product.supplier_id = supplier.supplier_id;

--SQL 05
SELECT
product.product_id,
product.product_name,
product.price,
supplier.supplier_id, 
supplier.supplier_name,
supplier.start_date
FROM product
FULL JOIN supplier ON product.supplier_id = supplier.supplier_id;

