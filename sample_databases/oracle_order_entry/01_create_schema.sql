--------------------------------------------------------------------------
-- 01_create_schema.sql
-- Creates an Order-Entry-style schema (Oracle OE, recreated from scratch)
-- Works via SQL*Plus or DataGrip - no substitution variables or prompts.
--
-- Tables:
--   REGIONS, COUNTRIES            (small lookup tables)
--   PRODUCT_CATEGORIES            (small lookup table)
--   WAREHOUSES                    (small lookup table)
--   SALES_REPS                    (small lookup table - "employees")
--   CUSTOMERS                     (scales to any size)
--   PRODUCTS                      (scales to any size)
--   ORDERS                        (scales to any size)
--   ORDER_ITEMS                   (scales largest - many rows per order)
--
-- Run this once per fresh schema/user. Run 05_drop_all.sql first if
-- re-running against a schema that already has these objects.
--------------------------------------------------------------------------

-- ===================== LOOKUP TABLES =====================

CREATE TABLE regions (
    region_id     NUMBER          NOT NULL,
    region_name   VARCHAR2(50)    NOT NULL,
    CONSTRAINT pk_regions PRIMARY KEY (region_id)
);

CREATE TABLE countries (
    country_id    CHAR(2)         NOT NULL,
    country_name  VARCHAR2(60)    NOT NULL,
    region_id     NUMBER          NOT NULL,
    CONSTRAINT pk_countries PRIMARY KEY (country_id),
    CONSTRAINT fk_countries_region FOREIGN KEY (region_id)
        REFERENCES regions (region_id)
);

CREATE TABLE product_categories (
    category_id     NUMBER        NOT NULL,
    category_name   VARCHAR2(50)  NOT NULL,
    CONSTRAINT pk_product_categories PRIMARY KEY (category_id)
);

CREATE TABLE warehouses (
    warehouse_id    NUMBER        NOT NULL,
    warehouse_name  VARCHAR2(50)  NOT NULL,
    city            VARCHAR2(50)  NOT NULL,
    country_id      CHAR(2)       NOT NULL,
    CONSTRAINT pk_warehouses PRIMARY KEY (warehouse_id),
    CONSTRAINT fk_warehouses_country FOREIGN KEY (country_id)
        REFERENCES countries (country_id)
);

CREATE TABLE sales_reps (
    sales_rep_id     NUMBER          NOT NULL,
    first_name       VARCHAR2(30)    NOT NULL,
    last_name        VARCHAR2(30)    NOT NULL,
    email            VARCHAR2(60)    NOT NULL,
    hire_date        DATE            NOT NULL,
    commission_pct   NUMBER(4,2)     NOT NULL,
    CONSTRAINT pk_sales_reps PRIMARY KEY (sales_rep_id)
);

-- ===================== SCALABLE TABLES =====================

CREATE TABLE customers (
    customer_id     NUMBER          NOT NULL,
    first_name      VARCHAR2(30)    NOT NULL,
    last_name       VARCHAR2(30)    NOT NULL,
    email           VARCHAR2(60)    NOT NULL,
    phone           VARCHAR2(20),
    country_id      CHAR(2)         NOT NULL,
    city            VARCHAR2(50)    NOT NULL,
    credit_limit    NUMBER(9,2)     NOT NULL,
    created_date    DATE            NOT NULL,
    CONSTRAINT pk_customers PRIMARY KEY (customer_id),
    CONSTRAINT fk_customers_country FOREIGN KEY (country_id)
        REFERENCES countries (country_id)
);

CREATE TABLE products (
    product_id      NUMBER          NOT NULL,
    product_name    VARCHAR2(100)   NOT NULL,
    category_id     NUMBER          NOT NULL,
    unit_price      NUMBER(9,2)     NOT NULL,
    warehouse_id    NUMBER          NOT NULL,
    status          VARCHAR2(12)    DEFAULT 'ACTIVE' NOT NULL,
    CONSTRAINT pk_products PRIMARY KEY (product_id),
    CONSTRAINT fk_products_category FOREIGN KEY (category_id)
        REFERENCES product_categories (category_id),
    CONSTRAINT fk_products_warehouse FOREIGN KEY (warehouse_id)
        REFERENCES warehouses (warehouse_id),
    CONSTRAINT ck_products_status CHECK (status IN ('ACTIVE','DISCONTINUED'))
);

CREATE TABLE orders (
    order_id        NUMBER          NOT NULL,
    customer_id     NUMBER          NOT NULL,
    sales_rep_id    NUMBER          NOT NULL,
    warehouse_id    NUMBER          NOT NULL,
    order_date      DATE            NOT NULL,
    status          VARCHAR2(15)    DEFAULT 'PENDING' NOT NULL,
    order_total     NUMBER(12,2)    DEFAULT 0,
    CONSTRAINT pk_orders PRIMARY KEY (order_id),
    CONSTRAINT fk_orders_customer FOREIGN KEY (customer_id)
        REFERENCES customers (customer_id),
    CONSTRAINT fk_orders_sales_rep FOREIGN KEY (sales_rep_id)
        REFERENCES sales_reps (sales_rep_id),
    CONSTRAINT fk_orders_warehouse FOREIGN KEY (warehouse_id)
        REFERENCES warehouses (warehouse_id),
    CONSTRAINT ck_orders_status CHECK (status IN ('PENDING','SHIPPED','DELIVERED','CANCELLED'))
);

CREATE TABLE order_items (
    order_id        NUMBER          NOT NULL,
    line_item_id    NUMBER          NOT NULL,
    product_id      NUMBER          NOT NULL,
    unit_price      NUMBER(9,2)     NOT NULL,
    quantity        NUMBER(6)       NOT NULL,
    discount        NUMBER(4,2)     DEFAULT 0,
    CONSTRAINT pk_order_items PRIMARY KEY (order_id, line_item_id),
    CONSTRAINT fk_order_items_order FOREIGN KEY (order_id)
        REFERENCES orders (order_id),
    CONSTRAINT fk_order_items_product FOREIGN KEY (product_id)
        REFERENCES products (product_id)
);

-- ===================== SEQUENCES =====================

CREATE SEQUENCE seq_customer_id   START WITH 1 INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE seq_product_id    START WITH 1 INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE seq_order_id      START WITH 1 INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE seq_sales_rep_id  START WITH 1 INCREMENT BY 1 NOCACHE;

-- ===================== INDEXES =====================
-- Foreign key columns are NOT auto-indexed in Oracle, so add the common ones.
-- A couple of columns are deliberately left unindexed (e.g. ORDERS.STATUS,
-- CUSTOMERS.CITY) - handy if your video wants to show a full table scan
-- before adding an index.

CREATE INDEX ix_customers_country   ON customers (country_id);
CREATE INDEX ix_products_category   ON products (category_id);
CREATE INDEX ix_products_warehouse  ON products (warehouse_id);
CREATE INDEX ix_orders_customer     ON orders (customer_id);
CREATE INDEX ix_orders_sales_rep    ON orders (sales_rep_id);
CREATE INDEX ix_orders_date         ON orders (order_date);
CREATE INDEX ix_order_items_product ON order_items (product_id);

PROMPT Schema created successfully.
