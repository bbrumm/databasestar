--Compound Trigger
CREATE TABLE sales_order_audit (
	order_id NUMBER(10),
    customer_id NUMBER(10),
    order_date DATE,
    order_source VARCHAR2(100)
);


CREATE OR REPLACE TRIGGER so_before
FOR INSERT OR UPDATE OR DELETE ON sales_order
COMPOUND TRIGGER
BEFORE EACH ROW IS
    BEGIN
    
      IF INSERTING THEN
        :new.order_date := SYSDATE;
      END IF;
    
      IF UPDATING THEN
        INSERT INTO sales_order_audit (order_id, customer_id, order_date, order_source)
        VALUES (:new.order_id, :new.customer_id, :new.order_date, :new.order_source);
      END IF;
    
      IF DELETING THEN
        INSERT INTO sales_order_audit (order_id, customer_id, order_date, order_source)
        VALUES (:old.order_id, :old.customer_id, :old.order_date, :old.order_source);
      END IF;
    
    END BEFORE EACH ROW;
END so_before;

SELECT * FROM sales_order;
SELECT * FROM sales_order_audit;

INSERT INTO sales_order(order_id, customer_id, order_date, order_source)
VALUES (11, 21, SYSDATE, 'Online');

UPDATE sales_order
SET order_source = 'Phone'
WHERE order_id = 11;

DELETE FROM sales_order
WHERE order_id = 11;