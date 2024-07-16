CREATE OR REPLACE PROCEDURE ListHelloBasic
AS
  v_loop_counter NUMBER;
BEGIN
  v_loop_counter := 1;
  LOOP
    DBMS_OUTPUT.PUT_LINE('Hello');
    v_loop_counter := v_loop_counter + 1;
    
    IF (v_loop_counter > 10) THEN
      EXIT;
    END IF;
  END LOOP;
END;

CALL ListHelloBasic();