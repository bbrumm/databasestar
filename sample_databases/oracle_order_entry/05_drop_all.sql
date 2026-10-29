--------------------------------------------------------------------------
-- 05_drop_all.sql
-- Drops everything created by these scripts, so you can re-run from
-- scratch (e.g. with different scale settings).
-- Order matters: children before parents.
--------------------------------------------------------------------------

DROP TABLE order_items PURGE;
DROP TABLE orders PURGE;
DROP TABLE products PURGE;
DROP TABLE customers PURGE;
DROP TABLE sales_reps PURGE;
DROP TABLE warehouses PURGE;
DROP TABLE product_categories PURGE;
DROP TABLE countries PURGE;
DROP TABLE regions PURGE;

DROP TABLE seed_first_names PURGE;
DROP TABLE seed_last_names PURGE;
DROP TABLE seed_cities PURGE;
DROP TABLE seed_adjectives PURGE;
DROP TABLE seed_nouns PURGE;

DROP SEQUENCE seq_customer_id;
DROP SEQUENCE seq_product_id;
DROP SEQUENCE seq_order_id;
DROP SEQUENCE seq_sales_rep_id;

PROMPT All objects dropped.
