SELECT b.title, s.order_date
FROM book b
CROSS APPLY (
	SELECT TOP 3 co.order_date
	FROM order_line ol
	INNER JOIN cust_order co ON ol.order_id = co.order_id
	WHERE ol.book_id = b.book_id 
	ORDER BY co.order_date ASC
) s
ORDER BY title ASC, order_date ASC;



SELECT b.book_id, b.title
FROM book b
WHERE b.book_id NOT IN (
	SELECT book_id
	FROM order_line
)
ORDER BY b.title;



SELECT b.title, s.order_date
FROM book b
OUTER APPLY (
	SELECT TOP 3 co.order_date
	FROM order_line ol
	INNER JOIN cust_order co ON ol.order_id = co.order_id
	WHERE ol.book_id = b.book_id 
	ORDER BY co.order_date ASC
) s
ORDER BY title ASC, order_date ASC;