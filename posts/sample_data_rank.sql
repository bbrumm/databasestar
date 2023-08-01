/*
Sample data for SQL RANK and DENSE_RANK examples
Post here: https://www.databasestar.com/sql-rank/
*/

/*
Oracle
*/

CREATE TABLE student (
    student_id NUMBER,
    first_name VARCHAR2(100),
    last_name VARCHAR2(100),
    fees_paid NUMBER,
    gender VARCHAR2(1)
);

/*
SQL Server, MySQL, Postgres
*/

CREATE TABLE student (
    student_id INT,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    fees_paid INT,
    gender VARCHAR(1)
);

/*
Insert (for all vendors)
*/
INSERT INTO student (student_id, first_name, last_name, fees_paid, gender)
VALUES (1, 'John', 'Smith', 200, 'M');
INSERT INTO student (student_id, first_name, last_name, fees_paid, gender)
VALUES (2, 'Susan', 'Johnson', 500, 'F');
INSERT INTO student (student_id, first_name, last_name, fees_paid, gender)
VALUES (3, 'Tom', 'Capper', 350, 'M');
INSERT INTO student (student_id, first_name, last_name, fees_paid, gender)
VALUES (4, 'Mark', 'Holloway', 100, 'M');
INSERT INTO student (student_id, first_name, last_name, fees_paid, gender)
VALUES (5, 'Steven', 'Webber', 0, 'M');
INSERT INTO student (student_id, first_name, last_name, fees_paid, gender)
VALUES (6, 'Julie', 'Armstrong', 150, 'F');
INSERT INTO student (student_id, first_name, last_name, fees_paid, gender)
VALUES (7, 'Michelle', 'Randall', 150, 'F');
INSERT INTO student (student_id, first_name, last_name, fees_paid, gender)
VALUES (8, 'Andrew', 'Cooper', 800, 'M');
INSERT INTO student (student_id, first_name, last_name, fees_paid, gender)
VALUES (9, 'Robert', 'Pickering', 900, 'M');
INSERT INTO student (student_id, first_name, last_name, fees_paid, gender)
VALUES (10, 'Tanya', 'Hall', 50, 'F');

