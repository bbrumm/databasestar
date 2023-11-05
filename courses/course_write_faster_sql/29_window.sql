SELECT 
co.order_id,
co.order_date,
c.email,
ol.book_id,
(
	SELECT COUNT(*)
	FROM order_line
	WHERE book_id = ol.book_id
) AS book_count
FROM cust_order co
INNER JOIN customer c ON co.customer_id = c.customer_id
INNER JOIN order_line ol ON co.order_id = ol.order_id
ORDER BY co.order_id ASC;



SELECT 
co.order_id,
co.order_date,
c.email,
ol.book_id,
COUNT(*) OVER (
	PARTITION BY ol.book_id
) AS book_total_window
FROM cust_order co
INNER JOIN customer c ON co.customer_id = c.customer_id
INNER JOIN order_line ol ON co.order_id = ol.order_id
ORDER BY co.order_id ASC;


