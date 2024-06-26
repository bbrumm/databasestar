CALL FindEmployeeName(102);

DECLARE
    found_first_name VARCHAR2(100);
BEGIN
    FindEmployeeName(101, found_first_name);
    DBMS_OUTPUT.PUT_LINE(found_first_name);
END;