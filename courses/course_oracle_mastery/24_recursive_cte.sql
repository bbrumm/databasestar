/*
Recursive CTEs
*/

--SQL 01
CREATE TABLE book_category (
  category_id INTEGER,
  category_name VARCHAR2(100),
  parent_category_id INTEGER,
  CONSTRAINT pk_category
    PRIMARY KEY (category_id),
  CONSTRAINT fk_category_parent
    FOREIGN KEY (parent_category_id)
    REFERENCES book_category (category_id)
);

--SQL 02
INSERT ALL
INTO book_category (category_id, category_name, parent_category_id) VALUES (1, 'Books', NULL)
INTO book_category (category_id, category_name, parent_category_id) VALUES (2, 'Arts & Photography', 1)
INTO book_category (category_id, category_name, parent_category_id) VALUES (10, 'Fashion', 2)
INTO book_category (category_id, category_name, parent_category_id) VALUES (11, 'Design', 2)
INTO book_category (category_id, category_name, parent_category_id) VALUES (12, 'Photography & Video', 2)
INTO book_category (category_id, category_name, parent_category_id) VALUES (13, 'Music', 2)
INTO book_category (category_id, category_name, parent_category_id) VALUES (14, 'Music Biography', 13)
INTO book_category (category_id, category_name, parent_category_id) VALUES (15, 'Crafts, Hobbies & Home', 2)
INTO book_category (category_id, category_name, parent_category_id) VALUES (16, 'Home Improvement & Design', 15)
INTO book_category (category_id, category_name, parent_category_id) VALUES (3, 'Business & Money', 1)
INTO book_category (category_id, category_name, parent_category_id) VALUES (17, 'Entrepreneurship', 3)
INTO book_category (category_id, category_name, parent_category_id) VALUES (18, 'Marketing & Sales', 3)
INTO book_category (category_id, category_name, parent_category_id) VALUES (19, 'Small Business', 3)
INTO book_category (category_id, category_name, parent_category_id) VALUES (20, 'Local Business', 19)
INTO book_category (category_id, category_name, parent_category_id) VALUES (21, 'Management', 3)
INTO book_category (category_id, category_name, parent_category_id) VALUES (22, 'Personal Finance', 3)
INTO book_category (category_id, category_name, parent_category_id) VALUES (4, 'Comics, Manga & Graphic Novels', 1)
INTO book_category (category_id, category_name, parent_category_id) VALUES (23, 'Superheroes', 4)
INTO book_category (category_id, category_name, parent_category_id) VALUES (24, 'Fantasy Graphic Novels', 4)
INTO book_category (category_id, category_name, parent_category_id) VALUES (25, 'Comic Strips', 4)
INTO book_category (category_id, category_name, parent_category_id) VALUES (5, 'History', 1)
INTO book_category (category_id, category_name, parent_category_id) VALUES (26, 'Europe', 5)
INTO book_category (category_id, category_name, parent_category_id) VALUES (27, 'American', 5)
INTO book_category (category_id, category_name, parent_category_id) VALUES (28, 'Ancient Civilisations', 5)
INTO book_category (category_id, category_name, parent_category_id) VALUES (6, 'Literature & Fiction', 1)
INTO book_category (category_id, category_name, parent_category_id) VALUES (29, 'Action & Adventure', 6)
INTO book_category (category_id, category_name, parent_category_id) VALUES (30, 'Magic', 6)
INTO book_category (category_id, category_name, parent_category_id) VALUES (31, 'Victorian', 6)
INTO book_category (category_id, category_name, parent_category_id) VALUES (32, 'Horror', 6)
INTO book_category (category_id, category_name, parent_category_id) VALUES (7, 'Reference', 1)
INTO book_category (category_id, category_name, parent_category_id) VALUES (33, 'Test Preparation', 7)
INTO book_category (category_id, category_name, parent_category_id) VALUES (34, 'Encyclopedias', 7)
INTO book_category (category_id, category_name, parent_category_id) VALUES (35, 'Almanacs', 7)
INTO book_category (category_id, category_name, parent_category_id) VALUES (36, 'Dictionaries and Thesauruses', 7)
INTO book_category (category_id, category_name, parent_category_id) VALUES (8, 'Children''s Books', 1)
INTO book_category (category_id, category_name, parent_category_id) VALUES (37, 'Arts, Music & Photography', 8)
INTO book_category (category_id, category_name, parent_category_id) VALUES (38, 'Holidays & Celebrations', 8)
INTO book_category (category_id, category_name, parent_category_id) VALUES (39, 'Animals', 8)
INTO book_category (category_id, category_name, parent_category_id) VALUES (40, 'Sports & Outdoors', 8)
INTO book_category (category_id, category_name, parent_category_id) VALUES (9, 'Self-Help', 1)
INTO book_category (category_id, category_name, parent_category_id) VALUES (41, 'Inspirational', 9)
INTO book_category (category_id, category_name, parent_category_id) VALUES (42, 'Self Improvement', 9)
INTO book_category (category_id, category_name, parent_category_id) VALUES (43, 'Productivity', 9)
INTO book_category (category_id, category_name, parent_category_id) VALUES (44, 'Career Development', 9)
SELECT * FROM dual;

--SQL 03
SET DEFINE OFF;


--SQL 04
SELECT *
FROM book_category;


--SQL 05
WITH categories AS (
	SELECT category_id, category_name, parent_category_id
	FROM book_category
)
SELECT category_id, category_name, parent_category_id
FROM categories;

--SQL 06
WITH categories AS (
	SELECT category_id, category_name, parent_category_id
	FROM book_category
	WHERE parent_category_id IS NULL
)
SELECT category_id, category_name, parent_category_id
FROM categories;


--SQL 07
--error, needs column names
WITH categories AS (
	SELECT category_id, category_name, parent_category_id
	FROM book_category
	WHERE parent_category_id IS NULL
	UNION
	SELECT c.category_id, c.category_name, c.parent_category_id
    FROM book_category c
    INNER JOIN categories p ON c.parent_category_id = p.category_id
)
SELECT category_id, category_name, parent_category_id
FROM categories;

--SQL 08
WITH categories (category_id, category_name, parent_category_id) AS (
	SELECT category_id, category_name, parent_category_id
	FROM book_category
	WHERE parent_category_id IS NULL
	UNION ALL
	SELECT c.category_id, c.category_name, c.parent_category_id
    FROM book_category c
    INNER JOIN categories p ON p.category_id = c.parent_category_id
)
SELECT category_id, category_name, parent_category_id
FROM categories;

--SQL 08
--Add level
WITH categories (category_id, category_name, parent_category_id, row_level) AS (
	SELECT category_id, category_name, parent_category_id, 1 AS row_level
	FROM book_category
	WHERE parent_category_id IS NULL
	UNION ALL
	SELECT c.category_id, c.category_name, c.parent_category_id, p.row_level + 1
    FROM book_category c
    INNER JOIN categories p ON p.category_id = c.parent_category_id
)
SELECT category_id, category_name, parent_category_id, row_level
FROM categories;

COMMIT;




