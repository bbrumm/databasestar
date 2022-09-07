TRUNCATE TABLE cust_order;

/* Add 2500 orders*/
INSERT INTO cust_order (order_id, order_date, customer_id, shipping_method_id, dest_address_id)
SELECT
SEQ_CUSTORDER.nextval,
order_date,
customer_id,
shipping_method_id,
address_id
FROM (
    SELECT
    SYSDATE - (DBMS_RANDOM.VALUE() * 365 * 3) AS order_date,
    c.customer_id,
    FLOOR(DBMS_RANDOM.VALUE(1, 4)) AS shipping_method_id,
    ca.address_id
    FROM customer c
    INNER JOIN customer_address ca ON c.customer_id = ca.customer_id
    ORDER BY DBMS_RANDOM.VALUE()
    FETCH NEXT 2500 ROWS ONLY
);


/*Add more orders*/


INSERT INTO cust_order (order_id, order_date, customer_id, shipping_method_id, dest_address_id)
SELECT
SEQ_CUSTORDER.nextval,
order_date,
customer_id,
shipping_method_id,
address_id
FROM (
    SELECT
    SYSDATE - (DBMS_RANDOM.VALUE() * 365 * 3) AS order_date,
    c.customer_id,
    FLOOR(DBMS_RANDOM.VALUE(1, 4)) AS shipping_method_id,
    ca.address_id
    FROM customer c
    INNER JOIN customer_address ca ON c.customer_id = ca.customer_id
    ORDER BY DBMS_RANDOM.VALUE()
    FETCH NEXT 1500 ROWS ONLY
);

INSERT INTO cust_order (order_id, order_date, customer_id, shipping_method_id, dest_address_id)
SELECT
SEQ_CUSTORDER.nextval,
order_date,
customer_id,
shipping_method_id,
address_id
FROM (
    SELECT
    SYSDATE - (DBMS_RANDOM.VALUE() * 365 * 3) AS order_date,
    c.customer_id,
    FLOOR(DBMS_RANDOM.VALUE(1, 4)) AS shipping_method_id,
    ca.address_id
    FROM customer c
    INNER JOIN customer_address ca ON c.customer_id = ca.customer_id
    ORDER BY DBMS_RANDOM.VALUE()
    FETCH NEXT 1200 ROWS ONLY
);

INSERT INTO cust_order (order_id, order_date, customer_id, shipping_method_id, dest_address_id)
SELECT
SEQ_CUSTORDER.nextval,
order_date,
customer_id,
shipping_method_id,
address_id
FROM (
    SELECT
    SYSDATE - (DBMS_RANDOM.VALUE() * 365 * 3) AS order_date,
    c.customer_id,
    FLOOR(DBMS_RANDOM.VALUE(1, 4)) AS shipping_method_id,
    ca.address_id
    FROM customer c
    INNER JOIN customer_address ca ON c.customer_id = ca.customer_id
    ORDER BY DBMS_RANDOM.VALUE()
    FETCH NEXT 900 ROWS ONLY
);

INSERT INTO cust_order (order_id, order_date, customer_id, shipping_method_id, dest_address_id)
SELECT
SEQ_CUSTORDER.nextval,
order_date,
customer_id,
shipping_method_id,
address_id
FROM (
    SELECT
    SYSDATE - (DBMS_RANDOM.VALUE() * 365 * 3) AS order_date,
    c.customer_id,
    FLOOR(DBMS_RANDOM.VALUE(1, 4)) AS shipping_method_id,
    ca.address_id
    FROM customer c
    INNER JOIN customer_address ca ON c.customer_id = ca.customer_id
    ORDER BY DBMS_RANDOM.VALUE()
    FETCH NEXT 600 ROWS ONLY
);

INSERT INTO cust_order (order_id, order_date, customer_id, shipping_method_id, dest_address_id)
SELECT
SEQ_CUSTORDER.nextval,
order_date,
customer_id,
shipping_method_id,
address_id
FROM (
    SELECT
    SYSDATE - (DBMS_RANDOM.VALUE() * 365 * 3) AS order_date,
    c.customer_id,
    FLOOR(DBMS_RANDOM.VALUE(1, 4)) AS shipping_method_id,
    ca.address_id
    FROM customer c
    INNER JOIN customer_address ca ON c.customer_id = ca.customer_id
    ORDER BY DBMS_RANDOM.VALUE()
    FETCH NEXT 400 ROWS ONLY
);

INSERT INTO cust_order (order_id, order_date, customer_id, shipping_method_id, dest_address_id)
SELECT
SEQ_CUSTORDER.nextval,
order_date,
customer_id,
shipping_method_id,
address_id
FROM (
    SELECT
    SYSDATE - (DBMS_RANDOM.VALUE() * 365 * 3) AS order_date,
    c.customer_id,
    FLOOR(DBMS_RANDOM.VALUE(1, 4)) AS shipping_method_id,
    ca.address_id
    FROM customer c
    INNER JOIN customer_address ca ON c.customer_id = ca.customer_id
    ORDER BY DBMS_RANDOM.VALUE()
    FETCH NEXT 300 ROWS ONLY
);

INSERT INTO cust_order (order_id, order_date, customer_id, shipping_method_id, dest_address_id)
SELECT
SEQ_CUSTORDER.nextval,
order_date,
customer_id,
shipping_method_id,
address_id
FROM (
    SELECT
    SYSDATE - (DBMS_RANDOM.VALUE() * 365 * 3) AS order_date,
    c.customer_id,
    FLOOR(DBMS_RANDOM.VALUE(1, 4)) AS shipping_method_id,
    ca.address_id
    FROM customer c
    INNER JOIN customer_address ca ON c.customer_id = ca.customer_id
    ORDER BY DBMS_RANDOM.VALUE()
    FETCH NEXT 100 ROWS ONLY
);

INSERT INTO cust_order (order_id, order_date, customer_id, shipping_method_id, dest_address_id)
SELECT
SEQ_CUSTORDER.nextval,
order_date,
customer_id,
shipping_method_id,
address_id
FROM (
    SELECT
    SYSDATE - (DBMS_RANDOM.VALUE() * 365 * 3) AS order_date,
    c.customer_id,
    FLOOR(DBMS_RANDOM.VALUE(1, 4)) AS shipping_method_id,
    ca.address_id
    FROM customer c
    INNER JOIN customer_address ca ON c.customer_id = ca.customer_id
    ORDER BY DBMS_RANDOM.VALUE()
    FETCH NEXT 50 ROWS ONLY
);

COMMIT;
