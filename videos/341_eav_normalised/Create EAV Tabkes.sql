
-- ---------------------------------------------------------------------
-- 1. Tables
-- ---------------------------------------------------------------------

DROP TABLE IF EXISTS eav_product_attributes CASCADE;
DROP TABLE IF EXISTS eav_products CASCADE;
DROP TABLE IF EXISTS eav_categories CASCADE;

CREATE TABLE eav_categories (
    category_id   SERIAL PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);

CREATE TABLE eav_products (
    product_id  SERIAL PRIMARY KEY,
    category_id INTEGER NOT NULL REFERENCES eav_categories(category_id),
    name        VARCHAR(200) NOT NULL
);

-- No typed columns for price/weight/colour — every attribute is a row here.
CREATE TABLE eav_product_attributes (
    product_id      INTEGER NOT NULL REFERENCES eav_products(product_id),
    attribute_name  VARCHAR(50) NOT NULL,
    attribute_value VARCHAR(100) NOT NULL
);

-- ---------------------------------------------------------------------
-- 2. Sample data
--    50,000 products x 3 attributes each = 150,000 rows in
--    product_attributes. Large enough that the sequential scan +
--    text filter + cast overhead shows up clearly in EXPLAIN ANALYZE.
--    Increase the generate_series bound below for an even bigger gap.
-- ---------------------------------------------------------------------

INSERT INTO eav_categories (category_name) VALUES
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

INSERT INTO eav_products (category_id, name)
SELECT
    (1 + floor(random() * 10))::int,
    'Product ' || n
FROM generate_series(1, 50000) AS n;

-- Price attribute (stored as text — needs a cast when queried as a number)
INSERT INTO eav_product_attributes (product_id, attribute_name, attribute_value)
SELECT
    product_id,
    'price',
    ROUND((5 + random() * 495)::numeric, 2)::text
FROM eav_products;

-- Weight attribute
INSERT INTO eav_product_attributes (product_id, attribute_name, attribute_value)
SELECT
    product_id,
    'weight',
    ROUND((0.1 + random() * 25)::numeric, 2)::text
FROM eav_products;

-- Colour attribute
INSERT INTO eav_product_attributes (product_id, attribute_name, attribute_value)
SELECT
    product_id,
    'colour',
    (ARRAY['Black','White','Red','Blue','Green','Yellow','Grey','Purple','Orange','Pink'])[1 + floor(random() * 10)]
FROM eav_products;

-- ---------------------------------------------------------------------
-- 3. Refresh planner statistics so EXPLAIN ANALYZE reflects real
--    row-count estimates rather than stale/default ones.
-- ---------------------------------------------------------------------

ANALYZE eav_categories;
ANALYZE eav_products;
ANALYZE eav_product_attributes;

-- Sanity checks
-- SELECT count(*) FROM products;            -- expect 50,000
-- SELECT count(*) FROM product_attributes;  -- expect 150,000
