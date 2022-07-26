--Updating data

SELECT full_name, COUNT(*)
FROM person
GROUP BY full_name
ORDER BY COUNT(*) DESC;

SELECT full_name
FROM person
GROUP BY full_name
HAVING COUNT(*) > 1;

UPDATE person
SET full_name = full_name + ' TBC'
WHERE full_name IN (
	SELECT full_name
	FROM person
	GROUP BY full_name
	HAVING COUNT(*) > 1
);


UPDATE person
SET full_name = REPLACE(full_name, ' TBC', '')
WHERE full_name LIKE '% TBC%';
