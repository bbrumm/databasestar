SELECT
co.order_id,
co.order_date,
b.title,
ol.price,
MAX(ol.price) OVER () AS max_book_price
FROM cust_order co 
INNER JOIN order_line ol ON co.order_id = ol.order_id
INNER JOIN book b ON ol.book_id = b.book_id 
ORDER BY co.order_date ASC, co.order_id ASC;


SELECT
co.order_id,
co.order_date,
b.title,
ol.price,
MAX(ol.price) OVER (ORDER BY co.order_date) AS max_book_price
FROM cust_order co 
INNER JOIN order_line ol ON co.order_id = ol.order_id
INNER JOIN book b ON ol.book_id = b.book_id 
ORDER BY co.order_date ASC, co.order_id ASC;


SELECT
co.order_id,
co.order_date,
b.title,
ol.price,
MAX(ol.price) OVER (
    ORDER BY co.order_date RANGE UNBOUNDED PRECEDING
) AS max_book_price
FROM cust_order co 
INNER JOIN order_line ol ON co.order_id = ol.order_id
INNER JOIN book b ON ol.book_id = b.book_id 
ORDER BY co.order_date ASC, co.order_id, ol.price ASC;


SELECT
co.order_id,
co.order_date,
b.title,
ol.price,
MAX(ol.price) OVER (
    ORDER BY co.order_date ROWS UNBOUNDED PRECEDING
) AS max_book_price
FROM cust_order co 
INNER JOIN order_line ol ON co.order_id = ol.order_id
INNER JOIN book b ON ol.book_id = b.book_id 
ORDER BY co.order_date ASC, co.order_id, ol.price ASC;


SELECT
co.order_id,
co.order_date,
b.title,
ol.price,
MAX(ol.price) OVER (
    ORDER BY co.order_date, co.order_id, ol.price ROWS UNBOUNDED PRECEDING
) AS max_book_price
FROM cust_order co 
INNER JOIN order_line ol ON co.order_id = ol.order_id
INNER JOIN book b ON ol.book_id = b.book_id 
ORDER BY co.order_date ASC, co.order_id, ol.price ASC;


SELECT
co.order_id,
co.order_date,
b.title,
ol.price,
MAX(ol.price) OVER (
    ORDER BY co.order_date, co.order_id, ol.price ROWS 5 PRECEDING
) AS max_book_price
FROM cust_order co 
INNER JOIN order_line ol ON co.order_id = ol.order_id
INNER JOIN book b ON ol.book_id = b.book_id 
ORDER BY co.order_date ASC, co.order_id ASC, ol.price ASC;


SELECT
CONVERT(date, co.order_date) AS order_date,
COUNT(*) AS order_line_count,
SUM(COUNT(*)) OVER(
    ORDER BY CONVERT(date, co.order_date)
) AS running_total
FROM cust_order co
INNER JOIN order_line ol ON co.order_id = ol.order_id
GROUP BY CONVERT(date, co.order_date)
ORDER BY CONVERT(date, co.order_date) ASC;


SELECT
CONVERT(date, co.order_date) AS order_date,
COUNT(*) AS order_line_count,
SUM(COUNT(*)) OVER(
    ORDER BY CONVERT(date, co.order_date) ROWS 5 PRECEDING
) AS total_last_5
FROM cust_order co
INNER JOIN order_line ol ON co.order_id = ol.order_id
GROUP BY CONVERT(date, co.order_date)
ORDER BY CONVERT(date, co.order_date) ASC;