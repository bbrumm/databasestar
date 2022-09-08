CREATE OR REPLACE TRIGGER so_before_insert
BEFORE INSERT ON sales_order
FOR EACH ROW
BEGIN
    :new.order_date := SYSDATE - 7;
END;

INSERT INTO sales_order (order_id, order_source)
VALUES (7, 'Online');

SELECT * FROM sales_order;

SELECT SYSDATE, SYSDATE-7 FROM dual;

COMMIT;