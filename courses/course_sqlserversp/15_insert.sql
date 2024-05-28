CREATE PROCEDURE InsertPeopleSimple
	@fullName NVARCHAR(50),
	@preferredName NVARCHAR(50),
	@emailAddress NVARCHAR(256)
AS
BEGIN
  INSERT INTO Application.People (FullName, PreferredName, IsPermittedToLogon,
	LogonName, IsExternalLogonProvider, HashedPassword, IsSystemUser, IsEmployee,
	IsSalesperson, UserPreferences, PhoneNumber, FaxNumber, EmailAddress, 
	Photo, CustomFields, LastEditedBy)
	VALUES (@fullName, @preferredName, 0, 'NO LOGON', 0, NULL, 0, 0, 0,
	NULL, NULL, NULL, @emailAddress, NULL, NULL, 1);
END;

EXECUTE InsertPeopleSimple @fullName = 'Ben Brumm', @preferredName = 'Ben', @emailAddress = 'ben@test.com';

SELECT *
FROM Application.People
ORDER BY PersonID DESC;