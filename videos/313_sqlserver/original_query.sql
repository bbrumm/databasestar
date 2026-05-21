--Original query for Video 313
--SQL Server
SELECT
    c.FirstName + ' ' + c.LastName AS CustomerName,
    a.City,
    a.StateProvinceID,
    COUNT(soh.SalesOrderID) AS TotalOrders,
    SUM(sod.OrderQty * sod.UnitPrice) AS TotalRevenue,
    AVG(sod.OrderQty * sod.UnitPrice) AS AvgLineRevenue
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


/*
On my laptop, this runs in about 1 second and shows 19 rows.
*/

/*
Query 2, with many subqueries
*/


SELECT
    (
        SELECT TOP 1 p.FirstName + ' ' + p.LastName
        FROM Sales.Customer c
        JOIN Person.Person p ON c.PersonID = p.BusinessEntityID
        WHERE c.CustomerID = soh.CustomerID
    ) AS CustomerName,
    soh.SalesOrderID,
    soh.OrderDate,
    (
        SELECT SUM(sod.OrderQty * sod.UnitPrice)
        FROM Sales.SalesOrderDetail sod
        WHERE sod.SalesOrderID = soh.SalesOrderID
    ) AS TotalRevenue,
    (
        SELECT COUNT(*)
        FROM Sales.SalesOrderDetail sod
        WHERE sod.SalesOrderID = soh.SalesOrderID
    ) AS LineCount,
    (
        SELECT AVG(sod.UnitPrice)
        FROM Sales.SalesOrderDetail sod
        WHERE sod.SalesOrderID = soh.SalesOrderID
    ) AS AvgUnitPrice,
    (
        SELECT MAX(sod.UnitPrice)
        FROM Sales.SalesOrderDetail sod
        WHERE sod.SalesOrderID = soh.SalesOrderID
    ) AS MaxUnitPrice,
    (
        SELECT MIN(sod.UnitPrice)
        FROM Sales.SalesOrderDetail sod
        WHERE sod.SalesOrderID = soh.SalesOrderID
    ) AS MinUnitPrice
FROM Sales.SalesOrderHeader soh
WHERE
    YEAR(soh.OrderDate) BETWEEN 2011 AND 2014
    AND soh.TotalDue > 100
ORDER BY
    soh.OrderDate DESC;

/*
On my laptop, this took 27 seconds and has 90k rows
I could add more rows to the table, but it may not work as I may run out of space on the laptop.
Let's go with this query.



*/

/*
First step - remove the YEAR function.
*/


SELECT
    (
        SELECT TOP 1 p.FirstName + ' ' + p.LastName
        FROM Sales.Customer c
        JOIN Person.Person p ON c.PersonID = p.BusinessEntityID
        WHERE c.CustomerID = soh.CustomerID
    ) AS CustomerName,
    soh.SalesOrderID,
    soh.OrderDate,
    (
        SELECT SUM(sod.OrderQty * sod.UnitPrice)
        FROM Sales.SalesOrderDetail sod
        WHERE sod.SalesOrderID = soh.SalesOrderID
    ) AS TotalRevenue,
    (
        SELECT COUNT(*)
        FROM Sales.SalesOrderDetail sod
        WHERE sod.SalesOrderID = soh.SalesOrderID
    ) AS LineCount,
    (
        SELECT AVG(sod.UnitPrice)
        FROM Sales.SalesOrderDetail sod
        WHERE sod.SalesOrderID = soh.SalesOrderID
    ) AS AvgUnitPrice,
    (
        SELECT MAX(sod.UnitPrice)
        FROM Sales.SalesOrderDetail sod
        WHERE sod.SalesOrderID = soh.SalesOrderID
    ) AS MaxUnitPrice,
    (
        SELECT MIN(sod.UnitPrice)
        FROM Sales.SalesOrderDetail sod
        WHERE sod.SalesOrderID = soh.SalesOrderID
    ) AS MinUnitPrice
FROM Sales.SalesOrderHeader soh
WHERE
    soh.OrderDate >= '2011-01-01' AND soh.OrderDate < '2015-01-01'
    AND soh.TotalDue > 100
ORDER BY
    soh.OrderDate DESC;


/*
This query now runs in 28 seconds, with 90,427 rows.
*/



/*
Step 2: change one of the subqueries to a join (customer name)
*/


SELECT
p.FirstName + ' ' + p.LastName  AS CustomerName,
    soh.SalesOrderID,
    soh.OrderDate,
    (
        SELECT SUM(sod.OrderQty * sod.UnitPrice)
        FROM Sales.SalesOrderDetail sod
        WHERE sod.SalesOrderID = soh.SalesOrderID
    ) AS TotalRevenue,
    (
        SELECT COUNT(*)
        FROM Sales.SalesOrderDetail sod
        WHERE sod.SalesOrderID = soh.SalesOrderID
    ) AS LineCount,
    (
        SELECT AVG(sod.UnitPrice)
        FROM Sales.SalesOrderDetail sod
        WHERE sod.SalesOrderID = soh.SalesOrderID
    ) AS AvgUnitPrice,
    (
        SELECT MAX(sod.UnitPrice)
        FROM Sales.SalesOrderDetail sod
        WHERE sod.SalesOrderID = soh.SalesOrderID
    ) AS MaxUnitPrice,
    (
        SELECT MIN(sod.UnitPrice)
        FROM Sales.SalesOrderDetail sod
        WHERE sod.SalesOrderID = soh.SalesOrderID
    ) AS MinUnitPrice
FROM Sales.SalesOrderHeader soh
INNER JOIN Sales.Customer c ON soh.CustomerID = c.CustomerID
INNER JOIN Person.Person p ON c.PersonID = p.BusinessEntityID
WHERE soh.OrderDate >= '2011-01-01' AND soh.OrderDate < '2015-01-01'
AND soh.TotalDue > 100
ORDER BY
    soh.OrderDate DESC;

/*
This runs in 28 seconds and has 90,427 rows.
*/


/*
Step 3: remove another subquery: total revenue (because it has the salesorderdetail in it)
*/



SELECT
p.FirstName + ' ' + p.LastName  AS CustomerName,
    soh.SalesOrderID,
    soh.OrderDate,
    sod_rev.TotalRevenue,
    (
        SELECT COUNT(*)
        FROM Sales.SalesOrderDetail sod
        WHERE sod.SalesOrderID = soh.SalesOrderID
    ) AS LineCount,
    (
        SELECT AVG(sod.UnitPrice)
        FROM Sales.SalesOrderDetail sod
        WHERE sod.SalesOrderID = soh.SalesOrderID
    ) AS AvgUnitPrice,
    (
        SELECT MAX(sod.UnitPrice)
        FROM Sales.SalesOrderDetail sod
        WHERE sod.SalesOrderID = soh.SalesOrderID
    ) AS MaxUnitPrice,
    (
        SELECT MIN(sod.UnitPrice)
        FROM Sales.SalesOrderDetail sod
        WHERE sod.SalesOrderID = soh.SalesOrderID
    ) AS MinUnitPrice
FROM Sales.SalesOrderHeader soh
INNER JOIN Sales.Customer c ON soh.CustomerID = c.CustomerID
INNER JOIN Person.Person p ON c.PersonID = p.BusinessEntityID
INNER JOIN (
    SELECT SalesOrderID, SUM(OrderQty * UnitPrice) AS TotalRevenue
    FROM Sales.SalesOrderDetail
    GROUP BY SalesOrderID
) AS sod_rev
    ON soh.SalesOrderID = sod_rev.SalesOrderID
WHERE soh.OrderDate >= '2011-01-01' AND soh.OrderDate < '2015-01-01'
AND soh.TotalDue > 100
ORDER BY
    soh.OrderDate DESC;


/*
This query runs in 24 seconds and has 86,859 rows. Why?
Join type:
Show more
20:34
The difference is the type of JOIN used to bring in sod_rev.

In the first query, the SalesOrderDetail data comes from correlated subqueries in the SELECT list. Correlated subqueries return NULL if no matching rows exist — so a SalesOrderHeader row with no detail lines still appears in the results, just with NULL values for revenue, count, etc.

In the second query, you replaced TotalRevenue with an INNER JOIN to sod_rev. An inner join excludes any SalesOrderHeader row that has no matching rows in SalesOrderDetail. Those 3,568 missing rows are orders that exist in SalesOrderHeader but have no corresponding lines in SalesOrderDetail — which is plausible given you inserted the header rows and detail rows separately, and the detail insert may not have produced a match for every header.

The fix is simple — change the INNER JOIN to a LEFT JOIN.

Step 4: Change to LEFT JOIN
*/


SELECT
p.FirstName + ' ' + p.LastName  AS CustomerName,
    soh.SalesOrderID,
    soh.OrderDate,
    sod_rev.TotalRevenue,
    (
        SELECT COUNT(*)
        FROM Sales.SalesOrderDetail sod
        WHERE sod.SalesOrderID = soh.SalesOrderID
    ) AS LineCount,
    (
        SELECT AVG(sod.UnitPrice)
        FROM Sales.SalesOrderDetail sod
        WHERE sod.SalesOrderID = soh.SalesOrderID
    ) AS AvgUnitPrice,
    (
        SELECT MAX(sod.UnitPrice)
        FROM Sales.SalesOrderDetail sod
        WHERE sod.SalesOrderID = soh.SalesOrderID
    ) AS MaxUnitPrice,
    (
        SELECT MIN(sod.UnitPrice)
        FROM Sales.SalesOrderDetail sod
        WHERE sod.SalesOrderID = soh.SalesOrderID
    ) AS MinUnitPrice
FROM Sales.SalesOrderHeader soh
INNER JOIN Sales.Customer c ON soh.CustomerID = c.CustomerID
INNER JOIN Person.Person p ON c.PersonID = p.BusinessEntityID
LEFT JOIN (
    SELECT SalesOrderID, SUM(OrderQty * UnitPrice) AS TotalRevenue
    FROM Sales.SalesOrderDetail
    GROUP BY SalesOrderID
) AS sod_rev
    ON soh.SalesOrderID = sod_rev.SalesOrderID
WHERE soh.OrderDate >= '2011-01-01' AND soh.OrderDate < '2015-01-01'
AND soh.TotalDue > 100
ORDER BY
    soh.OrderDate DESC;

/*
This query runs in 29 seconds and shows 90,427 rows.
*/

/*
Step 5: Change the line count to a join
*/



SELECT
p.FirstName + ' ' + p.LastName  AS CustomerName,
    soh.SalesOrderID,
    soh.OrderDate,
    sod_rev.TotalRevenue,
	sod_rev.LineCount,
    (
        SELECT AVG(sod.UnitPrice)
        FROM Sales.SalesOrderDetail sod
        WHERE sod.SalesOrderID = soh.SalesOrderID
    ) AS AvgUnitPrice,
    (
        SELECT MAX(sod.UnitPrice)
        FROM Sales.SalesOrderDetail sod
        WHERE sod.SalesOrderID = soh.SalesOrderID
    ) AS MaxUnitPrice,
    (
        SELECT MIN(sod.UnitPrice)
        FROM Sales.SalesOrderDetail sod
        WHERE sod.SalesOrderID = soh.SalesOrderID
    ) AS MinUnitPrice
FROM Sales.SalesOrderHeader soh
INNER JOIN Sales.Customer c ON soh.CustomerID = c.CustomerID
INNER JOIN Person.Person p ON c.PersonID = p.BusinessEntityID

LEFT JOIN (
    SELECT SalesOrderID,
	SUM(OrderQty * UnitPrice) AS TotalRevenue,
	COUNT(*) AS LineCount
    FROM Sales.SalesOrderDetail
    GROUP BY SalesOrderID
) AS sod_rev
    ON soh.SalesOrderID = sod_rev.SalesOrderID
WHERE soh.OrderDate >= '2011-01-01' AND soh.OrderDate < '2015-01-01'
AND soh.TotalDue > 100
ORDER BY
    soh.OrderDate DESC;

/*
Runs in 27 seconds, 90,427 rows rows.
*/


/*
Step 6: Change the avg, max, min to a join
*/



SELECT
p.FirstName + ' ' + p.LastName  AS CustomerName,
    soh.SalesOrderID,
    soh.OrderDate,
    sod_rev.TotalRevenue,
	sod_rev.LineCount,
    sod_rev.AvgUnitPrice,
    sod_rev.MaxUnitPrice,
    sod_rev.MinUnitPrice
FROM Sales.SalesOrderHeader soh
INNER JOIN Sales.Customer c ON soh.CustomerID = c.CustomerID
INNER JOIN Person.Person p ON c.PersonID = p.BusinessEntityID

LEFT JOIN (
    SELECT SalesOrderID,
	SUM(OrderQty * UnitPrice) AS TotalRevenue,
	COUNT(*) AS LineCount,
	AVG(UnitPrice) AS AvgUnitPrice,
	MAX(UnitPrice) AS MaxUnitPrice,
	MIN(UnitPrice) AS MinUnitPrice
    FROM Sales.SalesOrderDetail
    GROUP BY SalesOrderID
) AS sod_rev
    ON soh.SalesOrderID = sod_rev.SalesOrderID
WHERE soh.OrderDate >= '2011-01-01' AND soh.OrderDate < '2015-01-01'
AND soh.TotalDue > 100
ORDER BY
    soh.OrderDate DESC;

/*
Query runs in 13 seconds, 90,427 rows
*/

/*
Step 7: Add index
*/


CREATE NONCLUSTERED INDEX IX_SOH_OrderDate_TotalDue
ON Sales.SalesOrderHeader (OrderDate, TotalDue)
INCLUDE (CustomerID, SalesOrderID);

--Code to drop index if needed
DROP INDEX Sales.SalesOrderHeader.IX_SOH_OrderDate_TotalDue;


/*
Rerun query from Step 6:
Runs in 12 seconds, 90,427 rows
*/

/*
Step 8: Add a covering index
*/

CREATE NONCLUSTERED INDEX IX_SalesOrderDetail_Agg
ON Sales.SalesOrderDetail (SalesOrderID)
INCLUDE (OrderQty, UnitPrice);

--Code to drop index if needed
DROP INDEX Sales.SalesOrderDetail.IX_SalesOrderDetail_Agg;


/*
Rerun query from Step 6:
Runs in 4 seconds, 90,427 rows
Original query ran in 27 seconds.
*/