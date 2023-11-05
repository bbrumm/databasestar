SELECT book_id, title, isbn13, num_pages, publication_date
FROM book
WHERE title LIKE '%dragon%';

--Used a Clustered Index Scan on pk_book
--Let's create an index

CREATE INDEX idx_book_title
ON book (title);

DROP INDEX book.idx_book_title;

SELECT book_id, title, isbn13, num_pages, publication_date
FROM book
WHERE title IN (
'Dragon''s Kin (Pern  #17)',
'Dragon''s Fire (Pern  #19)',
'Summer of the Dragon'
);

DROP TABLE title_lookup;

CREATE TABLE title_lookup (
  title_to_find VARCHAR(1000)
);

INSERT INTO title_lookup (title_to_find) VALUES
('Dragon''s Kin (Pern  #17)'),
('Dragon''s Fire (Pern  #19)'),
('Summer of the Dragon');

SELECT * FROM title_lookup;

SELECT b.book_id, b.title, b.isbn13, b.num_pages, b.publication_date
FROM book b
INNER JOIN title_lookup l ON b.title = l.title_to_find;


SELECT b.book_id, b.title, b.isbn13, b.num_pages, b.publication_date
FROM book b
WHERE title LIKE 'Dragon%';