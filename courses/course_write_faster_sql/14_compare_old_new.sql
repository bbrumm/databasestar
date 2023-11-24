/*
A script to compare the results of an original query and a new query
*/

WITH original_query AS (
	SELECT
	your_query_here
),
new_query AS (
	SELECT
	your_query_here
)

SELECT
'Original' AS query_name,
your_columns
FROM original_query qo
WHERE NOT EXISTS (
	SELECT 1
	FROM new_query qn
	WHERE qn.column_name = qo.column_name
	AND qn.column_name = qo.column_name
    ...
)
UNION ALL

SELECT
'New',
your_columns
FROM new_query qn
WHERE NOT EXISTS (
	SELECT 1
	FROM original_query qo
	WHERE qn.column_name = qo.column_name
	AND qn.column_name = qo.column_name
);
