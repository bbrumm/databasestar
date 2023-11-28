SELECT
book_id,
title,
isbn13,
language_id,
num_pages,
publication_date
FROM book
WHERE 1=1
AND language_id IN (1, 3, 8)
AND num_pages > 400
AND publication_date < '2000-01-01'