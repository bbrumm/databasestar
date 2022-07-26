SELECT c.customerid,
c.AccountNumber,
p.PersonType,
p.Title,
p.FirstName,
p.MiddleName,
p.LastName,
p.Suffix,
s.Name As storename
FROM sales.customer c
INNER JOIN person.person p ON c.personid = p.BusinessEntityID
INNER JOIN sales.store s ON c.storeid = s.BusinessEntityID

