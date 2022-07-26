
/*#Add 2500 orders*/
INSERT INTO dbo.cust_order (order_date, customer_id, shipping_method_id, dest_address_id)
SELECT TOP 2500
    DATEADD(ss, ABS(CHECKSUM(NEWID())) % (365 * 3 * 24 * 60 * 60) * -1, GETDATE()),
    c.customer_id,
    FLOOR(1 + RAND() * 4) AS shipping_method_id,
    ca.address_id
FROM dbo.customer c
INNER JOIN dbo.customer_address ca ON c.customer_id = ca.customer_id
ORDER BY NEWID();


/*#Add more orders*/
INSERT INTO dbo.cust_order (order_date, customer_id, shipping_method_id, dest_address_id)
SELECT TOP 1500
    DATEADD(ss, ABS(CHECKSUM(NEWID())) % (365 * 3 * 24 * 60 * 60) * -1, GETDATE()),
    c.customer_id,
    FLOOR(1 + RAND() * 4) AS shipping_method_id,
    ca.address_id
FROM dbo.customer c
INNER JOIN dbo.customer_address ca ON c.customer_id = ca.customer_id
ORDER BY NEWID();

INSERT INTO dbo.cust_order (order_date, customer_id, shipping_method_id, dest_address_id)
SELECT TOP 1200
    DATEADD(ss, ABS(CHECKSUM(NEWID())) % (365 * 3 * 24 * 60 * 60) * -1, GETDATE()),
    c.customer_id,
    FLOOR(1 + RAND() * 4) AS shipping_method_id,
    ca.address_id
FROM dbo.customer c
INNER JOIN dbo.customer_address ca ON c.customer_id = ca.customer_id
ORDER BY NEWID();

INSERT INTO dbo.cust_order (order_date, customer_id, shipping_method_id, dest_address_id)
SELECT TOP 900
    DATEADD(ss, ABS(CHECKSUM(NEWID())) % (365 * 3 * 24 * 60 * 60) * -1, GETDATE()),
    c.customer_id,
    FLOOR(1 + RAND() * 4) AS shipping_method_id,
    ca.address_id
FROM dbo.customer c
INNER JOIN dbo.customer_address ca ON c.customer_id = ca.customer_id
ORDER BY NEWID();

INSERT INTO dbo.cust_order (order_date, customer_id, shipping_method_id, dest_address_id)
SELECT TOP 600
    DATEADD(ss, ABS(CHECKSUM(NEWID())) % (365 * 3 * 24 * 60 * 60) * -1, GETDATE()),
    c.customer_id,
    FLOOR(1 + RAND() * 4) AS shipping_method_id,
    ca.address_id
FROM dbo.customer c
INNER JOIN dbo.customer_address ca ON c.customer_id = ca.customer_id
ORDER BY NEWID();

INSERT INTO dbo.cust_order (order_date, customer_id, shipping_method_id, dest_address_id)
SELECT TOP 400
    DATEADD(ss, ABS(CHECKSUM(NEWID())) % (365 * 3 * 24 * 60 * 60) * -1, GETDATE()),
    c.customer_id,
    FLOOR(1 + RAND() * 4) AS shipping_method_id,
    ca.address_id
FROM dbo.customer c
INNER JOIN dbo.customer_address ca ON c.customer_id = ca.customer_id
ORDER BY NEWID();

INSERT INTO dbo.cust_order (order_date, customer_id, shipping_method_id, dest_address_id)
SELECT TOP 300
    DATEADD(ss, ABS(CHECKSUM(NEWID())) % (365 * 3 * 24 * 60 * 60) * -1, GETDATE()),
    c.customer_id,
    FLOOR(1 + RAND() * 4) AS shipping_method_id,
    ca.address_id
FROM dbo.customer c
INNER JOIN dbo.customer_address ca ON c.customer_id = ca.customer_id
ORDER BY NEWID();


INSERT INTO dbo.cust_order (order_date, customer_id, shipping_method_id, dest_address_id)
SELECT TOP 100
    DATEADD(ss, ABS(CHECKSUM(NEWID())) % (365 * 3 * 24 * 60 * 60) * -1, GETDATE()),
    c.customer_id,
    FLOOR(1 + RAND() * 4) AS shipping_method_id,
    ca.address_id
FROM dbo.customer c
INNER JOIN dbo.customer_address ca ON c.customer_id = ca.customer_id
ORDER BY NEWID();

INSERT INTO dbo.cust_order (order_date, customer_id, shipping_method_id, dest_address_id)
SELECT TOP 50
    DATEADD(ss, ABS(CHECKSUM(NEWID())) % (365 * 3 * 24 * 60 * 60) * -1, GETDATE()),
    c.customer_id,
    FLOOR(1 + RAND() * 4) AS shipping_method_id,
    ca.address_id
FROM dbo.customer c
INNER JOIN dbo.customer_address ca ON c.customer_id = ca.customer_id
ORDER BY NEWID();
