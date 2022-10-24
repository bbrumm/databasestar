/*
Temp Table - SQL Server
*/

CREATE TABLE #temp_customers (
id INT,
cust_name VARCHAR(100)
);


INSERT INTO #temp_customers (id, cust_name)
SELECT id, cust_name
FROM customer
WHERE cust_type = 'R';