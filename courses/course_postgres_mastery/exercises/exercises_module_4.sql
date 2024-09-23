/*
Exercises from the PostgreSQL Mastery course
Module 4
*/


/* 26-01 */

WITH order_value AS (
	SELECT
	co.customer_id,
	co.order_id,
	cn.country_name,
	SUM(ol.price) AS order_amount
	FROM cust_order co 
	INNER JOIN order_line ol ON co.order_id = ol.order_id
	INNER JOIN address a ON co.dest_address_id = a.address_id
	INNER JOIN country cn ON a.country_id = cn.country_id
	GROUP BY co.customer_id, co.order_id, cn.country_name
),
country_order_stats AS (
	SELECT
	o.country_name,
	SUM(o.order_amount) AS total_order_amount,
	ROUND(AVG(o.order_amount), 2) AS avg_order_amount
	FROM order_value o
	GROUP BY o.country_name
)
SELECT
s.country_name,
s.total_order_amount,
s.avg_order_amount
FROM country_order_stats s
ORDER BY s.total_order_amount DESC;

/* 27-01 */

WITH RECURSIVE categories AS (
	SELECT category_id, category_name, parent_category_id, 1 AS level
	FROM book_category
	WHERE parent_category_id IS NULL
	UNION
	SELECT this.category_id, this.category_name, this.parent_category_id, prior.level + 1
	FROM book_category this
	INNER JOIN categories prior ON this.parent_category_id = prior.category_id
)
SELECT category_id, category_name, parent_category_id, level
FROM categories;

/* 28-01 */

WITH RECURSIVE categories AS (
	SELECT category_id, category_name, parent_category_id, 1 AS level
	FROM book_category
	WHERE parent_category_id IS NULL
	UNION
	SELECT this.category_id, this.category_name, this.parent_category_id, prior.level + 1
	FROM book_category this
	INNER JOIN categories prior ON this.parent_category_id = prior.category_id
)
SELECT category_id, category_name, parent_category_id, level
FROM categories;

/* 29-01 */

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
category_name,
parent_category_id,
level,
hierarchy
FROM categories
ORDER BY hierarchy ASC;