SELECT
t.name AS table_name,
ind.name AS index_name,
ind.index_id,
col.name AS column_name,
ind.type_desc,
ic.key_ordinal
FROM sys.indexes ind 
INNER JOIN sys.index_columns ic ON  ind.object_id = ic.object_id and ind.index_id = ic.index_id 
INNER JOIN sys.columns col ON ic.object_id = col.object_id and ic.column_id = col.column_id 
INNER JOIN sys.tables t ON ind.object_id = t.object_id 
ORDER BY t.name, ind.name, ic.key_ordinal;
