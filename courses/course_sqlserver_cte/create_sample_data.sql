CREATE DATABASE employees;

USE employees;


CREATE TABLE employee (
  emp_id INT NOT NULL,
  first_name VARCHAR(100),
  title VARCHAR(100),
  dept_id INT NOT NULL,
  manager_id INT,
  CONSTRAINT pk_empid PRIMARY KEY CLUSTERED (emp_id)
);

INSERT INTO employee (emp_id, first_name, title, dept_id, manager_id) VALUES
(1, 'John', 'CIO', 3, 7),
(2, 'Sarah', 'Account Manager', 2, 3),
(3, 'Michelle', 'Sales Manager', 2, 7),
(4, 'Mark', 'Executive Assistant', 1, 7),
(5, 'Peter', 'Tech Team Leader', 3, 1),
(6, 'Michael', 'Quality Assurance Engineer', 3, 5),
(7, 'Claire', 'CEO', 1, NULL),
(8, 'Stephanie', 'Customer Service Representative', 4, 10),
(9, 'Morris', 'Customer Service Representative', 4, 10),
(10, 'Ross', 'Head of Customer Service', 4, 7),
(11, 'Chris', 'Account Manager', 2, 3),
(12, 'Tom', 'Developer', 3, 5),
(13, 'Arnold', 'Developer', 3, 5),
(14, 'Claudette', 'Junior Account Manager', 2, 11);
