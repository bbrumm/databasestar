
WITH book_rows AS (
    SELECT book_id,
    ROW_NUMBER() OVER (ORDER BY NEWID()) AS rn
    FROM dbo.book
),
order_rows AS (
    SELECT order_id,
    ROW_NUMBER() OVER (ORDER BY NEWID()) AS rn
    FROM dbo.cust_order
)
SELECT top 200
o.order_id,
b.book_id,
(ABS(CHECKSUM(NEWID())) % 2000) / CAST(100 AS DECIMAL (8, 2)) AS price
FROM order_rows o
INNER JOIN book_rows b ON o.rn = b.rn
ORDER BY NEWID();


/*#Add a line for all orders*/
WITH book_rows AS (
    SELECT book_id,
    ROW_NUMBER() OVER (ORDER BY NEWID()) AS rn
    FROM dbo.book
),
order_rows AS (
    SELECT order_id,
    ROW_NUMBER() OVER (ORDER BY NEWID()) AS rn
    FROM dbo.cust_order
)
INSERT INTO dbo.order_line (order_id, book_id, price)
SELECT
o.order_id,
b.book_id,
(ABS(CHECKSUM(NEWID())) % 2000) / CAST(100 AS DECIMAL (8, 2)) AS price
FROM order_rows o
INNER JOIN book_rows b ON o.rn = b.rn;



/*#Add a line for some orders*/
WITH book_rows AS (
    SELECT book_id,
    ROW_NUMBER() OVER (ORDER BY NEWID()) AS rn
    FROM dbo.book
),
order_rows AS (
    SELECT order_id,
    ROW_NUMBER() OVER (ORDER BY NEWID()) AS rn
    FROM dbo.cust_order
)
INSERT INTO dbo.order_line (order_id, book_id, price)
SELECT TOP 4000
o.order_id,
b.book_id,
(ABS(CHECKSUM(NEWID())) % 2000) / CAST(100 AS DECIMAL (8, 2)) AS price
FROM order_rows o
INNER JOIN book_rows b ON o.rn = b.rn
ORDER BY NEWID();

/*
 2000
 1000
 300
 500
 50

 */

WITH book_rows AS (
    SELECT book_id,
    ROW_NUMBER() OVER (ORDER BY NEWID()) AS rn
    FROM dbo.book
),
order_rows AS (
    SELECT order_id,
    ROW_NUMBER() OVER (ORDER BY NEWID()) AS rn
    FROM dbo.cust_order
)
INSERT INTO dbo.order_line (order_id, book_id, price)
SELECT TOP 2000
o.order_id,
b.book_id,
(ABS(CHECKSUM(NEWID())) % 2000) / CAST(100 AS DECIMAL (8, 2)) AS price
FROM order_rows o
INNER JOIN book_rows b ON o.rn = b.rn
ORDER BY NEWID();

WITH book_rows AS (
    SELECT book_id,
    ROW_NUMBER() OVER (ORDER BY NEWID()) AS rn
    FROM dbo.book
),
order_rows AS (
    SELECT order_id,
    ROW_NUMBER() OVER (ORDER BY NEWID()) AS rn
    FROM dbo.cust_order
)
INSERT INTO dbo.order_line (order_id, book_id, price)
SELECT TOP 1000
o.order_id,
b.book_id,
(ABS(CHECKSUM(NEWID())) % 2000) / CAST(100 AS DECIMAL (8, 2)) AS price
FROM order_rows o
INNER JOIN book_rows b ON o.rn = b.rn
ORDER BY NEWID();

WITH book_rows AS (
    SELECT book_id,
    ROW_NUMBER() OVER (ORDER BY NEWID()) AS rn
    FROM dbo.book
),
order_rows AS (
    SELECT order_id,
    ROW_NUMBER() OVER (ORDER BY NEWID()) AS rn
    FROM dbo.cust_order
)
INSERT INTO dbo.order_line (order_id, book_id, price)
SELECT TOP 300
o.order_id,
b.book_id,
(ABS(CHECKSUM(NEWID())) % 2000) / CAST(100 AS DECIMAL (8, 2)) AS price
FROM order_rows o
INNER JOIN book_rows b ON o.rn = b.rn
ORDER BY NEWID();

WITH book_rows AS (
    SELECT book_id,
    ROW_NUMBER() OVER (ORDER BY NEWID()) AS rn
    FROM dbo.book
),
order_rows AS (
    SELECT order_id,
    ROW_NUMBER() OVER (ORDER BY NEWID()) AS rn
    FROM dbo.cust_order
)
INSERT INTO dbo.order_line (order_id, book_id, price)
SELECT TOP 500
o.order_id,
b.book_id,
(ABS(CHECKSUM(NEWID())) % 2000) / CAST(100 AS DECIMAL (8, 2)) AS price
FROM order_rows o
INNER JOIN book_rows b ON o.rn = b.rn
ORDER BY NEWID();

WITH book_rows AS (
    SELECT book_id,
    ROW_NUMBER() OVER (ORDER BY NEWID()) AS rn
    FROM dbo.book
),
order_rows AS (
    SELECT order_id,
    ROW_NUMBER() OVER (ORDER BY NEWID()) AS rn
    FROM dbo.cust_order
)
INSERT INTO dbo.order_line (order_id, book_id, price)
SELECT TOP 50
o.order_id,
b.book_id,
(ABS(CHECKSUM(NEWID())) % 2000) / CAST(100 AS DECIMAL (8, 2)) AS price
FROM order_rows o
INNER JOIN book_rows b ON o.rn = b.rn
ORDER BY NEWID();
