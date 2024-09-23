/*
Exercises from the PostgreSQL Mastery course
Module 2
*/

/* 09-01 */

SELECT
co.order_id,
co.order_date,
SUM(ol.price) AS total_price,
AVG(SUM(ol.price)) OVER () AS avg_all_orders
FROM cust_order co
INNER JOIN order_line ol ON co.order_id = ol.order_id
GROUP BY co.order_id, co.order_date, ol.price;

/* 09-02 */

SELECT
co.order_id,
co.order_date,
COUNT(*) AS num_books,
AVG(COUNT(*)) OVER () AS avg_all_orders
FROM cust_order co
INNER JOIN order_line ol ON co.order_id = ol.order_id
GROUP BY co.order_id, co.order_date;

/* 10-01 */

SELECT
book_id,
title,
isbn13,
num_pages,
publication_date,
RANK() OVER (ORDER BY num_pages DESC) AS num_page_rank
FROM book
ORDER BY num_pages DESC;

/* 10-02 */

SELECT
customer_id,
first_name,
last_name,
email,
LENGTH(last_name) AS last_name_length,
RANK() OVER (ORDER BY LENGTH(last_name) DESC) AS length_rank
FROM customer
ORDER BY last_name_length DESC;

/* 10-03 */

SELECT
order_id,
order_date,
order_date::time AS order_time,
RANK() OVER (ORDER BY order_date::time ASC) AS order_time_rank
FROM cust_order
ORDER BY order_time ASC;

/* 11-01 */

SELECT
bl.language_name,
COUNT(*) AS book_count,
DENSE_RANK() OVER(ORDER BY COUNT(*) DESC) AS book_rank
FROM book b
INNER JOIN book_language bl ON b.language_id = bl.language_id
GROUP BY bl.language_name
ORDER BY COUNT(*) DESC;

/* 11-02 */

SELECT
bl.language_name,
COUNT(*) AS book_count,
DENSE_RANK() OVER(ORDER BY COUNT(*) DESC) AS book_rank
FROM book b
INNER JOIN book_language bl ON b.language_id = bl.language_id
GROUP BY bl.language_name
ORDER BY COUNT(*) DESC;

/* 12-01 */

SELECT
bl.language_name,
COUNT(*) AS book_count,
ROW_NUMBER() OVER(ORDER BY COUNT(*) DESC) AS book_rank
FROM book b
INNER JOIN book_language bl ON b.language_id = bl.language_id
GROUP BY bl.language_name
ORDER BY COUNT(*) DESC;

/* 13-01 */

SELECT
b.book_id,
b.title,
b.num_pages,
bl.language_name,
COUNT(*) OVER (PARTITION BY bl.language_name) AS books_in_language
FROM book b
INNER JOIN book_language bl ON b.language_id = bl.language_id;

/* 13-02 */

SELECT
co.order_id,
co.order_date,
sm.method_name,
COUNT(*) OVER (PARTITION BY sm.method_name) AS count_with_method
FROM cust_order co
INNER JOIN shipping_method sm ON co.shipping_method_id = sm.method_id;

/* 13-03 */

SELECT
b.book_id,
b.title,
co.order_id,
co.order_date,
ol.price,
MIN(ol.price) OVER (PARTITION BY b.book_id) AS min_price,
MAX(ol.price) OVER (PARTITION BY b.book_id) AS max_price
FROM book b
INNER JOIN order_line ol ON b.book_id = ol.book_id 
INNER JOIN cust_order co ON ol.order_id = co.order_id;

/* 14-01 */
/* Note: the exercise did not specify how the running total should be ordered,
so this query will order by the publication date */

SELECT
b.book_id,
b.title,
b.publication_date,
b.num_pages,
SUM(b.num_pages) OVER(ORDER BY b.publication_date ASC)
FROM book b
ORDER BY b.publication_date ASC;

/* 14-02 */

SELECT
co.order_id,
co.order_date,
COUNT(*) OVER (ORDER BY co.order_date ASC) AS running_total
FROM cust_order co 
INNER JOIN order_history oh ON co.order_id = oh.order_id 
INNER JOIN order_status os ON oh.status_id = os.status_id
WHERE os.status_value = 'Cancelled'
ORDER BY co.order_date ASC;

/* 15-01 */

SELECT
co.order_id,
co.order_date,
SUM(ol.price) AS order_amount,
LAG(SUM(ol.price)) OVER(ORDER BY co.order_date ASC) AS previous_order_amount
FROM cust_order co 
INNER JOIN order_line ol ON co.order_id = ol.order_id
GROUP BY co.order_id, co.order_date
ORDER BY co.order_date ASC;

/* 15-02 */

SELECT
b.book_id,
b.title,
b.publication_date,
p.publisher_name,
b.num_pages,
LAG(b.num_pages) OVER (
  PARTITION BY p.publisher_name 
  ORDER BY b.publication_date ASC
) AS prev_num_pages
FROM book b
INNER JOIN publisher p ON b.publisher_id = p.publisher_id 

/* 15-03 */

SELECT
b.book_id,
b.title,
co.order_date,
ol.price,
LAG(ol.price) OVER (
  PARTITION BY b.book_id
  ORDER BY co.order_date ASC
) AS previous_price,
LEAD(ol.price) OVER (
  PARTITION BY b.book_id
  ORDER BY co.order_date ASC
) AS next_price
FROM book b
INNER JOIN order_line ol ON ol.book_id = b.book_id 
INNER JOIN cust_order co ON ol.order_id = co.order_id
ORDER BY b.book_id ASC, co.order_date ASC;

/* 16-01 */

SELECT
co.order_date::date AS order_date,
COUNT(*) AS order_count,
SUM(COUNT(*)) OVER (
  ORDER BY co.order_date::date ASC
  RANGE INTERVAL '30' DAY PRECEDING
) AS orders_rolling_month
FROM cust_order co 
GROUP BY co.order_date::date
ORDER BY co.order_date::date ASC

/* 16-02 */

SELECT
b.book_id,
b.title,
b.publication_date,
b.num_pages,
AVG(b.num_pages) OVER (
  ORDER BY b.publication_date ASC
  ROWS 9 PRECEDING
) AS avg_last_10
FROM book b
ORDER BY b.publication_date ASC;

/* 17-02 */

SELECT
co.order_id,
co.order_date::date AS order_date,
SUM(ol.price) AS order_amount,
SUM(SUM(ol.price)) OVER (
  ORDER BY co.order_date::date ASC
  RANGE BETWEEN INTERVAL '7' DAY PRECEDING AND INTERVAL '7' DAY FOLLOWING
) AS avg_order_amount_week
FROM cust_order co 
INNER JOIN order_line ol ON co.order_id = ol.order_id 
GROUP BY co.order_id, co.order_date::date
ORDER BY co.order_date::date ASC;

/* 18-01 */

SELECT
co.order_id,
co.order_date,
c.first_name,
c.last_name,
SUM(ol.price) AS order_amount,
SUM(SUM(ol.price)) OVER w_cust AS sum_for_customer,
AVG(SUM(ol.price)) OVER w_cust AS avg_for_customer,
COUNT(co.order_id) OVER w_cust AS num_orders_for_customer
FROM cust_order co 
INNER JOIN order_line ol ON co.order_id = ol.order_id 
INNER JOIN customer c ON co.customer_id = c.customer_id 
GROUP BY co.order_id, co.order_date, c.first_name, c.last_name
WINDOW w_cust AS (
  PARTITION BY c.first_name, c.last_name
)
ORDER BY co.order_date ASC;

/* 18-02 */

/*
Note: even though the exercise says to use a window clause for this,
it could also be solved with a group by as shown below.
*/

SELECT
c.country_name,
COUNT(*) count_for_country,
MAX(co.order_date::date) AS recent_order_date_for_country
FROM cust_order co 
INNER JOIN address a ON co.dest_address_id = a.address_id 
INNER JOIN country c ON a.country_id = c.country_id
GROUP BY c.country_name 
ORDER BY c.country_name ASC;

