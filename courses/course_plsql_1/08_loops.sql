/*
Lesson 08
*/
DECLARE
  loopCounter NUMBER(2) := 0;
BEGIN
  LOOP
    DBMS_OUTPUT.PUT_LINE('Here is a message.');
    loopCounter := loopCounter + 1;
    IF (loopCounter >= 5) THEN
      EXIT;
    END IF;
  END LOOP;
END;


DECLARE
  loopCounter NUMBER(2) := 0;
BEGIN
  FOR loopCounter IN 1 .. 5 LOOP
    DBMS_OUTPUT.PUT_LINE('Here is a message: ' || loopCounter);
  END LOOP;
END;


DECLARE
  loopCounter NUMBER(2) := 0;
BEGIN
  WHILE (loopCounter < 5) LOOP
    DBMS_OUTPUT.PUT_LINE('Here is a message: ' || loopCounter);
    loopCounter := loopCounter + 1;
  END LOOP;
END;
