/*
 * More recursive CTEs
 */

--SQL 01
WITH RECURSIVE categories AS (
	SELECT category_id, category_name, parent_category_id, 1 AS level
	FROM book_category
	WHERE parent_category_id IS NULL
	UNION
	SELECT this.category_id, this.category_name, this.parent_category_id, prior.level + 1
	FROM book_category this
	INNER JOIN categories prior ON this.parent_category_id = prior.category_id
)
SELECT
category_id,
category_name,
parent_category_id,
level
FROM categories;

--SQL 02
WITH RECURSIVE categories AS (
	SELECT category_id, category_name, parent_category_id, 1 AS level
	FROM book_category
	WHERE parent_category_id IS NULL
	UNION
	SELECT this.category_id, this.category_name, this.parent_category_id, prior.level + 1
	FROM book_category this
	INNER JOIN categories prior ON this.parent_category_id = prior.category_id
)
SELECT
category_id,
LPAD(category_name, LENGTH(category_name) + level) AS category_name,
parent_category_id,
level
FROM categories;

--SQL 03
WITH RECURSIVE categories AS (
	SELECT category_id, category_name, parent_category_id, 1 AS level
	FROM book_category
	WHERE parent_category_id IS NULL
	UNION
	SELECT this.category_id, this.category_name, this.parent_category_id, prior.level + 1
	FROM book_category this
	INNER JOIN categories prior ON this.parent_category_id = prior.category_id
)
SELECT
category_id,
LPAD(category_name, LENGTH(category_name) + level, '-') AS category_name,
parent_category_id,
level
FROM categories;


--SQL 04
WITH RECURSIVE categories AS (
	SELECT ARRAY[category_id] AS hierarchy, category_id, category_name, parent_category_id, 1 AS level
	FROM book_category
	WHERE parent_category_id IS NULL
	UNION
	SELECT prior.hierarchy || this.category_id, this.category_id, this.category_name, this.parent_category_id, prior.level + 1
	FROM book_category this
	INNER JOIN categories prior ON this.parent_category_id = prior.category_id
)
SELECT
category_id,
LPAD(category_name, LENGTH(category_name) + level, '-') AS category_name,
parent_category_id,
level,
hierarchy
FROM categories
ORDER BY hierarchy ASC;

--SQL 05
WITH RECURSIVE categories AS (
	SELECT category_id::text AS hierarchy, category_id, category_name, parent_category_id, 1 AS level
	FROM book_category
	WHERE parent_category_id IS NULL
	UNION
	SELECT prior.hierarchy || '.' || this.category_id, this.category_id, this.category_name, this.parent_category_id, prior.level + 1
	FROM book_category this
	INNER JOIN categories prior ON this.parent_category_id = prior.category_id
)
SELECT
category_id,
LPAD(category_name, LENGTH(category_name) + level, '-') AS category_name,
parent_category_id,
level,
hierarchy
FROM categories
ORDER BY hierarchy ASC;
