CREATE PROCEDURE ShowOrdersWithinDateRange
	@startDate DATE,
	@endDate DATE
AS
BEGIN
	IF @startDate > @endDate
		PRINT 'Invalid entry: the start date is after the end date.';
	ELSE
		SELECT OrderID, CustomerID, OrderDate
		FROM Sales.Orders
		WHERE OrderDate BETWEEN @startDate AND @endDate;
END;