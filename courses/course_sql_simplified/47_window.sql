/*
Lesson 47
*/

--SQL 01 - Oracle
CREATE TABLE cust_order (
  order_id INTEGER,
  order_date DATE,
  product_id INTEGER,
  qty INTEGER,
  CONSTRAINT pk_custorder
    PRIMARY KEY (order_id),
  CONSTRAINT fk_custorder_product
    FOREIGN KEY (product_id)
    REFERENCES product (product_id)
);

--SQL 02 - Oracle
INSERT INTO cust_order (order_id, order_date, product_id, qty)
VALUES (1, DATE '2024-02-01', 4, 1);
INSERT INTO cust_order (order_id, order_date, product_id, qty)
VALUES (2, DATE '2024-02-03', 3, 5);
INSERT INTO cust_order (order_id, order_date, product_id, qty)
VALUES (3, DATE '2024-02-03', 1, 2);
INSERT INTO cust_order (order_id, order_date, product_id, qty)
VALUES (4, DATE '2024-02-05', 12, 1);

--SQL 03
SELECT
order_id,
order_date,
product_id,
qty
FROM cust_order
ORDER BY order_id ASC;

--SQL 04
SELECT
order_id,
order_date,
product_id,
qty,
SUM(qty) OVER (ORDER BY order_id ASC) AS running_total
FROM cust_order
ORDER BY order_id ASC;

--SQL 05
SELECT
order_id,
order_date,
product_id,
qty,
SUM(qty) OVER (PARTITION BY order_date ORDER BY order_id ASC) AS running_total
FROM cust_order
ORDER BY order_id ASC;

--SQL 06
SELECT
order_id,
order_date,
product_id,
qty,
SUM(qty) OVER (PARTITION BY order_date) AS running_total
FROM cust_order
ORDER BY order_id ASC;

--SQL 07 - SQL Server, MySQL, Postgres
CREATE TABLE cust_order (
  order_id INT,
  order_date DATE,
  product_id INT,
  qty INT,
  CONSTRAINT pk_custorder
    PRIMARY KEY (order_id),
  CONSTRAINT fk_custorder_product
    FOREIGN KEY (product_id)
    REFERENCES product (product_id)
);

--SQL 08 - SQL Server, MySQL, Postgres
INSERT INTO cust_order (order_id, order_date, product_id, qty)
VALUES (1, '2024-02-01', 4, 1);
INSERT INTO cust_order (order_id, order_date, product_id, qty)
VALUES (2, '2024-02-03', 3, 5);
INSERT INTO cust_order (order_id, order_date, product_id, qty)
VALUES (3, '2024-02-03', 1, 2);
INSERT INTO cust_order (order_id, order_date, product_id, qty)
VALUES (4, '2024-02-05', 12, 1);