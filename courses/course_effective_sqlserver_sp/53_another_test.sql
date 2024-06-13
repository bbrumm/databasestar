CREATE PROCEDURE testDivideTwoNumbers.[test another set of numbers]
AS
BEGIN
	DECLARE @actualResult INT;
	DECLARE @expectedResult INT;
	DECLARE @topNumber INT;
	DECLARE @bottomNumber INT;
	SET @topNumber = 14;
	SET @bottomNumber = 2;

	EXECUTE dbo.DivideTwoNumbers @topNumber, @bottomNumber, @actualResult OUTPUT
	SET @expectedResult = 70;

	EXEC tSQLt.AssertEquals @expectedResult, @actualResult


END;
GO

EXEC tSQLt.Run 'testDivideTwoNumbers';



CREATE PROCEDURE testDivideTwoNumbers.[test bottom number is zero]
AS
BEGIN
	DECLARE @actualResult INT;
	DECLARE @expectedResult INT;
	DECLARE @topNumber INT;
	DECLARE @bottomNumber INT;
	SET @topNumber = 14;
	SET @bottomNumber = 0;

	EXECUTE dbo.DivideTwoNumbers @topNumber, @bottomNumber, @actualResult OUTPUT
	SET @expectedResult = 0;

	EXEC tSQLt.AssertEquals @expectedResult, @actualResult


END;
GO