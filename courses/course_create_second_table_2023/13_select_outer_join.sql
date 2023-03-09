/*
Select using outer joins
*/

SELECT
product.product_name,
product.price,
supplier.supplier_id,
supplier.supplier_name,
supplier.city,
supplier.num_employees
FROM product
LEFT JOIN supplier
ON product.supplier_id = supplier.supplier_id;


SELECT
product.product_name,
product.price,
supplier.supplier_id,
supplier.supplier_name,
supplier.city,
supplier.num_employees
FROM product
RIGHT JOIN supplier
ON product.supplier_id = supplier.supplier_id;


SELECT
product.product_name,
product.price,
supplier.supplier_id,
supplier.supplier_name,
supplier.city,
supplier.num_employees
FROM product
FULL JOIN supplier
ON product.supplier_id = supplier.supplier_id;

