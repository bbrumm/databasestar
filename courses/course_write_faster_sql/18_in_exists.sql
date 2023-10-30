/*
Original query
Cost in MySQL 4,344
*/
SELECT
b.book_id,
b.title,
b.publication_date,
b.num_pages
FROM book b
WHERE b.book_id IN (
	SELECT book_id
    FROM order_line
    WHERE price > (
        SELECT AVG(price)
		FROM order_line
    )
);

/*
Change to Exists
Cost: 4,344
*/
SELECT
b.book_id,
b.title,
b.publication_date,
b.num_pages
FROM book b
WHERE EXISTS (
	SELECT 1
    FROM order_line
    WHERE book_id = b.book_id
    AND price > (
        SELECT AVG(price)
		FROM order_line
    )
);

