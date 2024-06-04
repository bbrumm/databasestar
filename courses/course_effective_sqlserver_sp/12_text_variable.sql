ALTER PROCEDURE FindCustomerName
AS
BEGIN
	DECLARE @specificCustomerID INT;
	SET @specificCustomerID = 909;
	DECLARE @foundCustomerName VARCHAR(100);

	SELECT @foundCustomerName = CustomerName
	FROM Sales.Customers
	WHERE CustomerID = @specificCustomerID;

	PRINT @foundCustomerName;

END;