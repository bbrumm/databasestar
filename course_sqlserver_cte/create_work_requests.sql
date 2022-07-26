CREATE TABLE work_request (
request_id INT,
request_name VARCHAR(200),
created_date DATE,
request_status VARCHAR(20),
assigned_to INT,
CONSTRAINT pk_work_id PRIMARY KEY CLUSTERED (request_id)
);

INSERT INTO work_request(request_id, request_name, created_date, request_status, assigned_to) VALUES
(1, 'Fix bug on login page', '20200105', 'Done', 12),
(2, 'Confirm price for ABC Pty Ltd', '20200109', 'In Progress', 2),
(3, 'Resolve refund issue', '20200120', 'In Progress', 8),
(4, 'Cannot update profile details', '20200214', 'Not Started', NULL),
(5, 'Records are duplicated', '20200223', 'In Progress', 13),
(6, 'Prepare contract for Information Inc', '20200304', 'Not Started', 3),
(7, 'Provide update on account status to John', '20200309', 'In Progress', 9);
