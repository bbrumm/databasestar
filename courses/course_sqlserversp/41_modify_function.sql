ALTER FUNCTION CalculateOrderLinePrice (@orderLineID INT)
RETURNS INT
AS
BEGIN
	DECLARE @orderLinePrice INT;
	
	SELECT @orderLinePrice = Quantity * UnitPrice
	FROM Sales.OrderLines
	WHERE OrderLineID = @orderLineID;

	RETURN @orderLinePrice;
END;