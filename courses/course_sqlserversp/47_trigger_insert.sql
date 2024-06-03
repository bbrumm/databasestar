CREATE TRIGGER InsertPerson
ON Application.People
AFTER INSERT
AS
	INSERT INTO dbo.PersonActivity (PersonID, FullName, DeletedDatetime, ActionPerformed)
	SELECT PersonID, FullName, GETDATE(), 'Inserted'
	FROM Inserted;