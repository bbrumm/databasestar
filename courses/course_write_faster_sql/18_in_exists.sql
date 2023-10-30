/*
Original query
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
        SELECT AVG(price) AS avg_price
		FROM order_line
    )
);



/*
Change to Exists
*/
SELECT
b.book_id,
b.title,
b.publication_date,
b.num_pages
FROM book b
WHERE EXISTS (
	SELECT 1
    FROM order_line ol
    WHERE ol.book_id = b.book_id
    AND ol.price > (
        SELECT AVG(price)
		FROM order_line
    )
);

