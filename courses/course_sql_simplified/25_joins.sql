/*
Lesson 25
*/

--SQL 01
SELECT product_id, supplier_id, product_name, price
FROM product;

SELECT supplier_id, supplier_name, start_date
FROM supplier;

--SQL 02
SELECT product_id, product_name, price
FROM product
INNER JOIN supplier ON product.supplier_id = supplier.supplier_id;

--SQL 03
SELECT product_id, product_name, price, supplier_name, start_date
FROM product
INNER JOIN supplier ON product.supplier_id = supplier.supplier_id;

--SQL 04
SELECT product_id, product_name, price, supplier_id, supplier_name, start_date
FROM product
INNER JOIN supplier ON product.supplier_id = supplier.supplier_id;

--SQL 05
SELECT
product.product_id,
product.product_name,
product.price,
supplier.supplier_id, 
supplier.supplier_name,
supplier.start_date
FROM product
INNER JOIN supplier ON product.supplier_id = supplier.supplier_id;

--SQL 06
SELECT
product.product_id,
product.product_name,
product.price,
supplier.supplier_id, 
supplier.supplier_name,
supplier.start_date
FROM product, supplier
WHERE product.supplier_id = supplier.supplier_id;