SELECT *
FROM employees;

CREATE OR REPLACE PROCEDURE UpdatePeopleContactDetails(
	v_emp_id NUMBER,
	v_phonenumber VARCHAR2,
	v_emailaddress VARCHAR2
)
AS
BEGIN
    UPDATE employees
    SET phone_number = v_phonenumber,
    email = v_emailaddress
    WHERE employee_id = v_emp_id;
END;

CALL UpdatePeopleContactDetails(
    v_emp_id => 207,
    v_phonenumber => '515.123.1111',
    v_emailaddress => 'BENBRUMM'
);

SELECT *
FROM employees
WHERE employee_id = 207;