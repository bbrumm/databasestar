/*
Sample data for my guide to SQL joins
Post is here: https://www.databasestar.com/sql-joins/
*/

/*
Oracle
*/
CREATE TABLE department (
    department_id NUMBER(5) PRIMARY KEY,
    department_name VARCHAR2(100)
);
 
CREATE TABLE employee (
    employee_id NUMBER(5) PRIMARY KEY,
    full_name VARCHAR2(100),
    department_id NUMBER(5) REFERENCES department(department_id),
    job_role VARCHAR2(100),
    manager_id NUMBER(5)
);

/*
SQL Server, MySQL, Postgres
*/
CREATE TABLE department (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);
 
CREATE TABLE employee (
    employee_id INT PRIMARY KEY,
    full_name VARCHAR(100),
    department_id INT REFERENCES department(department_id),
    job_role VARCHAR(100),
    manager_id INT
);


/*
Insert data
*/

INSERT INTO department(department_id, department_name) VALUES (1, 'Executive');
INSERT INTO department(department_id, department_name) VALUES (2, 'HR');
INSERT INTO department(department_id, department_name) VALUES (3, 'Sales');
INSERT INTO department(department_id, department_name) VALUES (4, 'Development');
INSERT INTO department(department_id, department_name) VALUES (5, 'Support');
INSERT INTO department(department_id, department_name) VALUES (6, 'Research');

INSERT INTO employee (employee_id, full_name, department_id, job_role, manager_id)
VALUES (1, 'John Smith', 1, 'CEO', NULL);
INSERT INTO employee (employee_id, full_name, department_id, job_role, manager_id)
VALUES (2, 'Sarah Goodes', 1, 'CFO', 1);
INSERT INTO employee (employee_id, full_name, department_id, job_role, manager_id)
VALUES (3, 'Wayne Ablett', 1, 'CIO', 1);
INSERT INTO employee (employee_id, full_name, department_id, job_role, manager_id)
VALUES (4, 'Michelle Carey', 2, 'HR Manager', 1);
INSERT INTO employee (employee_id, full_name, department_id, job_role, manager_id)
VALUES (5, 'Chris Matthews', 3, 'Sales Manager ', 2);
INSERT INTO employee (employee_id, full_name, department_id, job_role, manager_id)
VALUES (6, 'Andrew Judd', 4, 'Development Manager', 3);
INSERT INTO employee (employee_id, full_name, department_id, job_role, manager_id)
VALUES (7, 'Danielle McLeod', 5, 'Support Manager', 3);
INSERT INTO employee (employee_id, full_name, department_id, job_role, manager_id)
VALUES (8, 'Matthew Swan', 2, 'HR Representative', 4);
INSERT INTO employee (employee_id, full_name, department_id, job_role, manager_id)
VALUES (9, 'Stephanie Richardson', 2, 'Salesperson', 5);
INSERT INTO employee (employee_id, full_name, department_id, job_role, manager_id)
VALUES (10, 'Tony Grant', 3, 'Salesperson', 5);
INSERT INTO employee (employee_id, full_name, department_id, job_role, manager_id)
VALUES (11, 'Jenna Lockett', 4, 'Front-End Developer', 6);
INSERT INTO employee (employee_id, full_name, department_id, job_role, manager_id)
VALUES (12, 'Michael Dunstall', 4, 'Back-End Developer', 6);
INSERT INTO employee (employee_id, full_name, department_id, job_role, manager_id)
VALUES (13, 'Jane Voss', 4, 'Back-End Developer', 6);
INSERT INTO employee (employee_id, full_name, department_id, job_role, manager_id)
VALUES (14, 'Anthony Hird', null, 'Support', 7);
INSERT INTO employee (employee_id, full_name, department_id, job_role, manager_id)
VALUES (15, 'Natalie Rocca', 5, 'Support', 7);