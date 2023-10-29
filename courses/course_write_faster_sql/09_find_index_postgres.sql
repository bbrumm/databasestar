SELECT *
FROM pg_indexes
WHERE tablename NOT LIKE 'pg%';

DROP INDEX idx_book_pubid;