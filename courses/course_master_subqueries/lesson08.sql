/*
Find average number of pages per publisher
*/

SELECT
publisher_id,
AVG(num_pages)
FROM book
GROUP BY publisher_id;

/*
Select books
*/
SELECT
book_id,
title,
num_pages,
publisher_id
FROM book;

/*
Filter
*/
SELECT
book_id,
title,
num_pages,
publisher_id
FROM book
WHERE num_pages > (
	SELECT
	AVG(num_pages)
	FROM book
);

SELECT
publisher_id,
AVG(num_pages)
FROM book
WHERE publisher_id IN (
1591, 1891, 435, 1749
)
GROUP BY publisher_id;



/*
Works
*/
SELECT
book_id,
title,
num_pages,
publisher_id
FROM book b
WHERE num_pages > (
	SELECT
	AVG(num_pages)
	FROM book b2
    WHERE b2.publisher_id = b.publisher_id
);

/*
Using a join instead
*/
SELECT
b.book_id,
b.title,
b.num_pages,
b.publisher_id
FROM book b
INNER JOIN (
	SELECT
	publisher_id,
	AVG(num_pages) AS avg_num_pages
	FROM book
	GROUP BY publisher_id
) pub
ON b.publisher_id = pub.publisher_id
WHERE b.num_pages > pub.avg_num_pages;





