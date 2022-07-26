CREATE TABLE Fact_SalesDetail (
	SalesDetailKey INT IDENTITY,
	SalesKey INT,
	ProductKey INT,
	SalesOrderDetailID INT,
	OrderQty SMALLINT,
	UnitPrice MONEY,
	UnitPriceDiscount MONEY,
	LineTotal NUMERIC(38,6)
);