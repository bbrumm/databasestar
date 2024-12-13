/*
 * More recursive CTEs
 */

--SQL 01
WITH categories (category_id, category_name, parent_category_id, row_level) AS (
	SELECT category_id, category_name, parent_category_id, 1 AS row_level
	FROM book_category
	WHERE parent_category_id IS NULL
	UNION ALL
	SELECT c.category_id, c.category_name, c.parent_category_id, p.row_level + 1
    FROM book_category c
    INNER JOIN categories p ON p.category_id = c.parent_category_id
)
SELECT
category_id,
category_name,
parent_category_id,
row_level
FROM categories;

--SQL 02
WITH categories (category_id, category_name, parent_category_id, row_level) AS (
	SELECT category_id, category_name, parent_category_id, 1 AS row_level
	FROM book_category
	WHERE parent_category_id IS NULL
	UNION ALL
	SELECT c.category_id, c.category_name, c.parent_category_id, p.row_level + 1
    FROM book_category c
    INNER JOIN categories p ON p.category_id = c.parent_category_id
)
SELECT
category_id,
LPAD(category_name, LENGTH(category_name) + row_level) AS category_name,
parent_category_id,
row_level
FROM categories;

--SQL 03
WITH categories (category_id, category_name, parent_category_id, row_level) AS (
	SELECT category_id, category_name, parent_category_id, 1 AS row_level
	FROM book_category
	WHERE parent_category_id IS NULL
	UNION ALL
	SELECT c.category_id, c.category_name, c.parent_category_id, p.row_level + 1
    FROM book_category c
    INNER JOIN categories p ON p.category_id = c.parent_category_id
)
SELECT
category_id,
LPAD(category_name, LENGTH(category_name) + row_level, '-') AS category_name,
parent_category_id,
row_level
FROM categories;

--SQL 04
WITH categories (category_id, category_name, parent_category_id, row_level) AS (
	SELECT category_id, category_name, parent_category_id, 1 AS row_level
	FROM book_category
	WHERE parent_category_id IS NULL
	UNION ALL
	SELECT c.category_id, c.category_name, c.parent_category_id, p.row_level + 1
    FROM book_category c
    INNER JOIN categories p ON p.category_id = c.parent_category_id
)
SEARCH DEPTH FIRST BY category_id SET order1
SELECT
category_id,
LPAD(category_name, LENGTH(category_name) + row_level, '-') AS category_name,
parent_category_id,
row_level
FROM categories;

--SQL 05
WITH categories (category_id, category_name, parent_category_id, row_level) AS (
	SELECT category_id, category_name, parent_category_id, 1 AS row_level
	FROM book_category
	WHERE parent_category_id IS NULL
	UNION ALL
	SELECT c.category_id, c.category_name, c.parent_category_id, p.row_level + 1
    FROM book_category c
    INNER JOIN categories p ON p.category_id = c.parent_category_id
)
SEARCH BREADTH FIRST BY category_id SET order1
SELECT
category_id,
LPAD(category_name, LENGTH(category_name) + row_level, '-') AS category_name,
parent_category_id,
row_level
FROM categories;

--SQl 06
--Add a path
WITH categories (category_path, category_id, category_name, parent_category_id, row_level) AS (
	SELECT TO_CHAR(category_id) AS category_path, category_id, category_name, parent_category_id, 1 AS row_level
	FROM book_category
	WHERE parent_category_id IS NULL
	UNION ALL
	SELECT p.category_path || '.' || c.category_id, c.category_id, c.category_name, c.parent_category_id, p.row_level + 1
    FROM book_category c
    INNER JOIN categories p ON p.category_id = c.parent_category_id
)
SELECT
category_id,
LPAD(category_name, LENGTH(category_name) + row_level, '-') AS category_name,
parent_category_id,
row_level,
category_path
FROM categories;
