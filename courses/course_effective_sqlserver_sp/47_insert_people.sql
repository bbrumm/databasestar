INSERT INTO Application.People (FullName, PreferredName, IsPermittedToLogon,
LogonName, IsExternalLogonProvider, HashedPassword, IsSystemUser, IsEmployee,
IsSalesperson, UserPreferences, PhoneNumber, FaxNumber, EmailAddress, 
Photo, CustomFields, LastEditedBy)
VALUES ('Sarah Jones', 'Sarah', 0, 'NO LOGON', 0, NULL, 0, 0, 0,
NULL, NULL, NULL, 'sarah@test.com', NULL, NULL, 1);


SELECT *
FROM Application.People
ORDER BY PersonID DESC;

SELECT *
FROM PersonActivity;