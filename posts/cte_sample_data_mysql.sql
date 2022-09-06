/*
Sample data for CTE
MySQL
*/

CREATE TABLE employee (
  emp_id INT,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  dept_id INT,
  manager_id INT,
  office_id INT
);
 
CREATE TABLE department (
  dept_id INT,
  dept_name VARCHAR(50)
);
 
INSERT INTO employee (emp_id, first_name, last_name, dept_id, manager_id, office_id) VALUES
(1, 'Sally', 'Jones', 3, 2, 5),
(2, 'Mark', 'Smith', 2, 4, 3),
(3, 'John', 'Andrews', 1, 4, 3),
(4, 'Michelle', 'Johnson', 2, NULL, 5),
(5, 'Brian', 'Grand', 2, 2, 3);
 
INSERT INTO department (dept_id, dept_name) VALUES
(1, 'Sales'),
(2, 'IT'),
(3, 'Support');

COMMIT;

SELECT * FROM employee;
SELECT * FROM department;

/*
Original select query
*/

SELECT
e.first_name, 
e.last_name, 
e.dept_id,
d.dept_count
FROM employee e
INNER JOIN (
  SELECT dept_id, COUNT(*) AS dept_count
  FROM employee
  GROUP BY dept_id
) d
ON e.dept_id = d.dept_id;

/*
Same query but using a CTE
*/

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