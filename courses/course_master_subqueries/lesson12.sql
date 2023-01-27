/*
Alter book table
*/
ALTER TABLE book
ADD COLUMN comments VARCHAR(100);

/*
Add comment for above average books
*/
UPDATE book
SET comments = 'Longer than average'
WHERE num_pages > (
	SELECT AVG(num_pages)
	FROM book
);

/*
MySQL: Error Code: 1093. You can't specify target table 'book' for update in FROM clause
*/

/*
MySQL different example: books published after the first order
*/

UPDATE book
SET comments = 'Published after first order'
WHERE publication_date > (
	SELECT MIN(order_date)
    FROM cust_order
);

SELECT
book_id,
title,
publication_date,
comments
FROM book
ORDER BY publication_date DESC;

/*
Subquery in SET: set comment to say number of books ordered
*/

UPDATE book b
SET b.comments = (
	SELECT COUNT(*)
    FROM order_line o
    WHERE o.book_id = b.book_id
);


SELECT
book_id,
title,
comments
FROM book;