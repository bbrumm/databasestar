SELECT * FROM job_history;

CREATE OR REPLACE FUNCTION GetJobHistoryLength(
  v_startdate DATE,
  v_enddate DATE
) RETURN NUMBER
AS
BEGIN
  RETURN v_enddate - v_startdate;
END;

SELECT
employee_id,
start_date,
end_date,
job_id, 
department_id,
GetJobHistoryLength(start_date, end_date) AS job_length
FROM job_history;