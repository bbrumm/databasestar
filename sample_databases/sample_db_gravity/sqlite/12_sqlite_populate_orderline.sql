/* Add a line for all orders */
INSERT INTO order_line (order_id, book_id, price)
WITH book_rows AS (
	SELECT
		book_id,
		ROW_NUMBER() OVER (ORDER BY RANDOM()) AS rn
	FROM book
), order_rows AS (
	SELECT
		order_id,
   	ROW_NUMBER() OVER (ORDER BY RANDOM()) AS rn
	FROM cust_order
)
SELECT 
	o.order_id,
	b.book_id,
	CAST( ABS(RANDOM()) % 2000 AS REAL ) / 100 price
FROM order_rows o
INNER JOIN book_rows b ON o.rn = b.rn
ORDER BY RANDOM();

/* Add lines to some orders */
INSERT INTO order_line (order_id, book_id, price)
WITH book_rows AS (
	SELECT
		book_id,
		ROW_NUMBER() OVER (ORDER BY RANDOM()) AS rn
	FROM book
), order_rows AS (
	SELECT
		order_id,
   	ROW_NUMBER() OVER (ORDER BY RANDOM()) AS rn
	FROM cust_order
)
SELECT 
	o.order_id,
	b.book_id,
	CAST( ABS(RANDOM()) % 2000 AS REAL ) / 100 price
FROM order_rows o
INNER JOIN book_rows b ON o.rn = b.rn
ORDER BY RANDOM()
LIMIT 4000;

INSERT INTO order_line (order_id, book_id, price)
WITH book_rows AS (
	SELECT
		book_id,
		ROW_NUMBER() OVER (ORDER BY RANDOM()) AS rn
	FROM book
), order_rows AS (
	SELECT
		order_id,
   	ROW_NUMBER() OVER (ORDER BY RANDOM()) AS rn
	FROM cust_order
)
SELECT 
	o.order_id,
	b.book_id,
	CAST( ABS(RANDOM()) % 2000 AS REAL ) / 100 price
FROM order_rows o
INNER JOIN book_rows b ON o.rn = b.rn
ORDER BY RANDOM()
LIMIT 2000;

INSERT INTO order_line (order_id, book_id, price)
WITH book_rows AS (
	SELECT
		book_id,
		ROW_NUMBER() OVER (ORDER BY RANDOM()) AS rn
	FROM book
), order_rows AS (
	SELECT
		order_id,
   	ROW_NUMBER() OVER (ORDER BY RANDOM()) AS rn
	FROM cust_order
)
SELECT 
	o.order_id,
	b.book_id,
	CAST( ABS(RANDOM()) % 2000 AS REAL ) / 100 price
FROM order_rows o
INNER JOIN book_rows b ON o.rn = b.rn
ORDER BY RANDOM()
LIMIT 1000;

INSERT INTO order_line (order_id, book_id, price)
WITH book_rows AS (
	SELECT
		book_id,
		ROW_NUMBER() OVER (ORDER BY RANDOM()) AS rn
	FROM book
), order_rows AS (
	SELECT
		order_id,
   	ROW_NUMBER() OVER (ORDER BY RANDOM()) AS rn
	FROM cust_order
)
SELECT 
	o.order_id,
	b.book_id,
	CAST( ABS(RANDOM()) % 2000 AS REAL ) / 100 price
FROM order_rows o
INNER JOIN book_rows b ON o.rn = b.rn
ORDER BY RANDOM()
LIMIT 500;

INSERT INTO order_line (order_id, book_id, price)
WITH book_rows AS (
	SELECT
		book_id,
		ROW_NUMBER() OVER (ORDER BY RANDOM()) AS rn
	FROM book
), order_rows AS (
	SELECT
		order_id,
   	ROW_NUMBER() OVER (ORDER BY RANDOM()) AS rn
	FROM cust_order
)
SELECT 
	o.order_id,
	b.book_id,
	CAST( ABS(RANDOM()) % 2000 AS REAL ) / 100 price
FROM order_rows o
INNER JOIN book_rows b ON o.rn = b.rn
ORDER BY RANDOM()
LIMIT 300;

INSERT INTO order_line (order_id, book_id, price)
WITH book_rows AS (
	SELECT
		book_id,
		ROW_NUMBER() OVER (ORDER BY RANDOM()) AS rn
	FROM book
), order_rows AS (
	SELECT
		order_id,
   	ROW_NUMBER() OVER (ORDER BY RANDOM()) AS rn
	FROM cust_order
)
SELECT 
	o.order_id,
	b.book_id,
	CAST( ABS(RANDOM()) % 2000 AS REAL ) / 100 price
FROM order_rows o
INNER JOIN book_rows b ON o.rn = b.rn
ORDER BY RANDOM()
LIMIT 50;