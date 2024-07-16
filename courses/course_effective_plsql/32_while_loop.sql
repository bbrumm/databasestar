CREATE OR REPLACE PROCEDURE ListHelloWhile
AS
  v_loop_counter NUMBER;
BEGIN
  v_loop_counter := 1;
  
  WHILE (v_loop_counter <= 10) LOOP
    DBMS_OUTPUT.PUT_LINE('Hello');
    v_loop_counter := v_loop_counter + 1;
  END LOOP;
END;

CALL ListHelloWhile();