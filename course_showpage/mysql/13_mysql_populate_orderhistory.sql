

/* Add order received for all orders older than 12 hours
#Total 7547 orders*/
INSERT INTO order_history (order_id, status_id, status_date)
SELECT
o.order_id,
1 AS status_id,
o.order_date + INTERVAL FLOOR(RAND() * 60 * 60 * 12) SECOND AS status_date
FROM cust_order o
WHERE o.order_date < NOW() - INTERVAL 12 HOUR;

/*#Add Pending Delivery for most of these orders, within 2 days after the previous step, where orders are older than 2 days
6800 records*/
INSERT INTO order_history (order_id, status_id, status_date)
SELECT
o.order_id,
2 AS status_id,
o.status_date + INTERVAL FLOOR(RAND() * 60 * 60 * 24 * 2) SECOND
FROM order_history o
WHERE o.status_date < NOW() - INTERVAL 2 DAY
ORDER BY RAND()
LIMIT 6800;

/* Add Delivery In Progress for orders that have a status of 2 and at least a few days in the past */
INSERT INTO order_history (order_id, status_id, status_date)
SELECT
o.order_id,
3 AS status_id,
o.status_date + INTERVAL FLOOR(RAND() * 60 * 60 * 24 * 2) SECOND AS new_date
FROM order_history o
WHERE o.status_date < NOW() - INTERVAL 2 DAY
AND o.status_id = 2
ORDER BY RAND()
LIMIT 4000;

/* Add Delivered for orders that have a status of 2 and at least a few days in the past */
INSERT INTO order_history (order_id, status_id, status_date)
SELECT
o.order_id,
4 AS status_id,
o.status_date + INTERVAL FLOOR(RAND() * 60 * 60 * 24 * 6) SECOND AS new_date
FROM order_history o
WHERE o.status_date < NOW() - INTERVAL 6 DAY
AND o.status_id = 3
ORDER BY RAND()
LIMIT 3500;

/* Add some Cancelled orders */
INSERT INTO order_history (order_id, status_id, status_date)
SELECT
o.order_id,
5 AS status_id,
o.status_date + INTERVAL FLOOR(RAND() * 60 * 60 * 24) SECOND AS new_date
FROM order_history o
WHERE o.status_id = 1
AND NOT EXISTS (
    SELECT 1
    FROM order_history oh
    WHERE oh.order_id = o.order_id
    AND oh.status_id = 2
)
ORDER BY RAND()
LIMIT 300;

/* Add some Returned orders*/
INSERT INTO order_history (order_id, status_id, status_date)
SELECT
o.order_id,
6 AS status_id,
o.status_date + INTERVAL FLOOR(RAND() * 60 * 60 * 24 * 7) SECOND AS new_date
FROM order_history o
WHERE o.status_id = 1
AND EXISTS (
    SELECT 1
    FROM order_history oh
    WHERE oh.order_id = o.order_id
    AND oh.status_id = 4
)
AND o.status_date < NOW() - INTERVAL 7 DAY
ORDER BY RAND()
LIMIT 200;
