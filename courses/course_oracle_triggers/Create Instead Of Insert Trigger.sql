CREATE TABLE customer (
customer_id NUMBER(8),
customer_name VARCHAR2(50),
customer_type VARCHAR2(20)
);

INSERT INTO customer (customer_id, customer_name, customer_type)
VALUES (1, 'ABC Pty Ltd', 'Business');

INSERT INTO customer (customer_id, customer_name, customer_type)
VALUES (2, 'John Smith', 'Personal');

COMMIT;
TRUNCATE TABLE customer;
DROP VIEW sales_customers;

CREATE VIEW sales_customers AS
SELECT
s.order_id,
s.order_date,
s.order_source,
c.customer_id,
c.customer_name,
c.customer_type
FROM sales_order s
LEFT JOIN customer c ON s.customer_id = c.customer_id;

SELECT * FROM sales_customers;


--Instead Of Insert on a View - insert new sales_order


CREATE OR REPLACE TRIGGER so_instead_insert_saleescust
INSTEAD OF INSERT ON sales_customers
FOR EACH ROW
BEGIN
    INSERT INTO sales_order (customer_id, order_date, order_source)
    VALUES (:new.customer_id, SYSDATE, :new.order_source);
END;



INSERT INTO customer (customer_id, customer_name)
VALUES (4, 'Mary Jones');

INSERT INTO sales_customers (order_id, order_source, customer_id, customer_name)
VALUES (6, 'Online', 4, 'Mary Jones');

SELECT * FROM sales_customers;
SELECT * FROM sales_order;
