CREATE TRIGGER DeletePerson
ON Application.People
AFTER DELETE
AS
	INSERT INTO dbo.PersonActivity (PersonID, FullName, DeletedDatetime)
	SELECT PersonID, FullName, GETDATE()
	FROM Deleted;