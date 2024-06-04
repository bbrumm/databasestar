CREATE PROCEDURE FindCustomerForOrder
AS
BEGIN
	SELECT CustomerID
	FROM Sales.Orders
	WHERE OrderID = 5;
END;


EXECUTE FindCustomerForOrder;


ALTER PROCEDURE FindCustomerForOrder
AS
DECLARE
	specificOrderID INT;
BEGIN
	SET @specificOrderID = 5;

	SELECT CustomerID
	FROM Sales.Orders
	WHERE OrderID = @specificOrderID 5;
END;