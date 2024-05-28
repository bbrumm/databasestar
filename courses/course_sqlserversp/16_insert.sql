CREATE PROCEDURE UpdatePeopleContactDetails
	@personID INT,
	@phoneNumber NVARCHAR(20),
	@emailAddress NVARCHAR(256)
AS
BEGIN
	UPDATE Application.People
	SET PhoneNumber = @phoneNumber,
	EmailAddress = @emailAddress
	WHERE PersonID = @personID;
END;

EXECUTE UpdatePeopleContactDetails @personID = 3262, @phoneNumber = '212 555 1234', @emailAddress = 'ben@something.com';

SELECT *
FROM Application.People
WHERE PersonID = 3262;