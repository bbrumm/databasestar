--Delete statement
DELETE FROM employee
WHERE emp_id = 9;

SELECT *
FROM employee;

GO

--Create procedure
CREATE PROCEDURE delete_employee (@emp_id INT) AS
BEGIN
    DELETE FROM employee
    WHERE emp_id = @emp_id;
END;
GO

EXEC delete_employee 9;

SELECT *
FROM employee;

--Re-insert employee
INSERT INTO employee (emp_id, first_name, title, dept_id, manager_id) VALUES
(9, 'Morris', 'Customer Service Representative', 4, 10);