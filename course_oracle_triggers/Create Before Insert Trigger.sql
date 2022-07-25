CREATE OR REPLACE TRIGGER so_before_insert
BEFORE INSERT ON sales_order
FOR EACH ROW
BEGIN
    :new.order_date := SYSDATE;
END;