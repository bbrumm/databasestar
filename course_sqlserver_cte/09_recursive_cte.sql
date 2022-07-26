--Recursive CTE
WITH emp_hierarchy (manager_id, emp_id, first_name, title, employee_level) AS (
  
  SELECT manager_id, emp_id, first_name, title, 0 AS employee_level
  FROM employee
  WHERE manager_id IS NULL
  
  UNION ALL
  
  SELECT e.manager_id, e.emp_id, e.first_name, e.title, employee_level + 1
  FROM employee e
  INNER JOIN emp_hierarchy h
  ON e.manager_id = h.emp_Id

)
SELECT manager_id, emp_id, first_name, title, employee_level
FROM emp_hierarchy;




--Limit levels to level 2
WITH emp_hierarchy (manager_id, emp_id, first_name, title, employee_level) AS (
  SELECT manager_id, emp_id, first_name, title, 0 AS employee_level
  FROM employee
  WHERE manager_id IS NULL
  UNION ALL
  SELECT e.manager_id, e.emp_id, e.first_name, e.title, employee_level + 1
  FROM employee e
  INNER JOIN emp_hierarchy h
  ON e.manager_id = h.emp_Id
)
SELECT manager_id, emp_id, first_name, title, employee_level
FROM emp_hierarchy
WHERE employee_level <= 2;


SELECT manager_id, emp_id, first_name, title, 0 AS employee_level
  FROM employee
  WHERE manager_id IS NULL