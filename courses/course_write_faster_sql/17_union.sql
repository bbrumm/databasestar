/*
Authors and customer names
*/
SELECT first_name || ' ' || last_name AS fullname
FROM customer
UNION
SELECT author_name
FROM author;




SELECT
'Books' AS rectype,
TO_CHAR(publication_date, 'YYYY-MM-DD') AS event_date,
COUNT(*)
FROM book
GROUP BY TO_CHAR(publication_date, 'YYYY-MM-DD')
UNION ALL
SELECT
'Order',
TO_CHAR(order_date, 'YYYY-MM-DD'),
COUNT(*)
FROM cust_order
GROUP BY TO_CHAR(order_date, 'YYYY-MM-DD');



SELECT TO_CHAR(order_date, 'YYYY-MM-DD')
FROM cust_order
WHERE order_id = 473
UNION 
SELECT TO_CHAR(status_date, 'YYYY-MM-DD')
FROM order_history
WHERE order_id = 473;

SELECT TO_CHAR(order_date, 'YYYY-MM-DD')
FROM cust_order
WHERE order_id = 473
UNION ALL
SELECT TO_CHAR(status_date, 'YYYY-MM-DD')
FROM order_history
WHERE order_id = 473;

SELECT * FROM cust_order;
SELECT order_id, count(*) FROM order_history group by order_id order by count(*) desc;

