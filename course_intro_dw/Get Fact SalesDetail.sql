SELECT
sod.SalesOrderDetailID,
sod.SalesOrderID,
sod.ProductID,
sod.OrderQty,
sod.UnitPrice,
sod.UnitPriceDiscount,
sod.LineTotal
FROM Sales.SalesOrderDetail sod
