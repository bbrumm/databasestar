--After Update of a Value

CREATE OR REPLACE TRIGGER so_after_update
AFTER UPDATE OF order_source ON sales_order
FOR EACH ROW
BEGIN
    INSERT INTO sales_order_copy (order_id, customer_id, order_date, order_source)
    VALUES (:old.order_id, :old.customer_id, :old.order_date, :old.order_source);
END;

SELECT * FROM sales_order;
SELECT * FROM sales_order_copy;

UPDATE sales_order
SET order_date = SYSDATE - 2
WHERE order_id = 1;

SELECT * FROM sales_order;
SELECT * FROM sales_order_copy;

UPDATE sales_order
SET order_source = 'Phone'
WHERE order_id = 1;

SELECT * FROM sales_order;
SELECT * FROM sales_order_copy;