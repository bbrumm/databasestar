SELECT
b.book_id,
b.isbn13,
b.title,
b.publication_date,
b.num_pages
FROM book b;



SELECT
b.book_id,
b.isbn13,
b.title,
b.publication_date,
b.num_pages
FROM book b
WITH (NOLOCK);