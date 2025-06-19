SELECT
b.book_id,
b.title,
b.publication_date,
AVG(b.num_pages) OVER (
    PARTITION BY DATEPART(YEAR, b.publication_date)
) AS avg_pages_year,
COUNT(*) OVER (
    PARTITION BY DATEPART(YEAR, b.publication_date)
) AS books_year
FROM book b
ORDER BY b.publication_date ASC;


SELECT
b.book_id,
b.title,
b.publication_date,
AVG(b.num_pages) OVER w AS avg_pages_year,
COUNT(*) OVER w AS books_year
FROM book b
WINDOW w AS (
    PARTITION BY DATEPART(YEAR, b.publication_date)
)
ORDER BY b.publication_date ASC;