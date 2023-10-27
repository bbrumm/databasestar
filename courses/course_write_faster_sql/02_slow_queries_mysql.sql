/*
A series of scripts to find slow queries in MySQL.
*/

SELECT
thread_id,
event_id,
source,
timer_start,
timer_end,
timer_wait,
lock_time,
sql_text,
current_schema,
rows_sent,
created_tmp_disk_tables,
created_tmp_tables,
select_full_join,
select_full_range_join,
select_range_check,
select_scan,
sort_rows,
sort_scan,
no_index_used,
no_good_index_used
FROM performance_schema.events_statements_history;

/*
Find all queries that don't use a good index
*/
SELECT
thread_id,
sql_text,
rows_sent,
rows_examined,
created_tmp_tables,
no_index_used,
no_good_index_used
FROM performance_schema.events_statements_history_long
WHERE no_index_used > 0
OR no_good_index_used > 0;

/*
More views that show queries with specific criteria
*/
SELECT *
FROM sys.statement_analysis;

SELECT *
FROM sys.statements_with_errors_or_warnings;

SELECT *
FROM sys.statements_with_full_table_scans;

SELECT *
FROM sys.statements_with_runtimes_in_95th_percentile;

SELECT *
FROM sys.statements_with_sorting;
