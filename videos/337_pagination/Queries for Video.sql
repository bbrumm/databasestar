EXPLAIN PLAN FOR
SELECT order_id, customer_id, order_date, order_total
FROM (
  SELECT a.*, ROWNUM rn
  FROM (
    SELECT order_id, customer_id, order_date, order_total
    FROM orders
    ORDER BY order_id
  ) a
  WHERE ROWNUM <= 500
)
WHERE rn > 490;



SELECT order_id, customer_id, order_date, order_total
FROM orders
ORDER BY order_id
OFFSET 490 ROWS FETCH NEXT 10 ROWS ONLY;


SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY());


SELECT order_id, customer_id, order_date, order_total
FROM orders
ORDER BY order_id
FETCH FIRST 10 ROWS ONLY;

EXPLAIN PLAN FOR
SELECT order_id, customer_id, order_date, order_total
FROM orders
WHERE order_id > 2345
ORDER BY order_id
FETCH FIRST 10 ROWS ONLY;