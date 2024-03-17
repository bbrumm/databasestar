/*
Queries for Video 130
*/

--SQL 1
SELECT
cust_order.order_id,
cust_order.order_date,
customer.customer_id,
customer.first_name,
customer.email
FROM cust_order, customer
WHERE cust_order.customer_id = customer.customer_id;

--SQL 2
SELECT *
FROM customer;

SELECT *
FROM cust_order;

--SQL 3
SELECT cust_order.order_id,
cust_order.order_date,
customer.customer_id,
customer.first_name,
customer.email
FROM cust_order, customer
WHERE cust_order.customer_id = customer.customer_id;

--SQL 4
SELECT
cust_order.order_id,
cust_order.order_date,
book.title,
book.isbn13,
book_language.language_name,
publisher.publisher_name,
order_line.price
FROM cust_order, order_line, book, publisher, book_language
WHERE cust_order.order_id = order_line.order_id
AND order_line.book_id = book.book_id
AND publisher.publisher_id = book.publisher_id
AND cust_order.order_date >= '20200101';

--SQL 5
SELECT
cust_order.order_id,
cust_order.order_date,
book.title,
book.isbn13
book_language.language_name
publisher.publisher_name
order_line.price
FROM cust_order
INNER JOIN order_line ON cust_order.order_id = order_line.order_id
INNER JOIN book ON order_line.book_id = book.book_id
INNER JOIN publisher ON publisher.publisher_id = book.publisher_id
INNER JOIN book_language ON book.language_id = book_language.language_id
WHERE cust_order.order_date >= '20200101';