/*
Lesson 07
*/

DECLARE
  shapeLength NUMBER(10);
  shapeWidth NUMBER(10);
BEGIN
  shapeLength := 5;
  shapeWidth := 5;

  IF shapeLength = shapeWidth) THEN
    DBMS_OUTPUT.PUT_LINE('The shape is a square.');
  END IF;
END;



DECLARE
  shapeLength NUMBER(10);
  shapeWidth NUMBER(10);
BEGIN
  shapeLength := 4;
  shapeWidth := 5;

  IF shapeLength = shapeWidth) THEN
    DBMS_OUTPUT.PUT_LINE('The shape is a square.');
  END IF;
END;


DECLARE
  shapeLength NUMBER(10);
  shapeWidth NUMBER(10);
BEGIN
  shapeLength := 4;
  shapeWidth := 5;

  IF shapeLength = shapeWidth) THEN
    DBMS_OUTPUT.PUT_LINE('The shape is a square.');
  ELSE
    DBMS_OUTPUT.PUT_LINE('The shape is a rectangle.');
  END IF;
END;



DECLARE
  shapeLength NUMBER(10);
  shapeWidth NUMBER(10);
BEGIN
  shapeLength := 4;
  shapeWidth := -8;

  IF shapeLength = shapeWidth) THEN
    DBMS_OUTPUT.PUT_LINE('The shape is a square.');
  ELSIF(shapeWidth < 0) THEN
    DBMS_OUTPUT.PUT_LINE('The width is negative.');
  ELSE
    DBMS_OUTPUT.PUT_LINE('The shape is a rectangle.');
  END IF;
END;



DECLARE
  shapeLength NUMBER(10);
  shapeWidth NUMBER(10);
BEGIN
  shapeLength := -8;
  shapeWidth := -8;

  IF (shapeWidth < 0) THEN
    DBMS_OUTPUT.PUT_LINE('The shape is a square.');
  ELSIF (shapeLength = shapeWidth) THEN
    DBMS_OUTPUT.PUT_LINE('The width is negative.');
  ELSE
    DBMS_OUTPUT.PUT_LINE('The shape is a rectangle.');
  END IF;
END;


DECLARE
  shapeLength NUMBER(10);
  shapeWidth NUMBER(10);
BEGIN
  shapeLength := -8;
  shapeWidth := 6;

  IF (shapeWidth < 0) THEN
    DBMS_OUTPUT.PUT_LINE('The width is negative.');
  ELSIF (shapeLength = shapeWidth) THEN
    DBMS_OUTPUT.PUT_LINE('The shape is a square.');
  ELSE
    DBMS_OUTPUT.PUT_LINE('The shape is a rectangle.');
  END IF;
END;


DECLARE
  shapeLength NUMBER(10);
  shapeWidth NUMBER(10);
BEGIN
  shapeLength := -8;
  shapeWidth := 6;

  IF (shapeWidth < 0 OR shapeLength < 9) THEN
    DBMS_OUTPUT.PUT_LINE('The width or length is negative.');
  ELSIF (shapeLength = shapeWidth) THEN
    DBMS_OUTPUT.PUT_LINE('The shape is a square.');
  ELSE
    DBMS_OUTPUT.PUT_LINE('The shape is a rectangle.');
  END IF;
END;
