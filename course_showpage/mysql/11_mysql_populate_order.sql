

/* Find random data for order */
/*
SELECT
    0 AS order_id,
    NOW() AS order_date,
    c.customer_id,
    FLOOR(1 + RAND() * 4) AS shipping_method_id,
    ca.address_id,
    NOW() - INTERVAL FLOOR(RAND() * 365 * 3 * 24 * 60 * 60) SECOND AS random_date
FROM customer c
INNER JOIN customer_address ca ON c.customer_id = ca.customer_id
LIMIT 2500;
*/
DELETE FROM cust_order;


/* Add 2500 orders */
INSERT INTO cust_order (order_date, customer_id, shipping_method_id, dest_address_id)
SELECT
    NOW() - INTERVAL FLOOR(RAND() * 365 * 3 * 24 * 60 * 60) SECOND AS order_date,
    c.customer_id,
    FLOOR(1 + RAND() * 4) AS shipping_method_id,
    ca.address_id
FROM customer c
INNER JOIN customer_address ca ON c.customer_id = ca.customer_id
LIMIT 2500;

/* Add more orders */
INSERT INTO cust_order (order_date, customer_id, shipping_method_id, dest_address_id)
SELECT
    NOW() - INTERVAL FLOOR(RAND() * 365 * 3 * 24 * 60 * 60) SECOND AS order_date,
    c.customer_id,
    FLOOR(1 + RAND() * 4) AS shipping_method_id,
    ca.address_id
FROM customer c
INNER JOIN customer_address ca ON c.customer_id = ca.customer_id
LIMIT 1500;

INSERT INTO cust_order (order_date, customer_id, shipping_method_id, dest_address_id)
SELECT
    NOW() - INTERVAL FLOOR(RAND() * 365 * 3 * 24 * 60 * 60) SECOND AS order_date,
    c.customer_id,
    FLOOR(1 + RAND() * 4) AS shipping_method_id,
    ca.address_id
FROM customer c
INNER JOIN customer_address ca ON c.customer_id = ca.customer_id
LIMIT 1200;

INSERT INTO cust_order (order_date, customer_id, shipping_method_id, dest_address_id)
SELECT
    NOW() - INTERVAL FLOOR(RAND() * 365 * 3 * 24 * 60 * 60) SECOND AS order_date,
    c.customer_id,
    FLOOR(1 + RAND() * 4) AS shipping_method_id,
    ca.address_id
FROM customer c
INNER JOIN customer_address ca ON c.customer_id = ca.customer_id
LIMIT 900;

INSERT INTO cust_order (order_date, customer_id, shipping_method_id, dest_address_id)
SELECT
    NOW() - INTERVAL FLOOR(RAND() * 365 * 3 * 24 * 60 * 60) SECOND AS order_date,
    c.customer_id,
    FLOOR(1 + RAND() * 4) AS shipping_method_id,
    ca.address_id
FROM customer c
INNER JOIN customer_address ca ON c.customer_id = ca.customer_id
LIMIT 600;

INSERT INTO cust_order (order_date, customer_id, shipping_method_id, dest_address_id)
SELECT
    NOW() - INTERVAL FLOOR(RAND() * 365 * 3 * 24 * 60 * 60) SECOND AS order_date,
    c.customer_id,
    FLOOR(1 + RAND() * 4) AS shipping_method_id,
    ca.address_id
FROM customer c
INNER JOIN customer_address ca ON c.customer_id = ca.customer_id
LIMIT 400;

INSERT INTO cust_order (order_date, customer_id, shipping_method_id, dest_address_id)
SELECT
    NOW() - INTERVAL FLOOR(RAND() * 365 * 3 * 24 * 60 * 60) SECOND AS order_date,
    c.customer_id,
    FLOOR(1 + RAND() * 4) AS shipping_method_id,
    ca.address_id
FROM customer c
INNER JOIN customer_address ca ON c.customer_id = ca.customer_id
LIMIT 300;


INSERT INTO cust_order (order_date, customer_id, shipping_method_id, dest_address_id)
SELECT
    NOW() - INTERVAL FLOOR(RAND() * 365 * 3 * 24 * 60 * 60) SECOND AS order_date,
    c.customer_id,
    FLOOR(1 + RAND() * 4) AS shipping_method_id,
    ca.address_id
FROM customer c
INNER JOIN customer_address ca ON c.customer_id = ca.customer_id
LIMIT 100;

INSERT INTO cust_order (order_date, customer_id, shipping_method_id, dest_address_id)
SELECT
    NOW() - INTERVAL FLOOR(RAND() * 365 * 3 * 24 * 60 * 60) SECOND AS order_date,
    c.customer_id,
    FLOOR(1 + RAND() * 4) AS shipping_method_id,
    ca.address_id
FROM customer c
INNER JOIN customer_address ca ON c.customer_id = ca.customer_id
LIMIT 50;
