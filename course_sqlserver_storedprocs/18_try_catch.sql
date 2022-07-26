--Exec proc
EXEC insert_employee
    @emp_id = 5,
    @first_name = 'Joan',
    @title = 'Salesperson',
    @dept_id = 2,
    @manager_id = 5
    ;

GO

--Add try catch
ALTER PROCEDURE insert_employee (
    @emp_id INT,
    @first_name VARCHAR(100),
    @title VARCHAR(100),
    @dept_id INT,
    @manager_id INT
) AS
BEGIN
    BEGIN TRY
        INSERT INTO employee (emp_id, first_name, title, dept_id, manager_id)
        VALUES (@emp_id, @first_name, @title, @dept_id, @manager_id);
    END TRY
    BEGIN CATCH
        PRINT 'Error encountered.';
    END CATCH
END;
GO

EXEC insert_employee
    @emp_id = 5,
    @first_name = 'Joan',
    @title = 'Salesperson',
    @dept_id = 2,
    @manager_id = 5
    ;
GO

--Add more error info
ALTER PROCEDURE insert_employee (
    @emp_id INT,
    @first_name VARCHAR(100),
    @title VARCHAR(100),
    @dept_id INT,
    @manager_id INT
) AS
BEGIN
    BEGIN TRY
        INSERT INTO employee (emp_id, first_name, title, dept_id, manager_id)
        VALUES (@emp_id, @first_name, @title, @dept_id, @manager_id);
    END TRY
    BEGIN CATCH
        SELECT   
        ERROR_NUMBER() AS error_number_val,
        ERROR_SEVERITY() AS error_severity_val,
        ERROR_STATE() AS error_state_val,
        ERROR_LINE () AS error_line_num,
        ERROR_PROCEDURE() AS error_procedure_val,
        ERROR_MESSAGE() AS error_message_val;
    END CATCH
END;
GO

EXEC insert_employee
    @emp_id = 5,
    @first_name = 'Joan',
    @title = 'Salesperson',
    @dept_id = 2,
    @manager_id = 5
    ;
GO