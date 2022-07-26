/*
Best Seller list
A list of books and the quantity they have sold, all time
Final query
*/
SELECT
       title,
       authors,
       isbn13,
       publisher_name,
       COUNT(*) AS sales
FROM (
         SELECT
                b.title,
                GROUP_CONCAT(a.author_name SEPARATOR ', ') AS authors,
                b.isbn13,
                p.publisher_name,
                ol.line_id
         FROM order_line ol
                  INNER JOIN book b ON ol.book_id = b.book_id
                  INNER JOIN publisher p ON b.publisher_id = p.publisher_id
                  INNER JOIN book_author ba on b.book_id = ba.book_id
                  INNER JOIN author a on ba.author_id = a.author_id
         GROUP BY b.title, b.isbn13, p.publisher_name, ol.line_id
     ) sub
GROUP BY title, authors, isbn13, publisher_name
ORDER BY COUNT(*) DESC
LIMIT 20;


/*
Try another way
*/

SELECT
       b.title,
       bs.authors,
       b.isbn13,
       COUNT(*) AS sales
FROM (
         SELECT
            b.book_id,
            GROUP_CONCAT(a.author_name SEPARATOR ', ') AS authors
         FROM book b
          INNER JOIN book_author ba on b.book_id = ba.book_id
          INNER JOIN author a on ba.author_id = a.author_id
         GROUP BY b.book_id
     )  AS bs
INNER JOIN book b ON bs.book_id = b.book_id
INNER JOIN order_line ol ON bs.book_id = ol.book_id
INNER JOIN publisher p ON b.publisher_id = p.publisher_id
GROUP BY title, authors, isbn13, publisher_name
ORDER BY COUNT(*) DESC
LIMIT 20;


/* Base Table */

SELECT *
FROM book;

/* Book table fields */

SELECT book_id, title, isbn13
FROM book;

/* Base order line */

SELECT *
FROM order_line;

/* Group by on order line */

SELECT book_id, COUNT(*)
FROM order_line
GROUP BY book_id;

/* Join to books */

SELECT book_id, COUNT(*)
FROM order_line
INNER JOIN book ON order_line.book_id = book.book_id
GROUP BY book_id;

/* Add alias */

SELECT book_id, COUNT(*)
FROM order_line o
INNER JOIN book b ON o.book_id = b.book_id
GROUP BY book_id;

/* add alias 2 */

SELECT b.book_id, COUNT(*)
FROM order_line o
INNER JOIN book b ON o.book_id = b.book_id
GROUP BY b.book_id;

/* book columns */

SELECT b.book_id, b.title, b.isbn13, COUNT(*)
FROM order_line o
INNER JOIN book b ON o.book_id = b.book_id
GROUP BY b.book_id, b.title, b.isbn13;

/* order by */

SELECT b.book_id, b.title, b.isbn13, COUNT(*)
FROM order_line o
INNER JOIN book b ON o.book_id = b.book_id
GROUP BY b.book_id, b.title, b.isbn13
ORDER BY COUNT(*) DESC;

/* col alias */

SELECT b.book_id, b.title, b.isbn13, COUNT(*) AS num_sales
FROM order_line o
INNER JOIN book b ON o.book_id = b.book_id
GROUP BY b.book_id, b.title, b.isbn13
ORDER BY COUNT(*) DESC;

/* join to publisher */

SELECT b.book_id, b.title, b.isbn13, COUNT(*) AS num_sales
FROM order_line o
INNER JOIN book b ON o.book_id = b.book_id
INNER JOIN publisher p ON b.publisher_id = p.publisher_id
GROUP BY b.book_id, b.title, b.isbn13
ORDER BY COUNT(*) DESC;

/* add publisher name */

SELECT b.book_id, b.title, b.isbn13, p.publisher_name, COUNT(*) AS num_sales
FROM order_line o
INNER JOIN book b ON o.book_id = b.book_id
INNER JOIN publisher p ON b.publisher_id = p.publisher_id
GROUP BY b.book_id, b.title, b.isbn13, p.publisher_name
ORDER BY COUNT(*) DESC;

/* new lines */

SELECT
b.book_id,
b.title,
b.isbn13,
p.publisher_name,
COUNT(*) AS num_sales
FROM order_line o
INNER JOIN book b ON o.book_id = b.book_id
INNER JOIN publisher p ON b.publisher_id = p.publisher_id
GROUP BY b.book_id, b.title, b.isbn13, p.publisher_name
ORDER BY COUNT(*) DESC;

/* row limiting in Oracle */

SELECT
b.book_id,
b.title,
b.isbn13,
p.publisher_name,
COUNT(*) AS num_sales
FROM order_line o
INNER JOIN book b ON o.book_id = b.book_id
INNER JOIN publisher p ON b.publisher_id = p.publisher_id
GROUP BY b.book_id, b.title, b.isbn13, p.publisher_name
ORDER BY COUNT(*) DESC
FETCH FIRST 20 ROWS ONLY;


/* row limiting in SQL Server */

SELECT
b.book_id,
b.title,
b.isbn13,
p.publisher_name,
COUNT(*) AS num_sales
FROM order_line o
INNER JOIN book b ON o.book_id = b.book_id
INNER JOIN publisher p ON b.publisher_id = p.publisher_id
GROUP BY b.book_id, b.title, b.isbn13, p.publisher_name
ORDER BY COUNT(*) DESC
FETCH FIRST 20 ROWS ONLY;

/* row limiting in SQL Server alt */

SELECT TOP 20
b.book_id,
b.title,
b.isbn13,
p.publisher_name,
COUNT(*) AS num_sales
FROM order_line o
INNER JOIN book b ON o.book_id = b.book_id
INNER JOIN publisher p ON b.publisher_id = p.publisher_id
GROUP BY b.book_id, b.title, b.isbn13, p.publisher_name
ORDER BY COUNT(*) DESC;

/* row limiting in MySQL */

SELECT
b.book_id,
b.title,
b.isbn13,
p.publisher_name,
COUNT(*) AS num_sales
FROM order_line o
INNER JOIN book b ON o.book_id = b.book_id
INNER JOIN publisher p ON b.publisher_id = p.publisher_id
GROUP BY b.book_id, b.title, b.isbn13, p.publisher_name
ORDER BY COUNT(*) DESC
LIMIT 20;

/* row limiting in PostgreSQL */

SELECT
b.book_id,
b.title,
b.isbn13,
p.publisher_name,
COUNT(*) AS num_sales
FROM order_line o
INNER JOIN book b ON o.book_id = b.book_id
INNER JOIN publisher p ON b.publisher_id = p.publisher_id
GROUP BY b.book_id, b.title, b.isbn13, p.publisher_name
ORDER BY COUNT(*) DESC
LIMIT 20;

/* pagination in Oracle */
/* is this the right offset number, or should it be 19? */

SELECT
b.book_id,
b.title,
b.isbn13,
p.publisher_name,
COUNT(*) AS num_sales
FROM order_line o
INNER JOIN book b ON o.book_id = b.book_id
INNER JOIN publisher p ON b.publisher_id = p.publisher_id
GROUP BY b.book_id, b.title, b.isbn13, p.publisher_name
ORDER BY COUNT(*) DESC
OFFSET 20 ROWS FETCH NEXT 20 ROWS ONLY;


/* pagination alternative in Oracle */
/* if the first method is slow, or if you're not on 12c */

SELECT
book_id,
title,
isbn13,
publisher_name,
num_sales
FROM (
  SELECT
  book_id,
  title,
  isbn13,
  publisher_name,
  num_sales,
  rownum AS rnum
  FROM (
    SELECT
    b.book_id,
    b.title,
    b.isbn13,
    p.publisher_name,
    COUNT(*) AS num_sales
    FROM order_line o
    INNER JOIN book b ON o.book_id = b.book_id
    INNER JOIN publisher p ON b.publisher_id = p.publisher_id
    GROUP BY b.book_id, b.title, b.isbn13, p.publisher_name
    ORDER BY COUNT(*) DESC
  )
  WHERE rownum <= 40
) WHERE rnum >= 21;

/* pagination in SQL Server */

SELECT
b.book_id,
b.title,
b.isbn13,
p.publisher_name,
COUNT(*) AS num_sales
FROM order_line o
INNER JOIN book b ON o.book_id = b.book_id
INNER JOIN publisher p ON b.publisher_id = p.publisher_id
GROUP BY b.book_id, b.title, b.isbn13, p.publisher_name
ORDER BY COUNT(*) DESC
OFFSET 20 ROWS FETCH NEXT 20 ROWS ONLY;


/* pagination in MySQL */

SELECT
b.book_id,
b.title,
b.isbn13,
p.publisher_name,
COUNT(*) AS num_sales
FROM order_line o
INNER JOIN book b ON o.book_id = b.book_id
INNER JOIN publisher p ON b.publisher_id = p.publisher_id
GROUP BY b.book_id, b.title, b.isbn13, p.publisher_name
ORDER BY COUNT(*) DESC
LIMIT 20 OFFSET 20;

/* pagination in MySQL alt */

SELECT
b.book_id,
b.title,
b.isbn13,
p.publisher_name,
COUNT(*) AS num_sales
FROM order_line o
INNER JOIN book b ON o.book_id = b.book_id
INNER JOIN publisher p ON b.publisher_id = p.publisher_id
GROUP BY b.book_id, b.title, b.isbn13, p.publisher_name
ORDER BY COUNT(*) DESC
LIMIT 20, 20;

/* pagination in PostgreSQL */

SELECT
b.book_id,
b.title,
b.isbn13,
p.publisher_name,
COUNT(*) AS num_sales
FROM order_line o
INNER JOIN book b ON o.book_id = b.book_id
INNER JOIN publisher p ON b.publisher_id = p.publisher_id
GROUP BY b.book_id, b.title, b.isbn13, p.publisher_name
ORDER BY COUNT(*) DESC
LIMIT 20 OFFSET 20;




/* join to book author */

SELECT
b.book_id,
b.title,
b.isbn13,
p.publisher_name,
COUNT(*) AS num_sales
FROM order_line o
INNER JOIN book b ON o.book_id = b.book_id
INNER JOIN publisher p ON b.publisher_id = p.publisher_id
INNER JOIN book_author ba ON b.book_id = ba.book_id
GROUP BY b.book_id, b.title, b.isbn13, p.publisher_name
ORDER BY COUNT(*) DESC
LIMIT 20;

/* join to author */

SELECT
b.book_id,
b.title,
b.isbn13,
p.publisher_name,
COUNT(*) AS num_sales
FROM order_line o
INNER JOIN book b ON o.book_id = b.book_id
INNER JOIN publisher p ON b.publisher_id = p.publisher_id
INNER JOIN book_author ba ON b.book_id = ba.book_id
INNER JOIN author a ON ba.author_id = a.author_id
GROUP BY b.book_id, b.title, b.isbn13, p.publisher_name
ORDER BY COUNT(*) DESC
LIMIT 20;


/* add author name */

SELECT
b.book_id,
b.title,
b.isbn13,
p.publisher_name,
a.author_name,
COUNT(*) AS num_sales
FROM order_line o
INNER JOIN book b ON o.book_id = b.book_id
INNER JOIN publisher p ON b.publisher_id = p.publisher_id
INNER JOIN book_author ba ON b.book_id = ba.book_id
INNER JOIN author a ON ba.author_id = a.author_id
GROUP BY b.book_id, b.title, b.isbn13, p.publisher_name, a.author_name
ORDER BY COUNT(*) DESC
LIMIT 20;


SELECT book_id, line_id
FROM order_line
WHERE book_id = 7200


/* group concat mysql */

SELECT
b.book_id,
b.title,
GROUP_CONCAT(a.author_name SEPARATOR ', ') AS authors
FROM book b
INNER JOIN book_author ba on b.book_id = ba.book_id
INNER JOIN author a on ba.author_id = a.author_id
GROUP BY b.book_id, b.title

/* aggregate oracle */

SELECT
b.book_id,
b.title,
LISTAGG(a.author_name, ', ') WITHIN GROUP (ORDER BY a.author_name) AS authors
FROM book b
INNER JOIN book_author ba on b.book_id = ba.book_id
INNER JOIN author a on ba.author_id = a.author_id
GROUP BY b.book_id, b.title;

/* aggregate sql server */

SELECT
b.book_id,
b.title,
STRING_AGG(a.author_name, ', ') AS authors
FROM book b
INNER JOIN book_author ba on b.book_id = ba.book_id
INNER JOIN author a on ba.author_id = a.author_id
GROUP BY b.book_id, b.title;

/* aggregate sql server stuff */
/* confirm if this query will work */

SELECT
b.book_id,
b.title,
STUFF((
  SELECT a.author_name
  FROM author a
  WHERE a.author_id = ba.author_id
  FOR XML PATH('')), 1, 1, '') AS authors
FROM book b
INNER JOIN book_author ba on b.book_id = ba.book_id
GROUP BY b.book_id, b.title;

/* aggregate PostgreSQL */

SELECT
b.book_id,
b.title,
ARRAY_TO_STRING(ARRAY_AGG(a.author_name), ', ') AS authors
FROM book b
INNER JOIN book_author ba on b.book_id = ba.book_id
INNER JOIN author a on ba.author_id = a.author_id
GROUP BY b.book_id, b.title;

/* adding book authors step 1 */

SELECT
b.book_id,
b.title,
b.isbn13,
p.publisher_name,
COUNT(*) AS num_sales
FROM order_line o
INNER JOIN book b ON o.book_id = b.book_id
INNER JOIN publisher p ON b.publisher_id = p.publisher_id
INNER JOIN
GROUP BY b.book_id, b.title, b.isbn13, p.publisher_name
ORDER BY COUNT(*) DESC
LIMIT 20;


/* adding book authors step 2 */

SELECT
b.book_id,
b.title,
b.isbn13,
p.publisher_name,
COUNT(*) AS num_sales
FROM order_line o
INNER JOIN book b ON o.book_id = b.book_id
INNER JOIN publisher p ON b.publisher_id = p.publisher_id
INNER JOIN (
  SELECT
  b.book_id,
  b.title,
  GROUP_CONCAT(a.author_name SEPARATOR ', ') AS authors
  FROM book b
  INNER JOIN book_author ba on b.book_id = ba.book_id
  INNER JOIN author a on ba.author_id = a.author_id
  GROUP BY b.book_id, b.title
) ba
GROUP BY b.book_id, b.title, b.isbn13, p.publisher_name
ORDER BY COUNT(*) DESC
LIMIT 20;

/* adding book authors step 3 */

SELECT
b.book_id,
b.title,
b.isbn13,
p.publisher_name,
COUNT(*) AS num_sales
FROM order_line o
INNER JOIN book b ON o.book_id = b.book_id
INNER JOIN publisher p ON b.publisher_id = p.publisher_id
INNER JOIN (
  SELECT
  b.book_id,
  b.title,
  GROUP_CONCAT(a.author_name SEPARATOR ', ') AS authors
  FROM book b
  INNER JOIN book_author ba on b.book_id = ba.book_id
  INNER JOIN author a on ba.author_id = a.author_id
  GROUP BY b.book_id, b.title
) ba ON b.book_id = ba.book_id
GROUP BY b.book_id, b.title, b.isbn13, p.publisher_name
ORDER BY COUNT(*) DESC
LIMIT 20;


/* adding book authors step 4 */

SELECT
b.book_id,
b.title,
ba.authors,
b.isbn13,
p.publisher_name,
COUNT(*) AS num_sales
FROM order_line o
INNER JOIN book b ON o.book_id = b.book_id
INNER JOIN publisher p ON b.publisher_id = p.publisher_id
INNER JOIN (
  SELECT
  b.book_id,
  b.title,
  GROUP_CONCAT(a.author_name SEPARATOR ', ') AS authors
  FROM book b
  INNER JOIN book_author ba on b.book_id = ba.book_id
  INNER JOIN author a on ba.author_id = a.author_id
  GROUP BY b.book_id, b.title
) ba ON b.book_id = ba.book_id
GROUP BY b.book_id, b.title, ba.authors, b.isbn13, p.publisher_name
ORDER BY COUNT(*) DESC
LIMIT 20;


/* adding book authors step 5 */

SELECT
b.book_id,
b.title,
ba.authors,
b.isbn13,
p.publisher_name,
COUNT(*) AS num_sales
FROM order_line o
INNER JOIN book b ON o.book_id = b.book_id
INNER JOIN publisher p ON b.publisher_id = p.publisher_id
INNER JOIN (
  SELECT
  b.book_id,
  GROUP_CONCAT(a.author_name SEPARATOR ', ') AS authors
  FROM book b
  INNER JOIN book_author ba on b.book_id = ba.book_id
  INNER JOIN author a on ba.author_id = a.author_id
  GROUP BY b.book_id
) ba ON b.book_id = ba.book_id
GROUP BY b.book_id, b.title, ba.authors, b.isbn13, p.publisher_name
ORDER BY COUNT(*) DESC
LIMIT 20;

/* adding book authors step 6 */

SELECT
b.book_id,
b.title,
ba.authors,
b.isbn13,
p.publisher_name,
COUNT(*) AS num_sales
FROM order_line o
INNER JOIN book b ON o.book_id = b.book_id
INNER JOIN publisher p ON b.publisher_id = p.publisher_id
INNER JOIN (
  SELECT
  ba.book_id,
  GROUP_CONCAT(a.author_name SEPARATOR ', ') AS authors
  FROM book_author ba
  INNER JOIN author a on ba.author_id = a.author_id
  GROUP BY ba.book_id
) ba ON b.book_id = ba.book_id
GROUP BY b.book_id, b.title, ba.authors, b.isbn13, p.publisher_name
ORDER BY COUNT(*) DESC
LIMIT 20;
