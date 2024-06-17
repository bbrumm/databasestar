/*
Temp tables  in Postgres
The syntax is slightly different in other databases.
*/


--SQL 01
SELECT
a.author_name,
COUNT(ol.line_id) AS book_count
FROM order_line ol
INNER JOIN book b ON ol.book_id = b.book_id
INNER JOIN book_author ba ON b.book_id = ba.book_id
INNER JOIN author a ON ba.author_id = a.author_id
GROUP BY a.author_name
HAVING COUNT(ol.line_id) > 1;

-- SQL 02
SELECT
a.author_name,
COUNT(ol.line_id) AS book_count
FROM order_line ol
INNER JOIN book b ON ol.book_id = b.book_id
INNER JOIN book_author ba ON b.book_id = ba.book_id
INNER JOIN author a ON ba.author_id = a.author_id
GROUP BY a.author_name
HAVING COUNT(ol.line_id) > 5;

--SQL 03
CREATE TEMPORARY TABLE author_books_sold (
    author_name VARCHAR(400),
    book_count INT
);


--SQL 04
INSERT INTO author_books_sold (author_name, book_count)
SELECT
a.author_name,
COUNT(ol.line_id) AS book_count
FROM order_line ol
INNER JOIN book b ON ol.book_id = b.book_id
INNER JOIN book_author ba ON b.book_id = ba.book_id
INNER JOIN author a ON ba.author_id = a.author_id
GROUP BY a.author_name;

--SQL 05
SELECT author_name, book_count
FROM author_books_sold;


--SQL 06
SELECT author_name, book_count
FROM author_books_sold
WHERE book_count > 1;

--SQL 07
SELECT author_name, book_count
FROM author_books_sold
WHERE book_count > 5;