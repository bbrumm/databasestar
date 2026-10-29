-- =====================================================================
-- Video 348: How I Redesigned a Database With 2,241 Tables
-- Script 3 of 4: Migrate the 2,241 client_ tables into the new schema
--
-- Run after Scripts 1 and 2. Run each step separately, in order, and
-- look at the results before moving on. Auto-commit ON.
-- =====================================================================


-- ---------------------------------------------------------------------
-- STEP 1: Load everything into a staging table
-- ---------------------------------------------------------------------

CREATE TABLE client_staging (
  client_id INT PRIMARY KEY,
  data JSONB NOT NULL,
  notes TEXT
);

-- The regular expression matches client_ followed by digits only.
-- LIKE 'client_%' would also match client_staging, because _ is a
-- wildcard in LIKE.
-- to_jsonb(t) turns the whole row into JSON, so ->> 'notes' returns the
-- notes column for tables that have one, and NULL for tables that don't.
-- The primary key on client_id fails if any table has more than one row.
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
      'INSERT INTO client_staging (client_id, data, notes)
       SELECT %s, t.data::jsonb, to_jsonb(t) ->> ''notes'' FROM %I t',
      substring(t.table_name FROM '[0-9]+'),
      t.table_name
    );
  END LOOP;
END $$;

-- Should return 2241
SELECT COUNT(*) FROM client_staging;


-- ---------------------------------------------------------------------
-- STEP 2: Check the JSON before trusting it
-- ---------------------------------------------------------------------

-- Which keys appear, and in how many clients?
-- If the data were consistent, every key would appear 2,241 times.
SELECT k AS json_key, COUNT(*) AS client_count
FROM client_staging
CROSS JOIN LATERAL jsonb_object_keys(data) AS k
GROUP BY k
ORDER BY client_count DESC;

-- Which tables have more than one column?
SELECT table_name, COUNT(*) AS column_count
FROM information_schema.columns
WHERE table_schema = 'public'
AND table_name ~ '^client_[0-9]+$'
GROUP BY table_name
HAVING COUNT(*) > 1
ORDER BY table_name;

-- Which study codes are stored with more than one name?
SELECT e ->> 'study_code' AS study_code,
  COUNT(DISTINCT e ->> 'study_name') AS name_count
FROM client_staging
CROSS JOIN LATERAL jsonb_array_elements(data -> 'enrolments') AS e
GROUP BY e ->> 'study_code'
HAVING COUNT(DISTINCT e ->> 'study_name') > 1;

-- What are the names, and how many clients use each one?
SELECT e ->> 'study_code' AS study_code,
  e ->> 'study_name' AS study_name,
  COUNT(*) AS enrolment_count
FROM client_staging
CROSS JOIN LATERAL jsonb_array_elements(data -> 'enrolments') AS e
WHERE e ->> 'study_code' = 'DIAB-2020'
GROUP BY e ->> 'study_code', e ->> 'study_name';

-- Fix: pick the correct name and update the staging data, so the
-- study table only gets one name per code.
UPDATE client_staging
SET data = jsonb_set(
  data,
  '{enrolments}',
  (SELECT jsonb_agg(
     CASE WHEN e ->> 'study_code' = 'DIAB-2020'
          THEN jsonb_set(e, '{study_name}', '"Type 2 Diabetes Prevention Study"')
          ELSE e END)
   FROM jsonb_array_elements(data -> 'enrolments') AS e)
)
WHERE data -> 'enrolments' @> '[{"study_code": "DIAB-2020"}]';

-- Run the name check again: it should return no rows now
SELECT e ->> 'study_code' AS study_code,
  COUNT(DISTINCT e ->> 'study_name') AS name_count
FROM client_staging
CROSS JOIN LATERAL jsonb_array_elements(data -> 'enrolments') AS e
GROUP BY e ->> 'study_code'
HAVING COUNT(DISTINCT e ->> 'study_name') > 1;


-- ---------------------------------------------------------------------
-- STEP 3: Insert into the new tables
-- ---------------------------------------------------------------------

-- Run this after the day's 3 AM job has run, then turn the cron job off.
-- A date minus a number of days gives a date, which reverses what the
-- cron job did.
INSERT INTO client (client_id, first_name, last_name, date_of_birth, sex, email, phone, notes)
SELECT
  client_id,
  data ->> 'first_name',
  COALESCE(data ->> 'last_name', data ->> 'surname'),
  CURRENT_DATE - (data ->> 'days_since_birth')::INT,
  data ->> 'sex',
  data ->> 'email',
  data ->> 'phone',
  notes
FROM client_staging;

-- Move the ID counter past the highest existing ID
SELECT setval(
  pg_get_serial_sequence('client', 'client_id'),
  (SELECT MAX(client_id) FROM client)
);

INSERT INTO study (study_code, study_name)
SELECT DISTINCT
  e ->> 'study_code',
  e ->> 'study_name'
FROM client_staging
CROSS JOIN LATERAL jsonb_array_elements(data -> 'enrolments') AS e;

INSERT INTO enrolment (client_id, study_id, enrolled_date, status)
SELECT
  cs.client_id,
  s.study_id,
  (e ->> 'enrolled_date')::DATE,
  e ->> 'status'
FROM client_staging cs
CROSS JOIN LATERAL jsonb_array_elements(cs.data -> 'enrolments') AS e
INNER JOIN study s ON s.study_code = e ->> 'study_code';


-- ---------------------------------------------------------------------
-- STEP 4: Validate
-- ---------------------------------------------------------------------

-- Row counts: both should be 2241
SELECT
  (SELECT COUNT(*) FROM client_staging) AS staged,
  (SELECT COUNT(*) FROM client) AS migrated;

-- Enrolment counts: both numbers should match
SELECT
  (SELECT SUM(jsonb_array_length(data -> 'enrolments')) FROM client_staging) AS staged_enrolments,
  (SELECT COUNT(*) FROM enrolment) AS migrated_enrolments;

-- Spot check: original JSON next to the new row
SELECT cs.data, cs.notes AS staged_notes, c.*
FROM client_staging cs
INNER JOIN client c ON c.client_id = cs.client_id
WHERE cs.client_id = 1042;

-- Spot check a client that used "surname" and one that had a notes column
SELECT cs.data, cs.notes AS staged_notes, c.*
FROM client_staging cs
INNER JOIN client c ON c.client_id = cs.client_id
WHERE cs.client_id IN (1056, 1064);

-- Impossible dates of birth: born in the future, or more than 120 years ago
SELECT client_id, first_name, last_name, date_of_birth
FROM client
WHERE date_of_birth > CURRENT_DATE
OR date_of_birth < CURRENT_DATE - INTERVAL '120 years';


-- ---------------------------------------------------------------------
-- STEP 5 (optional): Remove the old tables
-- Only once you're happy with the migration. Commits every 200 tables
-- to stay within PostgreSQL's lock limit.
-- ---------------------------------------------------------------------
/*
DO $$
DECLARE
  t RECORD;
  n INT := 0;
BEGIN
  FOR t IN
    SELECT table_name
    FROM information_schema.tables
    WHERE table_schema = 'public'
    AND table_name ~ '^client_[0-9]+$'
  LOOP
    EXECUTE format('DROP TABLE %I', t.table_name);
    n := n + 1;
    IF n % 200 = 0 THEN
      COMMIT;
    END IF;
  END LOOP;
END $$;

DROP TABLE client_staging;
*/
