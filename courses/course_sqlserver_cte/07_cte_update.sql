--Check table before update
SELECT *
FROM work_request;

--Update with CTE
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
UPDATE requests_in_progress
SET assigned_to = 8
WHERE request_id = 7;

--Check table after update
SELECT *
FROM work_request;
