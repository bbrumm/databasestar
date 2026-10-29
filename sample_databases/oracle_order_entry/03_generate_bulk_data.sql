--------------------------------------------------------------------------
-- 03_generate_bulk_data.sql
-- Set-based data generation - fast even at large row counts, because it
-- avoids row-by-row PL/SQL loops in favour of single INSERT...SELECT
-- statements. Adjust the four variables below to control scale.
--
-- Guide for scale (rough, depends on your laptop):
--   Small (fast, good for correctness checks):   customers=1000,  orders=5000
--   Medium (good for most performance demos):    customers=20000, orders=200000
--   Large (index vs full-scan is very obvious):  customers=100000,orders=2000000
--
-- Run 01_create_schema.sql and 02_seed_reference_data.sql first.
--------------------------------------------------------------------------

DECLARE
    v_customer_count   NUMBER := 100000;   -- rows in CUSTOMERS 20000
    v_product_count    NUMBER := 2000;    -- rows in PRODUCTS
    v_order_count      NUMBER := 2000000;  -- rows in ORDERS
    v_max_items        NUMBER := 5;       -- max line items per order
                                           -- (ORDER_ITEMS ends up roughly
                                           --  v_order_count * (v_max_items/2) rows)
    v_country_count    NUMBER := 10;
    v_warehouse_count  NUMBER := 6;
    v_sales_rep_count  NUMBER := 6;
    v_category_count   NUMBER := 8;
    v_name_count       NUMBER := 30;
    v_adj_count        NUMBER := 20;
    v_noun_count       NUMBER := 30;
BEGIN

    ----------------------------------------------------------------------
    -- CUSTOMERS
    ----------------------------------------------------------------------
    INSERT INTO customers (customer_id, first_name, last_name, email, phone,
                            country_id, city, credit_limit, created_date)
    SELECT
        seq_customer_id.NEXTVAL,
        fn.first_name,
        ln.last_name,
        LOWER(fn.first_name) || '.' || LOWER(ln.last_name) || '.' || g.rn || '@example.com',
        '+61 4' || LPAD(TRUNC(DBMS_RANDOM.VALUE(10000000, 99999999)), 8, '0'),
        c.country_id,
        c.city,
        ROUND(DBMS_RANDOM.VALUE(500, 20000), 2),
        TRUNC(SYSDATE) - TRUNC(DBMS_RANDOM.VALUE(1, 1825))
    FROM (SELECT LEVEL AS rn FROM dual CONNECT BY LEVEL <= v_customer_count) g
    JOIN seed_first_names fn ON fn.name_id = MOD(g.rn, v_name_count) + 1
    JOIN seed_last_names  ln ON ln.name_id = MOD(TRUNC(g.rn / 3), v_name_count) + 1
    JOIN seed_cities      c  ON c.city_id  = MOD(TRUNC(g.rn / 7), 30) + 1;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Customers inserted: ' || v_customer_count);
--END;

    ----------------------------------------------------------------------
    -- PRODUCTS
    ----------------------------------------------------------------------
    INSERT INTO products (product_id, product_name, category_id, unit_price,
                           warehouse_id, status)
    SELECT
        seq_product_id.NEXTVAL,
        adj.word || ' ' || noun.word,
        MOD(g.rn, v_category_count) + 1,
        ROUND(DBMS_RANDOM.VALUE(5, 500), 2),
        MOD(g.rn, v_warehouse_count) + 1,
        CASE WHEN MOD(g.rn, 20) = 0 THEN 'DISCONTINUED' ELSE 'ACTIVE' END
    FROM (SELECT LEVEL AS rn FROM dual CONNECT BY LEVEL <= v_product_count) g
    JOIN seed_adjectives adj ON adj.word_id = MOD(g.rn, v_adj_count) + 1
    JOIN seed_nouns      noun ON noun.word_id = MOD(TRUNC(g.rn / 2), v_noun_count) + 1;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Products inserted: ' || v_product_count);



    ----------------------------------------------------------------------
    -- ORDERS
    -- order_date spread over the last 2 years, status weighted so most
    -- orders are DELIVERED (more realistic than an even split).
    ----------------------------------------------------------------------
    INSERT INTO orders (order_id, customer_id, sales_rep_id, warehouse_id,
                         order_date, status, order_total)
    SELECT
        seq_order_id.NEXTVAL,
        MOD(g.rn, v_customer_count) + 1,
        MOD(g.rn, v_sales_rep_count) + 1,
        MOD(g.rn, v_warehouse_count) + 1,
        TRUNC(SYSDATE) - TRUNC(DBMS_RANDOM.VALUE(1, 730)),
        CASE
            WHEN MOD(g.rn, 20) = 0 THEN 'CANCELLED'
            WHEN MOD(g.rn, 5)  = 0 THEN 'PENDING'
            WHEN MOD(g.rn, 3)  = 0 THEN 'SHIPPED'
            ELSE 'DELIVERED'
        END,
        0
    FROM (SELECT LEVEL AS rn FROM dual CONNECT BY LEVEL <= v_order_count) g;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Orders inserted: ' || v_order_count);

    ----------------------------------------------------------------------
    -- ORDER_ITEMS
    -- Cross join each order with a small "line number" generator (max
    -- v_max_items rows), then cap how many lines each order actually gets
    -- using MOD(order_id, v_max_items)+1. This keeps the whole thing
    -- set-based instead of a recursive per-order loop.
    ----------------------------------------------------------------------
    INSERT INTO order_items (order_id, line_item_id, product_id, unit_price,
                              quantity, discount)
    SELECT
        o.order_id,
        ln.lvl,
        MOD(o.order_id + ln.lvl, v_product_count) + 1,
        p.unit_price,
        TRUNC(DBMS_RANDOM.VALUE(1, 10)),
        ROUND(DBMS_RANDOM.VALUE(0, 0.15), 2)
    FROM orders o
    JOIN (SELECT LEVEL AS lvl FROM dual CONNECT BY LEVEL <= v_max_items) ln
        ON ln.lvl <= MOD(o.order_id, v_max_items) + 1
    JOIN products p
        ON p.product_id = MOD(o.order_id + ln.lvl, v_product_count) + 1;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Order items inserted.');

    ----------------------------------------------------------------------
    -- Roll up ORDER_ITEMS totals back onto ORDERS.ORDER_TOTAL
    ----------------------------------------------------------------------
    MERGE INTO orders o
    USING (
        SELECT order_id, SUM(quantity * unit_price * (1 - discount)) AS tot
        FROM order_items
        GROUP BY order_id
    ) x
    ON (o.order_id = x.order_id)
    WHEN MATCHED THEN UPDATE SET o.order_total = ROUND(x.tot, 2);

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Order totals rolled up. Done.');

END;
/
