UPDATE Sales.Invoices
SET Comments = 'New comment'
WHERE InvoiceID = 97;

SELECT *
FROM Sales.Invoices
WHERE InvoiceID = 97;

SELECT * FROM Application.People
ORDER BY PersonID DESC;

