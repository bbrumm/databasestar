--Update statement (dept_id originally 2)
UPDATE employee
SET dept_id = 4 
WHERE emp_id = 11;

SELECT *
FROM employee;

GO

--Create procedure
CREATE PROCEDURE update_dept_for_emp (
    @emp_id INT,
    @dept_id INT
) AS
BEGIN
    UPDATE employee
    SET dept_id = @dept_id 
    WHERE emp_id = @emp_id;
END;
GO

EXEC update_dept_for_emp 11, 3;

SELECT *
FROM employee;

EXEC update_dept_for_emp 
    @emp_id = 11, 
    @dept_id = 2;

GO

--Move to IT dept
CREATE PROCEDURE move_emp_to_it (@emp_id INT) AS
BEGIN
    UPDATE employee
    SET dept_id = 3 
    WHERE emp_id = @emp_id;
END;
GO

EXEC move_emp_to_it 11;

SELECT *
FROM employee;

--Reset to original department
EXEC update_dept_for_emp 11, 2;