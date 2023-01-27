select *
from book_language;

/*
en-GB
en-CA
en-US
eng
*/

SELECT
b.book_id,
b.title
FROM book b;

SELECT
book_id,
title
FROM book
WHERE language_id = (
  SELECT language_id
  FROM book_language
  WHERE language_code IN ('eng', 'en-GB', 'en-CA', 'en-US')
);

SELECT
book_id,
title
FROM book
WHERE language_id IN (
  SELECT language_id
  FROM book_language
  WHERE language_code IN ('eng', 'en-GB', 'en-CA', 'en-US')
);


SELECT
b.book_id,
b.title
FROM book b
INNER JOIN book_language bl ON b.language_id = bl.language_id
WHERE bl.language_code IN ('eng', 'en-GB', 'en-CA', 'en-US');


SELECT
b.book_id,
b.title,
bl.language_code,
bl.language_name
FROM book b
INNER JOIN book_language bl ON b.language_id = bl.language_id
WHERE bl.language_code IN ('eng', 'en-GB', 'en-CA', 'en-US');