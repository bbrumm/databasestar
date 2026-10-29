SELECT COUNT(*) FROM orders;



SELECT COUNT(*) FROM customers;

SELECT * FROM customers;

SELECT * FROM orders;

EXPLAIN ANALYZE
SELECT order_id, customer_id, order_date, status
FROM orders
WHERE customer_id = 4;

--Before index: 1.38 s
--After index: 1.30 s

CREATE INDEX idx_orders_customer_id ON orders (customer_id);

DROP INDEX idx_orders_customer_id;


DO $$
DECLARE
    v_customer_ids integer[];
    v_method_ids   integer[];
    v_statuses     text[] := ARRAY['pending', 'processing', 'shipped', 'delivered', 'cancelled'];
BEGIN
    SELECT array_agg(customer_id) INTO v_customer_ids
    FROM test_data.customers;

    SELECT array_agg(shipping_method_id) INTO v_method_ids
    FROM test_data.shipping_method;

    INSERT INTO test_data.orders (customer_id, method_id, order_date, status)
    SELECT
        v_customer_ids[1 + (floor(random() * array_length(v_customer_ids, 1)))::int],
        v_method_ids[1  + (floor(random() * array_length(v_method_ids,   1)))::int],
        '2022-01-01'::date + (random() * 1095)::int,
        v_statuses[1 + (floor(random() * 5))::int]
    FROM generate_series(1, 10000);
END $$;


--Add customers

DO $$
DECLARE
    v_first_names text[] := ARRAY[
        'James', 'Mary', 'John', 'Patricia', 'Robert', 'Jennifer', 'Michael',
        'Linda', 'William', 'Barbara', 'David', 'Susan', 'Richard', 'Jessica',
        'Joseph', 'Sarah', 'Thomas', 'Karen', 'Charles', 'Lisa', 'Christopher',
        'Nancy', 'Daniel', 'Betty', 'Matthew', 'Margaret', 'Anthony', 'Sandra',
        'Mark', 'Ashley', 'Donald', 'Dorothy', 'Steven', 'Kimberly', 'Paul',
        'Emily', 'Andrew', 'Donna', 'Joshua', 'Michelle'
    ];
    v_last_names text[] := ARRAY[
        'Smith', 'Johnson', 'Williams', 'Brown', 'Jones', 'Garcia', 'Miller',
        'Davis', 'Rodriguez', 'Martinez', 'Hernandez', 'Lopez', 'Gonzalez',
        'Wilson', 'Anderson', 'Thomas', 'Taylor', 'Moore', 'Jackson', 'Martin',
        'Lee', 'Perez', 'Thompson', 'White', 'Harris', 'Sanchez', 'Clark',
        'Ramirez', 'Lewis', 'Robinson', 'Walker', 'Young', 'Allen', 'King',
        'Wright', 'Scott', 'Torres', 'Nguyen', 'Hill', 'Flores'
    ];
    v_domains text[] := ARRAY['gmail.com', 'outlook.com', 'yahoo.com', 'hotmail.com'];
    v_first   text;
    v_last    text;
    i         int;
BEGIN
    FOR i IN 1..100 LOOP
        v_first := v_first_names[1 + (floor(random() * array_length(v_first_names, 1)))::int];
        v_last  := v_last_names[1  + (floor(random() * array_length(v_last_names,  1)))::int];

        INSERT INTO test_data.customers (first_name, last_name, email)
        VALUES (
            v_first,
            v_last,
            lower(v_first) || '.' || lower(v_last) || i || '@'
                || v_domains[1 + (floor(random() * array_length(v_domains, 1)))::int]
        );
    END LOOP;
END $$;


