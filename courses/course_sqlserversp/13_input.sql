ALTER PROCEDURE FindCustomerName
  @specificCustomerID INT
AS
BEGIN
	DECLARE @foundCustomerName VARCHAR(100);

	SELECT @foundCustomerName = CustomerName
	FROM Sales.Customers
	WHERE CustomerID = @specificCustomerID;

	PRINT @foundCustomerName;

END;

EXECUTE FindCustomerName;
EXECUTE FindCustomerName 129;
EXECUTE FindCustomerName 438;
