CREATE PROCEDURE ShowOrdersWithinDateRange
	@startDate DATE,
	@endDate DATE
AS
BEGIN
	SELECT OrderID, CustomerID, OrderDate
	FROM Sales.Orders
	WHERE OrderDate BETWEEN @startDate AND @endDate;
END;


EXECUTE ShowOrdersWithinDateRange '2013-04-05', '2013-05-10';

EXECUTE ShowOrdersWithinDateRange '2013-05-10', '2013-04-15';

EXECUTE ShowOrdersWithinDateRange @startDate='2013-04-15', @endDate='2013-05-10';

EXECUTE ShowOrdersWithinDateRange @endDate='2013-05-10', @startDate='2013-04-15';