DECLARE
@customerName VARCHAR(100);

EXECUTE FindCustomerName @specificCustomerID = 418, @foundCustomerName = @customerName OUTPUT;

PRINT @customerName;