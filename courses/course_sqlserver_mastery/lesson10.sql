SELECT
co.order_id,
co.order_date,
SUM(ol.price) AS order_total,
RANK() OVER(ORDER BY SUM(ol.price) DESC) AS order_total_rank
FROM cust_order co 
INNER JOIN shipping_method sm ON co.shipping_method_id = sm.method_id 
INNER JOIN order_line ol ON co.order_id = ol.order_id 
GROUP BY co.order_id, co.order_date
ORDER BY SUM(ol.price) DESC;


SELECT
co.order_id,
co.order_date,
SUM(ol.price) AS order_total,
RANK() OVER(
  ORDER BY SUM(ol.price) DESC
  PARTITION BY DATEPART(YEAR, co.order_date)
) AS order_total_rank
FROM cust_order co 
INNER JOIN shipping_method sm ON co.shipping_method_id = sm.method_id 
INNER JOIN order_line ol ON co.order_id = ol.order_id 
GROUP BY co.order_id, co.order_date
ORDER BY SUM(ol.price) DESC;


SELECT
co.order_id,
co.order_date,
SUM(ol.price) AS order_total,
RANK() OVER(
  PARTITION BY DATEPART(YEAR, co.order_date)
  ORDER BY SUM(ol.price) DESC
) AS order_total_rank
FROM cust_order co 
INNER JOIN shipping_method sm ON co.shipping_method_id = sm.method_id 
INNER JOIN order_line ol ON co.order_id = ol.order_id 
GROUP BY co.order_id, co.order_date
ORDER BY SUM(ol.price) DESC;


SELECT
co.order_id,
co.order_date,
SUM(ol.price) AS order_total,
RANK() OVER(
  PARTITION BY DATEPART(YEAR, co.order_date)
  ORDER BY SUM(ol.price) DESC
) AS order_total_rank
FROM cust_order co 
INNER JOIN shipping_method sm ON co.shipping_method_id = sm.method_id 
INNER JOIN order_line ol ON co.order_id = ol.order_id 
GROUP BY co.order_id, co.order_date
ORDER BY DATEPART(YEAR, co.order_date) ASC, SUM(ol.price) DESC;


SELECT
b.book_id,
b.title,
bl.language_name,
b.num_pages,
AVG(b.num_pages) OVER () AS avg_pages
FROM book b
INNER JOIN book_language bl ON b.language_id = bl.language_id;


SELECT
b.book_id,
b.title,
bl.language_name,
b.num_pages,
AVG(b.num_pages) OVER (PARTITION BY bl.language_name) AS avg_pages
FROM book b
INNER JOIN book_language bl ON b.language_id = bl.language_id;