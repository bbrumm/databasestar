--Find info about a view

SELECT *
FROM sys.views;

SELECT *
FROM sys.sql_modules;

SELECT
v.object_id,
v.name,
v.create_date,
v.modify_date,
v.with_check_option,
m.uses_ansi_nulls,
m.uses_quoted_identifier,
m.is_schema_bound,
m.definition
FROM sys.views v
INNER JOIN sys.sql_modules m ON v.object_id = m.object_id;
