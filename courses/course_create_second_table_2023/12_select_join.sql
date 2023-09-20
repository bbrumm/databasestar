/*
Select using a join
*/

SELECT
product_name,
price,
supplier_id,
supplier_name,
city,
num_employees
FROM product
INNER JOIN supplier
ON product.supplier_id = supplier.supplier_id;

/*
Add table names as qualifiers
*/

SELECT
product.product_name,
product.price,
supplier.supplier_id,
supplier.supplier_name,
supplier.city,
supplier.num_employees
FROM product
INNER JOIN supplier
ON product.supplier_id = supplier.supplier_id;

/*
Use a where clause
*/

SELECT
product.product_name,
product.price,
supplier.supplier_id,
supplier.supplier_name,
supplier.city,
supplier.num_employees
FROM product, supplier
WHERE product.supplier_id = supplier.supplier_id;