SELECT
method_id,
method_name,
cost
FROM shipping_method;


SELECT
method_id,
method_name,
cost
FROM shipping_method
FOR JSON AUTO;


SELECT
method_id,
method_name AS 'method.name',
cost
FROM shipping_method
FOR JSON AUTO;


SELECT
method_id,
method_name,
cost
FROM shipping_method
FOR JSON PATH;


SELECT
method_id,
method_name AS 'method.name',
cost
FROM shipping_method
FOR JSON PATH;


SELECT
method_id,
method_name AS 'method.name',
cost AS 'method.cost'
FROM shipping_method
FOR JSON PATH;


SELECT
b.book_id,
b.title,
b.isbn13,
b.publication_date,
a.author_name
FROM book b
INNER JOIN book_author ba ON b.book_id = ba.book_id
INNER JOIN author a ON ba.author_id = a.author_id
WHERE b.book_id <= 20;


SELECT
b.book_id,
b.title,
b.isbn13,
b.publication_date,
a.author_name
FROM book b
INNER JOIN book_author ba ON b.book_id = ba.book_id
INNER JOIN author a ON ba.author_id = a.author_id
WHERE b.book_id <= 20
FOR JSON PATH;


SELECT
b.book_id,
b.title,
b.isbn13,
b.publication_date,
(
	SELECT
	sa.author_name
	FROM author sa
	INNER JOIN book_author ba ON b.book_id = ba.book_id
	INNER JOIN book sb ON ba.author_id = sa.author_id
	WHERE sb.book_id = b.book_id
	FOR JSON PATH
) AS authors
FROM book b
WHERE b.book_id <= 20
FOR JSON PATH;