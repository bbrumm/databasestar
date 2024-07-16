CREATE OR REPLACE PROCEDURE ListHelloFor
AS
  v_loop_counter NUMBER;
BEGIN
  FOR v_loop_counter IN 1 .. 10 LOOP
    DBMS_OUTPUT.PUT_LINE('Hello');
  END LOOP;
END;

CALL ListHelloFor();