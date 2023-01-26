/*
Find the max price for a book
*/
SELECT MAX(price)
FROM order_line;

/*
Find all books ordered at this price
*/
SELECT
line_id,
order_id,
book_id,
price
FROM order_line
WHERE price = (
	SELECT MAX(price)
	FROM order_line
);

SELECT
title, 
isbn13,
publication_date
FROM book
WHERE book_id IN (
	SELECT book_id
	FROM order_line
	WHERE price = (
		SELECT MAX(price)
		FROM order_line
	)
);

