CREATE OR REPLACE PROCEDURE DivideTwoNumbers(
  v_top_number IN NUMBER,
  v_bottom_number IN NUMBER,
  v_result OUT NUMBER
)
AS
BEGIN
  v_result := v_top_number / v_bottom_number;
END;


/*
Run the proc
*/

DECLARE
  v_result NUMBER;
BEGIN
  DivideTwoNumbers(15, 5, v_result);
  DBMS_OUTPUT.PUT_LINE(v_result);
END;
