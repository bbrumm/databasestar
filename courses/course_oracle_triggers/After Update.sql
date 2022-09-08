--After Update

CREATE OR REPLACE TRIGGER so_after_update
AFTER UPDATE ON sales_order
FOR EACH ROW
BEGIN
    INSERT INTO sales_order_copy (order_id, customer_id, order_date, order_source)
    VALUES (:old.order_id, :old.customer_id, :old.order_date, :old.order_source);
END;

SELECT * FROM sales_order;
SELECT * FROM sales_order_copy;

UPDATE sales_order
SET order_source = 'Online'
WHERE order_id = 5;

SELECT * FROM sales_order;
SELECT * FROM sales_order_copy;
