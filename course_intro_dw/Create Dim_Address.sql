CREATE TABLE Dim_Address (
	AddressKey INT IDENTITY,
	AddressID INT,
	AddressLine1 NVARCHAR(60),
	AddressLine2 NVARCHAR(60),
	City NVARCHAR(30),
	PostalCode NVARCHAR(15),
	SpatialLocation GEOGRAPHY,
	AddressTypeName NVARCHAR(50),
	StateProvinceCode NCHAR(3),
	IsOnlyStateProvinceFlag BIT,
	StateProvinceName NVARCHAR(50),
	CountryRegionName NVARCHAR(50)
);