/*
Window clause
*/

--SQL 01
SELECT
b.book_id,
b.title,
b.publication_date,
AVG(b.num_pages) OVER (
    PARTITION BY EXTRACT(YEAR FROM b.publication_date)
) AS avg_pages_year,
COUNT(*) OVER (
    PARTITION BY EXTRACT(YEAR FROM b.publication_date)
) AS books_year
FROM book b
ORDER BY b.publication_date ASC;

--SQL 02
SELECT
b.book_id,
b.title,
b.publication_date,
AVG(b.num_pages) OVER w AS avg_pages_year,
COUNT(*) OVER w AS books_year
FROM book b
WINDOW w AS (
    PARTITION BY EXTRACT(YEAR FROM b.publication_date)
)
ORDER BY b.publication_date ASC;