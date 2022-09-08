--After Delete

INSERT INTO sales_order (order_id, customer_id, order_date, order_source) 
VALUES (8, 2, SYSDATE, 'Phone');

SELECT * FROM sales_order;

CREATE OR REPLACE TRIGGER so_after_delete
AFTER DELETE ON sales_order
FOR EACH ROW
BEGIN
    INSERT INTO sales_order_copy (order_id, customer_id, order_date, order_source)
    VALUES (:old.order_id, :old.customer_id, :old.order_date, :old.order_source);
END;

DELETE FROM sales_order WHERE order_id = 8;

SELECT * FROM sales_order;
SELECT * FROM sales_order_copy;