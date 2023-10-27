/*
A series of scripts to find slow queries in Postgres.
*/

--Check the currently active queries for each sesson
SELECT *
FROM pg_stat_activity;

--Find stats about indexes such as how often they have been used
SELECT *
FROM pg_stat_all_indexes;

--Find status of slow query logging
-- -1 means not enabled
SELECT *
FROM pg_settings
WHERE name = 'log_min_duration_statement';

--Enable slow query logging by changing a config file
--Or by running Alter Database:
ALTER DATABASE gravity_books SET log_min_duration_statement = 2000;