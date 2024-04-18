/*
Lesson 45
*/

--SQL 01
WITH RECURSIVE category_tree AS (
    SELECT category_id, category_name, parent_category_id
    FROM product_category
    WHERE parent_category_id IS NULL
    UNION ALL
    SELECT c.category_id, c.category_name, c.parent_category_id
    FROM category_tree prior
    INNER JOIN product_category c ON prior.category_id = c.parent_category_id
)
SELECT category_id, category_name, parent_category_id
FROM category_tree;

--SQL 02 - MySQL, Postgres
WITH RECURSIVE category_tree AS (
    SELECT category_id, category_name, parent_category_id, 1 AS level
    FROM product_category
    WHERE parent_category_id IS NULL
    UNION ALL
    SELECT c.category_id, c.category_name, c.parent_category_id, prior.level + 1
    FROM category_tree prior
    INNER JOIN product_category c ON prior.category_id = c.parent_category_id
)
SELECT category_id, category_name, parent_category_id, level
FROM category_tree;


--SQL 03 - SQL Server
WITH category_tree AS (
    SELECT category_id, category_name, parent_category_id, 1 AS level
    FROM product_category
    WHERE parent_category_id IS NULL
    UNION ALL
    SELECT c.category_id, c.category_name, c.parent_category_id, prior.level + 1
    FROM category_tree prior
    INNER JOIN product_category c ON prior.category_id = c.parent_category_id
)
SELECT category_id, category_name, parent_category_id, level
FROM category_tree;

--SQL 04 - Oracle
WITH category_tree (category_id, category_name, parent_category_id, lvl) AS (
    SELECT category_id, category_name, parent_category_id, 1
    FROM product_category
    WHERE parent_category_id IS NULL
    UNION ALL
    SELECT c.category_id, c.category_name, c.parent_category_id, p.lvl + 1
    FROM category_tree p
    INNER JOIN product_category c ON p.category_id = c.parent_category_id
) SELECT category_id, category_name, parent_category_id, lvl
FROM category_tree t;