SELECT
p.publisher_name,
bl.language_name,
COUNT(*) AS book_count
FROM publisher p
INNER JOIN book b ON p.publisher_id = b.publisher_id
INNER JOIN book_language bl ON b.language_id = bl.language_id 
GROUP BY p.publisher_name, bl.language_name
ORDER BY p.publisher_name ASC, bl.language_name ASC;


SELECT
p.publisher_name,
bl.language_name,
COUNT(*) AS book_count
FROM publisher p
INNER JOIN book b ON p.publisher_id = b.publisher_id
INNER JOIN book_language bl ON b.language_id = bl.language_id 
GROUP BY GROUPING SETS (p.publisher_name, bl.language_name)
ORDER BY p.publisher_name ASC, bl.language_name ASC;


SELECT
p.publisher_name,
bl.language_name,
COUNT(*) AS book_count
FROM publisher p
INNER JOIN book b ON p.publisher_id = b.publisher_id
INNER JOIN book_language bl ON b.language_id = bl.language_id 
GROUP BY GROUPING SETS (p.publisher_name, bl.language_name, (p.publisher_name, bl.language_name))
ORDER BY p.publisher_name ASC, bl.language_name ASC;

SELECT
p.publisher_name,
bl.language_name,
COUNT(*) AS book_count
FROM publisher p
INNER JOIN book b ON p.publisher_id = b.publisher_id
INNER JOIN book_language bl ON b.language_id = bl.language_id 
GROUP BY GROUPING SETS (p.publisher_name, bl.language_name, (p.publisher_name, bl.language_name), ())
ORDER BY p.publisher_name ASC, bl.language_name ASC;


SELECT
p.publisher_name,
bl.language_name,
COUNT(*) AS book_count
FROM publisher p
INNER JOIN book b ON p.publisher_id = b.publisher_id
INNER JOIN book_language bl ON b.language_id = bl.language_id 
GROUP BY GROUPING SETS (p.publisher_name, bl.language_name, ())
ORDER BY p.publisher_name ASC, bl.language_name ASC;



SELECT
DATEPART(YEAR, co.order_date) AS order_year,
s.method_name,
COUNT(*) AS order_count
FROM cust_order co
INNER JOIN shipping_method s ON co.shipping_method_id = s.method_id
GROUP BY order_year, s.method_name
ORDER BY order_year ASC, s.method_name ASC;

SELECT
DATEPART(YEAR, co.order_date) AS order_year,
s.method_name,
COUNT(*) AS order_count
FROM cust_order co
INNER JOIN shipping_method s ON co.shipping_method_id = s.method_id
GROUP BY DATEPART(YEAR, co.order_date), s.method_name
ORDER BY order_year ASC, s.method_name ASC;




SELECT
DATEPART(YEAR, co.order_date) AS order_year,
s.method_name,
COUNT(*) AS order_count
FROM cust_order co
INNER JOIN shipping_method s ON co.shipping_method_id = s.method_id
GROUP BY GROUPING SETS (DATEPART(YEAR, co.order_date), s.method_name)
ORDER BY order_year ASC, s.method_name ASC;


SELECT
DATEPART(YEAR, co.order_date)) AS order_year,
s.method_name,
COUNT(*) AS order_count
FROM cust_order co
INNER JOIN shipping_method s ON co.shipping_method_id = s.method_id
GROUP BY GROUPING SETS ((DATEPART(YEAR, co.order_date), s.method_name))
ORDER BY order_year ASC, s.method_name ASC;



SELECT
DATEPART(YEAR, co.order_date) AS order_year,
s.method_name,
COUNT(*) AS order_count
FROM cust_order co
INNER JOIN shipping_method s ON co.shipping_method_id = s.method_id
GROUP BY GROUPING SETS ((DATEPART(YEAR, co.order_date), s.method_name), ())
ORDER BY order_year ASC, s.method_name ASC;


SELECT
DATEPART(YEAR, co.order_date) AS order_year,
s.method_name,
COUNT(*) AS order_count
FROM cust_order co
INNER JOIN shipping_method s ON co.shipping_method_id = s.method_id
GROUP BY GROUPING SETS (
    (DATEPART(YEAR, co.order_date), s.method_name),
    DATEPART(YEAR, co.order_date),
    ()
)
ORDER BY order_year ASC, s.method_name ASC;