SELECT
soh.SalesOrderID,
soh.OrderDate,
soh.DueDate,
soh.ShipDate,
soh.status,
soh.OnlineOrderFlag,
soh.SalesOrderNumber,
soh.AccountNumber,
soh.CustomerID,
soh.SalesPersonID,
soh.BillToAddressID,
soh.ShipToAddressID,
soh.SubTotal,
soh.TaxAmt,
soh.Freight,
soh.TotalDue,
sm.Name AS ShipMethodName,
sm.ShipBase,
sm.ShipRate,
c.CurrencyCode,
c.name AS CurrencyName
FROM Sales.SalesOrderHeader soh
INNER JOIN Purchasing.ShipMethod sm ON sm.ShipMethodID = soh.ShipMethodID
INNER JOIN Sales.CurrencyRate cr ON soh.CurrencyRateID = cr.CurrencyRateID
INNER JOIN Sales.Currency c ON cr.FromCurrencyCode = c.CurrencyCode;