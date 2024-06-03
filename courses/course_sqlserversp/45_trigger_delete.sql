CREATE TRIGGER DeletePerson
ON Application.People
AFTER DELETE
AS
	INSERT INTO dbo.PersonActivity (PersonID, FullName, DeletedDatetime, ActionPerformedss)
	SELECT PersonID, FullName, GETDATE(), 'Deleted'
	FROM Deleted;