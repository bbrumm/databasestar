/*
PSQL scripts
*/

--SQL 01
SELECT * FROM book;

--SQL 02
SHOW search_path;

--SQL 03
SELECT * FROM gravity.book;

--SQL 04
SET search_path = 'gravity';

--SQL 05
SELECT * FROM book;

--SQL 06
SELECT book_id, title
FROM book;

--SQL 07
SELECT
book_id,
title,
publication_date
FROM book
WHERE publication_date > '2000-01-01';
