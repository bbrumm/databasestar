WITH department_count AS (
  SELECT dept_id, COUNT(*) AS dept_count
  FROM employee
  GROUP BY dept_id
)
SELECT
e.first_name, 
e.last_name, 
e.dept_id,
d.dept_count
FROM employee e
INNER JOIN department_count d
ON e.dept_id = d.dept_id;
