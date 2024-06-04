CREATE TABLE error_log (
  err_datetime DATETIME,
  err_number INT,
  err_severity INT,
  err_state INT,
  err_procedure VARCHAR(500),
  err_line INT,
  err_message VARCHAR(2000)
);

