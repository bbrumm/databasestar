CREATE TABLE products (
  product_id NUMBER PRIMARY KEY,
  product_name VARCHAR2(200),
  price NUMBER,
  created_on DATE,
  updated_on DATE
);

INSERT INTO products (product_id, product_name, price, created_on, updated_on)
VALUES (1, 'Desk', 250, SYSDATE, NULL);
INSERT INTO products (product_id, product_name, price, created_on, updated_on)
VALUES (2, 'Couch', 300, SYSDATE, NULL);
INSERT INTO products (product_id, product_name, price, created_on, updated_on)
VALUES (3, 'Queen Bed', 500 , SYSDATE, NULL);
INSERT INTO products (product_id, product_name, price, created_on, updated_on)
VALUES (4, 'Dining Table', 120, SYSDATE, NULL);

SELECT *
FROM products;

CREATE TABLE products_audit AS
SELECT product_id, product_name, price, created_on, updated_on
FROM products
WHERE 1=0;

/*
Create the trigger
*/

CREATE OR REPLACE TRIGGER ProductsAudit
AFTER UPDATE OR DELETE ON products
FOR EACH ROW
BEGIN

  INSERT INTO products_audit
  (product_id, product_name, price, created_on, updated_on)
  VALUES
  (:old.product_id, :old.product_name, :old.price, :old.created_on, :old.updated_on);
END;
