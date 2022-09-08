/*
Lesson 06
*/

CREATE OR REPLACE PROCEDURE multiply_nums
(num1 IN NUMBER, num2 IN NUMBER)
AS
  totalNumber NUMBER(4);
BEGIN
  totalNumber := num1 * num2;
  DBMS_OUTPUT.PUT_LINE('Total is ' || totalNumber);
END;


CALL multiply_nums(5, 7);

CALL multiply_nums(230, 49);


CREATE OR REPLACE PROCEDURE multiply_nums
(num1 IN NUMBER, num2 IN NUMBER)
AS
  totalNumber NUMBER(4);
BEGIN
  totalNumber := num1 * num2;
  DBMS_OUTPUT.PUT_LINE('Total is ' || totalNumber);
EXCEPTION
  WHEN VALUE_ERROR THEN
    DBMS_OUTPUT.PUT_LINE('The two values multiplied are too large');
END;
