--Compound Trigger - Complex

ALTER TABLE customer ADD customer_type VARCHAR2(1);
ALTER TABLE customer ADD credit_limit NUMBER(8);

CREATE TABLE credit_limit (
	customer_type VARCHAR2(1),
	min_credit NUMBER(8),
	max_credit NUMBER(8)
);

INSERT INTO credit_limit (customer_type, min_credit, max_credit)
VALUES ('S', 0, 100);
INSERT INTO credit_limit (customer_type, min_credit, max_credit)
VALUES ('M', 100, 1000);
INSERT INTO credit_limit (customer_type, min_credit, max_credit)
VALUES ('L', 1000, 5000);

COMMIT;

SELECT *
FROM customer;

UPDATE customer SET credit_limit = 50, customer_type = 'S' WHERE customer_id = 1;
UPDATE customer SET credit_limit = 2000, customer_type = 'M' WHERE customer_id = 2;
UPDATE customer SET credit_limit = 8000, customer_type = 'L' WHERE customer_id = 4;
/*
Credit limits for each customer_type:
S 0 to 100
M 100 to 1000
L 1000 to 5000
*/
DROP TRIGGER cust_before_creditlimit;

CREATE OR REPLACE TRIGGER cust_before_creditlimit
FOR INSERT OR UPDATE OR DELETE ON customer
COMPOUND TRIGGER
	rowcount INTEGER;
	credit_range EXCEPTION;
    PRAGMA EXCEPTION_INIT (credit_range, -4099);
BEFORE EACH ROW IS
    BEGIN
        SELECT COUNT(*)
        INTO rowcount
        FROM credit_limit
        WHERE customer_type = :new.customer_type
        AND min_credit <= :new.credit_limit
        AND max_credit > :new.credit_limit;
    
        IF (rowcount = 0) THEN
            RAISE credit_range;
        END IF;
    
    EXCEPTION
        WHEN credit_range THEN
            Raise_application_error('-20010', 'Credit value is out of range for this customer type.');
    END BEFORE EACH ROW;

END cust_before_creditlimit;
/

SELECT *
FROM customer;

UPDATE customer SET credit_limit = 2500 WHERE customer_id = 4;

UPDATE customer SET credit_limit = 0 WHERE customer_id = 4;

UPDATE customer SET credit_limit = 8000 WHERE customer_id = 4;

