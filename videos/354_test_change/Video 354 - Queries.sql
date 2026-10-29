-- ============================================
-- Video 354 — Fix a Slow SQL Server Procedure Without Breaking It
-- SQL Server 2022
-- ============================================
-- Database: SalesDB (create it with Video 354 - Sample Data.sql first)
-- Needs tSQLt installed in SalesDB.
-- Run each section on its own by highlighting it, then pressing F5.
-- Each CREATE statement has a GO after it, because CREATE PROCEDURE must be
-- the only statement in its batch.
--
-- Sections 1 to 2 use the real 5,000,000-row table. Sections 3 to 11 use
-- tSQLt, which fakes dbo.Orders inside each test and rolls back afterwards.
--
-- ============================================

USE SalesDB;
GO


-- ============================================
-- 1. The slow procedure (Section 1)
-- ============================================
CREATE OR ALTER PROCEDURE dbo.GetOrdersForYear
    @Year INT
AS
BEGIN
    SELECT OrderID, CustomerID, TotalAmount
    FROM dbo.Orders
    WHERE YEAR(OrderDate) = @Year;
END;
GO


-- ============================================
-- 2. Run it with the actual execution plan on (Section 1)
-- Turn on Query > Include Actual Execution Plan (Ctrl+M) first.
-- Expect an Index Scan. [CHECK]
-- ============================================
SET STATISTICS TIME ON;

EXEC dbo.GetOrdersForYear @Year = 2025;


-- ============================================
-- 3. Create the test class (Section 3)
-- ============================================
EXEC tSQLt.NewTestClass 'GetOrdersForYearTests';
GO


-- ============================================
-- 4. First test: only orders from the requested year (Section 3)
-- [CHECK: FakeTable lets us insert explicit OrderID values, and
-- AssertEqualsTable works with these temporary tables]
-- ============================================
CREATE PROCEDURE GetOrdersForYearTests.[test returns only orders from the requested year]
AS
BEGIN
    EXEC tSQLt.FakeTable 'dbo.Orders';

    INSERT INTO dbo.Orders (OrderID, CustomerID, OrderDate, Status, TotalAmount)
    VALUES
        (1, 101, '2024-05-05', 'Completed', 50.00),
        (2, 102, '2025-03-10', 'Completed', 75.00),
        (3, 103, '2025-09-20', 'Completed', 120.00),
        (4, 104, '2026-05-05', 'Completed', 90.00);

    CREATE TABLE #Expected (OrderID INT, CustomerID INT, TotalAmount DECIMAL(10,2));

    INSERT INTO #Expected (OrderID, CustomerID, TotalAmount)
    VALUES
        (2, 102, 75.00),
        (3, 103, 120.00);

    SELECT OrderID, CustomerID, TotalAmount
    INTO #Actual
    FROM #Expected
    WHERE 1 = 0;

    INSERT INTO #Actual
    EXEC dbo.GetOrdersForYear @Year = 2025;

    EXEC tSQLt.AssertEqualsTable '#Expected', '#Actual';
END;
GO


-- ============================================
-- 5. Run the test class: 1 test, expect it to pass (Section 3)
-- ============================================
EXEC tSQLt.Run 'GetOrdersForYearTests';


-- ============================================
-- 6. Edge test: first and last day of the year are included (Section 4)
-- ============================================
CREATE PROCEDURE GetOrdersForYearTests.[test includes orders on the first and last day of the year]
AS
BEGIN
    EXEC tSQLt.FakeTable 'dbo.Orders';

    INSERT INTO dbo.Orders (OrderID, CustomerID, OrderDate, Status, TotalAmount)
    VALUES
        (1, 101, '2025-01-01', 'Completed', 75.00),
        (2, 102, '2025-12-31', 'Completed', 60.00);

    CREATE TABLE #Expected (OrderID INT, CustomerID INT, TotalAmount DECIMAL(10,2));

    INSERT INTO #Expected (OrderID, CustomerID, TotalAmount)
    VALUES
        (1, 101, 75.00),
        (2, 102, 60.00);

    SELECT OrderID, CustomerID, TotalAmount
    INTO #Actual
    FROM #Expected
    WHERE 1 = 0;

    INSERT INTO #Actual
    EXEC dbo.GetOrdersForYear @Year = 2025;

    EXEC tSQLt.AssertEqualsTable '#Expected', '#Actual';
END;
GO


-- ============================================
-- 7. Edge test: the day either side of the year is excluded (Section 4)
-- This is the test that fails when the end of the range uses <=.
-- ============================================
CREATE PROCEDURE GetOrdersForYearTests.[test excludes orders on the day either side of the year]
AS
BEGIN
    EXEC tSQLt.FakeTable 'dbo.Orders';

    INSERT INTO dbo.Orders (OrderID, CustomerID, OrderDate, Status, TotalAmount)
    VALUES
        (1, 101, '2024-12-31', 'Completed', 50.00),
        (2, 102, '2025-06-15', 'Completed', 120.00),
        (3, 103, '2026-01-01', 'Completed', 90.00);

    CREATE TABLE #Expected (OrderID INT, CustomerID INT, TotalAmount DECIMAL(10,2));

    INSERT INTO #Expected (OrderID, CustomerID, TotalAmount)
    VALUES
        (2, 102, 120.00);

    SELECT OrderID, CustomerID, TotalAmount
    INTO #Actual
    FROM #Expected
    WHERE 1 = 0;

    INSERT INTO #Actual
    EXEC dbo.GetOrdersForYear @Year = 2025;

    EXEC tSQLt.AssertEqualsTable '#Expected', '#Actual';
END;
GO


-- ============================================
-- 8. Edge test: a year with no orders returns no rows (Section 4)
-- ============================================
CREATE PROCEDURE GetOrdersForYearTests.[test returns no rows when the year has no orders]
AS
BEGIN
    EXEC tSQLt.FakeTable 'dbo.Orders';

    INSERT INTO dbo.Orders (OrderID, CustomerID, OrderDate, Status, TotalAmount)
    VALUES
        (1, 101, '2024-05-05', 'Completed', 50.00);

    CREATE TABLE #Expected (OrderID INT, CustomerID INT, TotalAmount DECIMAL(10,2));

    SELECT OrderID, CustomerID, TotalAmount
    INTO #Actual
    FROM #Expected
    WHERE 1 = 0;

    INSERT INTO #Actual
    EXEC dbo.GetOrdersForYear @Year = 2025;

    EXEC tSQLt.AssertEqualsTable '#Expected', '#Actual';
END;
GO


-- ============================================
-- 9. Run all 4 tests against the original procedure: expect 4 passes (Section 4)
-- ============================================
EXEC tSQLt.Run 'GetOrdersForYearTests';


-- ============================================
-- 10. The deliberate mistake: <= on the end of the range (Section 5)
-- ============================================
CREATE OR ALTER PROCEDURE dbo.GetOrdersForYear
    @Year INT
AS
BEGIN
    SELECT OrderID, CustomerID, TotalAmount
    FROM dbo.Orders
    WHERE OrderDate >= DATEFROMPARTS(@Year, 1, 1)
      AND OrderDate <= DATEFROMPARTS(@Year + 1, 1, 1);
END;
GO


-- ============================================
-- 11. Run the tests: expect the "day either side" test to fail (Section 5)
-- The failure shows the 2026-01-01 order as an unexpected row. [CHECK]
-- ============================================
EXEC tSQLt.Run 'GetOrdersForYearTests';


-- ============================================
-- 12. The correct fix: < on the end of the range (Section 5)
-- ============================================
CREATE OR ALTER PROCEDURE dbo.GetOrdersForYear
    @Year INT
AS
BEGIN
    SELECT OrderID, CustomerID, TotalAmount
    FROM dbo.Orders
    WHERE OrderDate >= DATEFROMPARTS(@Year, 1, 1)
      AND OrderDate <  DATEFROMPARTS(@Year + 1, 1, 1);
END;
GO


-- ============================================
-- 13. Run the tests again: expect 4 passes (Section 5)
-- ============================================
EXEC tSQLt.Run 'GetOrdersForYearTests';


-- ============================================
-- 14. The proof: run the fixed procedure on the real table (Section 6)
-- Keep the actual execution plan on. Expect an Index Seek. [CHECK]
-- ============================================
SET STATISTICS TIME ON;

EXEC dbo.GetOrdersForYear @Year = 2025;


-- ============================================
-- Reset for another take
-- Drops the tests and restores the original slow procedure.
-- Run the whole block, then start again from section 2.
-- [CHECK: confirm tSQLt.DropClass is the right command]
-- ============================================
EXEC tSQLt.DropClass 'GetOrdersForYearTests';
GO

CREATE OR ALTER PROCEDURE dbo.GetOrdersForYear
    @Year INT
AS
BEGIN
    SELECT OrderID, CustomerID, TotalAmount
    FROM dbo.Orders
    WHERE YEAR(OrderDate) = @Year;
END;
GO
