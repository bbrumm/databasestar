/*
SQL 01
Original table
*/

CREATE TABLE cust_order (
 order_id INT PRIMARY KEY,
 customer_id INT,
 order_status VARCHAR(50)
);

/*
SQL 02
ENUM
*/
CREATE TABLE cust_order (
 order_id INT PRIMARY KEY,
 customer_id INT,
 order_status ENUM('Ordered', 'Processing', 'In Transit', 'Complete', 'Cancelled')
);

/*
SQL 03
*/
INSERT INTO cust_order (order_id, customer_id, order_status) VALUES
(1, 2, 'Processing');


/*
SQL 04
*/
INSERT INTO cust_order (order_id, customer_id, order_status) VALUES
(2, 2, 'Pending');

/*
SQL 05
*/

SELECT
order_id,
customer_id,
order_status
FROM cust_order;

/*
SQL 06
*/

DROP TABLE cust_order;

/*
SQL 07
*/

CREATE TABLE cust_order (
 order_id INT PRIMARY KEY,
 customer_id INT,
 order_status VARCHAR(50),
 CONSTRAINT ck_custorder_status
 CHECK (order_status IN ('Ordered', 'Processing', 'In Transit', 'Complete', 'Cancelled'))
);

/*
SQL 08
*/

CREATE TABLE order_status (
  order_status_id INT PRIMARY KEY,
  order_status_name VARCHAR(50)
);

/*
SQL 09
*/

INSERT INTO order_status (order_status_id, order_status_name) VALUES
(1, 'Ordered'),
(2, 'Processing'),
(3, 'In Transit'), 
(4, 'Complete'),
(5, 'Cancelled');

/*
SQL 10
*/

CREATE TABLE cust_order (
 order_id INT PRIMARY KEY,
 customer_id INT,
 order_status_id INT,
 CONSTRAINT fk_co_orderstatus
 FOREIGN KEY (order_status_id)
 REFERENCES order_status (order_status_id)
);

/*
SQL 11
*/

INSERT INTO cust_order (order_id, customer_id, order_status_id) VALUES
(1, 2, 2);

/*
SQL 12
*/

INSERT INTO cust_order (order_id, customer_id, order_status_id) VALUES
(2, 2, 6);
