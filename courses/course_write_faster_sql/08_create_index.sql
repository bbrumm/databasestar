SELECT
b.book_id,
b.title,
b.isbn13,
b.num_pages,
b.publication_date,
p.publisher_name
FROM book b
INNER JOIN publisher p ON b.publisher_id = p.publisher_id
WHERE b.publisher_id = 1149;

CREATE INDEX idx_book_pubid
ON book (publisher_id);