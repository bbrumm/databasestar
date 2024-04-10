/*
Lesson 27
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
SELECT
p.product_id,
p.product_name,
p.price,
s.supplier_id, 
s.supplier_name,
s.start_date
FROM product p
INNER JOIN supplier s ON p.supplier_id = s.supplier_id;
