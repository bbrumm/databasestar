DROP TABLE sales_order_copy;

CREATE TABLE sales_order_copy (
    order_id NUMBER(10),
    customer_id NUMBER(10),
    order_date DATE,
    order_source VARCHAR2(100)
);



CREATE OR REPLACE TRIGGER so_after_insert
AFTER INSERT ON sales_order
FOR EACH ROW
BEGIN
    INSERT INTO sales_order_copy (order_id, customer_id, order_date, order_source)
    VALUES (:new.order_id, :new.customer_id, :new.order_date, :new.order_source);
END;

SELECT * FROM sales_order;

SELECT * FROM sales_order_copy;

INSERT INTO sales_order(order_id, customer_id, order_date, order_source)
VALUES (4, 8, SYSDATE, 'In Store');