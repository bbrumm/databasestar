/*
Lesson 07
*/

CREATE OR REPLACE PROCEDURE multiply_nums
(num1 IN NUMBER, num2 IN NUMBER)
AS
  totalNumber NUMBER(4);
  ex_negative_result EXCEPTION;
BEGIN
  totalNumber := num1 * num2;
  IF (totalNumber < 0) THEN
    RAISE ex_negative_result;
  END IF;
  DBMS_OUTPUT.PUT_LINE('Total is ' || totalNumber);
EXCEPTION
  WHEN ex_negative_result THEN
    DBMS_OUTPUT.PUT_LINE('The result of the calculation is negative');
  WHEN VALUE_ERROR THEN
    DBMS_OUTPUT.PUT_LINE('The two values multiplied are too large');
END;



CALL multiply_nums(230, 49);

CALL multiply_nums(-10, 5);