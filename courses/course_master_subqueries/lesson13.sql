/*
Create a new table
*/
CREATE TABLE all_books AS
SELECT book_id, title, language_id, num_pages
FROM book;

/*
Find books with no orders
*/
SELECT *
FROM all_books
WHERE book_id NOT IN (
	SELECT book_id
    FROM order_line
);

/*
Delete books with no orders
*/
DELETE FROM all_books
WHERE book_id NOT IN (
	SELECT book_id
    FROM order_line
);

/*
Select from the table
*/
SELECT *
FROM all_books;

DROP TABLE all_books;
