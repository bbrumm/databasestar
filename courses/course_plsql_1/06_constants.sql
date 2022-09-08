/*
Lesson 06
*/

BEGIN
  DBMS_OUTPUT.PUT_LINE(2 * 3.14 * 5);
END;



DECLARE
  radius NUMBER(10) := 5;
BEGIN
  DBMS_OUTPUT.PUT_LINE(2 * 3.14 * radius);
END;


DECLARE
  radius NUMBER(10) := 5;
  circumference NUMBER(14, 4);
BEGIN
  circumference := 2 * 3.14 * radius;
  DBMS_OUTPUT.PUT_LINE(circumference);
END;



DECLARE
  radius NUMBER(10) := 5;
  circumference NUMBER(14, 4);
  pi NUMBER(5, 2 := 3.14
BEGIN
  circumference := 2 * pi * radius;
  DBMS_OUTPUT.PUT_LINE(circumference);
END;



DECLARE
  radius NUMBER(10) := 5;
  circumference NUMBER(14, 4);
  pi NUMBER(5, 2 := 3.14
BEGIN
  pi := 10;
  circumference := 2 * pi * radius;
  DBMS_OUTPUT.PUT_LINE(circumference);
END;


DECLARE
  radius NUMBER(10) := 5;
  circumference NUMBER(14, 4);
  pi CONSTANT NUMBER(5, 2 := 3.14
BEGIN
  pi := 10;
  circumference := 2 * pi * radius;
  DBMS_OUTPUT.PUT_LINE(circumference);
END;




DECLARE
  radius NUMBER(10) := 5;
  circumference NUMBER(14, 4);
  pi CONSTANT NUMBER(5, 2 := 3.14
BEGIN
  circumference := 2 * pi * radius;
  DBMS_OUTPUT.PUT_LINE(circumference);
END;