/*
Lead and Lag
*/

--SQL 01

SELECT
co.order_id,
co.order_date,
SUM(ol.price) AS order_amount
FROM cust_order co 
INNER JOIN order_line ol ON co.order_id = ol.order_id 
GROUP BY co.order_id, co.order_date
ORDER BY co.order_date ASC;


--SQL 02

SELECT
co.order_id,
co.order_date,
SUM(ol.price) AS order_amount,
LAG(co.order_id) OVER(ORDER BY co.order_date ASC) AS previous_order_id
FROM cust_order co 
INNER JOIN order_line ol ON co.order_id = ol.order_id 
GROUP BY co.order_id, co.order_date
ORDER BY co.order_date ASC;


--SQL 03
SELECT
co.order_id,
co.order_date,
SUM(ol.price) AS order_amount,
LAG(SUM(ol.price)) OVER(ORDER BY co.order_date ASC) AS previous_order_total
FROM cust_order co 
INNER JOIN order_line ol ON co.order_id = ol.order_id 
GROUP BY co.order_id, co.order_date
ORDER BY co.order_date ASC;

--SQL 04
SELECT
TRUNC(co.order_date) AS order_date,
COUNT(*) AS num_books_ordered,
LAG(COUNT(*)) OVER(ORDER BY TRUNC(co.order_date) ASC) AS yesterday_count
FROM cust_order co 
INNER JOIN order_line ol ON co.order_id = ol.order_id 
GROUP BY TRUNC(co.order_date)
ORDER BY TRUNC(co.order_date) ASC;

--SQL 05
SELECT
TRUNC(co.order_date)AS order_date,
COUNT(*) AS num_books_ordered,
LAG(COUNT(*), 1) OVER(ORDER BY TRUNC(co.order_date) ASC) AS yesterday_count
FROM cust_order co 
INNER JOIN order_line ol ON co.order_id = ol.order_id 
GROUP BY TRUNC(co.order_date)
ORDER BY TRUNC(co.order_date) ASC;

--SQL 06
SELECT
TRUNC(co.order_date)AS order_date,
COUNT(*) AS num_books_ordered,
LAG(COUNT(*), 7) OVER(ORDER BY TRUNC(co.order_date) ASC) AS yesterday_count
FROM cust_order co 
INNER JOIN order_line ol ON co.order_id = ol.order_id 
GROUP BY TRUNC(co.order_date)
ORDER BY TRUNC(co.order_date) ASC;

--SQL 07
SELECT
TRUNC(co.order_date) AS order_date,
COUNT(*) AS num_books_ordered,
LEAD(COUNT(*), 1) OVER(ORDER BY TRUNC(co.order_date) ASC) AS next_day_count
FROM cust_order co 
INNER JOIN order_line ol ON co.order_id = ol.order_id 
GROUP BY TRUNC(co.order_date)
ORDER BY TRUNC(co.order_date) ASC;


--SQL 08
SELECT
TRUNC(co.order_date) AS order_date,
COUNT(*) AS num_books_ordered,
LEAD(COUNT(*), 7) OVER(ORDER BY TRUNC(co.order_date) ASC) AS next_week_count
FROM cust_order co 
INNER JOIN order_line ol ON co.order_id = ol.order_id 
GROUP BY TRUNC(co.order_date)
ORDER BY TRUNC(co.order_date) ASC;


--SQL 09
SELECT
TRUNC(co.order_date) AS order_date,
COUNT(*) AS num_books_ordered,
LAG(COUNT(*), 7) OVER(ORDER BY TRUNC(co.order_date) ASC) AS last_week_count,
LEAD(COUNT(*), 7) OVER(ORDER BY TRUNC(co.order_date) ASC) AS next_week_count
FROM cust_order co 
INNER JOIN order_line ol ON co.order_id = ol.order_id 
GROUP BY TRUNC(co.order_date)
ORDER BY TRUNC(co.order_date) ASC;