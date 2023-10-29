SELECT
b.book_id,
b.title,
b.isbn13,
b.publication_date,
bl.language_name,
p.publisher_name
FROM book b
INNER JOIN book_language bl ON b.language_id = bl.language_id
INNER JOIN publisher p ON b.publisher_id = p.publisher_id
WHERE  b.book_id = ?;