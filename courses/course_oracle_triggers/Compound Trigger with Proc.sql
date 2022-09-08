CREATE OR REPLACE PROCEDURE find_row_count (
    p_customer_type IN VARCHAR2, p_credit_limit IN INTEGER, rowcount OUT INTEGER) IS
BEGIN
    SELECT COUNT(*)
    INTO rowcount
    FROM credit_limit
    WHERE customer_type = p_customer_type
    AND min_credit <= p_credit_limit
    AND max_credit > p_credit_limit;

END find_row_count;
/

--DROP TRIGGER cust_before_creditlimit;

CREATE OR REPLACE TRIGGER cust_before_creditlimit
FOR INSERT OR UPDATE OR DELETE ON customer
COMPOUND TRIGGER
	rowcount INTEGER;
	credit_range EXCEPTION;
    PRAGMA EXCEPTION_INIT (credit_range, -4099);
    
BEFORE EACH ROW IS
    BEGIN
        find_row_count(:new.customer_type, :new.credit_limit, rowcount);

        IF (rowcount = 0) THEN
            RAISE credit_range;
        END IF;
    
    EXCEPTION
        WHEN credit_range THEN
            Raise_application_error('-20010', 'Credit value is out of range for this customer type.');
    END BEFORE EACH ROW;

END cust_before_creditlimit;
/


UPDATE customer SET credit_limit = 8000 WHERE customer_id = 4;

