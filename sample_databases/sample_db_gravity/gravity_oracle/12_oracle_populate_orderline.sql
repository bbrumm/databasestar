
WITH book_rows AS (
    SELECT book_id,
    ROW_NUMBER() OVER (ORDER BY DBMS_RANDOM.VALUE()) AS rn
    FROM book
),
order_rows AS (
    SELECT order_id,
    ROW_NUMBER() OVER (ORDER BY DBMS_RANDOM.VALUE()) AS rn
    FROM cust_order
)
SELECT
o.order_id,
b.book_id,
ROUND(DBMS_RANDOM.VALUE(1, 20), 2) AS price
FROM order_rows o
INNER JOIN book_rows b ON o.rn = b.rn
ORDER BY DBMS_RANDOM.VALUE()
FETCH NEXT 200 ROWS ONLY;


/*#Add a line for all orders*/
INSERT INTO order_line (line_id, order_id, book_id, price)
WITH book_rows AS (
    SELECT book_id,
    ROW_NUMBER() OVER (ORDER BY DBMS_RANDOM.VALUE()) AS rn
    FROM book
),
order_rows AS (
    SELECT order_id,
    ROW_NUMBER() OVER (ORDER BY DBMS_RANDOM.VALUE()) AS rn
    FROM cust_order
)
SELECT
SEQ_ORDERLINE.nextval,
order_id,
book_id,
price
FROM (
    SELECT
    o.order_id,
    b.book_id,
    ROUND(DBMS_RANDOM.VALUE(1, 20), 2) AS price
    FROM order_rows o
    INNER JOIN book_rows b ON o.rn = b.rn
    ORDER BY DBMS_RANDOM.VALUE()
);


/*Add a line for some orders*/

INSERT INTO order_line (line_id, order_id, book_id, price)
WITH book_rows AS (
    SELECT book_id,
    ROW_NUMBER() OVER (ORDER BY DBMS_RANDOM.VALUE()) AS rn
    FROM book
),
order_rows AS (
    SELECT order_id,
    ROW_NUMBER() OVER (ORDER BY DBMS_RANDOM.VALUE()) AS rn
    FROM cust_order
)
SELECT
SEQ_ORDERLINE.nextval,
order_id,
book_id,
price
FROM (
    SELECT
    o.order_id,
    b.book_id,
    ROUND(DBMS_RANDOM.VALUE(1, 20), 2) AS price
    FROM order_rows o
    INNER JOIN book_rows b ON o.rn = b.rn
    ORDER BY DBMS_RANDOM.VALUE()
    FETCH NEXT 4000 ROWS ONLY
);

INSERT INTO order_line (line_id, order_id, book_id, price)
WITH book_rows AS (
    SELECT book_id,
    ROW_NUMBER() OVER (ORDER BY DBMS_RANDOM.VALUE()) AS rn
    FROM book
),
order_rows AS (
    SELECT order_id,
    ROW_NUMBER() OVER (ORDER BY DBMS_RANDOM.VALUE()) AS rn
    FROM cust_order
)
SELECT
SEQ_ORDERLINE.nextval,
order_id,
book_id,
price
FROM (
    SELECT
    o.order_id,
    b.book_id,
    ROUND(DBMS_RANDOM.VALUE(1, 20), 2) AS price
    FROM order_rows o
    INNER JOIN book_rows b ON o.rn = b.rn
    ORDER BY DBMS_RANDOM.VALUE()
    FETCH NEXT 2000 ROWS ONLY
);

INSERT INTO order_line (line_id, order_id, book_id, price)
WITH book_rows AS (
    SELECT book_id,
    ROW_NUMBER() OVER (ORDER BY DBMS_RANDOM.VALUE()) AS rn
    FROM book
),
order_rows AS (
    SELECT order_id,
    ROW_NUMBER() OVER (ORDER BY DBMS_RANDOM.VALUE()) AS rn
    FROM cust_order
)
SELECT
SEQ_ORDERLINE.nextval,
order_id,
book_id,
price
FROM (
    SELECT
    o.order_id,
    b.book_id,
    ROUND(DBMS_RANDOM.VALUE(1, 20), 2) AS price
    FROM order_rows o
    INNER JOIN book_rows b ON o.rn = b.rn
    ORDER BY DBMS_RANDOM.VALUE()
    FETCH NEXT 1000 ROWS ONLY
);

INSERT INTO order_line (line_id, order_id, book_id, price)
WITH book_rows AS (
    SELECT book_id,
    ROW_NUMBER() OVER (ORDER BY DBMS_RANDOM.VALUE()) AS rn
    FROM book
),
order_rows AS (
    SELECT order_id,
    ROW_NUMBER() OVER (ORDER BY DBMS_RANDOM.VALUE()) AS rn
    FROM cust_order
)
SELECT
SEQ_ORDERLINE.nextval,
order_id,
book_id,
price
FROM (
    SELECT
    o.order_id,
    b.book_id,
    ROUND(DBMS_RANDOM.VALUE(1, 20), 2) AS price
    FROM order_rows o
    INNER JOIN book_rows b ON o.rn = b.rn
    ORDER BY DBMS_RANDOM.VALUE()
    FETCH NEXT 500 ROWS ONLY
);

INSERT INTO order_line (line_id, order_id, book_id, price)
WITH book_rows AS (
    SELECT book_id,
    ROW_NUMBER() OVER (ORDER BY DBMS_RANDOM.VALUE()) AS rn
    FROM book
),
order_rows AS (
    SELECT order_id,
    ROW_NUMBER() OVER (ORDER BY DBMS_RANDOM.VALUE()) AS rn
    FROM cust_order
)
SELECT
SEQ_ORDERLINE.nextval,
order_id,
book_id,
price
FROM (
    SELECT
    o.order_id,
    b.book_id,
    ROUND(DBMS_RANDOM.VALUE(1, 20), 2) AS price
    FROM order_rows o
    INNER JOIN book_rows b ON o.rn = b.rn
    ORDER BY DBMS_RANDOM.VALUE()
    FETCH NEXT 300 ROWS ONLY
);

INSERT INTO order_line (line_id, order_id, book_id, price)
WITH book_rows AS (
    SELECT book_id,
    ROW_NUMBER() OVER (ORDER BY DBMS_RANDOM.VALUE()) AS rn
    FROM book
),
order_rows AS (
    SELECT order_id,
    ROW_NUMBER() OVER (ORDER BY DBMS_RANDOM.VALUE()) AS rn
    FROM cust_order
)
SELECT
SEQ_ORDERLINE.nextval,
order_id,
book_id,
price
FROM (
    SELECT
    o.order_id,
    b.book_id,
    ROUND(DBMS_RANDOM.VALUE(1, 20), 2) AS price
    FROM order_rows o
    INNER JOIN book_rows b ON o.rn = b.rn
    ORDER BY DBMS_RANDOM.VALUE()
    FETCH NEXT 50 ROWS ONLY
);

COMMIT;
