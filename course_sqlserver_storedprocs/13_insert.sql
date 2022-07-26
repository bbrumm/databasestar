--Insert statement
INSERT INTO employee (emp_id, first_name, title, dept_id, manager_id)
VALUES (15, 'Mary', 'Developer', 3, 5);

SELECT *
FROM employee;

GO

--Inserting data with a stored proc
CREATE PROCEDURE insert_employee (
    @emp_id INT,
    @first_name VARCHAR(100),
    @title VARCHAR(100),
    @dept_id INT,
    @manager_id INT
) AS
BEGIN
    INSERT INTO employee (emp_id, first_name, title, dept_id, manager_id)
    VALUES (@emp_id, @first_name, @title, @dept_id, @manager_id);
END;
GO

EXEC insert_employee
    @emp_id = 16,
    @first_name = 'Jim',
    @title = 'Quality Assurance Engineer',
    @dept_id = 3,
    @manager_id = 5
    ;

SELECT *
FROM employee;

GO

--Insert IT dept employee
CREATE PROCEDURE insert_it_employee (
    @emp_id INT,
    @first_name VARCHAR(100),
    @title VARCHAR(100),
    @manager_id INT
) AS
DECLARE
    @it_dept INT = 3;
BEGIN
    INSERT INTO employee (emp_id, first_name, title, dept_id, manager_id)
    VALUES (@emp_id, @first_name, @title, @it_dept, @manager_id);
END;
GO

EXEC insert_it_employee
    @emp_id = 17,
    @first_name = 'Carol',
    @title = 'Developer',
    @manager_id = 5
    ;

SELECT *
FROM employee;

GO

