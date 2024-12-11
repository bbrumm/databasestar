/*
Window Functions
*/

--SQL 01
SELECT
b.book_id,
b.title,
b.num_pages
FROM book b;

--SQL 02
SELECT
b.book_id,
b.title,
b.num_pages,
AVG(b.num_pages) OVER () AS avg_pages
FROM book b;