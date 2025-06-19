WITH categories AS (
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


WITH categories AS (
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
RIGHT(REPLICATE(' ', row_level) + category_name, LEN(category_name) + row_level) AS category_name,
parent_category_id,
row_level
FROM categories;



WITH categories AS (
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
RIGHT(REPLICATE('-', row_level) + category_name, LEN(category_name) + row_level) AS category_name,
parent_category_id,
row_level
FROM categories;