-- =====================================================================
-- Video 348: How I Redesigned a Database With 2,241 Tables
-- Script 4 of 4: Queries shown in the video
-- =====================================================================


-- ---------------------------------------------------------------------
-- Demo 1.2: One client (old design)
-- ---------------------------------------------------------------------
SELECT * FROM client_1042;


-- ---------------------------------------------------------------------
-- Demo 1.3: Searching the old way
-- Every client over 50 enrolled in the Cardiac Recovery Study.
-- One query per table: 2,241 queries for one search.
-- Run after Script 1 (before or after the migration, as long as the
-- old tables still exist).
-- ---------------------------------------------------------------------
DROP TABLE IF EXISTS search_results;
CREATE TEMP TABLE search_results (client_id INT);

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
      'INSERT INTO search_results
       SELECT %s FROM %I
       WHERE (data::jsonb ->> ''days_since_birth'')::INT >= 50 * 365
       AND data::jsonb -> ''enrolments'' @> ''[{"study_code": "CARD-2019"}]''',
      substring(t.table_name FROM '[0-9]+'),
      t.table_name
    );
  END LOOP;
END $$;

SELECT COUNT(*) FROM search_results;


-- ---------------------------------------------------------------------
-- Demo 3.2: Calculating age from the date of birth (new design)
-- ---------------------------------------------------------------------
SELECT first_name, last_name, date_of_birth,
  AGE(date_of_birth) AS age
FROM client
WHERE client_id = 1042;


-- ---------------------------------------------------------------------
-- Demo 5.1: The same search in the new design
-- ---------------------------------------------------------------------
SELECT c.client_id, c.first_name, c.last_name,
  AGE(c.date_of_birth) AS age
FROM client c
INNER JOIN enrolment e ON e.client_id = c.client_id
INNER JOIN study s ON s.study_id = e.study_id
WHERE s.study_code = 'CARD-2019'
AND c.date_of_birth <= CURRENT_DATE - INTERVAL '50 years';

-- Compare the two searches: clients found by one but not the other.
-- The old search uses 50 * 365 days, which ignores leap years, so a
-- client who turned 50 in the last 12 or so days can appear in the old
-- result but not the new one.
SELECT 'old only' AS found_by, client_id
FROM (
  SELECT client_id FROM search_results
  EXCEPT
  SELECT c.client_id
  FROM client c
  INNER JOIN enrolment e ON e.client_id = c.client_id
  INNER JOIN study s ON s.study_id = e.study_id
  WHERE s.study_code = 'CARD-2019'
  AND c.date_of_birth <= CURRENT_DATE - INTERVAL '50 years'
) x
UNION ALL
SELECT 'new only', client_id
FROM (
  SELECT c.client_id
  FROM client c
  INNER JOIN enrolment e ON e.client_id = c.client_id
  INNER JOIN study s ON s.study_id = e.study_id
  WHERE s.study_code = 'CARD-2019'
  AND c.date_of_birth <= CURRENT_DATE - INTERVAL '50 years'
  EXCEPT
  SELECT client_id FROM search_results
) y;
