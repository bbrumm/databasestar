/*
Test script for SQL Server Stored Proc video
*/
DROP TABLE customer;

CREATE TABLE customer (
	id INT,
	name VARCHAR(100),
	is_active INT
);

INSERT INTO customer (id, name, is_active) VALUES
(1, 'XYZ Imports', 1),
(2, 'Wooden Treasures', 1),
(5, 'BM Electronics', 0),
(7, 'Super Mart', 1),
(12, 'Acme Inc', 1);