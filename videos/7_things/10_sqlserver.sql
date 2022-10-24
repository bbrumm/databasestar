/*
SQL Server
*/

CREATE TABLE product (
  product_id INT IDENTITY (1, 1) PRIMARY KEY,
  product_name VARCHAR(200),
  price INT
);
