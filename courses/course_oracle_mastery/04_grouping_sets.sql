/*
Grouping Sets
*/

--SQL 01
SELECT
p.publisher_name,
bl.language_name,
COUNT(*) AS book_count
FROM publisher p
INNER JOIN book b ON p.publisher_id = b.publisher_id
INNER JOIN book_language bl ON b.language_id = bl.language_id 
GROUP BY p.publisher_name, bl.language_name
ORDER BY p.publisher_name ASC, bl.language_name ASC;


--SQL 02
SELECT
p.publisher_name,
bl.language_name,
COUNT(*) AS book_count
FROM publisher p
INNER JOIN book b ON p.publisher_id = b.publisher_id
INNER JOIN book_language bl ON b.language_id = bl.language_id 
GROUP BY GROUPING SETS (p.publisher_name, bl.language_name)
ORDER BY p.publisher_name ASC, bl.language_name ASC;


--SQL 03
SELECT
p.publisher_name,
bl.language_name,
COUNT(*) AS book_count
FROM publisher p
INNER JOIN book b ON p.publisher_id = b.publisher_id
INNER JOIN book_language bl ON b.language_id = bl.language_id 
GROUP BY GROUPING SETS (p.publisher_name, bl.language_name, (p.publisher_name, bl.language_name))
ORDER BY p.publisher_name ASC, bl.language_name ASC;


--SQL 04
SELECT
p.publisher_name,
bl.language_name,
COUNT(*) AS book_count
FROM publisher p
INNER JOIN book b ON p.publisher_id = b.publisher_id
INNER JOIN book_language bl ON b.language_id = bl.language_id 
GROUP BY GROUPING SETS (p.publisher_name, bl.language_name, (p.publisher_name, bl.language_name), ())
ORDER BY p.publisher_name ASC, bl.language_name ASC;

--SQL 05
SELECT
p.publisher_name,
bl.language_name,
COUNT(*) AS book_count
FROM publisher p
INNER JOIN book b ON p.publisher_id = b.publisher_id
INNER JOIN book_language bl ON b.language_id = bl.language_id 
GROUP BY GROUPING SETS (p.publisher_name, bl.language_name, ())
ORDER BY p.publisher_name ASC, bl.language_name ASC;


--SQL 06
SELECT
EXTRACT(YEAR FROM co.order_date) AS order_year,
s.method_name,
COUNT(*) AS order_count
FROM cust_order co
INNER JOIN shipping_method s ON co.shipping_method_id = s.method_id
GROUP BY order_year, s.method_name
ORDER BY order_year ASC, s.method_name ASC;

--SQL 07
SELECT
EXTRACT(YEAR FROM co.order_date) AS order_year,
s.method_name,
COUNT(*) AS order_count
FROM cust_order co
INNER JOIN shipping_method s ON co.shipping_method_id = s.method_id
GROUP BY EXTRACT(YEAR FROM co.order_date), s.method_name
ORDER BY order_year ASC, s.method_name ASC;


--SQL 08
SELECT
EXTRACT(YEAR FROM co.order_date) AS order_year,
s.method_name,
COUNT(*) AS order_count
FROM cust_order co
INNER JOIN shipping_method s ON co.shipping_method_id = s.method_id
GROUP BY GROUPING SETS (EXTRACT(YEAR FROM co.order_date), s.method_name)
ORDER BY order_year ASC, s.method_name ASC;

--SQL 09
SELECT
EXTRACT(YEAR FROM co.order_date) AS order_year,
s.method_name,
COUNT(*) AS order_count
FROM cust_order co
INNER JOIN shipping_method s ON co.shipping_method_id = s.method_id
GROUP BY GROUPING SETS ((EXTRACT(YEAR FROM co.order_date), s.method_name))
ORDER BY order_year ASC, s.method_name ASC;

--SQL 10
SELECT
EXTRACT(YEAR FROM co.order_date) AS order_year,
s.method_name,
COUNT(*) AS order_count
FROM cust_order co
INNER JOIN shipping_method s ON co.shipping_method_id = s.method_id
GROUP BY GROUPING SETS ((EXTRACT(YEAR FROM co.order_date), s.method_name), ())
ORDER BY order_year ASC, s.method_name ASC;

--SQL 11
SELECT
EXTRACT(YEAR FROM co.order_date) AS order_year,
s.method_name,
COUNT(*) AS order_count
FROM cust_order co
INNER JOIN shipping_method s ON co.shipping_method_id = s.method_id
GROUP BY GROUPING SETS (
    (EXTRACT(YEAR FROM co.order_date), s.method_name),
    EXTRACT(YEAR FROM co.order_date),
    ()
)
ORDER BY order_year ASC, s.method_name ASC;
