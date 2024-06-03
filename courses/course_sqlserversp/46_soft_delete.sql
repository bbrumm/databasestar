CREATE TRIGGER DeletePerson
ON Application.People
INSTEAD OF DELETE
AS
	UPDATE Application.People
	SET is_active = 0
	WHERE PersonID IN (
	  SELECT PersonID
	  FROM Deleted
	);