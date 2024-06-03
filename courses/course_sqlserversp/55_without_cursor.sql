ALTER PROCEDURE OrdersAfterDate
	@specificDate DATE
AS
BEGIN
	DECLARE @orderCounter INT;

	SELECT @orderCounter = COUNT(*)
	FROM Sales.Orders
	WHERE OrderDate > @specificDate;

	PRINT CONCAT('There are ', @orderCounter, ' orders after the specified date.');

END;


EXECUTE OrdersAfterDate '2014-01-01';