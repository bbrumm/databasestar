/*
Lesson 05
*/

DECLARE
  message VARCHAR2(100);
  firstNumber NUMBER(4);
  secondNumber NUMBER(4);
  totalNumber NUMBER(4);
BEGIN
  message := 'The sum is ';
  firstNumber := 4;
  secondNumber := 5;
  totalNumber := firstNumber + secondNumber;
  DBMS_OUTPUT.PUT_LINE('The first number is ' || firstNumber);
  DBMS_OUTPUT.PUT_LINE('The second number is ' || secondNumber);
  DBMS_OUTPUT.PUT_LINE(message || totalNumber);
END;



DECLARE
  message VARCHAR2(100);
  firstNumber NUMBER(4);
  secondNumber NUMBER(4);
  totalNumber NUMBER(4);
BEGIN
  message := 'The sum is ';
  firstNumber := 3;
  secondNumber := 12;
  totalNumber := firstNumber + secondNumber;
  DBMS_OUTPUT.PUT_LINE('The first number is ' || firstNumber);
  DBMS_OUTPUT.PUT_LINE('The second number is ' || secondNumber);
  DBMS_OUTPUT.PUT_LINE(message || totalNumber);
END;