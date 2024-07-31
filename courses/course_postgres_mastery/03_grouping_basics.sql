/*
Grouping Basics
*/

--SQL 01
SELECT
p.publisher_name,
COUNT(*) AS publisher_count
FROM publisher p
INNER JOIN book b ON p.publisher_id = b.publisher_id
GROUP BY p.publisher_name;

--SQL 02
SELECT
p.publisher_name,
COUNT(*) AS publisher_count
FROM publisher p
INNER JOIN book b ON p.publisher_id = b.publisher_id
GROUP BY p.publisher_name
ORDER BY COUNT(*) DESC;

--SQL 03
SELECT
p.publisher_name,
COUNT(*) AS publisher_count
FROM publisher p
INNER JOIN book b ON p.publisher_id = b.publisher_id
GROUP BY p.publisher_name
ORDER BY publisher_count DESC;


--SQL 04
SELECT
p.publisher_name,
COUNT(*) AS publisher_count
FROM publisher p
INNER JOIN book b ON p.publisher_id = b.publisher_id
GROUP BY p.publisher_name
HAVING publisher_count > 50
ORDER BY publisher_count DESC;

--SQL 05
SELECT
p.publisher_name,
COUNT(*) AS publisher_count
FROM publisher p
INNER JOIN book b ON p.publisher_id = b.publisher_id
GROUP BY p.publisher_name
HAVING COUNT(*) > 50
ORDER BY publisher_count DESC;


--SQL 06
SELECT
p.publisher_name
FROM publisher p
INNER JOIN book b ON p.publisher_id = b.publisher_id
GROUP BY p.publisher_name
HAVING COUNT(*) > 50
ORDER BY COUNT(*) DESC;

--SQL 07
SELECT
p.publisher_name,
bl.language_name,
COUNT(*) AS book_count
FROM publisher p
INNER JOIN book b ON p.publisher_id = b.publisher_id
INNER JOIN book_language bl ON b.language_id = bl.language_id 
GROUP BY p.publisher_name, bl.language_name
ORDER BY COUNT(*) DESC;

--SQL 08
SELECT
p.publisher_name,
bl.language_name,
COUNT(*) AS book_count
FROM publisher p
INNER JOIN book b ON p.publisher_id = b.publisher_id
INNER JOIN book_language bl ON b.language_id = bl.language_id 
WHERE bl.language_name != 'English'
GROUP BY p.publisher_name, bl.language_name
ORDER BY COUNT(*) DESC;


--SQL 09
SELECT
p.publisher_name,
bl.language_name,
COUNT(*) AS book_count
FROM publisher p
INNER JOIN book b ON p.publisher_id = b.publisher_id
INNER JOIN book_language bl ON b.language_id = bl.language_id 
WHERE bl.language_name NOT IN('English', 'United States English')
GROUP BY p.publisher_name, bl.language_name
ORDER BY COUNT(*) DESC;