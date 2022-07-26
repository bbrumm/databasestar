/*
Lesson 02
*/

DECLARE
  radius NUMBER(10) := 5;
  circumference NUMBER(14, 4);
  pi CONSTANT NUMBER(5, 2) := 3.14;
BEGIN
  circumference := 2 * pi * radius;
  DBMS_OUTPUT.PUT_LINE(circumference);
END;



CREATE PROCEDURE hello_world AS
BEGIN
  DBMS_OUTPUT.PUT_LINE('Hello world!');
END;



CALL hello_world();

EXEC hello_world;

BEGIN
  hello_world;
END;
