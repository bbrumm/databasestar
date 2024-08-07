/*
Left Join lateral
*/

--SQL 01
-- 13,481 rows 
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


--SQL 02
-- 17,175 rows
SELECT b.title, s.order_date
FROM book b
LEFT JOIN LATERAL (
	SELECT ol.*, co.*
	FROM order_line ol
	INNER JOIN cust_order co ON ol.order_id = co.order_id
	WHERE ol.book_id = b.book_id 
	ORDER BY co.order_date ASC
	FETCH FIRST 3 ROWS ONLY
) s ON TRUE
ORDER BY title ASC, order_date ASC;