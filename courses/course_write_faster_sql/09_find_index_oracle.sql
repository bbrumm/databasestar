SELECT
index_name,
index_type,
table_owner,
table_name,
uniqueness
FROM all_indexes;

SELECT
index_name,
index_type,
table_owner,
table_name,
uniqueness
FROM all_indexes
WHERE table_owner = 'GRAVITY'; 

SELECT
i.index_name,
i.table_name,
c.column_name,
c.column_position
FROM all_indexes i
INNER JOIN all_ind_columns c ON i.index_name = c.index_name
WHERE i.table_owner = 'GRAVITY'
ORDER BY i.index_name, c.column_position; 
