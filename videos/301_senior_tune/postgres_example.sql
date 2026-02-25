SELECT * FROM customer;

SELECT  c.customer_id,
c.first_name,
c.last_name,
i.invoice_id,
i.invoice_date,
i.total
FROM customer c
INNER JOIN invoice i on c.customer_id = i.customer_id
WHERE i.invoice_date >= '2023-03-01'
AND i.invoice_date < '2023-03-31'
AND c.customer_id = 1;



CREATE INDEX idx_invoice_invdate ON invoice (invoice_date);
