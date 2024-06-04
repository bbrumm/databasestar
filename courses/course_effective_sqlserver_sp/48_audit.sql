DROP TABLE dbo.Employee;

CREATE TABLE dbo.Employee (
  EmployeeID INT PRIMARY KEY,
  FullName NVARCHAR(200),
  Salary INT,
  CreatedOn DATETIME DEFAULT GETDATE(),
  UpdatedOn DATETIME
);

INSERT INTO dbo.Employee (EmployeeID, FullName, Salary)
VALUES
(1, 'John', 1000),
(2, 'Sarah', 1500),
(3, 'Julie', 1700),
(4, 'Mark', 800);

SELECT *
FROM dbo.Employee;


SELECT EmployeeID, FullName, Salary, CreatedOn, UpdatedOn
INTO dbo.EmployeeAudit
FROM dbo.Employee
WHERE 1=0;

GO;

CREATE TRIGGER EmployeeUpdateDelete
ON dbo.Employee
AFTER UPDATE, DELETE
AS
BEGIN
	INSERT INTO dbo.EmployeeAudit (EmployeeID, FullName, Salary, CreatedOn, UpdatedOn)
	SELECT EmployeeID, FullName, Salary, CreatedOn, UpdatedOn
	FROM Deleted;
END;

UPDATE dbo.Employee
SET Salary = 1100,
UpdatedOn = GETDATE()
WHERE EmployeeID = 1;

DELETE FROM dbo.Employee
WHERE EmployeeID = 3;

SELECT *
FROM dbo.EmployeeAudit;