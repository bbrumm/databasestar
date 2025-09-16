CREATE DATABASE postgres_dev;
CREATE DATABASE postgres_test;

SET search_path TO postgres_dev;

DROP VIEW employees_100k_plus;
DROP TABLE public.employee;
DROP TABLE public.department;


CREATE TABLE postgres_dev.public.employee (
    id INTEGER,
    first_name TEXT,
    salary INT
);

INSERT INTO postgres_dev.public.employee (id, first_name, salary) VALUES
(1, 'John', 100000),
(2, 'Sarah', 120000),
(3, 'Michael', 90000),
(4, 'Claire', 80000);

CREATE OR REPLACE FUNCTION postgres_dev.public.findEmployeeCount()
RETURNS INTEGER
LANGUAGE plpgsql
AS
$$
    DECLARE
        emp_count INTEGER;
    BEGIN
        SELECT COUNT(*)
        INTO emp_count
        FROM employee;

        RETURN emp_count;
   END;
$$;

CREATE VIEW employees_100k_plus AS
SELECT id, first_name, salary
FROM employee
WHERE salary >= 100000;

SELECT findEmployeeCount();

--Now create the TEST objects
SET search_path TO postgres_test;



CREATE TABLE postgres_test.public.employee (
    id INTEGER,
    first_name TEXT,
    salary INT
);

INSERT INTO postgres_test.public.employee (id, first_name, salary) VALUES
(1, 'John', 100000),
(2, 'Sarah', 120000),
(3, 'Michael', 90000),
(4, 'Claire', 80000);

CREATE OR REPLACE FUNCTION postgres_test.public.findEmployeeCount()
RETURNS INTEGER
LANGUAGE plpgsql
AS
$$
   BEGIN
    SELECT COUNT(*)
    FROM employee;
   END;
$$;


CREATE VIEW employees_100k_plus AS
SELECT id, first_name, salary
FROM employee
WHERE salary > 100000;


--Then, make changes in DEV
ALTER TABLE public.employee ADD COLUMN start_date DATE;

CREATE TABLE public.department (
    id INTEGER,
    name TEXT,
    CONSTRAINT pk_department PRIMARY KEY (id)
);

CREATE TABLE audit_log (
  id SERIAL PRIMARY KEY,
  action TEXT NOT NULL,
  created_at TIMESTAMP DEFAULT NOW()
);