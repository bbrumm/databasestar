CREATE PROCEDURE HelloWorldSelect
AS
BEGIN
	SELECT 'Hello world';
END;


EXECUTE HelloWorldSelect;



CREATE PROCEDURE ShowSalesOrders
AS
BEGIN
	SELECT OrderID, CustomeIDd, OrderDate
	FROM Sales.Orders;
END;

EXECUTE ShowSalesOrders