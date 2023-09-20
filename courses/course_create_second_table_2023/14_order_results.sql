/*
Ordering results
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

/*
Add order by asc
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
ON product.supplier_id = supplier.supplier_id
ORDER BY product.price ASC;

/*
Order by desc
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
ON product.supplier_id = supplier.supplier_id
ORDER BY product.price DESC;