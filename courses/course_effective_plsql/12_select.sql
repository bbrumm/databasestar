CREATE PROCEDURE HelloWorldSelect
AS
BEGIN
  SELECT 'Hello world'
  FROM dual;
END;


CREATE OR REPLACE PROCEDURE HelloWorldSelect
AS
  display_message VARCHAR2(100);
BEGIN
  SELECT 'Hello world'
  INTO display_message
  FROM dual;
END;

CALL HelloWorldSelect();


CREATE OR REPLACE PROCEDURE HelloWorldSelect
AS
  display_message VARCHAR2(100);
BEGIN
  SELECT 'Hello world'
  INTO display_message
  FROM dual;
  DBMS_OUTPUT.PUT_LINE(display_message);
END;

CALL HelloWorldSelect();