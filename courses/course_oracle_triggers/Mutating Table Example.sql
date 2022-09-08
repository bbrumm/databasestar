--Trigger that causes Mutating Table error
--Rule: Credit limit can't be more than 10x the highest credit limit for any customer

DROP TRIGGER cust_before_creditlimit;

CREATE OR REPLACE TRIGGER cust_after_limitcheck
    AFTER UPDATE OR INSERT ON customer
    FOR EACH ROW
DECLARE
    max_credit_limit customer.credit_limit%TYPE;
BEGIN
    SELECT MAX(credit_limit) * 10
    INTO max_credit_limit
    FROM customer;
    
    IF :NEW.credit_limit > max_credit_limit THEN
        UPDATE customer
        SET credit_limit = max_credit_limit
        WHERE customer_id = :NEW.customer_id;
    END IF;
END;
/

SELECT * FROM customer;

--Update statement that causes error
UPDATE customer
SET credit_limit = 20000
WHERE customer_id = 4;

--Compound trigger to avoid error
CREATE OR REPLACE TRIGGER cust_after_limitcheck
    FOR UPDATE OR INSERT ON customer
    COMPOUND TRIGGER

        TYPE id_limit_rt IS RECORD (
            customer_id customer.customer_id%TYPE,
            credit_limit customer.credit_limit%TYPE
        );
        TYPE row_level_info_t IS TABLE OF id_limit_rt INDEX BY PLS_INTEGER;
        g_row_level_info row_level_info_t;
    
    AFTER EACH ROW IS
    BEGIN
        g_row_level_info(g_row_level_info.COUNT + 1).customer_id := :NEW.customer_id;
        g_row_level_info(g_row_level_info.COUNT).credit_limit := :NEW.credit_limit;
    
    END AFTER EACH ROW;
    
    AFTER STATEMENT IS
        max_credit_limit customer.credit_limit%TYPE;
    BEGIN
        SELECT MAX(credit_limit) * 10
        INTO max_credit_limit
        FROM customer;
        
        FOR idx IN 1 .. g_row_level_info.COUNT
        LOOP
            IF  g_row_level_info(idx).credit_limit > max_credit_limit THEN
                UPDATE customer
                SET credit_limit = max_credit_limit
                WHERE customer_id = g_row_level_info(idx).customer_id;
            END IF;
        END LOOP;
    END AFTER STATEMENT;
END;
/

--Same update statement as above
UPDATE customer
SET credit_limit = 50000
WHERE customer_id = 4;

SELECT * FROM customer;