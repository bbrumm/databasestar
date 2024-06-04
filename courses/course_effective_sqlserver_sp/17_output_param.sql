ALTER PROCEDURE FindCustomerName
  @specificCustomerID INT,
  @foundCustomerName VARCHAR(100) OUTPUT
AS
BEGIN
	SELECT @foundCustomerName = CustomerName
	FROM Sales.Customers
	WHERE CustomerID = @specificCustomerID;

END;

