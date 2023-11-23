SELECT
b.title,
b.isbn13,
b.publication_date,
bl.language_name,
p.publisher_name
FROM book b
INNER JOIN book_author ba ON b.book_id = ba.book_id
INNER JOIN author a ON ba.author_id = a.author_id
INNER JOIN book_language bl ON b.language_id = bl.language_id
INNER JOIN publisher p ON b.publisher_id = p.publisher_id
WHERE b.publication_date < '2000-01-01'
ORDER BY b.publication_date DESC;


SELECT DISTINCT
b.title,
b.isbn13,
b.publication_date,
bl.language_name,
p.publisher_name
FROM book b
INNER JOIN book_author ba ON b.book_id = ba.book_id
INNER JOIN author a ON ba.author_id = a.author_id
INNER JOIN book_language bl ON b.language_id = bl.language_id
INNER JOIN publisher p ON b.publisher_id = p.publisher_id
WHERE b.publication_date < '2000-01-01'
ORDER BY b.publication_date DESC;

SELECT
b.title,
b.isbn13,
b.publication_date,
bl.language_name,
p.publisher_name,
'b',
b.*,
'ba',
ba.*,
'a',
a.*,
'bl',
bl.*,
'p',
p.*
FROM book b
INNER JOIN book_author ba ON b.book_id = ba.book_id
INNER JOIN author a ON ba.author_id = a.author_id
INNER JOIN book_language bl ON b.language_id = bl.language_id
INNER JOIN publisher p ON b.publisher_id = p.publisher_id
WHERE b.publication_date < '2000-01-01'
ORDER BY b.publication_date DESC;

SELECT
b.title,
b.isbn13,
b.publication_date,
bl.language_name,
p.publisher_name,
'b',
b.*,
'bl',
bl.*,
'p',
p.*
FROM book b
INNER JOIN book_language bl ON b.language_id = bl.language_id
INNER JOIN publisher p ON b.publisher_id = p.publisher_id
WHERE b.publication_date < '2000-01-01'
ORDER BY b.publication_date DESC;