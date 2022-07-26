SELECT
sp.BusinessEntityID AS SalesPersonID,
sp.salesquota,
sp.bonus,
sp.commissionpct,
sp.SalesYTD,
sp.SalesLastYear,
st.name AS TerritoryName,
st.[group] AS TerritoryGroup,
st.SalesYTD AS TerritorySalesYTD,
st.SalesLastYear AS TerritorySalesLastYear,
st.CostYTD AS TerritoryCostYTD,
st.CostLastYear AS TerritoryCostLastYear,
cr.Name AS CountryRegionName,
spv.StateProvinceCode,
spv.IsOnlyStateProvinceFlag,
spv.Name AS StateProvinceName,
e.NationalIDNumber,
e.LoginID,
e.OrganizationNode,
e.OrganizationLevel,
e.JobTitle,
e.BirthDate,
e.MaritalStatus,
e.Gender,
e.HireDate,
e.SalariedFlag,
e.VacationHours,
e.SickLeaveHours,
e.CurrentFlag
FROM sales.salesperson sp
INNER JOIN Sales.SalesTerritory st ON sp.TerritoryID = st.TerritoryID
INNER JOIN Person.CountryRegion cr ON st.CountryRegionCode = cr.CountryRegionCode
INNER JOIN Person.StateProvince spv ON spv.CountryRegionCode = cr.CountryRegionCode
INNER JOIN HumanResources.Employee e ON sp.BusinessEntityID = e.BusinessEntityID