SELECT *
FROM employees;


CREATE OR REPLACE PROCEDURE InsertEmployeeSimple(
  v_firstname IN VARCHAR2,
  v_lastname IN VARCHAR2,
  v_email IN VARCHAR2,
  v_salary IN NUMBER
)
AS
BEGIN
    INSERT INTO employees (employee_id, first_name, last_name, email,
    phone_number, hire_date, job_id, salary, commission_pct,
    manager_id, department_id)
    VALUES (employees_seq.nextval, v_firstname, v_lastname, v_email,
    NULL, SYSDATE, 'SH_CLERK', v_salary, NULL,
    NULL, 50);

END;

CALL InsertEmployeeSimple(
  v_firstname => 'Ben',
  v_lastname => 'Brumm',
  v_email => 'BBRUMM',
  v_salary => 1000
);


SELECT *
FROM employees
ORDER BY employee_id DESC;