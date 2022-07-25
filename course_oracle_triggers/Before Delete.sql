--Before Delete

CREATE OR REPLACE TRIGGER so_before_delete
BEFORE DELETE ON sales_order
DECLARE
  rowcount PLS_INTEGER;
  table_empty EXCEPTION;
  PRAGMA EXCEPTION_INIT (table_empty, -4090);
BEGIN
    SELECT COUNT(*)
    INTO rowcount
    FROM sales_order;

    IF (rowcount = 0) THEN
      RAISE table_empty;
    END IF;

  EXCEPTION
  WHEN table_empty THEN
    Raise_application_error(-20324,
    	'Sales_Order table cannot be empty.');
END;

DELETE FROM sales_order;

SELECT * FROM sales_order;