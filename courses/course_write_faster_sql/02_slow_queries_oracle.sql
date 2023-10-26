/*
A series of scripts to find slow queries in Oracle.
*/

--Recent queries by elapsed time
--(queries are eventually removed from v$sql)
-- Elapsed Time is in microseconds
SELECT
sql_fulltext,
sql_id,
child_number,
disk_reads,
executions,
first_load_time,
last_load_time
FROM v$sql
ORDER BY elapsed_time DESC;

--Same query but show top 10
SELECT *
FROM (
    SELECT
    sql_fulltext,
    sql_id,
    child_number,
    disk_reads,
    executions,
    first_load_time,
    last_load_time,
    elapsed_time
    FROM v$sql
    ORDER BY elapsed_time DESC
)
WHERE rownum <= 10;

--Show SQL queries currently running:
select S.USERNAME, s.sid, s.osuser, t.sql_id, sql_text
from v$sqltext_with_newlines t
INNER JOIN V$SESSION s 
ON t.address =s.sql_address
AND t.hash_value = s.sql_hash_value
WHERE s.status = 'ACTIVE'
and s.username <> 'SYSTEM'
order by s.sid,t.piece;

--Shows long operations
SELECT sid, to_char(start_time,'hh24:mi:ss') stime, 
message,( sofar/totalwork)* 100 percent 
FROM v$session_longops
WHERE sofar/totalwork < 1;


