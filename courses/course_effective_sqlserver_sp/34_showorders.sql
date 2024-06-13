ALTER PROCEDURE ShowOrdersWithinDateRange
	@startDate DATE,
	@endDate DATE
AS
BEGIN
BEGIN TRY
  IF @startDate > @endDate
    PRINT "Invalid entry: the start date is after the end date."
  ELSE
	SELECT OrderID, CustomerID, OrderDate
	FROM Sales.Orders
	WHERE OrderDate BETWEEN @startDate AND @endDate;
END TRY
BEGIN CATCH
 INSERT INTO error_log
    (err_datetime, err_number, err_severity, err_state, err_procedure, err_line,     err_message)
    VALUES (GETDATE(),
    ERROR_NUMBER(),
    ERROR_SEVERITY(),
    ERROR_STATE(),
    ERROR_PROCEDURE(), 
    ERROR_LINE(),
    ERROR_MESSAGE()
    );
END CATCH
END;
