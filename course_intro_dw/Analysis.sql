--All sales and products
SELECT
p.CategoryName,
p.SubcategoryName,
p.Name,
p.ProductNumber,
p.color,
p.StandardCost,
p.ListPrice,
sd.OrderQty,
sd.UnitPrice,
sd.UnitPriceDiscount,
sd.LineTotal
FROM Fact_SalesDetail sd
INNER JOIN Dim_Product p ON sd.ProductKey = p.ProductKey;

--Number of sales for each products
SELECT
p.CategoryName,
p.SubcategoryName,
p.Name,
SUM(sd.OrderQty) AS TotalQtyOrdered,
SUM(sd.LineTotal) AS TotalSalesValue
FROM Fact_SalesDetail sd
INNER JOIN Dim_Product p ON sd.ProductKey = p.ProductKey
GROUP BY p.CategoryName, p.SubcategoryName, p.Name
ORDER BY TotalQtyOrdered DESC, TotalSalesValue DESC;


--Customers who have made the most sales - "most valuable customers"
SELECT
c.AccountNumber,
c.FirstName,
c.LastName,
SUM(s.TotalDue) AS SumTotalDue
FROM Fact_Sales s
INNER JOIN Dim_Customer c ON s.CustomerKey = c.CustomerKey
GROUP BY c.AccountNumber, c.FirstName, c.LastName
ORDER BY SumTotalDue DESC;

--Product categories and sales by date
SELECT
p.CategoryName,
p.SubcategoryName,
d.Year,
d.Month,
SUM(sd.LineTotal) AS SumLineTotal
FROM Fact_Sales s
INNER JOIN Fact_SalesDetail sd ON s.SalesKey = sd.SalesKey
INNER JOIN Dim_Product p ON sd.ProductKey = p.ProductKey
INNER JOIN Dim_Date d ON s.OrderDateKey = d.DateKey
GROUP BY p.CategoryName, p.SubcategoryName, d.Year, d.Month
ORDER BY p.CategoryName, p.SubcategoryName, d.Year, d.Month;








