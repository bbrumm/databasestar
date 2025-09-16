CREATE DATABASE postgres_dev;

SET search_path TO postgres_dev;

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

CREATE OR REPLACE FUNCTION findEmployeeCount()
RETURNS INTEGER
LANGUAGE plpgsql
AS
$$
    

$$;