/*
CASE vs DECODE
*/


SELECT *
FROM customer_order;

/*
1 Simple - check status
*/
SELECT
co.order_id,
co.order_date,
co.payment_period,
co.order_value,
co.order_status,
DECODE(co.order_status, 
    'C', 'Complete', 'P', 'Pending', 'S', 'Shipped') AS order_status_dec,
CASE co.order_status
    WHEN 'C' THEN 'Complete'
    WHEN 'P' THEN 'Pending'
    WHEN 'S' THEN 'Shipped'
END AS order_status_case
FROM customer_order co;


/*
2 Simple: check if order is overdue
*/
SELECT
co.order_id,
co.order_date,
co.payment_period,
co.order_date + payment_period AS payment_due_date,
CASE
    WHEN co.order_date + payment_period < SYSDATE THEN 'Order is overdue'
    ELSE 'Order is not yet due'
END AS order_overdue_case,
ROUND(co.order_date + payment_period - SYSDATE,2) AS days_diff,
DECODE(
    SIGN(co.order_date + payment_period - SYSDATE), 
    -1, 'Order is overdue', 
    'Order is not overdue'
) AS order_overdue_dec
FROM customer_order co;


/*
3 Complex - same logic but include order status
*/

SELECT
co.order_id,
co.order_date,
co.payment_period,
co.order_date + payment_period AS payment_due_date,
co.order_status,
CASE
    WHEN co.order_date + payment_period < SYSDATE 
        AND co.order_status = 'S' THEN 'Payment is overdue'
    WHEN co.order_date + payment_period < SYSDATE 
        AND co.order_status = 'P' THEN 'Shipment is very overdue'
    WHEN co.order_status = 'C' THEN 'Order complete'
    ELSE 'Order in progress'
END AS order_info_case,
DECODE(
    SIGN(co.order_date + payment_period - SYSDATE), 
    -1, DECODE(co.order_status, 
        'S', 'Payment is overdue', 
        'P', 'Shipment is very overdue', 
        'Order in progress'),
    DECODE(co.order_status, 
        'C', 'Order complete', 
        'Order in progress')
) AS order_info_dec
FROM customer_order co;


