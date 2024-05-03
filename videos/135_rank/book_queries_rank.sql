SELECT
p.publisher_name,
COUNT(*),
RANK() OVER (ORDER BY COUNT(*) DESC) AS pub_rank,
DENSE_RANK() OVER (ORDER BY COUNT(*) DESC) AS pub_denserank,
ROW_NUMBER() OVER (ORDER BY COUNT(*) DESC) AS pub_rownumber
FROM publisher p
INNER JOIN book b ON p.publisher_id = b.publisher_id 
GROUP BY p.publisher_name
ORDER BY COUNT(*) DESC;