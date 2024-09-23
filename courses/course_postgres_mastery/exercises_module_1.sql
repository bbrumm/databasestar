/*
Exercises from the PostgreSQL Mastery course
Module 1
*/

/* 03-01 */

SELECT
a.author_name,
COUNT(*) AS book_count
FROM author a
INNER JOIN book_author ba ON ba.author_id = a.author_id
GROUP BY a.author_name
ORDER BY COUNT(*) DESC;

/* 03-02 */

SELECT
a.city,
c.country_name,
COUNT(*)
FROM address a
INNER JOIN country c ON a.country_id = c.country_id
GROUP BY a.city, c.country_name
ORDER BY a.city ASC;

/* 04-01 */

SELECT
EXTRACT(year FROM order_date) AS order_year,
EXTRACT(month FROM order_date) AS order_month,
COUNT(*) AS order_count
FROM cust_order
GROUP BY GROUPING SETS ((order_year, order_month), ())
ORDER BY order_year ASC, order_month ASC;

/* 04-02 */

SELECT
bl.language_name,
p.publisher_name,
SUM(ol.price) AS total_price
FROM book b
INNER JOIN book_language bl ON b.language_id = bl.language_id 
INNER JOIN publisher p ON b.publisher_id = p.publisher_id 
INNER JOIN order_line ol ON b.book_id = ol.book_id
GROUP BY GROUPING SETS (
	(bl.language_name, p.publisher_name),
	bl.language_name,
	()
)
ORDER BY bl.language_name, p.publisher_name;

/* 05-01 */

SELECT
EXTRACT(year FROM order_date) AS order_year,
EXTRACT(month FROM order_date) AS order_month,
COUNT(*) AS order_count
FROM cust_order
GROUP BY CUBE (order_year, order_month)
ORDER BY order_year ASC, order_month ASC;

/* 05-02 */

SELECT
a.city,
c.country_name,
COUNT(*)
FROM address a
INNER JOIN country c ON a.country_id = c.country_id
GROUP BY CUBE (a.city, c.country_name)
ORDER BY a.city ASC, c.country_name ASC;

/* 06-01 */

SELECT
EXTRACT(year FROM order_date) AS order_year,
EXTRACT(month FROM order_date) AS order_month,
COUNT(*) AS order_count
FROM cust_order
GROUP BY ROLLUP (order_year, order_month)
ORDER BY order_year ASC, order_month ASC;

/* 06-02 */

SELECT
a.city,
c.country_name,
COUNT(*)
FROM address a
INNER JOIN country c ON a.country_id = c.country_id
GROUP BY ROLLUP (c.country_name, a.city)
ORDER BY a.city ASC, c.country_name ASC;
