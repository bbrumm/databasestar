/*
Left Join lateral
*/

--SQL 01
SELECT b.title, s.order_date
FROM book b
JOIN LATERAL (
	SELECT co.order_date
	FROM order_line ol
	INNER JOIN cust_order co ON ol.order_id = co.order_id
	WHERE ol.book_id = b.book_id 
	ORDER BY co.order_date ASC
	FETCH FIRST 3 ROWS ONLY
) s ON TRUE
ORDER BY title ASC, order_date ASC;

--SQL 02
SELECT b.book_id, b.title
FROM book b
WHERE b.book_id NOT IN (
	SELECT book_id
	FROM order_line
)
ORDER BY b.title;



--SQL 03
SELECT b.title, s.order_date
FROM book b
LEFT JOIN LATERAL (
	SELECT co.order_date
	FROM order_line ol
	INNER JOIN cust_order co ON ol.order_id = co.order_id
	WHERE ol.book_id = b.book_id 
	ORDER BY co.order_date ASC
	FETCH FIRST 3 ROWS ONLY
) s ON TRUE
ORDER BY title ASC, order_date ASC;