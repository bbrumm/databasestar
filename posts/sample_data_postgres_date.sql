/*
Sample data and queries for the Postgres Date Format post
*/

CREATE TABLE cust_order (
  order_id INT,
  order_date DATE
);



INSERT INTO cust_order (order_id, order_date) VALUES (1, '2022-10-13');
INSERT INTO cust_order (order_id, order_date) VALUES (2, '14-OCT-2022');
INSERT INTO cust_order (order_id, order_date) VALUES (3, '20221015');
INSERT INTO cust_order (order_id, order_date) VALUES (4, '16-10-2022');


SELECT order_id, order_date
FROM cust_order;

/*
Examples
*/

SELECT
order_date, 
TO_CHAR(order_date, 'DD/MM/YYYY') AS formatted_date
FROM cust_order;


SELECT
order_date, 
TO_CHAR(order_date, 'Day, DD Month, YYYY') AS formatted_date
FROM cust_order;

SELECT
order_date, 
TO_CHAR(order_date, 'MM') AS month_num,
TO_CHAR(order_date, 'DDD') AS day_of_year,
TO_CHAR(order_date, 'ID') AS day_of_week,
TO_CHAR(order_date, 'WW') AS week_of_year,
TO_CHAR(order_date, 'J') AS julian_date
FROM cust_order;


SELECT
NOW(),
NOW()::DATE,
DATE(NOW());