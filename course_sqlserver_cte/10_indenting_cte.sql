--Recursive CTE
WITH emp_hierarchy (manager_id, emp_id, first_name, title, employee_level, name_indented) AS (
  
  SELECT manager_id, emp_id, first_name, title, 0 AS employee_level,
  CONVERT(VARCHAR(200), first_name)
  FROM employee
  WHERE manager_id IS NULL
  
  UNION ALL
  
  SELECT e.manager_id, e.emp_id, e.first_name, e.title, employee_level + 1,
  CONVERT(VARCHAR(200), REPLICATE ('- ' , employee_level + 1) +  e.first_name)
  FROM employee e
  INNER JOIN emp_hierarchy h
  ON e.manager_id = h.emp_Id
  
)
SELECT manager_id, emp_id, first_name, title, employee_level, name_indented
FROM emp_hierarchy;
