/*
Stored procedure for select
*/

CREATE PROCEDURE selectCustomer
AS
BEGIN
  SELECT id, name, is_active
  FROM customer;
END;

EXEC selectCustomer;

/*
Stored procedure for insert
*/

CREATE PROCEDURE insertCustomer(@customerName VARCHAR(100))
AS
BEGIN
  INSERT INTO customer (id, name, is_active)
  VALUES (4, @customerName, 1);
END;


EXEC insertCustomer;

EXEC insertCustomer 'DLP Shipping';

SELECT id, name, is_active
FROM customer;

/*
Stored procedure for update
*/

CREATE PROCEDURE updateCustomer(
    @newCustomerName VARCHAR(100),
    @customerID INT
)
AS
BEGIN
  UPDATE customer
  SET name = @newCustomerName
  WHERE id = @customerID;
END;

EXEC updateCustomer 'ABC Exports', 2;


SELECT id, name, is_active
FROM customer;

/*
Stored procedure for delete customer
*/

CREATE PROCEDURE deleteCustomer(@customerID INT)
AS
BEGIN
  DELETE FROM customer
  WHERE id = @customerID;
END;

EXEC deleteCustomer 8;

EXEC deleteCustomer 2;

SELECT id, name, is_active
FROM customer;