-- ============================================
-- Video 354 — Fix a Slow SQL Server Procedure Without Breaking It
-- Sample data
-- SQL Server 2022
-- ============================================
-- Creates the SalesDB database with dbo.Customers and dbo.Orders, then loads
-- 100,000 customers and 5,000,000 orders for the demo.
--
-- Orders are spread evenly over 20 years (2006 to 2025), so each year has
-- about 250,000 orders. About 90% of orders have the status Completed.
--
-- dbo.OrderLines from the 27 Stored Procedure Mistakes guide is left out,
-- because this video doesn't use it.
--
-- The index on OrderDate is a covering index (it includes CustomerID and
-- TotalAmount). This is different from the guide, where the index is on
-- OrderDate alone. With a covering index, the fixed query can use an Index
-- Seek instead of a scan.
--
-- Run the whole file to reset everything. It drops and recreates SalesDB.
-- Loading 5,000,000 rows can take a few minutes.
-- ============================================

USE master;
GO

IF DB_ID('SalesDB') IS NOT NULL
BEGIN
    ALTER DATABASE SalesDB SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE SalesDB;
END;
GO

CREATE DATABASE SalesDB;
GO

-- Simple recovery keeps the transaction log small during the big insert
ALTER DATABASE SalesDB SET RECOVERY SIMPLE;
GO

USE SalesDB;
GO


-- ============================================
-- 1. Create the tables
-- ============================================
CREATE TABLE dbo.Customers (
    CustomerID     INT IDENTITY PRIMARY KEY,
    Email          VARCHAR(255) NOT NULL,
    Country        VARCHAR(50)  NOT NULL,
    LifetimeValue  DECIMAL(12,2) NULL,
    LastOrderDate  DATE NULL
);

CREATE TABLE dbo.Orders (
    OrderID      INT IDENTITY PRIMARY KEY,
    CustomerID   INT NOT NULL REFERENCES dbo.Customers (CustomerID),
    OrderDate    DATE NOT NULL,
    Status       VARCHAR(20) NOT NULL,
    TotalAmount  DECIMAL(10,2) NOT NULL,
    Notes        NVARCHAR(MAX) NULL
);
GO


-- ============================================
-- 2. Load 100,000 customers
-- ============================================
WITH Numbers AS (
    SELECT TOP (100000)
        ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS n
    FROM sys.all_objects AS a
    CROSS JOIN sys.all_objects AS b
)
INSERT INTO dbo.Customers (Email, Country)
SELECT
    'customer' + CAST(n AS VARCHAR(10)) + '@example.com',
    CHOOSE((n % 5) + 1, 'Australia', 'United States', 'United Kingdom', 'Canada', 'India')
FROM Numbers;
GO


-- ============================================
-- 3. Load 5,000,000 orders
-- Order dates run from 2006-01-01 to 2025-12-31 (7,305 days).
-- The values repeat in a fixed pattern, so the data is the same every time.
-- ============================================
WITH Numbers AS (
    SELECT TOP (5000000)
        ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS n
    FROM sys.all_objects AS a
    CROSS JOIN sys.all_objects AS b
    CROSS JOIN sys.all_objects AS c
)
INSERT INTO dbo.Orders (CustomerID, OrderDate, Status, TotalAmount)
SELECT
    CAST(1 + (n * 7919) % 100000 AS INT),
    DATEADD(DAY, CAST(n % 7305 AS INT), '2006-01-01'),
    CASE
        WHEN n % 100 < 90 THEN 'Completed'
        WHEN n % 100 < 95 THEN 'Pending'
        WHEN n % 100 < 98 THEN 'Shipped'
        ELSE 'Cancelled'
    END,
    CAST(10 + ((n * 31) % 49000) / 100.0 AS DECIMAL(10,2))
FROM Numbers;
GO


-- ============================================
-- 4. Create the indexes after the load, which is faster
-- ============================================
CREATE INDEX IX_Customers_Email   ON dbo.Customers (Email);
CREATE INDEX IX_Orders_CustomerID ON dbo.Orders (CustomerID);
CREATE INDEX IX_Orders_Status     ON dbo.Orders (Status);

-- Covering index for the demo: OrderDate plus the other columns the procedure returns
CREATE INDEX IX_Orders_OrderDate
    ON dbo.Orders (OrderDate)
    INCLUDE (CustomerID, TotalAmount);
GO


-- ============================================
-- 5. Check the data
-- ============================================
SELECT COUNT(*) AS CustomerCount FROM dbo.Customers;   -- expect 100,000
SELECT COUNT(*) AS OrderCount    FROM dbo.Orders;      -- expect 5,000,000

SELECT YEAR(OrderDate) AS OrderYear, COUNT(*) AS OrderCount
FROM dbo.Orders
GROUP BY YEAR(OrderDate)
ORDER BY OrderYear;                                    -- expect about 250,000 per year
GO
