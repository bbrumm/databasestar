
TRUNCATE TABLE order_history;

/*#Add order received for all orders older than 12 hours
#Total 7547 orders*/
INSERT INTO order_history (history_id, order_id, status_id, status_date)
SELECT
SEQ_ORDERHIST.nextval,
o.order_id,
1 AS status_id,
o.order_date + (DBMS_RANDOM.VALUE() / 24 * 12) AS status_date
FROM cust_order o
WHERE o.order_date < SYSDATE - (12 / 24);

/*#Add Pending Delivery for most of these orders, within 2 days after the previous step, where orders are older than 2 days
6800 records*/
INSERT INTO order_history (history_id, order_id, status_id, status_date)
SELECT
SEQ_ORDERHIST.nextval,
order_id,
status_id,
status_date
FROM (
    SELECT
    o.order_id,
    2 AS status_id,
    o.order_date + (DBMS_RANDOM.VALUE() * 2) AS status_date
    FROM cust_order o
    WHERE o.order_date < SYSDATE - 2
    ORDER BY DBMS_RANDOM.VALUE()
    FETCH NEXT 6800 ROWS ONLY
);



/* Add Delivery In Progress for orders that have a status of 2 and at least a few days in the past*/
INSERT INTO order_history (history_id, order_id, status_id, status_date)
SELECT
SEQ_ORDERHIST.nextval,
order_id,
status_id,
status_date
FROM (
    SELECT
    o.order_id,
    3 AS status_id,
    o.status_date + (DBMS_RANDOM.VALUE() * 2) AS status_date
    FROM order_history o
    WHERE o.status_date < SYSDATE - 2
    ORDER BY DBMS_RANDOM.VALUE()
    FETCH NEXT 4000 ROWS ONLY
);



/* Add Delivered for orders that have a status of 2 and at least a few days in the past*/
INSERT INTO order_history (history_id, order_id, status_id, status_date)
SELECT
SEQ_ORDERHIST.nextval,
order_id,
status_id,
status_date
FROM (
    SELECT
    o.order_id,
    4 AS status_id,
    o.status_date + (DBMS_RANDOM.VALUE() * 6) AS status_date
    FROM order_history o
    WHERE o.status_date < SYSDATE - 6
    ORDER BY DBMS_RANDOM.VALUE()
    FETCH NEXT 3500 ROWS ONLY
);


/*#Add some Cancelled orders*/
INSERT INTO order_history (history_id, order_id, status_id, status_date)
SELECT
SEQ_ORDERHIST.nextval,
order_id,
status_id,
status_date
FROM (
    SELECT
    o.order_id,
    5 AS status_id,
    o.status_date + (DBMS_RANDOM.VALUE() * 6) AS status_date
    FROM order_history o
    WHERE o.status_id = 1
    AND NOT EXISTS (
        SELECT 1
        FROM order_history oh
        WHERE oh.order_id = o.order_id
        AND oh.status_id = 2
    )
    ORDER BY DBMS_RANDOM.VALUE()
    FETCH NEXT 300 ROWS ONLY
);



/*#Add some Returned orders*/
INSERT INTO order_history (history_id, order_id, status_id, status_date)
SELECT
SEQ_ORDERHIST.nextval,
order_id,
status_id,
status_date
FROM (
    SELECT
    o.order_id,
    6 AS status_id,
    o.status_date + (DBMS_RANDOM.VALUE() * 7) AS status_date
    FROM order_history o
    WHERE o.status_date < SYSDATE - 7
    AND NOT EXISTS (
        SELECT 1
        FROM order_history oh
        WHERE oh.order_id = o.order_id
        AND oh.status_id = 4
    )
    ORDER BY DBMS_RANDOM.VALUE()
    FETCH NEXT 200 ROWS ONLY
);


COMMIT;
