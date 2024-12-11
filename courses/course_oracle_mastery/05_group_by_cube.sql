/*
Group By Cube
*/

--SQL 01
SELECT
EXTRACT(YEAR FROM co.order_date) AS order_year,
s.method_name,
COUNT(*) AS order_count
FROM cust_order co
INNER JOIN shipping_method s ON co.shipping_method_id = s.method_id
GROUP BY CUBE(EXTRACT(YEAR FROM co.order_date), s.method_name)
ORDER BY order_year ASC, s.method_name ASC;

--SQL 02
SELECT
EXTRACT(YEAR FROM co.order_date) AS order_year,
s.method_name,
COUNT(*) AS order_count
FROM cust_order co
INNER JOIN shipping_method s ON co.shipping_method_id = s.method_id
GROUP BY GROUPING SETS (
  EXTRACT(YEAR FROM co.order_date) ,
  s.method_name,
  (EXTRACT(YEAR FROM co.order_date) , s.method_name),
  ()
  )
ORDER BY order_year ASC, s.method_name ASC;


--SQL 03
--author, publisher, language
SELECT
p.publisher_name,
bl.language_name,
a.author_name,
COUNT(*) AS book_count
FROM publisher p
INNER JOIN book b ON p.publisher_id = b.publisher_id
INNER JOIN book_language bl ON b.language_id = bl.language_id 
INNER JOIN book_author ba ON b.book_id = ba.book_id 
INNER JOIN author a ON ba.author_id = a.author_id 
GROUP BY CUBE (p.publisher_name, bl.language_name, a.author_name)
ORDER BY p.publisher_name ASC, bl.language_name ASC, a.author_name ASC;




