--Multi column subquery

SELECT *
FROM person
WHERE (height, weight) IN (
	SELECT AVG(height), AVG(weight)
	FROM person
);
--Not valid syntax in SQL Server