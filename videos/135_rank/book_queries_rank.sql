SELECT
p.publisher_name,
COUNT(*)
FROM publisher p
INNER JOIN book b ON p.publisher_id = b.publisher_id 
GROUP BY p.publisher_name
ORDER BY COUNT(*) DESC;