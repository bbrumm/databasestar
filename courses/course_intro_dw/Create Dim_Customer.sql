CREATE TABLE dim_customer (
	CustomerKey INT IDENTITY,
	CustoemrID INT,
	AccountNumber VARCHAR(10),
	PersonType NCHAR(2),
	Title NVARCHAR(8),
	FirstName NVARCHAR(50),
	MiddleName NVARCHAR(50),
	LastName NVARCHAR(50),
	Suffix NVARCHAR(10),
	StoreName NVARCHAR(50)
);

