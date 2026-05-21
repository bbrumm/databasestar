--Original query for Video 313
--SQL Server
SELECT
    c.FirstName + ' ' + c.LastName                          AS CustomerName,
    a.City,
    a.StateProvinceID,
    COUNT(soh.SalesOrderID)                                 AS TotalOrders,
    SUM(sod.OrderQty * sod.UnitPrice)                       AS TotalRevenue,
    AVG(sod.OrderQty * sod.UnitPrice)                       AS AvgLineRevenue
FROM Sales.SalesOrderHeader soh
JOIN Sales.SalesOrderDetail sod
    ON soh.SalesOrderID = sod.SalesOrderID
JOIN Sales.Customer c_link
    ON soh.CustomerID = c_link.CustomerID
JOIN Person.Person c
    ON c_link.PersonID = c.BusinessEntityID
JOIN Person.BusinessEntityAddress bea
    ON c.BusinessEntityID = bea.BusinessEntityID
JOIN Person.Address a
    ON bea.AddressID = a.AddressID
WHERE
    YEAR(soh.OrderDate) = 2013
    AND UPPER(a.City) = UPPER('Seattle')
    AND (sod.OrderQty * sod.UnitPrice) > 50
GROUP BY
    c.FirstName + ' ' + c.LastName,
    a.City,
    a.StateProvinceID
HAVING
    SUM(sod.OrderQty * sod.UnitPrice) > 100
ORDER BY
    TotalRevenue DESC;