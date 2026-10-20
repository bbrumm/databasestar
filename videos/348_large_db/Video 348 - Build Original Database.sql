-- =====================================================================
-- Video 348: How I Redesigned a Database With 2,241 Tables
-- Script 1 of 4: Build the original database
--
-- Rebuilds the database described in the r/programminghorror post
-- "DB with 2241 tables": one table per client, each with a single row
-- of JSON. The post didn't show the JSON contents, so the fields are a
-- reconstruction for a healthcare research client.
--
-- PostgreSQL 12+. Run in an empty database with auto-commit ON
-- (the default in DataGrip and psql). The block commits every 200
-- tables, because creating 2,241 tables in one transaction can exceed
-- PostgreSQL's lock table ("out of shared memory").
--
-- The data is random but reproducible (setseed), so every run gives the
-- same clients. Client 1042 (Emma Walsh) is fixed, as shown in the video.
--
-- Problems planted in the data, for the migration checks to find:
--   1. About 3% of clients use the key "surname" instead of "last_name".
--   2. Study code DIAB-2020 is stored with two different names.
--   3. 3 clients have impossible days_since_birth values
--      (2 negative = born in the future, 1 over 120 years).
--   4. 40 tables have a second column, "notes". The post said some
--      tables had a second column but not what it held, so this is an
--      assumption for the demo.
-- =====================================================================

DO $$
DECLARE
  first_names TEXT[] := ARRAY['James','Olivia','Liam','Charlotte','Noah','Amelia','Jack','Isla',
    'William','Mia','Oliver','Grace','Thomas','Chloe','Henry','Ruby','Lucas','Zoe','Ethan','Sophie',
    'Daniel','Hannah','Samuel','Emily','Michael','Lily','David','Ella','Matthew','Sarah','Peter',
    'Margaret','Robert','Susan','John','Helen','Paul','Karen','Mark','Julie'];
  last_names TEXT[] := ARRAY['Smith','Jones','Williams','Brown','Wilson','Taylor','Johnson','White',
    'Martin','Anderson','Thompson','Nguyen','Thomas','Walker','Harris','Lee','Ryan','Robinson',
    'Kelly','King','Davis','Wright','Evans','Roberts','Green','Hall','Wood','Jackson','Clarke',
    'Patel','Khan','Lewis','James','Phillips','Mitchell','Campbell','Murphy','Chen','Scott','Young'];
  study_codes TEXT[] := ARRAY['CARD-2019','DIAB-2020','SLEEP-2021','BONE-2018','RESP-2022','MIND-2023'];
  study_names TEXT[] := ARRAY['Cardiac Recovery Study','Type 2 Diabetes Prevention Study',
    'Sleep and Recovery Study','Bone Density in Ageing Adults','Respiratory Health Cohort',
    'Mindfulness and Blood Pressure Trial'];
  statuses TEXT[] := ARRAY['Active','Active','Active','Completed','Withdrawn'];
  v_id INT;
  v_name_idx INT;
  v_first TEXT;
  v_last TEXT;
  v_sex TEXT;
  v_days INT;
  v_enrolments JSON;
  v_data JSON;
BEGIN
  PERFORM setseed(0.348);

  FOR v_id IN 1001..3241 LOOP

    IF v_id = 1042 THEN
      -- The client shown in the video
      v_data := json_build_object(
        'first_name', 'Emma',
        'last_name', 'Walsh',
        'sex', 'F',
        'email', 'emma.walsh@example.com',
        'phone', '0412 555 018',
        'days_since_birth', 19850,
        'enrolments', json_build_array(json_build_object(
          'study_code', 'CARD-2019',
          'study_name', 'Cardiac Recovery Study',
          'enrolled_date', '2021-03-14',
          'status', 'Active'))
      );
    ELSE
      -- first_names alternates male (odd positions) and female (even positions)
      v_name_idx := 1 + floor(random() * array_length(first_names, 1))::INT;
      v_first := first_names[v_name_idx];
      v_last := last_names[1 + floor(random() * array_length(last_names, 1))::INT];
      v_sex := CASE WHEN v_name_idx % 2 = 0 THEN 'F' ELSE 'M' END;

      -- Ages between 18 and 85
      v_days := (18 * 365.25 + random() * 67 * 365.25)::INT;

      -- Planted problem 3: impossible day counts
      IF v_id IN (1777, 2650) THEN v_days := -1 * (3 + floor(random() * 40)::INT); END IF;
      IF v_id = 2318 THEN v_days := 47500; END IF;

      -- 0 to 3 enrolments per client, no duplicate studies
      SELECT COALESCE(json_agg(json_build_object(
          'study_code', study_codes[s],
          -- Planted problem 2: DIAB-2020 has a second spelling for about 1 in 4 clients
          'study_name', CASE WHEN s = 2 AND random() < 0.25
                             THEN 'T2 Diabetes Prevention Study'
                             ELSE study_names[s] END,
          'enrolled_date', to_char(DATE '2018-01-01' + floor(random() * 2900)::INT, 'YYYY-MM-DD'),
          'status', statuses[1 + floor(random() * 5)::INT]
        ) ORDER BY s), '[]'::json)
      INTO v_enrolments
      FROM (
        SELECT s FROM generate_series(1, 6) AS s
        ORDER BY random()
        LIMIT (CASE WHEN random() < 0.1 THEN 0
                    WHEN random() < 0.75 THEN 1
                    WHEN random() < 0.8 THEN 2
                    ELSE 3 END)
      ) picked;

      -- Planted problem 1: some clients use "surname" instead of "last_name"
      IF v_id % 33 = 0 THEN
        v_data := json_build_object(
          'first_name', v_first,
          'surname', v_last,
          'sex', v_sex,
          'email', lower(v_first || '.' || v_last || '.' || v_id || '@example.com'),
          'phone', '04' || lpad(floor(random() * 100000000)::TEXT, 8, '0'),
          'days_since_birth', v_days,
          'enrolments', v_enrolments);
      ELSE
        v_data := json_build_object(
          'first_name', v_first,
          'last_name', v_last,
          'sex', v_sex,
          'email', lower(v_first || '.' || v_last || '.' || v_id || '@example.com'),
          'phone', '04' || lpad(floor(random() * 100000000)::TEXT, 8, '0'),
          'days_since_birth', v_days,
          'enrolments', v_enrolments);
      END IF;
    END IF;

    -- One table per client, one row per table
    IF v_id % 56 = 0 THEN
      -- Planted problem 4: some tables have a second column (assumed to be notes)
      EXECUTE format('CREATE TABLE client_%s (data JSON, notes TEXT)', v_id);
      EXECUTE format('INSERT INTO client_%s (data, notes) VALUES (%L, %L)', v_id, v_data,
        (ARRAY['Prefers phone contact','Interpreter required for visits',
               'Moved interstate, check address','Consent re-signed after protocol change'])
          [1 + floor(random() * 4)::INT]);
    ELSE
      EXECUTE format('CREATE TABLE client_%s (data JSON)', v_id);
      EXECUTE format('INSERT INTO client_%s (data) VALUES (%L)', v_id, v_data);
    END IF;

    IF v_id % 200 = 0 THEN
      COMMIT;
    END IF;
  END LOOP;
END $$;

-- Check: should return 2241
SELECT COUNT(*) AS client_tables
FROM information_schema.tables
WHERE table_schema = 'video348'
AND table_name ~ '^client_[0-9]+$';



-- =====================================================================
-- For display only: what the 3 AM cron job runs every night.
-- Don't run this unless you want to age every client by 1 day.
-- =====================================================================
/*
DO $$
DECLARE
  t RECORD;
BEGIN
  FOR t IN
    SELECT table_name
    FROM information_schema.tables
    WHERE table_schema = 'public'
    AND table_name ~ '^client_[0-9]+$'
  LOOP
    EXECUTE format(
      'UPDATE %I SET data = jsonb_set(data::jsonb, ''{days_since_birth}'',
         to_jsonb((data::jsonb ->> ''days_since_birth'')::INT + 1))::json',
      t.table_name);
  END LOOP;
END $$;
*/
