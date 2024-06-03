ALTER TABLE Purchasing.PurchaseOrders
ADD is_active INT DEFAULT 1;

UPDATE Purchasing.PurchaseOrders
SET is_active = 1;

SELECT *
FROM Purchasing.PurchaseOrders;


DELETE FROM Purchasing.PurchaseOrders
WHERE PurchaseOrderID = 4;

CREATE TRIGGER DeletePurchaseOrder
ON Purchasing.PurchaseOrders
INSTEAD OF DELETE
AS
	UPDATE Purchasing.PurchaseOrders
	SET is_active = 0
	WHERE PurchaseOrderID IN (
	  SELECT PurchaseOrderID
	  FROM Deleted
	);