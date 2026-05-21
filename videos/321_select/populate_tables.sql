-- ============================================================
-- PK Performance Test: Data Population Script
-- Inserts 10,000 / 100,000 / 1,000,000 rows into each table.
--
-- HOW TO USE
-- ----------
-- Set the :row_count variable before running, or use one of
-- the three ready-made blocks at the bottom of this script.
--
-- The label column is a random 12-character alphanumeric string.
-- The created_at column is a random timestamp within the last 5 years.
--
-- Run time at 1,000,000 rows will vary by machine. On a local
-- Postgres instance expect a few minutes per table.
-- ============================================================


-- ============================================================
-- Helper: random text generator
-- Returns a random alphanumeric string of the requested length.
-- Used to populate the label column.
-- ============================================================

CREATE OR REPLACE FUNCTION random_text(length INT)
RETURNS TEXT
LANGUAGE sql
AS $$
    SELECT STRING_AGG(
        SUBSTRING('abcdefghijklmnopqrstuvwxyz0123456789', CEIL(random() * 36)::INT, 1),
        ''
    )
    FROM generate_series(1, length);
$$;


-- ============================================================
-- Helper: random timestamp generator
-- Returns a random TIMESTAMPTZ somewhere in the last 5 years.
-- ============================================================

CREATE OR REPLACE FUNCTION random_timestamp()
RETURNS TIMESTAMPTZ
LANGUAGE sql
AS $$
    SELECT NOW() - (random() * INTERVAL '5 years');
$$;


-- ============================================================
-- INSERT BLOCKS
-- Uncomment the block for the volume you want to insert.
-- Each block truncates the tables first so results are clean
-- and not cumulative across runs.
-- ============================================================


-- ------------------------------------------------------------
-- 10,000 ROWS
-- ------------------------------------------------------------

/*
DO $$
BEGIN
    RAISE NOTICE 'Truncating tables...';
    TRUNCATE pk_test_int, pk_test_text, pk_test_uuidv4, pk_test_uuidv7;

    RAISE NOTICE 'Inserting 10,000 rows into pk_test_int...';
    INSERT INTO pk_test_int (label, created_at)
    SELECT
        random_text(12),
        random_timestamp()
    FROM generate_series(1, 10000);

    RAISE NOTICE 'Inserting 10,000 rows into pk_test_text...';
    INSERT INTO pk_test_text (id, label, created_at)
    SELECT
        gen_random_uuid()::TEXT,
        random_text(12),
        random_timestamp()
    FROM generate_series(1, 10000);

    RAISE NOTICE 'Inserting 10,000 rows into pk_test_uuidv4...';
    INSERT INTO pk_test_uuidv4 (label, created_at)
    SELECT
        random_text(12),
        random_timestamp()
    FROM generate_series(1, 10000);

    RAISE NOTICE 'Inserting 10,000 rows into pk_test_uuidv7...';
    INSERT INTO pk_test_uuidv7 (label, created_at)
    SELECT
        random_text(12),
        random_timestamp()
    FROM generate_series(1, 10000);

    RAISE NOTICE 'Done. 10,000 rows inserted into each table.';
END;
$$;
*/


-- ------------------------------------------------------------
-- 100,000 ROWS
-- ------------------------------------------------------------

/*
DO $$
BEGIN
    RAISE NOTICE 'Truncating tables...';
    TRUNCATE pk_test_int, pk_test_text, pk_test_uuidv4, pk_test_uuidv7;

    RAISE NOTICE 'Inserting 100,000 rows into pk_test_int...';
    INSERT INTO pk_test_int (label, created_at)
    SELECT
        random_text(12),
        random_timestamp()
    FROM generate_series(1, 100000);

    RAISE NOTICE 'Inserting 100,000 rows into pk_test_text...';
    INSERT INTO pk_test_text (id, label, created_at)
    SELECT
        gen_random_uuid()::TEXT,
        random_text(12),
        random_timestamp()
    FROM generate_series(1, 100000);

    RAISE NOTICE 'Inserting 100,000 rows into pk_test_uuidv4...';
    INSERT INTO pk_test_uuidv4 (label, created_at)
    SELECT
        random_text(12),
        random_timestamp()
    FROM generate_series(1, 100000);

    RAISE NOTICE 'Inserting 100,000 rows into pk_test_uuidv7...';
    INSERT INTO pk_test_uuidv7 (label, created_at)
    SELECT
        random_text(12),
        random_timestamp()
    FROM generate_series(1, 100000);

    RAISE NOTICE 'Done. 100,000 rows inserted into each table.';
END;
$$;
*/


-- ------------------------------------------------------------
-- 1,000,000 ROWS
-- Inserted in batches of 100,000 to avoid memory pressure
-- and keep progress visible in the console.
-- ------------------------------------------------------------


DO $$
DECLARE
    batch_size  INT := 100000;
    total_rows  INT := 1000000;
    batches     INT := total_rows / batch_size;
    i           INT;
BEGIN
    RAISE NOTICE 'Truncating tables...';
    TRUNCATE pk_test_int, pk_test_text, pk_test_uuidv4, pk_test_uuidv7;

    FOR i IN 1..batches LOOP

        RAISE NOTICE 'Batch % of % — inserting into pk_test_int...', i, batches;
        INSERT INTO pk_test_int (label, created_at)
        SELECT
            random_text(12),
            random_timestamp()
        FROM generate_series(1, batch_size);

        RAISE NOTICE 'Batch % of % — inserting into pk_test_text...', i, batches;
        INSERT INTO pk_test_text (id, label, created_at)
        SELECT
            gen_random_uuid()::TEXT,
            random_text(12),
            random_timestamp()
        FROM generate_series(1, batch_size);

        RAISE NOTICE 'Batch % of % — inserting into pk_test_uuidv4...', i, batches;
        INSERT INTO pk_test_uuidv4 (label, created_at)
        SELECT
            random_text(12),
            random_timestamp()
        FROM generate_series(1, batch_size);

        RAISE NOTICE 'Batch % of % — inserting into pk_test_uuidv7...', i, batches;
        INSERT INTO pk_test_uuidv7 (label, created_at)
        SELECT
            random_text(12),
            random_timestamp()
        FROM generate_series(1, batch_size);

    END LOOP;

    RAISE NOTICE 'Done. 1,000,000 rows inserted into each table.';
END;
$$;



-- ============================================================
-- VERIFY ROW COUNTS
-- Run this after any insert block to confirm the totals.
-- ============================================================

/*
SELECT 'pk_test_int'    AS table_name, COUNT(*) AS row_count FROM pk_test_int
UNION ALL
SELECT 'pk_test_text'   AS table_name, COUNT(*) AS row_count FROM pk_test_text
UNION ALL
SELECT 'pk_test_uuidv4' AS table_name, COUNT(*) AS row_count FROM pk_test_uuidv4
UNION ALL
SELECT 'pk_test_uuidv7' AS table_name, COUNT(*) AS row_count FROM pk_test_uuidv7;
*/
