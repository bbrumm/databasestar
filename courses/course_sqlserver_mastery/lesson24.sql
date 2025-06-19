CREATE TABLE book_category (
  category_id INTEGER,
  category_name VARCHAR(100),
  parent_category_id INTEGER,
  CONSTRAINT pk_category
    PRIMARY KEY (category_id),
  CONSTRAINT fk_category_parent
    FOREIGN KEY (parent_category_id)
    REFERENCES book_category (category_id)
);


INSERT INTO book_category (category_id, category_name, parent_category_id) VALUES
(1, 'Books', NULL),
(2, 'Arts & Photography', 1),
(10, 'Fashion', 2),
(11, 'Design', 2),
(12, 'Photography & Video', 2),
(13, 'Music', 2),
(14, 'Music Biography', 13),
(15, 'Crafts, Hobbies & Home', 2),
(16, 'Home Improvement & Design', 15),
(3, 'Business & Money', 1),
(17, 'Entrepreneurship', 3),
(18, 'Marketing & Sales', 3),
(19, 'Small Business', 3),
(20, 'Local Business', 19),
(21, 'Management', 3),
(22, 'Personal Finance', 3),
(4, 'Comics, Manga & Graphic Novels', 1),
(23, 'Superheroes', 4),
(24, 'Fantasy Graphic Novels', 4),
(25, 'Comic Strips', 4),
(5, 'History', 1),
(26, 'Europe', 5),
(27, 'American', 5),
(28, 'Ancient Civilisations', 5),
(6, 'Literature & Fiction', 1),
(29, 'Action & Adventure', 6),
(30, 'Magic', 6),
(31, 'Victorian', 6),
(32, 'Horror', 6),
(7, 'Reference', 1),
(33, 'Test Preparation', 7),
(34, 'Encyclopedias', 7),
(35, 'Almanacs', 7),
(36, 'Dictionaries and Thesauruses', 7),
(8, 'Children''s Books', 1),
(37, 'Arts, Music & Photography', 8),
(38, 'Holidays & Celebrations', 8),
(39, 'Animals', 8),
(40, 'Sports & Outdoors', 8),
(9, 'Self-Help', 1),
(41, 'Inspirational', 9),
(42, 'Self Improvement', 9),
(43, 'Productivity', 9),
(44, 'Career Development', 9);


WITH categories AS (
	SELECT category_id, category_name, parent_category_id
	FROM book_category
)
SELECT category_id, category_name, parent_category_id
FROM categories;




WITH categories AS (
	SELECT category_id, category_name, parent_category_id
	FROM book_category
	WHERE parent_category_id IS NULL
)
SELECT category_id, category_name, parent_category_id
FROM categories;


WITH categories AS (
	SELECT category_id, category_name, parent_category_id
	FROM book_category
	WHERE parent_category_id IS NULL
	UNION
	SELECT c.category_id, c.category_name, c.parent_category_id
    FROM book_category c
    INNER JOIN categories p ON p.category_id = c.parent_category_id
)
SELECT category_id, category_name, parent_category_id
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
SELECT category_id, category_name, parent_category_id, row_level
FROM categories;