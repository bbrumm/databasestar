/*
Books and pages
*/
SELECT
book_id,
title,
num_pages,
publisher_id
FROM book;

/*
Add avg column
*/

SELECT
book_id,
title,
num_pages,
publisher_id,
AVG(num_pages)
FROM book;

/*
Add as subquery
*/

SELECT
book_id,
title,
num_pages,
publisher_id,
(
	SELECT AVG(num_pages)
	FROM book
)
FROM book;

/*
Add alias
*/

SELECT
book_id,
title,
num_pages,
publisher_id,
(
	SELECT AVG(num_pages)
	FROM book
) AS overall_avg
FROM book;

/*
Just for a publisher id
*/

SELECT
book_id,
title,
num_pages,
publisher_id,
(
	SELECT AVG(b2.num_pages)
	FROM book b2
    WHERE b2.publisher_id = b1.publisher_id
) AS avg_for_publisher
FROM book b1;

/*
Add where
*/
SELECT
book_id,
title,
num_pages,
publisher_id,
(
	SELECT AVG(b2.num_pages)
	FROM book b2
    WHERE b2.publisher_id = b1.publisher_id
) AS avg_for_publisher
FROM book b1
WHERE num_pages < avg_for_publisher;

/*
Subquery repeat
*/

SELECT
book_id,
title,
num_pages,
publisher_id,
(
	SELECT AVG(b2.num_pages)
	FROM book b2
    WHERE b2.publisher_id = b1.publisher_id
) AS avg_for_publisher
FROM book b1
WHERE num_pages < (
	SELECT AVG(b2.num_pages)
	FROM book b2
    WHERE b2.publisher_id = b1.publisher_id
);

/*
Surround
*/
SELECT
book_id,
title,
num_pages,
publisher_id,
avg_for_publisher
FROM (
	SELECT
	book_id,
	title,
	num_pages,
	publisher_id,
	(
		SELECT AVG(b2.num_pages)
		FROM book b2
		WHERE b2.publisher_id = b1.publisher_id
	) AS avg_for_publisher
	FROM book b1
) AS sub
WHERE num_pages < avg_for_publisher;