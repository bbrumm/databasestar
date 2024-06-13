ALTER PROCEDURE DivideTwoNumbers
	@topNumber INT,
	@bottomNumber INT,
	@returnedValue INT OUTPUT
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		SET @returnedValue = @topNumber / @bottomNumber;
	END TRY
	BEGIN CATCH
		EXECUTE LogError;
	END CATCH
END;