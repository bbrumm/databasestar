/* test set operator ordering for Patrick */

CREATE TABLE workers (
    first_name VARCHAR2(100),
    last_name VARCHAR2(100)
);

CREATE TABLE employees (
    first_name VARCHAR2(100),
    last_name VARCHAR2(100)
);

INSERT INTO workers (first_name, last_name) VALUES ('Ellen', 'Abel');
INSERT INTO workers (first_name, last_name) VALUES ('Herman', 'Baer');
INSERT INTO workers (first_name, last_name) VALUES ('Sarah', 'Bell');
INSERT INTO workers (first_name, last_name) VALUES ('Anthony', 'Cabrio');

INSERT INTO employees (first_name, last_name) VALUES ('Sundar', 'Ande');
INSERT INTO employees (first_name, last_name) VALUES ('Amit', 'Banda');
INSERT INTO employees (first_name, last_name) VALUES ('Alexis', 'Bull');
INSERT INTO employees (first_name, last_name) VALUES ('Scott', 'Davidson');

SELECT first_name, last_name FROM workers;
SELECT first_name, last_name FROM employees;

/*
Simple union. No Order By.
Seems to sort by the first column in ascending order
*/
SELECT last_name AS lname, first_name FROM workers
UNION
SELECT last_name, first_name FROM employees;

/*
Simple union. No order by. Using firstname as first column
Still sorts by the first column: first_name
*/
SELECT first_name, last_name FROM workers
UNION
SELECT first_name, last_name FROM employees;

/*
Add an alias, to match the example from Patrick
*/
SELECT first_name AS fname, last_name FROM workers
UNION
SELECT first_name, last_name FROM employees;