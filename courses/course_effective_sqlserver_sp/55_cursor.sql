ALTER PROCEDURE OrdersAfterDate
	@specificDate DATE
AS
BEGIN
	DECLARE @orderID INT;
	DECLARE @customerID INT;
	DECLARE @orderDate DATE;
	DECLARE @orderCounter INT;

	SET @orderCounter = 0;

	DECLARE orderCursor CURSOR FOR
	SELECT OrderID, CustomerID, OrderDate
	FROM Sales.Orders;

	OPEN orderCursor;

	FETCH NEXT FROM orderCursor
	INTO @orderID, @customerID, @orderDate;

	WHILE @@FETCH_STATUS = 0
		BEGIN
			IF @orderDate > @specificDate
				SET @orderCounter = @orderCounter + 1;

			FETCH NEXT FROM orderCursor
			INTO @orderID, @customerID, @orderDate;
		END;

	CLOSE orderCursor;
	DEALLOCATE orderCursor;

	PRINT CONCAT('There are ', @orderCounter, ' orders after the specified date.');

END;


EXECUTE OrdersAfterDate '2014-01-01';