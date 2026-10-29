-- =====================================================================
-- Video 341 — Normalised schema
-- Run this in its own PostgreSQL database (e.g. `normalised_demo`),
-- separate from the EAV schema, since both designs use the table names
-- `products` and `categories`.
-- =====================================================================

-- ---------------------------------------------------------------------
-- 1. Tables
-- ---------------------------------------------------------------------

DROP TABLE IF EXISTS norm_products CASCADE;
DROP TABLE IF EXISTS norm_weights CASCADE;
DROP TABLE IF EXISTS norm_colours CASCADE;
DROP TABLE IF EXISTS norm_categories CASCADE;

CREATE TABLE norm_categories (
    category_id   SERIAL PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);

CREATE TABLE norm_weights (
    weight_id    SERIAL PRIMARY KEY,
    weight_value NUMERIC(6,2) NOT NULL
);

CREATE TABLE norm_colours (
    colour_id    SERIAL PRIMARY KEY,
    colour_value VARCHAR(50) NOT NULL
);

-- price stays a typed column; weight and colour point at their own
-- lookup tables, the same way category_id points at categories.
CREATE TABLE norm_products (
    product_id  SERIAL PRIMARY KEY,
    category_id INTEGER NOT NULL REFERENCES norm_categories(category_id),
    name        VARCHAR(200) NOT NULL,
    price       NUMERIC(10,2) NOT NULL,
    weight_id   INTEGER NOT NULL REFERENCES norm_weights(weight_id),
    colour_id   INTEGER NOT NULL REFERENCES norm_colours(colour_id)
);

-- ---------------------------------------------------------------------
-- 2. Sample data
--    Same volume as the EAV schema — 50,000 products — so the load
--    test and execution plans are comparing like with like.
-- ---------------------------------------------------------------------

INSERT INTO norm_categories (category_name) VALUES
    ('Electronics'),
    ('Clothing'),
    ('Home & Kitchen'),
    ('Sports & Outdoors'),
    ('Toys & Games'),
    ('Books'),
    ('Beauty'),
    ('Automotive'),
    ('Garden'),
    ('Office Supplies');

INSERT INTO norm_colours (colour_value) VALUES
    ('Black'),
    ('White'),
    ('Red'),
    ('Blue'),
    ('Green'),
    ('Yellow'),
    ('Grey'),
    ('Purple'),
    ('Orange'),
    ('Pink');

-- 50 distinct weight values (kg), 0.10 - 2.55
INSERT INTO norm_weights (weight_value)
SELECT ROUND((0.1 + (n * 0.05))::numeric, 2)
FROM generate_series(1, 50) AS n;

INSERT INTO norm_products (category_id, name, price, weight_id, colour_id)
SELECT
    (1 + floor(random() * 10))::int,
    'Product ' || n,
    ROUND((5 + random() * 495)::numeric, 2),
    (1 + floor(random() * 50))::int,
    (1 + floor(random() * 10))::int
FROM generate_series(1, 50000) AS n;

-- ---------------------------------------------------------------------
-- 3. Refresh planner statistics so EXPLAIN ANALYZE reflects real
--    row-count estimates rather than stale/default ones.
-- ---------------------------------------------------------------------

ANALYZE norm_categories;
ANALYZE norm_weights;
ANALYZE norm_colours;
ANALYZE norm_products;

-- Sanity check
-- SELECT count(*) FROM products;  -- expect 50,000
