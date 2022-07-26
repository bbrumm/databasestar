--Select query
WITH requests_in_progress (request_id, request_name, created_date, request_status, assigned_to) AS (
	SELECT
	request_id,
	request_name,
	created_date,
	request_status,
	assigned_to
	FROM work_request
	WHERE request_status != 'Done'
)
SELECT
e.emp_id,
e.first_name,
e.title,
w.request_id,
w.request_name,
w.created_date,
w.request_status
FROM employee e
INNER JOIN requests_in_progress w ON w.assigned_to = e.emp_id;

--Create table as SELECT. Shows error.
CREATE TABLE emp_req_in_progress
WITH requests_in_progress (request_id, request_name, created_date, request_status, assigned_to) AS (
	SELECT
	request_id,
	request_name,
	created_date,
	request_status,
	assigned_to
	FROM work_request
	WHERE request_status != 'Done'
)
SELECT
e.emp_id,
e.first_name,
e.title,
w.request_id,
w.request_name,
w.created_date,
w.request_status
FROM employee e
INNER JOIN requests_in_progress w ON w.assigned_to = e.emp_id;


--Create table first
CREATE TABLE emp_req_in_progress (
	emp_id INT,
	first_name VARCHAR(100),
	title VARCHAR(100),
	request_id INT,
	request_name VARCHAR(100),
	created_date DATE,
	request_status VARCHAR(20)
);

--Insert with CTE
WITH requests_in_progress (request_id, request_name, created_date, request_status, assigned_to) AS (
	SELECT
	request_id,
	request_name,
	created_date,
	request_status,
	assigned_to
	FROM work_request
	WHERE request_status != 'Done'
)
INSERT INTO emp_req_in_progress (emp_id, first_name, title, request_id, request_name, created_date, request_status)
SELECT
e.emp_id,
e.first_name,
e.title,
w.request_id,
w.request_name,
w.created_date,
w.request_status
FROM employee e
INNER JOIN requests_in_progress w ON w.assigned_to = e.emp_id;



SELECT *
FROM emp_req_in_progress;
