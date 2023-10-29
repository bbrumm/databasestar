SELECT author_name
FROM author
UNION ALL
SELECT first_name + ' ' + last_name
FROM customer;

SELECT DATE(order_date)
FROM cust_order
UNION 
SELECT DATE(status_date)
FROM order_history;