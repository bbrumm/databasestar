/*
A series of scripts to find slow queries in SQL Server.
*/

SELECT
dest.text,
deqp.query_plan,
der.cpu_time,
der.logical_reads,
der.writes
FROM sys.dm_exec_requests AS der
CROSS APPLY sys.dm_exec_query_plan(der.plan_handle) AS deqp
CROSS APPLY sys.dm_exec_sql_text(der.plan_handle) AS dest;

--Query stats:
SELECT *
FROM sys.dm_exec_query_stats;

--More query stats:
SELECT
dest.text,
deqp.query_plan,
deqs.execution_count,
deqs.min_logical_writes,
deqs.max_logical_reads,
deqs.total_logical_reads,
deqs.total_elapsed_time,
deqs.last_elapsed_time
FROM sys.dm_exec_query_stats AS deqs
CROSS APPLY sys.dm_exec_query_plan(deqs.plan_handle) AS deqp
CROSS APPLY sys.dm_exec_sql_text(deqs.plan_handle) AS dest;

