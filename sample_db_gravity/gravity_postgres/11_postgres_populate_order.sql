
/* Add 2500 orders*/
INSERT INTO cust_order (order_date, customer_id, shipping_method_id, dest_address_id)
SELECT
    (NOW() - FLOOR(RANDOM() * 365 * 3 * 24 * 60 * 60) * '1 second'::interval) AS order_date,
    c.customer_id,
    FLOOR(1 + RANDOM() * 4) AS shipping_method_id,
    ca.address_id
FROM customer c
INNER JOIN customer_address ca ON c.customer_id = ca.customer_id
LIMIT 2500;

/* Add more orders*/
INSERT INTO cust_order (order_date, customer_id, shipping_method_id, dest_address_id)
SELECT
    (NOW() - FLOOR(RANDOM() * 365 * 3 * 24 * 60 * 60) * '1 second'::interval) AS order_date,
    c.customer_id,
    FLOOR(1 + RANDOM() * 4) AS shipping_method_id,
    ca.address_id
FROM customer c
INNER JOIN customer_address ca ON c.customer_id = ca.customer_id
LIMIT 1500;

INSERT INTO cust_order (order_date, customer_id, shipping_method_id, dest_address_id)
SELECT
    (NOW() - FLOOR(RANDOM() * 365 * 3 * 24 * 60 * 60) * '1 second'::interval) AS order_date,
    c.customer_id,
    FLOOR(1 + RANDOM() * 4) AS shipping_method_id,
    ca.address_id
FROM customer c
INNER JOIN customer_address ca ON c.customer_id = ca.customer_id
LIMIT 1200;

INSERT INTO cust_order (order_date, customer_id, shipping_method_id, dest_address_id)
SELECT
    (NOW() - FLOOR(RANDOM() * 365 * 3 * 24 * 60 * 60) * '1 second'::interval) AS order_date,
    c.customer_id,
    FLOOR(1 + RANDOM() * 4) AS shipping_method_id,
    ca.address_id
FROM customer c
INNER JOIN customer_address ca ON c.customer_id = ca.customer_id
LIMIT 900;

INSERT INTO cust_order (order_date, customer_id, shipping_method_id, dest_address_id)
SELECT
    (NOW() - FLOOR(RANDOM() * 365 * 3 * 24 * 60 * 60) * '1 second'::interval) AS order_date,
    c.customer_id,
    FLOOR(1 + RANDOM() * 4) AS shipping_method_id,
    ca.address_id
FROM customer c
INNER JOIN customer_address ca ON c.customer_id = ca.customer_id
LIMIT 600;

INSERT INTO cust_order (order_date, customer_id, shipping_method_id, dest_address_id)
SELECT
    (NOW() - FLOOR(RANDOM() * 365 * 3 * 24 * 60 * 60) * '1 second'::interval) AS order_date,
    c.customer_id,
    FLOOR(1 + RANDOM() * 4) AS shipping_method_id,
    ca.address_id
FROM customer c
INNER JOIN customer_address ca ON c.customer_id = ca.customer_id
LIMIT 400;

INSERT INTO cust_order (order_date, customer_id, shipping_method_id, dest_address_id)
SELECT
    (NOW() - FLOOR(RANDOM() * 365 * 3 * 24 * 60 * 60) * '1 second'::interval) AS order_date,
    c.customer_id,
    FLOOR(1 + RANDOM() * 4) AS shipping_method_id,
    ca.address_id
FROM customer c
INNER JOIN customer_address ca ON c.customer_id = ca.customer_id
LIMIT 300;


INSERT INTO cust_order (order_date, customer_id, shipping_method_id, dest_address_id)
SELECT
    (NOW() - FLOOR(RANDOM() * 365 * 3 * 24 * 60 * 60) * '1 second'::interval) AS order_date,
    c.customer_id,
    FLOOR(1 + RANDOM() * 4) AS shipping_method_id,
    ca.address_id
FROM customer c
INNER JOIN customer_address ca ON c.customer_id = ca.customer_id
LIMIT 100;

INSERT INTO cust_order (order_date, customer_id, shipping_method_id, dest_address_id)
SELECT
    (NOW() - FLOOR(RANDOM() * 365 * 3 * 24 * 60 * 60) * '1 second'::interval) AS order_date,
    c.customer_id,
    FLOOR(1 + RANDOM() * 4) AS shipping_method_id,
    ca.address_id
FROM customer c
INNER JOIN customer_address ca ON c.customer_id = ca.customer_id
LIMIT 50;
