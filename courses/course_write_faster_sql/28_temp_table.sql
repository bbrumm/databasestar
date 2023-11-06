SELECT
a.author_name,
COUNT(ol.line_id) AS book_count
FROM order_line ol
INNER JOIN book b ON ol.book_id = b.book_id
INNER JOIN book_author ba ON b.book_id = ba.book_id
INNER JOIN author a ON ba.author_id = a.author_id
GROUP BY a.author_name
HAVING COUNT(ol.line_id) > 1;

DROP TABLE author_sales;

CREATE GLOBAL TEMPORARY TABLE author_sales (
    author_name VARCHAR2(400),
    book_count NUMBER
);

INSERT INTO author_sales (author_name, book_count)
SELECT
a.author_name,
COUNT(ol.line_id) AS book_count
FROM order_line ol
INNER JOIN book b ON ol.book_id = b.book_id
INNER JOIN book_author ba ON b.book_id = ba.book_id
INNER JOIN author a ON ba.author_id = a.author_id
GROUP BY a.author_name
HAVING COUNT(ol.line_id) > 1;

SELECT
author_name,
book_count
FROM author_sales;

SELECT
author_name,
book_count
FROM author_sales
WHERE book_count > 10;