CREATE FUNCTION CalculateOrderLinePrice(@qty INT, @unitPrice INT)
RETURNS INT
AS
BEGIN
	DECLARE @orderLinePrice INT;
	SET @orderLinePrice = @qty * @unitPrice;
	RETURN @orderLinePrice;
END;


SELECT
OrderLineID,
OrderID,
Description,
Quantity,
UnitPrice,
dbo.CalculateOrderLinePrice(Quantity, UnitPrice) AS total_price
FROM Sales.OrderLine
WHERE OrderLineID = 1;