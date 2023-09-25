SELECT COUNT(*)
FROM employee;

SELECT employee_id, first_name, last_name, salary, department_id, manager_id
FROM employee;

--Just shows the employees and their managers
SELECT
e.employee_id,
e.first_name,
e.last_name,
e.manager_id
FROM employee e
START WITH e.manager_id IS NULL
CONNECT BY PRIOR e.employee_id = e.manager_id;

--Show a certain area - all employees under emp id 46
SELECT
e.employee_id,
e.first_name,
e.last_name,
e.manager_id
FROM employee e
START WITH e.employee_id = 46
CONNECT BY PRIOR e.employee_id = e.manager_id;

--Use LEVEL
SELECT
e.employee_id,
e.first_name,
e.last_name,
e.manager_id,
LEVEL
FROM employee e
START WITH e.manager_id IS NULL
CONNECT BY PRIOR e.employee_id = e.manager_id;

--LEVEL and LPAD
SELECT
e.employee_id,
e.first_name,
e.last_name,
e.manager_id,
LEVEL,
LPAD(' ', LEVEL * 2) || e.last_name AS last_name_pad
FROM employee e
START WITH e.manager_id IS NULL
CONNECT BY PRIOR e.employee_id = e.manager_id;


--LEVEL and LPAD v2
SELECT
e.employee_id,
LPAD(' ', LEVEL * 2) || e.first_name || ' ' || e.last_name AS name_pad,
e.manager_id,
LEVEL
FROM employee e
START WITH e.manager_id IS NULL
CONNECT BY PRIOR e.employee_id = e.manager_id;



--SYS_CONNECT_BY_PATH
SELECT
e.employee_id,
LPAD(' ', LEVEL * 2) || e.first_name || ' ' || e.last_name AS name_pad,
e.manager_id,
LEVEL,
SYS_CONNECT_BY_PATH(last_name, '/') AS path
FROM employee e
START WITH e.manager_id IS NULL
CONNECT BY PRIOR e.employee_id = e.manager_id;
