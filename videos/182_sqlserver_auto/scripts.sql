
CREATE TABLE cust_orders (
  cust_id INTEGER,
  order_date DATE,
  order_amount INTEGER
);


BULK INSERT dbo.cust_orders
FROM 'C:/Users/bbrum/databasestar/databasestar/videos/182_sqlserver_auto/cust_orders.csv'
WITH
(
  FIRSTROW=2,
  FIELDTERMINATOR =',',
  ROWTERMINATOR = '0x0a'
);