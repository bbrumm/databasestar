SELECT emp_id, first_name, title, dept_id, manager_id
FROM employee;

GO

--Create a procedure
CREATE PROCEDURE show_employees AS
BEGIN
    SELECT emp_id, first_name, title, dept_id, manager_id
    FROM employee;
END;

EXECUTE show_employees;