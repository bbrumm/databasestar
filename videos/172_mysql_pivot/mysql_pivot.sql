/* Original query */

SELECT
co.order_id,
co.order_date,
b.book_id,
b.title,
p.publisher_name
FROM publisher p
INNER JOIN book b ON p.publisher_id = b.publisher_id
INNER JOIN order_line ol ON ol.book_id = b.book_id
INNER JOIN cust_order co ON co.order_id = ol.order_id;

/* Pivot query */


SELECT
p.publisher_name,
SUM(CASE WHEN YEAR(co.order_date) = 2019 THEN 1 ELSE 0 END) AS orders_2019,
SUM(CASE WHEN YEAR(co.order_date) = 2020 THEN 1 ELSE 0 END) AS orders_2020,
SUM(CASE WHEN YEAR(co.order_date) = 2021 THEN 1 ELSE 0 END) AS orders_2021,
SUM(CASE WHEN YEAR(co.order_date) = 2022 THEN 1 ELSE 0 END) AS orders_2022
FROM publisher p
INNER JOIN book b ON p.publisher_id = b.publisher_id
INNER JOIN order_line ol ON ol.book_id = b.book_id
INNER JOIN cust_order co ON co.order_id = ol.order_id
GROUP BY p.publisher_name;