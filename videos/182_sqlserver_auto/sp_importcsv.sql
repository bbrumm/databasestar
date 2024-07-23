CREATE OR ALTER PROCEDURE ImportCSV
AS
BEGIN
    DELETE FROM dbo.cust_orders;

    BULK INSERT dbo.cust_orders
	FROM 'C:/Users/bbrum/databasestar/databasestar/videos/182_sqlserver_auto/cust_orders.csv'
	WITH
	(
	  FIRSTROW=2,
	  FIELDTERMINATOR =',',
	  ROWTERMINATOR = '0x0a'
	);
END;