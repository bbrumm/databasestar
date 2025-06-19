SELECT
b.book_id,
b.isbn13,
b.title,
b.publication_date,
p.publisher_name,
a.author_name
INTO #temp_book_authors
FROM book b
INNER JOIN book_author ba ON b.book_id = ba.book_id
INNER JOIN author a ON ba.author_id = a.author_id
INNER JOIN publisher p ON b.publisher_id = p.publisher_id;



SELECT
book_id,
isbn13,
title,
publication_date,
publisher_name,
author_name
FROM #temp_book_authors;



CREATE TABLE books_and_authors (
  book_id INT,
  isbn13 VARCHAR(13),
  title VARCHAR(400),
  publication_date DATE,
  publisher_name VARCHAR(400),
  author_name VARCHAR(400)
);



INSERT INTO books_and_authors (book_id, isbn13, title, publication_date, publisher_name, author_name)
SELECT
b.book_id,
b.isbn13,
b.title,
b.publication_date,
p.publisher_name,
a.author_name
FROM book b
INNER JOIN book_author ba ON b.book_id = ba.book_id
INNER JOIN author a ON ba.author_id = a.author_id
INNER JOIN publisher p ON b.publisher_id = p.publisher_id;


SELECT
book_id,
isbn13,
title,
publication_date,
publisher_name,
author_name
FROM books_and_authors;