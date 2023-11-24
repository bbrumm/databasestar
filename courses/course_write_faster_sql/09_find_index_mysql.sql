SELECT
table_schema,
table_name,
index_name,
column_name
FROM information_schema.statistics
WHERE table_schema = 'gravity_books';