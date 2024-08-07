/*
Another Lateral Join example
*/

--SQL 01
WITH book_orders AS (
	SELECT
	b.title,
	co.order_date,
	ROW_NUMBER() OVER (
		PARTITION BY ol.book_id 
		ORDER BY co.order_date ASC
	) AS book_order_occurrence
	FROM book b
	INNER JOIN order_line ol ON b.book_id = ol.book_id
	INNER JOIN cust_order co ON ol.order_id = co.order_id
)
SELECT
title,
order_date
FROM book_orders
WHERE book_order_occurrence <= 3
ORDER BY title ASC, order_date ASC;


--SQL 02
SELECT b.title, s.order_date
FROM book b
JOIN LATERAL (
	SELECT ol.*, co.*
	FROM order_line ol
	INNER JOIN cust_order co ON ol.order_id = co.order_id
	WHERE ol.book_id = b.book_id 
	ORDER BY co.order_date ASC
	FETCH FIRST 3 ROWS ONLY
) s ON TRUE
ORDER BY title ASC, order_date ASC;