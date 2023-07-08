/*
Lesson 15 - view data
*/

SELECT * FROM book;

SELECT * FROM review;

SELECT * FROM genre;

SELECT * FROM list;

SELECT
b.id,
b.title,
b.author
FROM book b
INNER JOIN list l ON b.list_id = l.id
WHERE l.list_name = 'To Read';

SELECT
r.rating,
r.review,
r.date_reviewed,
b.title,
b.author
FROM review r
INNER JOIN book b ON r.book_id = b.id;
