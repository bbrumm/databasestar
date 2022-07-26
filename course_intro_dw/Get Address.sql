SELECT
a.AddressID,
a.AddressLine1,
a.AddressLine2,
a.City,
a.PostalCode,
a.SpatialLocation,
at.Name AS AddressTypeName,
sp.StateProvinceCode,
sp.IsOnlyStateProvinceFlag,
sp.Name AS StateProvinceName,
cr.Name AS CountryRegionName
FROM Person.Address a
INNER JOIN Person.BusinessEntityAddress bea ON a.AddressID = bea.AddressID
INNER JOIN Person.AddressType at ON bea.AddressTypeID = at.AddressTypeID
INNER JOIN Person.StateProvince sp ON a.StateProvinceID = sp.StateProvinceID
INNER JOIN Person.CountryRegion cr ON sp.CountryRegionCode = cr.CountryRegionCode