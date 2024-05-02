/*
Lesson 46
*/

--SQL 01
SELECT
p.product_id,
p.product_name,
p.price,
c.category_id,
c.category_name
FROM product_category c
LEFT JOIN product p ON c.category_id = p.category_id;

--SQL 02
CREATE VIEW products_and_categories AS
SELECT
p.product_id,
p.product_name,
p.price,
c.category_id,
c.category_name
FROM product_category c
LEFT JOIN product p ON c.category_id = p.category_id;

--SQL 03
SELECT * FROM products_and_categories;

--SQL 04
SELECT
product_id,
product_name,
price,
category_id,
category_name
FROM products_and_categories;