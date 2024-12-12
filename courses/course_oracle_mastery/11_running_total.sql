/*
Running Total
*/

--SQL 01
SELECT
co.order_id,
co.order_date,
COUNT(*) AS count_order_lines
FROM cust_order co 
INNER JOIN order_line ol ON co.order_id = ol.order_id
GROUP BY co.order_id, co.order_date
ORDER BY co.order_date ASC, co.order_id ASC;


--SQL 02
SELECT
co.order_id,
co.order_date,
COUNT(*) AS count_order_lines,
SUM(COUNT(*)) OVER (ORDER BY co.order_date ASC) AS running_total
FROM cust_order co 
INNER JOIN order_line ol ON co.order_id = ol.order_id
GROUP BY co.order_id, co.order_date
ORDER BY co.order_date ASC, co.order_id ASC;


--SQL 03
SELECT
co.order_id,
co.order_date,
ol.price,
SUM(ol.price) OVER (ORDER BY co.order_date ASC) AS running_total
FROM cust_order co 
INNER JOIN order_line ol ON co.order_id = ol.order_id
ORDER BY co.order_date ASC, co.order_id ASC;

