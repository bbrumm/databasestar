ALTER PROCEDURE FindCustomerForOrder
AS
BEGIN
	DECLARE @specificOrderID INT;
	SET @specificOrderID = 5;

	DECLARE @foundCustomerID INT;

	SELECT @foundCustomerID = CustomerID
	FROM Sales.Orders
	WHERE OrderID = @specificOrderID;

	PRINT CONCAT('The customer ID is ', @foundCustomerID);
END;


EXECUTE FindCustomerForOrder;