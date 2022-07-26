CREATE VIEW it_requests_in_progress AS
WITH requests_in_progress (request_id, request_name, created_date, request_status, assigned_to) AS (
	SELECT
	request_id,
	request_name,
	created_date,
	request_status,
	assigned_to
	FROM work_request
	WHERE request_status != 'Done'
),
it_employees (emp_id, first_name, title) AS (
	SELECT emp_id, first_name, title
	FROM employee
	WHERE dept_id = 3
)
SELECT
e.emp_id,
e.first_name,
e.title,
w.request_id,
w.request_name,
w.created_date,
w.request_status
FROM it_employees e
INNER JOIN requests_in_progress w ON w.assigned_to = e.emp_id;


