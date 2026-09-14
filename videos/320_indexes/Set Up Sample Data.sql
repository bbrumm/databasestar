SELECT COUNT(*) FROM orders;

SELECT COUNT(*) FROM customers;

SELECT * FROM customers;

SELECT * FROM orders;

SELECT order_id, customer_id, order_date, status
FROM orders
WHERE customer_id = 4;



-- Assumes the PK of test_data.customers is customer_id
-- and the PK of test_data.shipping_method is method_id
-- Adjust those column names below if different

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