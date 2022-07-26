SELECT * FROM employee;

--All employees
SELECT first_name, title
FROM employee
WHERE dept_id = 3;

WITH it_employees (emp_id, first_name, title) AS
(
	SELECT emp_id, first_name, title
	FROM employee
	WHERE dept_id = 3
)
SELECT first_name, title
FROM it_employees;
