/*
Original cursor
*/


--FOR cursor that returns 1 row
DECLARE
    CURSOR c_customers IS
        SELECT customer_id, first_name, last_name, max_credit
        FROM customer
        WHERE customer_id = 135;

BEGIN
    FOR customer_rec IN c_customers
    LOOP
        dbms_output.put_line('Name: ' ||
        customer_rec.first_name || ' ' ||
        customer_rec.last_name);
    END LOOP;
END;

/*
Updated cursor
*/
DECLARE
    CURSOR c_customers IS
    SELECT first_name || ' ' last_name AS full_name
    FROM customer
    WHERE created_date = '30-JUN-2016';

    TYPE customer_tt IS TABLE OF c_customers%ROWTYPE INDEX BY PLS_INTEGER
    l_customers customer_tt;

BEGIN
    OPEN c_customers;
    LOOP
        FETCH c_customers
        BULK COLLECT INTO
        l_customers LIMIT 100;

        FOR indexnum IN i .. l_customers.COUNT LOOP
            dbms_output.put_line(l.customers(indexnum).full_name);
        END LOOP;
        EXIT WHEN c_customers%NOTFOUND;
    END LOOP;
    
    CLOSE c_customers;
END: