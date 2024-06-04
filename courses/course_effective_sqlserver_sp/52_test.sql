EXECUTE tSQLt.NewTestClass 'testDivideTwoNumbers';
GO

CREATE PROCEDURE testDivideTwoNumbers.[test a whole number division]
AS
BEGIN
	DECLARE @actualResult INT;
	DECLARE @expectedResult INT;
	DECLARE @topNumber INT;
	DECLARE @bottomNumber INT;
	SET @topNumber = 10;
	SET @bottomNumber = 2;

	EXECUTE dbo.DivideTwoNumbers @topNumber, @bottomNumber, @actualResult OUTPUT
	SET @expectedResult = 5;

	EXECUTE tSQLt.AssertEquals @expectedResult, @actualResult


END;
GO

EXECUTE tSQLt.Run 'testDivideTwoNumbers';