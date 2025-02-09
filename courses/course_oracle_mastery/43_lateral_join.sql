/*
Lateral Join
*/

--SQL 01
SELECT
p.publisher_name,
p.publisher_id,
b.title,
b.publication_date 
FROM book b
INNER JOIN publisher p ON b.publisher_id = p.publisher_id
WHERE b.book_id IN (
	SELECT s.book_id
	FROM (
		SELECT b2.book_id,
		ROW_NUMBER() OVER (
			PARTITION BY b2.publisher_id ORDER BY b2.publication_date DESC
		) AS recent_number
		FROM book b2
		WHERE b2.publisher_id = b.publisher_id 
	) s
	WHERE s.recent_number <= 5
)
ORDER BY p.publisher_name ASC, b.publication_date DESC;


--SQL 02
WITH books_by_publisher AS (
	SELECT
	p.publisher_name,
	b.publisher_id,
	b.title,
	b.publication_date,
	ROW_NUMBER() OVER (
		PARTITION BY b.publisher_id ORDER BY b.publication_date DESC
	) AS recent_number
	FROM book b
	INNER JOIN publisher p ON b.publisher_id = p.publisher_id
)
SELECT
publisher_name,
publisher_id,
title,
publication_date
FROM books_by_publisher
WHERE recent_number <= 5
ORDER BY publisher_name ASC, publication_date DESC;

--SQL 03
SELECT *
FROM publisher p
JOIN LATERAL (
	SELECT b.*
	FROM book b
	WHERE p.publisher_id = b.publisher_id 
	ORDER BY b.publication_date DESC
	FETCH FIRST 5 ROWS ONLY
) s ON TRUE
ORDER BY p.publisher_name ASC, s.publication_date DESC;

--SQL 04
SELECT
p.publisher_name,
p.publisher_id,
s.title,
s.publication_date 
FROM publisher p
JOIN LATERAL (
	SELECT b.*
	FROM book b
	WHERE p.publisher_id = b.publisher_id 
	ORDER BY b.publication_date DESC
	FETCH FIRST 5 ROWS ONLY
) s ON TRUE
ORDER BY p.publisher_name ASC, s.publication_date DESC;
