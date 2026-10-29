--------------------------------------------------------------------------
-- 02_seed_reference_data.sql
-- Populates the small lookup tables, plus a few throwaway "seed" tables
-- (first names, last names, cities, product name parts) that
-- 03_generate_bulk_data.sql uses to build realistic-looking rows.
--
-- The seed tables are not part of the "real" schema - drop them any time
-- after generation with 05_drop_all.sql, or leave them, they're harmless.
--------------------------------------------------------------------------

-- ===================== REGIONS / COUNTRIES =====================

INSERT INTO regions (region_id, region_name) VALUES (1, 'Oceania');
INSERT INTO regions (region_id, region_name) VALUES (2, 'Asia');
INSERT INTO regions (region_id, region_name) VALUES (3, 'Europe');
INSERT INTO regions (region_id, region_name) VALUES (4, 'Americas');

INSERT INTO countries (country_id, country_name, region_id) VALUES ('AU', 'Australia', 1);
INSERT INTO countries (country_id, country_name, region_id) VALUES ('NZ', 'New Zealand', 1);
INSERT INTO countries (country_id, country_name, region_id) VALUES ('SG', 'Singapore', 2);
INSERT INTO countries (country_id, country_name, region_id) VALUES ('JP', 'Japan', 2);
INSERT INTO countries (country_id, country_name, region_id) VALUES ('IN', 'India', 2);
INSERT INTO countries (country_id, country_name, region_id) VALUES ('GB', 'United Kingdom', 3);
INSERT INTO countries (country_id, country_name, region_id) VALUES ('DE', 'Germany', 3);
INSERT INTO countries (country_id, country_name, region_id) VALUES ('FR', 'France', 3);
INSERT INTO countries (country_id, country_name, region_id) VALUES ('US', 'United States', 4);
INSERT INTO countries (country_id, country_name, region_id) VALUES ('CA', 'Canada', 4);

-- ===================== PRODUCT CATEGORIES =====================

INSERT INTO product_categories (category_id, category_name) VALUES (1, 'Electronics');
INSERT INTO product_categories (category_id, category_name) VALUES (2, 'Home and Kitchen');
INSERT INTO product_categories (category_id, category_name) VALUES (3, 'Sports and Outdoors');
INSERT INTO product_categories (category_id, category_name) VALUES (4, 'Office Supplies');
INSERT INTO product_categories (category_id, category_name) VALUES (5, 'Toys and Games');
INSERT INTO product_categories (category_id, category_name) VALUES (6, 'Clothing');
INSERT INTO product_categories (category_id, category_name) VALUES (7, 'Health and Beauty');
INSERT INTO product_categories (category_id, category_name) VALUES (8, 'Books');

-- ===================== WAREHOUSES =====================

INSERT INTO warehouses (warehouse_id, warehouse_name, city, country_id) VALUES (1, 'Melbourne DC', 'Melbourne', 'AU');
INSERT INTO warehouses (warehouse_id, warehouse_name, city, country_id) VALUES (2, 'Sydney DC', 'Sydney', 'AU');
INSERT INTO warehouses (warehouse_id, warehouse_name, city, country_id) VALUES (3, 'Auckland DC', 'Auckland', 'NZ');
INSERT INTO warehouses (warehouse_id, warehouse_name, city, country_id) VALUES (4, 'Singapore DC', 'Singapore', 'SG');
INSERT INTO warehouses (warehouse_id, warehouse_name, city, country_id) VALUES (5, 'London DC', 'London', 'GB');
INSERT INTO warehouses (warehouse_id, warehouse_name, city, country_id) VALUES (6, 'Chicago DC', 'Chicago', 'US');

-- ===================== SALES REPS =====================

INSERT INTO sales_reps (sales_rep_id, first_name, last_name, email, hire_date, commission_pct) VALUES (1, 'Amelia', 'Nguyen', 'amelia.nguyen@corp.example', DATE '2019-03-14', 0.10);
INSERT INTO sales_reps (sales_rep_id, first_name, last_name, email, hire_date, commission_pct) VALUES (2, 'Liam', 'Carter', 'liam.carter@corp.example', DATE '2020-07-01', 0.08);
INSERT INTO sales_reps (sales_rep_id, first_name, last_name, email, hire_date, commission_pct) VALUES (3, 'Sophie', 'Bianchi', 'sophie.bianchi@corp.example', DATE '2018-11-20', 0.12);
INSERT INTO sales_reps (sales_rep_id, first_name, last_name, email, hire_date, commission_pct) VALUES (4, 'Noah', 'Kim', 'noah.kim@corp.example', DATE '2021-02-08', 0.07);
INSERT INTO sales_reps (sales_rep_id, first_name, last_name, email, hire_date, commission_pct) VALUES (5, 'Isla', 'Robertson', 'isla.robertson@corp.example', DATE '2022-05-30', 0.06);
INSERT INTO sales_reps (sales_rep_id, first_name, last_name, email, hire_date, commission_pct) VALUES (6, 'Ethan', 'Walsh', 'ethan.walsh@corp.example', DATE '2017-09-12', 0.15);

-- ===================== SEED TABLES (used for data generation only) =====================

CREATE TABLE seed_first_names (
    name_id     NUMBER,
    first_name  VARCHAR2(30)
);

CREATE TABLE seed_last_names (
    name_id    NUMBER,
    last_name  VARCHAR2(30)
);

CREATE TABLE seed_cities (
    city_id     NUMBER,
    city        VARCHAR2(50),
    country_id  CHAR(2)
);

CREATE TABLE seed_adjectives (
    word_id  NUMBER,
    word     VARCHAR2(30)
);

CREATE TABLE seed_nouns (
    word_id  NUMBER,
    word     VARCHAR2(30)
);

INSERT ALL
    INTO seed_first_names VALUES (1,'James')   INTO seed_first_names VALUES (2,'Olivia')
    INTO seed_first_names VALUES (3,'Lucas')   INTO seed_first_names VALUES (4,'Ava')
    INTO seed_first_names VALUES (5,'Henry')   INTO seed_first_names VALUES (6,'Mia')
    INTO seed_first_names VALUES (7,'Jack')    INTO seed_first_names VALUES (8,'Chloe')
    INTO seed_first_names VALUES (9,'Leo')     INTO seed_first_names VALUES (10,'Grace')
    INTO seed_first_names VALUES (11,'Oscar')  INTO seed_first_names VALUES (12,'Ruby')
    INTO seed_first_names VALUES (13,'Charlie')INTO seed_first_names VALUES (14,'Zoe')
    INTO seed_first_names VALUES (15,'Thomas') INTO seed_first_names VALUES (16,'Ella')
    INTO seed_first_names VALUES (17,'William')INTO seed_first_names VALUES (18,'Freya')
    INTO seed_first_names VALUES (19,'Daniel') INTO seed_first_names VALUES (20,'Isla')
    INTO seed_first_names VALUES (21,'Samuel') INTO seed_first_names VALUES (22,'Poppy')
    INTO seed_first_names VALUES (23,'Joseph') INTO seed_first_names VALUES (24,'Layla')
    INTO seed_first_names VALUES (25,'Arjun')  INTO seed_first_names VALUES (26,'Priya')
    INTO seed_first_names VALUES (27,'Kenji')  INTO seed_first_names VALUES (28,'Yui')
    INTO seed_first_names VALUES (29,'Marco')  INTO seed_first_names VALUES (30,'Elena')
SELECT * FROM dual;

INSERT ALL
    INTO seed_last_names VALUES (1,'Smith')     INTO seed_last_names VALUES (2,'Johnson')
    INTO seed_last_names VALUES (3,'Williams')  INTO seed_last_names VALUES (4,'Brown')
    INTO seed_last_names VALUES (5,'Taylor')    INTO seed_last_names VALUES (6,'Wilson')
    INTO seed_last_names VALUES (7,'Anderson')  INTO seed_last_names VALUES (8,'Clarke')
    INTO seed_last_names VALUES (9,'Walker')    INTO seed_last_names VALUES (10,'Harris')
    INTO seed_last_names VALUES (11,'Robinson') INTO seed_last_names VALUES (12,'Mitchell')
    INTO seed_last_names VALUES (13,'Campbell') INTO seed_last_names VALUES (14,'Roberts')
    INTO seed_last_names VALUES (15,'Nguyen')   INTO seed_last_names VALUES (16,'Patel')
    INTO seed_last_names VALUES (17,'Kim')      INTO seed_last_names VALUES (18,'Sato')
    INTO seed_last_names VALUES (19,'Rossi')    INTO seed_last_names VALUES (20,'Muller')
    INTO seed_last_names VALUES (21,'Dubois')   INTO seed_last_names VALUES (22,'Fraser')
    INTO seed_last_names VALUES (23,'Coleman')  INTO seed_last_names VALUES (24,'Chapman')
    INTO seed_last_names VALUES (25,'Hughes')   INTO seed_last_names VALUES (26,'Foster')
    INTO seed_last_names VALUES (27,'Bennett')  INTO seed_last_names VALUES (28,'Ward')
    INTO seed_last_names VALUES (29,'Simpson')  INTO seed_last_names VALUES (30,'Bianchi')
SELECT * FROM dual;

INSERT ALL
    INTO seed_cities VALUES (1,'Melbourne','AU')   INTO seed_cities VALUES (2,'Sydney','AU')
    INTO seed_cities VALUES (3,'Brisbane','AU')    INTO seed_cities VALUES (4,'Perth','AU')
    INTO seed_cities VALUES (5,'Adelaide','AU')    INTO seed_cities VALUES (6,'Auckland','NZ')
    INTO seed_cities VALUES (7,'Wellington','NZ')  INTO seed_cities VALUES (8,'Singapore','SG')
    INTO seed_cities VALUES (9,'Tokyo','JP')       INTO seed_cities VALUES (10,'Osaka','JP')
    INTO seed_cities VALUES (11,'Mumbai','IN')     INTO seed_cities VALUES (12,'Bengaluru','IN')
    INTO seed_cities VALUES (13,'London','GB')     INTO seed_cities VALUES (14,'Manchester','GB')
    INTO seed_cities VALUES (15,'Berlin','DE')     INTO seed_cities VALUES (16,'Munich','DE')
    INTO seed_cities VALUES (17,'Paris','FR')      INTO seed_cities VALUES (18,'Lyon','FR')
    INTO seed_cities VALUES (19,'New York','US')   INTO seed_cities VALUES (20,'Chicago','US')
    INTO seed_cities VALUES (21,'Austin','US')     INTO seed_cities VALUES (22,'Seattle','US')
    INTO seed_cities VALUES (23,'Toronto','CA')    INTO seed_cities VALUES (24,'Vancouver','CA')
    INTO seed_cities VALUES (25,'Canberra','AU')   INTO seed_cities VALUES (26,'Hobart','AU')
    INTO seed_cities VALUES (27,'Christchurch','NZ')INTO seed_cities VALUES (28,'Kyoto','JP')
    INTO seed_cities VALUES (29,'Delhi','IN')      INTO seed_cities VALUES (30,'Bristol','GB')
SELECT * FROM dual;

INSERT ALL
    INTO seed_adjectives VALUES (1,'Wireless')   INTO seed_adjectives VALUES (2,'Compact')
    INTO seed_adjectives VALUES (3,'Portable')   INTO seed_adjectives VALUES (4,'Premium')
    INTO seed_adjectives VALUES (5,'Ergonomic')  INTO seed_adjectives VALUES (6,'Stainless')
    INTO seed_adjectives VALUES (7,'Rechargeable')INTO seed_adjectives VALUES (8,'Adjustable')
    INTO seed_adjectives VALUES (9,'Heavy-Duty') INTO seed_adjectives VALUES (10,'Foldable')
    INTO seed_adjectives VALUES (11,'Insulated') INTO seed_adjectives VALUES (12,'Waterproof')
    INTO seed_adjectives VALUES (13,'Digital')   INTO seed_adjectives VALUES (14,'Classic')
    INTO seed_adjectives VALUES (15,'Ultra-Light')INTO seed_adjectives VALUES (16,'Bluetooth')
    INTO seed_adjectives VALUES (17,'Organic')   INTO seed_adjectives VALUES (18,'Recycled')
    INTO seed_adjectives VALUES (19,'Deluxe')    INTO seed_adjectives VALUES (20,'Standard')
SELECT * FROM dual;

INSERT ALL
    INTO seed_nouns VALUES (1,'Mouse')        INTO seed_nouns VALUES (2,'Keyboard')
    INTO seed_nouns VALUES (3,'Water Bottle') INTO seed_nouns VALUES (4,'Backpack')
    INTO seed_nouns VALUES (5,'Desk Lamp')    INTO seed_nouns VALUES (6,'Notebook')
    INTO seed_nouns VALUES (7,'Headphones')   INTO seed_nouns VALUES (8,'Chair')
    INTO seed_nouns VALUES (9,'Monitor Stand')INTO seed_nouns VALUES (10,'Tent')
    INTO seed_nouns VALUES (11,'Blender')     INTO seed_nouns VALUES (12,'Yoga Mat')
    INTO seed_nouns VALUES (13,'Charger')     INTO seed_nouns VALUES (14,'Speaker')
    INTO seed_nouns VALUES (15,'Pen Set')     INTO seed_nouns VALUES (16,'Board Game')
    INTO seed_nouns VALUES (17,'Jacket')      INTO seed_nouns VALUES (18,'Sunglasses')
    INTO seed_nouns VALUES (19,'Water Filter')INTO seed_nouns VALUES (20,'Hiking Poles')
    INTO seed_nouns VALUES (21,'Camera Mount')INTO seed_nouns VALUES (22,'Toolkit')
    INTO seed_nouns VALUES (23,'Picture Frame')INTO seed_nouns VALUES (24,'Storage Bin')
    INTO seed_nouns VALUES (25,'Coffee Mug')  INTO seed_nouns VALUES (26,'Bike Lock')
    INTO seed_nouns VALUES (27,'Cutting Board')INTO seed_nouns VALUES (28,'Desk Organizer')
    INTO seed_nouns VALUES (29,'Reading Lamp')INTO seed_nouns VALUES (30,'Travel Pillow')
SELECT * FROM dual;

COMMIT;

PROMPT Reference and seed data loaded successfully.
