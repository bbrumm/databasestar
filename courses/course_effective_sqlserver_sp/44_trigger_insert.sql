CREATE TRIGGER UpdateInvoice
ON Sales.Invoices
AFTER UPDATE
AS
	UPDATE Sales.Invoices
	SET LastEditedWhen = GETDATE()
	WHERE InvoiceID IN (
		SELECT InvoiceID FROM Inserted
	);