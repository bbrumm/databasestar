CREATE OR REPLACE PROCEDURE IncreaseSalary
AS
  TYPE array_dept_id IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
  v_dept_id array_dept_id;
BEGIN

  v_dept_id(1) := 60;
  v_dept_id(2) := 30;
  v_dept_id(3) := 10;


  FOR i IN 1 .. v_dept_id.count LOOP
    UPDATE employees
    SET salary = salary + 1000
    WHERE department_id = v_dept_id(i);
  END LOOP;
END;


CREATE OR REPLACE PROCEDURE IncreaseSalary
AS
  TYPE array_dept_id IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
  v_dept_id array_dept_id;
BEGIN

  v_dept_id(1) := 60;
  v_dept_id(2) := 30;
  v_dept_id(3) := 10;


  FORALL i IN 1 .. v_dept_id.count
    UPDATE employees
    SET salary = salary + 1000
    WHERE department_id = v_dept_id(i);

END;

CALL IncreaseSalary();

SELECT *
FROM employees;