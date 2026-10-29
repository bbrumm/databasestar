-- ============================================================
-- sensor_readings — bulk insert script
-- ============================================================
-- Change total_rows to control how many rows are inserted:
--   1000000  =  1 million rows  (starting demo)
--   10000000 = 10 million rows  (middle of demo)
--   25000000 = 25 million rows  (full demo)
--
-- The script inserts in batches of 500,000 rows and prints
-- progress after each batch.
-- ============================================================

DO $$
DECLARE
    total_rows  BIGINT := 5000000;  -- change this
    batch_size  INT    := 500000;
    inserted    BIGINT := 0;
    this_batch  INT;
BEGIN
    WHILE inserted < total_rows LOOP

        this_batch := LEAST(batch_size, total_rows - inserted);

        INSERT INTO sensor_readings (recorded_at, device_id, temperature, humidity)
        SELECT
            NOW() - (random() * INTERVAL '730 days'),   -- random timestamp over last 2 years
            (random() * 99 + 1)::INT,                   -- device_id between 1 and 100
            (random() * 20 + 15)::NUMERIC(5,2),         -- temperature between 15.00 and 35.00
            (random() * 70 + 20)::NUMERIC(5,2)          -- humidity between 20.00 and 90.00
        FROM generate_series(1, this_batch);

        inserted := inserted + this_batch;
        RAISE NOTICE 'Inserted % / % rows', inserted, total_rows;

    END LOOP;
END $$;


COMMIT;