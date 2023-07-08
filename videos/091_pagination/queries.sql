SELECT 
co.order_date,
c.first_name,
c.last_name
FROM cust_order co
INNER JOIN customer c ON co.customer_id = c.customer_id
ORDER BY co.order_date ASC
OFFSET 20 ROWS FETCH NEXT 10 ROWS ONLY;


SELECT 
co.order_date,
c.first_name,
c.last_name
FROM cust_order co
INNER JOIN customer c ON co.customer_id = c.customer_id
ORDER BY co.order_date ASC
OFFSET 230 ROWS FETCH NEXT 10 ROWS ONLY;

DROP INDEX idx_co_date;
CREATE INDEX idx_co_date ON cust_order(order_date);

/*
First page
*/
SELECT 
co.order_date,
c.first_name,
c.last_name
FROM cust_order co
INNER JOIN customer c ON co.customer_id = c.customer_id
ORDER BY co.order_date ASC
OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY;

/*
Second page
*/
SELECT 
co.order_date,
c.first_name,
c.last_name
FROM cust_order co
INNER JOIN customer c ON co.customer_id = c.customer_id
ORDER BY co.order_date ASC
OFFSET 10 ROWS FETCH NEXT 10 ROWS ONLY;

/*
Add PK to order by
*/
SELECT 
co.order_date,
c.first_name,
c.last_name
FROM cust_order co
INNER JOIN customer c ON co.customer_id = c.customer_id
ORDER BY co.order_date ASC, order_id ASC
OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY;