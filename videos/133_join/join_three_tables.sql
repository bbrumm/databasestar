/*
Join 3 tables
*/

SELECT *
FROM product;

SELECT *
FROM product_category;

SELECT
product.product_id,
product.product_name,
product_category.category_id,
product_category.category_name
FROM product
INNER JOIN product_category ON product.category_id = product_category.category_id;


SELECT
product.product_id,
product.product_name,
product_category.category_id,
product_category.category_name,
supplier.supplier_name
FROM product
INNER JOIN product_category ON product.category_id = product_category.category_id
INNER JOIN supplier ON product.supplier_id = supplier.supplier_id;


SELECT
product.product_id,
product.product_name,
product_category.category_id,
product_category.category_name,
supplier.supplier_name
FROM product
INNER JOIN product_category ON product.category_id = product_category.category_id
LEFT JOIN supplier ON product.supplier_id = supplier.supplier_id;



SELECT
product.product_id,
product.product_name,
product_category.category_id,
product_category.category_name,
supplier.supplier_name
FROM product
INNER JOIN product_category ON product.category_id = product_category.category_id
LEFT JOIN supplier ON product.supplier_id = supplier.supplier_id
INNER JOIN cust_order ON product.product_id = cust_order.product_id;
