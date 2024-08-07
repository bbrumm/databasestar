/*
A simple SQL command to run from psql
*/

SELECT book_id, title, publication_date
FROM gravity.book
ORDER BY publication_date DESC
LIMIT 5;