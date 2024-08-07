/*
Rank Rows
*/

--SQL 01
SELECT
co.order_id,
co.order_date,
SUM(ol.price) AS order_total
FROM cust_order co 
INNER JOIN order_line ol ON co.order_id = ol.order_id 
GROUP BY co.order_id, co.order_date
ORDER BY SUM(ol.price) DESC;

--SQL 02
SELECT
co.order_id,
co.order_date,
SUM(ol.price) AS order_total,
RANK() OVER(ORDER BY SUM(ol.price) DESC) AS order_total_rank
FROM cust_order co 
INNER JOIN order_line ol ON co.order_id = ol.order_id 
GROUP BY co.order_id, co.order_date
ORDER BY SUM(ol.price) DESC;


--SQL 03
SELECT
co.order_id,
co.order_date,
SUM(ol.price) AS order_total,
RANK() OVER(ORDER BY SUM(ol.price) DESC) AS order_total_rank
FROM cust_order co 
INNER JOIN order_line ol ON co.order_id = ol.order_id 
GROUP BY co.order_id, co.order_date
ORDER BY co.order_id ASC;