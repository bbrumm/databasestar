/*
 Reset tables
 */

DROP TABLE course_category;
DROP TABLE enrolment_grades;
DROP TABLE score_grades;

/*
Create tables and add data
*/

CREATE TABLE departments (
    department_id INTEGER,
    department_name VARCHAR(100),
    advisor_name VARCHAR(200),
    office_location VARCHAR(20),
    CONSTRAINT pk_departments
        PRIMARY KEY (department_id)
);

CREATE TABLE students (
    student_id INTEGER,
    full_name VARCHAR(200),
    department INTEGER,
    enrollment_year INTEGER,
    status VARCHAR(20),
    CONSTRAINT pk_students
        PRIMARY KEY (student_id),
    CONSTRAINT fk_students_dept
        FOREIGN KEY (department)
        REFERENCES departments (department_id)
);

CREATE TABLE courses (
    course_id INTEGER,
    course_code VARCHAR(10),
    course_name VARCHAR(200),
    CONSTRAINT pk_courses
        PRIMARY KEY (course_id)
);

CREATE TABLE enrolments (
    id INTEGER,
    student_id INTEGER,
    semester INTEGER,
    year INTEGER,
    course_id INTEGER,
    score1 INTEGER,
    score2 INTEGER,
    score3 INTEGER,
    score4 INTEGER,
    score5 INTEGER,
    score6 INTEGER,
    score7 INTEGER,
    score8 INTEGER,
    score9 INTEGER,
    score10 INTEGER,
    attendance INTEGER,
    final_score INTEGER,
    is_pass CHAR(1),
    CONSTRAINT pk_enrolments
        PRIMARY KEY (id),
    CONSTRAINT fk_enrolments_stud
        FOREIGN KEY (student_id)
        REFERENCES students (student_id),
    CONSTRAINT fk_enrolments_course
        FOREIGN KEY (course_id)
        REFERENCES courses (course_id)
);


/*
Add rows
*/

DELETE FROM enrolments;
DELETE FROM courses;
DELETE FROM students;
DELETE FROM departments;

INSERT INTO departments (department_id, department_name, advisor_name, office_location) VALUES
(1, 'Physics', 'Matthew Jones', '10A'),
(2, 'Computer Science', 'Tony Stark', '14B'),
(3, 'History', 'Sally Smith', '10C'),
(4, 'Mathematics', 'Bruce Banner', '12A');

INSERT INTO students (student_id, full_name, department, enrollment_year, status) VALUES
(1, 'Michael Smith', 2, 2018, 'active'),
(2, 'Mary Jones', 1, 2021, 'active'),
(3, 'Peter Parker', 3, 2019, 'active'),
(4, 'Natasha Romanov', 4, 2020, 'active'),
(5, 'Claire Jameson', 4, 2021, 'active'),
(6, 'Paul Johnson', 3, 2022, 'active'),
(7, 'Michelle Livingstone', 2, 2023, 'active'),
(8, 'Aaron Smith', 1, 2020, 'active'),
(9, 'Joanne Taylor', 1, 2019, 'inactive'),
(10, 'Terry Jones', 2, 2022, 'active');

INSERT INTO courses (course_id, course_code, course_name) VALUES
(1, 'CS100', 'Introduction to Computer Science'),
(2, 'CS200', 'Intermediate Computer Science'),
(3, 'CS300', 'Advanced Computer Science'),
(4, 'PH100', 'Basics of Physics'),
(5, 'PH250', 'Advanced Physics'),
(6, 'PH400', 'Advanced Physics 2'),
(7, 'HI100', 'Introduction to History'),
(8, 'HI200', 'Roman History'),
(9, 'MA100', 'Introduction to Mathematics'),
(10, 'MA150', 'Basics of Algebra');

--get enrolments from the Google Sheet
INSERT INTO enrolments (id, student_id, semester, year, course_id, score1, score2, score3, score4, score5, score6, score7, score8, score9, score10, attendance, final_score, is_pass) VALUES
(1, 1, 1, 2018, 1, 30, 45, 90, 34, 36, 70, 95, 65, 68, 84, 62, 65, 'Y'),
(2, 1, 2, 2018, 2, 91, 57, 78, 95, 69, 34, 41, 40, 75, 42, 64, 93, 'Y'),
(3, 2, 1, 2021, 4, 51, 43, 68, 55, 74, 56, 84, 59, 90, 35, 82, 65, 'Y'),
(4, 2, 2, 2021, 5, 54, 80, 47, 84, 57, 31, 53, 54, 79, 63, 75, 80, 'Y'),
(5, 2, 1, 2022, 6, 37, 82, 69, 43, 97, 79, 55, 91, 39, 95, 72, 58, 'N'),
(6, 2, 2, 2022, 6, 40, 66, 31, 61, 64, 38, 41, 75, 77, 44, 80, 79, 'Y'),
(7, 3, 1, 2019, 7, 30, 85, 38, 63, 79, 30, 42, 88, 36, 73, 80, 66, 'Y'),
(8, 3, 2, 2019, 7, 70, 82, 80, 48, 84, 98, 51, 96, 91, 58, 96, 70, 'Y'),
(9, 3, 1, 2020, 8, 54, 75, 59, 51, 76, 45, 81, 75, 92, 59, 83, 73, 'Y'),
(10, 3, 2, 2020, 8, 57, 34, 87, 70, 55, 31, 65, 84, 70, 72, 100, 67, 'Y'),
(11, 4, 1, 2020, 9, 58, 97, 54, 81, 66, 33, 69, 33, 36, 63, 75, 89, 'Y'),
(12, 4, 2, 2020, 10, 98, 97, 38, 74, 43, 69, 60, 83, 49, 93, 78, 68, 'Y'),
(13, 4, 1, 2021, 10, 72, 94, 42, 76, 33, 98, 91, 48, 49, 74, 55, 80, 'N'),
(14, 4, 2, 2021, 10, 88, 33, 77, 64, 93, 56, 81, 95, 53, 79, 86, 68, 'Y'),
(15, 5, 1, 2021, 10, 77, 61, 65, 83, 57, 59, 97, 44, 60, 63, 82, 77, 'Y'),
(16, 5, 2, 2021, 10, 81, 99, 54, 40, 33, 62, 71, 46, 68, 83, 65, 75, 'Y'),
(17, 6, 1, 2022, 7, 40, 65, 77, 88, 43, 88, 83, 40, 57, 42, 87, 87, 'Y'),
(18, 6, 2, 2022, 7, 30, 34, 55, 99, 63, 64, 40, 67, 60, 71, 85, 93, 'Y'),
(19, 7, 1, 2023, 1, 99, 53, 90, 85, 50, 95, 42, 89, 53, 92, 63, 90, 'Y'),
(20, 7, 2, 2023, 2, 87, 51, 95, 51, 85, 55, 90, 65, 91, 87, 83, 84, 'Y'),
(21, 7, 1, 2024, 2, 94, 67, 84, 40, 36, 74, 100, 41, 86, 35, 80, 73, 'Y'),
(22, 7, 2, 2024, 3, 58, 67, 83, 37, 62, 99, 96, 51, 69, 37, 95, 78, 'Y'),
(23, 8, 1, 2020, 4, 44, 57, 72, 37, 69, 78, 42, 67, 85, 49, 83, 91, 'Y'),
(24, 8, 2, 2020, 5, 44, 84, 42, 97, 43, 87, 46, 48, 84, 39, 72, 87, 'Y'),
(25, 8, 1, 2021, 6, 64, 50, 94, 51, 92, 85, 38, 83, 96, 37, 62, 99, 'Y'),
(26, 8, 2, 2021, 6, 96, 80, 96, 53, 47, 93, 48, 64, 98, 53, 90, 83, 'Y'),
(27, 9, 1, 2019, 4, 81, 89, 91, 66, 76, 32, 95, 71, 37, 65, 52, 57, 'N'),
(28, 9, 2, 2019, 4, 64, 77, 94, 59, 71, 36, 80, 91, 75, 48, 92, 68, 'Y'),
(29, 9, 1, 2020, 5, 58, 77, 32, 57, 82, 38, 73, 60, 34, 68, 82, 68, 'Y'),
(30, 9, 2, 2020, 6, 88, 80, 53, 71, 39, 33, 61, 89, 43, 65, 90, 63, 'Y'),
(31, 10, 1, 2022, 1, 44, 89, 47, 76, 78, 93, 88, 92, 66, 59, 97, 83, 'Y'),
(32, 10, 2, 2022, 2, 94, 30, 33, 68, 98, 71, 66, 81, 39, 78, 80, 85, 'Y');


/*
SQL 01
Starting query
*/


SELECT s.student_id, s.full_name, s.department, s.enrollment_year, d.advisor_name, d.office_location, 
c.course_name, c.course_code, e.semester, e.year,

    CASE
        WHEN e.score1 >= 90 THEN 'A'
        WHEN e.score1 >= 80 THEN 'B'
        WHEN e.score1 >= 70 THEN 'C'
        WHEN e.score1 >= 60 THEN 'D'
        ELSE 'F'
    END AS grade_score1,

    CASE
        WHEN e.score2 >= 90 THEN 'A'
        WHEN e.score2 >= 80 THEN 'B'
        WHEN e.score2 >= 70 THEN 'C'
        WHEN e.score2 >= 60 THEN 'D'
        ELSE 'F'
    END AS grade_score2,

    CASE
        WHEN e.score3 >= 90 THEN 'A'
        WHEN e.score3 >= 80 THEN 'B'
        WHEN e.score3 >= 70 THEN 'C'
        WHEN e.score3 >= 60 THEN 'D'
        ELSE 'F'
    END AS grade_score3,

    CASE
        WHEN e.score4 >= 90 THEN 'A'
        WHEN e.score4 >= 80 THEN 'B'
        WHEN e.score4 >= 70 THEN 'C'
        WHEN e.score4 >= 60 THEN 'D'
        ELSE 'F'
    END AS grade_score4,

    CASE
        WHEN e.score5 >= 90 THEN 'A'
        WHEN e.score5 >= 80 THEN 'B'
        WHEN e.score5 >= 70 THEN 'C'
        WHEN e.score5 >= 60 THEN 'D'
        ELSE 'F'
    END AS grade_score5,

    CASE
        WHEN e.score6 >= 90 THEN 'A'
        WHEN e.score6 >= 80 THEN 'B'
        WHEN e.score6 >= 70 THEN 'C'
        WHEN e.score6 >= 60 THEN 'D'
        ELSE 'F'
    END AS grade_score6,

    CASE
        WHEN e.score7 >= 90 THEN 'A'
        WHEN e.score7 >= 80 THEN 'B'
        WHEN e.score7 >= 70 THEN 'C'
        WHEN e.score7 >= 60 THEN 'D'
        ELSE 'F'
    END AS grade_score7,

    CASE
        WHEN e.score8 >= 90 THEN 'A'
        WHEN e.score8 >= 80 THEN 'B'
        WHEN e.score8 >= 70 THEN 'C'
        WHEN e.score8 >= 60 THEN 'D'
        ELSE 'F'
    END AS grade_score8,

    CASE
        WHEN e.score9 >= 90 THEN 'A'
        WHEN e.score9 >= 80 THEN 'B'
        WHEN e.score9 >= 70 THEN 'C'
        WHEN e.score9 >= 60 THEN 'D'
        ELSE 'F'
    END AS grade_score9,

    CASE
        WHEN e.score10 >= 90 THEN 'A'
        WHEN e.score10 >= 80 THEN 'B'
        WHEN e.score10 >= 70 THEN 'C'
        WHEN e.score10 >= 60 THEN 'D'
        ELSE 'F'
    END AS grade_score10,

    CASE
        WHEN e.attendance >= 95 THEN 'Excellent'
        WHEN e.attendance >= 85 THEN 'Good'
        WHEN e.attendance >= 75 THEN 'Satisfactory'
        WHEN e.attendance >= 60 THEN 'Poor'
        ELSE 'Fail'
    END AS attendance_rating,

    CASE
        WHEN s.enrollment_year < 2018 THEN 'Legacy'
        WHEN s.enrollment_year BETWEEN 2018 AND 2020 THEN 'Midstream'
        ELSE 'Recent'
    END AS student_category,

    CASE
        WHEN e.final_score >= 90 THEN 'High Distinction'
        WHEN e.final_score >= 80 THEN 'Distinction'
        WHEN e.final_score >= 70 THEN 'Credit'
        WHEN e.final_score >= 60 THEN 'Pass'
        ELSE 'Fail'
    END AS overall_grade,

    CASE
        WHEN c.course_code LIKE 'CS%' THEN 'Computer Science'
        WHEN c.course_code LIKE 'MA%' THEN 'Mathematics'
        WHEN c.course_code LIKE 'PH%' THEN 'Physics'
        ELSE 'Other'
    END AS course_category,

    CASE WHEN e.is_pass = 'Y' THEN 'Passed' ELSE 'Not Passed' END AS pass_status

FROM
    students s
LEFT JOIN
    enrolments e ON s.student_id = e.student_id
LEFT JOIN
    courses c ON e.course_id = c.course_id
LEFT JOIN
    departments d ON s.department = d.department_id
WHERE
    e.year >= 2020
    AND s.status = 'active'
    AND (e.score1 > 50 OR e.score2 > 50 OR e.score3 > 50 OR e.score4 > 50)
ORDER BY s.full_name;

/*
SQL 02
Formatted
*/


SELECT
s.student_id,
s.full_name,
s.department,
s.enrollment_year,
d.advisor_name,
d.office_location, 
c.course_name,
c.course_code,
e.semester,
e.year,
CASE
    WHEN e.score1 >= 90 THEN 'A'
    WHEN e.score1 >= 80 THEN 'B'
    WHEN e.score1 >= 70 THEN 'C'
    WHEN e.score1 >= 60 THEN 'D'
    ELSE 'F'
END AS grade_score1,

CASE
    WHEN e.score2 >= 90 THEN 'A'
    WHEN e.score2 >= 80 THEN 'B'
    WHEN e.score2 >= 70 THEN 'C'
    WHEN e.score2 >= 60 THEN 'D'
    ELSE 'F'
END AS grade_score2,

CASE
    WHEN e.score3 >= 90 THEN 'A'
    WHEN e.score3 >= 80 THEN 'B'
    WHEN e.score3 >= 70 THEN 'C'
    WHEN e.score3 >= 60 THEN 'D'
    ELSE 'F'
END AS grade_score3,

CASE
    WHEN e.score4 >= 90 THEN 'A'
    WHEN e.score4 >= 80 THEN 'B'
    WHEN e.score4 >= 70 THEN 'C'
    WHEN e.score4 >= 60 THEN 'D'
    ELSE 'F'
END AS grade_score4,

CASE
    WHEN e.score5 >= 90 THEN 'A'
    WHEN e.score5 >= 80 THEN 'B'
    WHEN e.score5 >= 70 THEN 'C'
    WHEN e.score5 >= 60 THEN 'D'
    ELSE 'F'
END AS grade_score5,

CASE
    WHEN e.score6 >= 90 THEN 'A'
    WHEN e.score6 >= 80 THEN 'B'
    WHEN e.score6 >= 70 THEN 'C'
    WHEN e.score6 >= 60 THEN 'D'
    ELSE 'F'
END AS grade_score6,

CASE
    WHEN e.score7 >= 90 THEN 'A'
    WHEN e.score7 >= 80 THEN 'B'
    WHEN e.score7 >= 70 THEN 'C'
    WHEN e.score7 >= 60 THEN 'D'
    ELSE 'F'
END AS grade_score7,

CASE
    WHEN e.score8 >= 90 THEN 'A'
    WHEN e.score8 >= 80 THEN 'B'
    WHEN e.score8 >= 70 THEN 'C'
    WHEN e.score8 >= 60 THEN 'D'
    ELSE 'F'
END AS grade_score8,

CASE
    WHEN e.score9 >= 90 THEN 'A'
    WHEN e.score9 >= 80 THEN 'B'
    WHEN e.score9 >= 70 THEN 'C'
    WHEN e.score9 >= 60 THEN 'D'
    ELSE 'F'
END AS grade_score9,

CASE
    WHEN e.score10 >= 90 THEN 'A'
    WHEN e.score10 >= 80 THEN 'B'
    WHEN e.score10 >= 70 THEN 'C'
    WHEN e.score10 >= 60 THEN 'D'
    ELSE 'F'
END AS grade_score10,

CASE
    WHEN e.attendance >= 95 THEN 'Excellent'
    WHEN e.attendance >= 85 THEN 'Good'
    WHEN e.attendance >= 75 THEN 'Satisfactory'
    WHEN e.attendance >= 60 THEN 'Poor'
    ELSE 'Fail'
END AS attendance_rating,

CASE
    WHEN s.enrollment_year < 2018 THEN 'Legacy'
    WHEN s.enrollment_year BETWEEN 2018 AND 2020 THEN 'Midstream'
    ELSE 'Recent'
END AS student_category,

CASE
    WHEN e.final_score >= 90 THEN 'High Distinction'
    WHEN e.final_score >= 80 THEN 'Distinction'
    WHEN e.final_score >= 70 THEN 'Credit'
    WHEN e.final_score >= 60 THEN 'Pass'
    ELSE 'Fail'
END AS overall_grade,

CASE
    WHEN c.course_code LIKE 'CS%' THEN 'Computer Science'
    WHEN c.course_code LIKE 'MA%' THEN 'Mathematics'
    WHEN c.course_code LIKE 'PH%' THEN 'Physics'
    ELSE 'Other'
END AS course_category,

CASE
    WHEN e.is_pass = 'Y' THEN 'Passed'
    ELSE 'Not Passed'
END AS pass_status

FROM
    students s
LEFT JOIN
    enrolments e ON s.student_id = e.student_id
LEFT JOIN
    courses c ON e.course_id = c.course_id
LEFT JOIN
    departments d ON s.department = d.department_id
WHERE
    e.year >= 2020
    AND s.status = 'active'
    AND (e.score1 > 50 OR e.score2 > 50 OR e.score3 > 50 OR e.score4 > 50)
ORDER BY s.full_name;


/*
SQL 03
Move enrolment table to CTE
*/

WITH enrolment_with_grades AS (
    SELECT
    e.student_id,
    e.semester,
    e.year,
    e.course_id,
    CASE
        WHEN e.score1 >= 90 THEN 'A'
        WHEN e.score1 >= 80 THEN 'B'
        WHEN e.score1 >= 70 THEN 'C'
        WHEN e.score1 >= 60 THEN 'D'
        ELSE 'F'
    END AS grade_score1,
    CASE
        WHEN e.score2 >= 90 THEN 'A'
        WHEN e.score2 >= 80 THEN 'B'
        WHEN e.score2 >= 70 THEN 'C'
        WHEN e.score2 >= 60 THEN 'D'
        ELSE 'F'
    END AS grade_score2,
    CASE
        WHEN e.score3 >= 90 THEN 'A'
        WHEN e.score3 >= 80 THEN 'B'
        WHEN e.score3 >= 70 THEN 'C'
        WHEN e.score3 >= 60 THEN 'D'
        ELSE 'F'
    END AS grade_score3,

    CASE
        WHEN e.score4 >= 90 THEN 'A'
        WHEN e.score4 >= 80 THEN 'B'
        WHEN e.score4 >= 70 THEN 'C'
        WHEN e.score4 >= 60 THEN 'D'
        ELSE 'F'
    END AS grade_score4,

    CASE
        WHEN e.score5 >= 90 THEN 'A'
        WHEN e.score5 >= 80 THEN 'B'
        WHEN e.score5 >= 70 THEN 'C'
        WHEN e.score5 >= 60 THEN 'D'
        ELSE 'F'
    END AS grade_score5,

    CASE
        WHEN e.score6 >= 90 THEN 'A'
        WHEN e.score6 >= 80 THEN 'B'
        WHEN e.score6 >= 70 THEN 'C'
        WHEN e.score6 >= 60 THEN 'D'
        ELSE 'F'
    END AS grade_score6,

    CASE
        WHEN e.score7 >= 90 THEN 'A'
        WHEN e.score7 >= 80 THEN 'B'
        WHEN e.score7 >= 70 THEN 'C'
        WHEN e.score7 >= 60 THEN 'D'
        ELSE 'F'
    END AS grade_score7,

    CASE
        WHEN e.score8 >= 90 THEN 'A'
        WHEN e.score8 >= 80 THEN 'B'
        WHEN e.score8 >= 70 THEN 'C'
        WHEN e.score8 >= 60 THEN 'D'
        ELSE 'F'
    END AS grade_score8,

    CASE
        WHEN e.score9 >= 90 THEN 'A'
        WHEN e.score9 >= 80 THEN 'B'
        WHEN e.score9 >= 70 THEN 'C'
        WHEN e.score9 >= 60 THEN 'D'
        ELSE 'F'
    END AS grade_score9,

    CASE
        WHEN e.score10 >= 90 THEN 'A'
        WHEN e.score10 >= 80 THEN 'B'
        WHEN e.score10 >= 70 THEN 'C'
        WHEN e.score10 >= 60 THEN 'D'
        ELSE 'F'
    END AS grade_score10,

    CASE
        WHEN e.attendance >= 95 THEN 'Excellent'
        WHEN e.attendance >= 85 THEN 'Good'
        WHEN e.attendance >= 75 THEN 'Satisfactory'
        WHEN e.attendance >= 60 THEN 'Poor'
        ELSE 'Fail'
    END AS attendance_rating,
    CASE
        WHEN e.final_score >= 90 THEN 'High Distinction'
        WHEN e.final_score >= 80 THEN 'Distinction'
        WHEN e.final_score >= 70 THEN 'Credit'
        WHEN e.final_score >= 60 THEN 'Pass'
        ELSE 'Fail'
    END AS overall_grade,

    CASE
        WHEN e.is_pass = 'Y' THEN 'Passed'
        ELSE 'Not Passed'
    END AS pass_status
    FROM enrolments e
    WHERE e.year >= 2020
    AND (e.score1 > 50 OR e.score2 > 50 OR e.score3 > 50 OR e.score4 > 50)
)
SELECT
s.student_id,
s.full_name,
s.department,
s.enrollment_year,
d.advisor_name,
d.office_location, 
c.course_name,
c.course_code,
e.semester,
e.year,
e.grade_score1,
e.grade_score2,
e.grade_score3,
e.grade_score4,
e.grade_score5,
e.grade_score6,
e.grade_score7,
e.grade_score8,
e.grade_score9,
e.grade_score10,
e.attendance_rating,

CASE
    WHEN s.enrollment_year < 2018 THEN 'Legacy'
    WHEN s.enrollment_year BETWEEN 2018 AND 2020 THEN 'Midstream'
    ELSE 'Recent'
END AS student_category,

e.overall_grade,

CASE
    WHEN c.course_code LIKE 'CS%' THEN 'Computer Science'
    WHEN c.course_code LIKE 'MA%' THEN 'Mathematics'
    WHEN c.course_code LIKE 'PH%' THEN 'Physics'
    ELSE 'Other'
END AS course_category,

e.pass_status

FROM
    students s
LEFT JOIN
    enrolment_with_grades e ON s.student_id = e.student_id
LEFT JOIN
    courses c ON e.course_id = c.course_id
LEFT JOIN
    departments d ON s.department = d.department_id
WHERE s.status = 'active'
ORDER BY s.full_name;


/*
SQL 04
Grading lookup table
*/

CREATE TABLE score_grades (
  grade_letter CHAR(1),
  lower_limit INT,
  upper_limit INT
);

INSERT INTO score_grades (grade_letter, lower_limit, upper_limit) VALUES
('F', 0, 60),
('D', 60, 70),
('C', 70, 80),
('B', 80, 90),
('A', 90, 100);

/*
SQL 05
Lookup a grade table
*/


WITH enrolment_with_grades AS (
    SELECT e.student_id,
    e.semester,
    e.year,
    e.course_id,
    s1.grade_letter AS grade_score1,
    CASE
        WHEN e.score2 >= 90 THEN 'A'
        WHEN e.score2 >= 80 THEN 'B'
        WHEN e.score2 >= 70 THEN 'C'
        WHEN e.score2 >= 60 THEN 'D'
        ELSE 'F'
    END AS grade_score2,

    CASE
        WHEN e.score3 >= 90 THEN 'A'
        WHEN e.score3 >= 80 THEN 'B'
        WHEN e.score3 >= 70 THEN 'C'
        WHEN e.score3 >= 60 THEN 'D'
        ELSE 'F'
    END AS grade_score3,

    CASE
        WHEN e.score4 >= 90 THEN 'A'
        WHEN e.score4 >= 80 THEN 'B'
        WHEN e.score4 >= 70 THEN 'C'
        WHEN e.score4 >= 60 THEN 'D'
        ELSE 'F'
    END AS grade_score4,

    CASE
        WHEN e.score5 >= 90 THEN 'A'
        WHEN e.score5 >= 80 THEN 'B'
        WHEN e.score5 >= 70 THEN 'C'
        WHEN e.score5 >= 60 THEN 'D'
        ELSE 'F'
    END AS grade_score5,

    CASE
        WHEN e.score6 >= 90 THEN 'A'
        WHEN e.score6 >= 80 THEN 'B'
        WHEN e.score6 >= 70 THEN 'C'
        WHEN e.score6 >= 60 THEN 'D'
        ELSE 'F'
    END AS grade_score6,

    CASE
        WHEN e.score7 >= 90 THEN 'A'
        WHEN e.score7 >= 80 THEN 'B'
        WHEN e.score7 >= 70 THEN 'C'
        WHEN e.score7 >= 60 THEN 'D'
        ELSE 'F'
    END AS grade_score7,

    CASE
        WHEN e.score8 >= 90 THEN 'A'
        WHEN e.score8 >= 80 THEN 'B'
        WHEN e.score8 >= 70 THEN 'C'
        WHEN e.score8 >= 60 THEN 'D'
        ELSE 'F'
    END AS grade_score8,

    CASE
        WHEN e.score9 >= 90 THEN 'A'
        WHEN e.score9 >= 80 THEN 'B'
        WHEN e.score9 >= 70 THEN 'C'
        WHEN e.score9 >= 60 THEN 'D'
        ELSE 'F'
    END AS grade_score9,

    CASE
        WHEN e.score10 >= 90 THEN 'A'
        WHEN e.score10 >= 80 THEN 'B'
        WHEN e.score10 >= 70 THEN 'C'
        WHEN e.score10 >= 60 THEN 'D'
        ELSE 'F'
    END AS grade_score10,

    CASE
        WHEN e.attendance >= 95 THEN 'Excellent'
        WHEN e.attendance >= 85 THEN 'Good'
        WHEN e.attendance >= 75 THEN 'Satisfactory'
        WHEN e.attendance >= 60 THEN 'Poor'
        ELSE 'Fail'
    END AS attendance_rating,
    CASE
        WHEN e.final_score >= 90 THEN 'High Distinction'
        WHEN e.final_score >= 80 THEN 'Distinction'
        WHEN e.final_score >= 70 THEN 'Credit'
        WHEN e.final_score >= 60 THEN 'Pass'
        ELSE 'Fail'
    END AS overall_grade,

    CASE
        WHEN e.is_pass = 'Y' THEN 'Passed'
        ELSE 'Not Passed'
    END AS pass_status
    FROM enrolments e
    INNER JOIN score_grades s1 ON e.score1 >= s1.lower_limit AND e.score1 < s1.upper_limit
    WHERE e.year >= 2020
    AND (e.score1 > 50 OR e.score2 > 50 OR e.score3 > 50 OR e.score4 > 50)
)
SELECT
s.student_id,
s.full_name,
s.department,
s.enrollment_year,
d.advisor_name,
d.office_location, 
c.course_name,
c.course_code,
e.semester,
e.year,
e.grade_score1,
e.grade_score2,
e.grade_score3,
e.grade_score4,
e.grade_score5,
e.grade_score6,
e.grade_score7,
e.grade_score8,
e.grade_score9,
e.grade_score10,
e.attendance_rating,

CASE
    WHEN s.enrollment_year < 2018 THEN 'Legacy'
    WHEN s.enrollment_year BETWEEN 2018 AND 2020 THEN 'Midstream'
    ELSE 'Recent'
END AS student_category,

e.overall_grade,

CASE
    WHEN c.course_code LIKE 'CS%' THEN 'Computer Science'
    WHEN c.course_code LIKE 'MA%' THEN 'Mathematics'
    WHEN c.course_code LIKE 'PH%' THEN 'Physics'
    ELSE 'Other'
END AS course_category,

e.pass_status

FROM
    students s
LEFT JOIN
    enrolment_with_grades e ON s.student_id = e.student_id
LEFT JOIN
    courses c ON e.course_id = c.course_id
LEFT JOIN
    departments d ON s.department = d.department_id
WHERE s.status = 'active'
ORDER BY s.full_name;


/*
SQL 06
Repeat for all other grade scores
*/


WITH enrolment_with_grades AS (
    SELECT e.student_id,
    e.semester,
    e.year,
    e.course_id,
    s1.grade_letter AS grade_score1,
    s2.grade_letter AS grade_score2,
    s3.grade_letter AS grade_score3,
    s4.grade_letter AS grade_score4,
    s5.grade_letter AS grade_score5,
    s6.grade_letter AS grade_score6,
    s7.grade_letter AS grade_score7,
    s8.grade_letter AS grade_score8,
    s9.grade_letter AS grade_score9,
    s10.grade_letter AS grade_score10,


    CASE
        WHEN e.attendance >= 95 THEN 'Excellent'
        WHEN e.attendance >= 85 THEN 'Good'
        WHEN e.attendance >= 75 THEN 'Satisfactory'
        WHEN e.attendance >= 60 THEN 'Poor'
        ELSE 'Fail'
    END AS attendance_rating,
    CASE
        WHEN e.final_score >= 90 THEN 'High Distinction'
        WHEN e.final_score >= 80 THEN 'Distinction'
        WHEN e.final_score >= 70 THEN 'Credit'
        WHEN e.final_score >= 60 THEN 'Pass'
        ELSE 'Fail'
    END AS overall_grade,

    CASE
        WHEN e.is_pass = 'Y' THEN 'Passed'
        ELSE 'Not Passed'
    END AS pass_status
    FROM enrolments e
    INNER JOIN score_grades s1 ON e.score1 >= s1.lower_limit AND e.score1 < s1.upper_limit
    INNER JOIN score_grades s2 ON e.score1 >= s2.lower_limit AND e.score1 < s2.upper_limit
    INNER JOIN score_grades s3 ON e.score1 >= s3.lower_limit AND e.score1 < s3.upper_limit
    INNER JOIN score_grades s4 ON e.score1 >= s4.lower_limit AND e.score1 < s4.upper_limit
    INNER JOIN score_grades s5 ON e.score1 >= s5.lower_limit AND e.score1 < s5.upper_limit
    INNER JOIN score_grades s6 ON e.score1 >= s6.lower_limit AND e.score1 < s6.upper_limit
    INNER JOIN score_grades s7 ON e.score1 >= s7.lower_limit AND e.score1 < s7.upper_limit
    INNER JOIN score_grades s8 ON e.score1 >= s8.lower_limit AND e.score1 < s8.upper_limit
    INNER JOIN score_grades s9 ON e.score1 >= s9.lower_limit AND e.score1 < s9.upper_limit
    INNER JOIN score_grades s10 ON e.score1 >= s10.lower_limit AND e.score1 < s10.upper_limit
    WHERE e.year >= 2020
    AND (e.score1 > 50 OR e.score2 > 50 OR e.score3 > 50 OR e.score4 > 50)
)
SELECT
s.student_id,
s.full_name,
s.department,
s.enrollment_year,
d.advisor_name,
d.office_location, 
c.course_name,
c.course_code,
e.semester,
e.year,
e.grade_score1,
e.grade_score2,
e.grade_score3,
e.grade_score4,
e.grade_score5,
e.grade_score6,
e.grade_score7,
e.grade_score8,
e.grade_score9,
e.grade_score10,
e.attendance_rating,

CASE
    WHEN s.enrollment_year < 2018 THEN 'Legacy'
    WHEN s.enrollment_year BETWEEN 2018 AND 2020 THEN 'Midstream'
    ELSE 'Recent'
END AS student_category,

e.overall_grade,

CASE
    WHEN c.course_code LIKE 'CS%' THEN 'Computer Science'
    WHEN c.course_code LIKE 'MA%' THEN 'Mathematics'
    WHEN c.course_code LIKE 'PH%' THEN 'Physics'
    ELSE 'Other'
END AS course_category,

e.pass_status

FROM
    students s
LEFT JOIN
    enrolment_with_grades e ON s.student_id = e.student_id
LEFT JOIN
    courses c ON e.course_id = c.course_id
LEFT JOIN
    departments d ON s.department = d.department_id
WHERE s.status = 'active'
ORDER BY s.full_name;


/*
SQL 07
Normalise the grades
*/

CREATE TABLE enrolment_grades (
    id SERIAL PRIMARY KEY,
    enrolment_id INTEGER,
    grade_index_number INTEGER,
    score INTEGER
);

INSERT INTO enrolment_grades (enrolment_id, grade_index_number, score)
SELECT id, 1, score1
FROM enrolments
UNION ALL
SELECT id, 2, score2
FROM enrolments
UNION ALL
SELECT id, 3, score3
FROM enrolments
UNION ALL
SELECT id, 4, score4
FROM enrolments
UNION ALL
SELECT id, 15, score5
FROM enrolments
UNION ALL
SELECT id, 6, score6
FROM enrolments
UNION ALL
SELECT id, 7, score7
FROM enrolments
UNION ALL
SELECT id, 8, score8
FROM enrolments
UNION ALL
SELECT id, 9, score9
FROM enrolments
UNION ALL
SELECT id, 10, score10
FROM enrolments;

/*
SQL 08
Update main query to use normalised data
It should show the grades and scores in a different format (rows instead of columns),
so we need to fix that
*/



WITH enrolment_with_grades AS (
    SELECT e.student_id,
    e.semester,
    e.year,
    e.course_id,
    eg.grade_index_number,
    s.grade_letter,

    CASE
        WHEN e.attendance >= 95 THEN 'Excellent'
        WHEN e.attendance >= 85 THEN 'Good'
        WHEN e.attendance >= 75 THEN 'Satisfactory'
        WHEN e.attendance >= 60 THEN 'Poor'
        ELSE 'Fail'
    END AS attendance_rating,
    CASE
        WHEN e.final_score >= 90 THEN 'High Distinction'
        WHEN e.final_score >= 80 THEN 'Distinction'
        WHEN e.final_score >= 70 THEN 'Credit'
        WHEN e.final_score >= 60 THEN 'Pass'
        ELSE 'Fail'
    END AS overall_grade,

    CASE
        WHEN e.is_pass = 'Y' THEN 'Passed'
        ELSE 'Not Passed'
    END AS pass_status
    FROM enrolments e
    INNER JOIN enrolment_grades eg ON e.id = eg.enrolment_id
    INNER JOIN score_grades s ON eg.score >= s.lower_limit AND eg.score < s.upper_limit
    WHERE e.year >= 2020
    AND (e.score1 > 50 OR e.score2 > 50 OR e.score3 > 50 OR e.score4 > 50)
)
SELECT
s.student_id,
s.full_name,
s.department,
s.enrollment_year,
d.advisor_name,
d.office_location, 
c.course_name,
c.course_code,
e.semester,
e.year,
e.grade_index_number,
e.grade_letter,
e.attendance_rating,

CASE
    WHEN s.enrollment_year < 2018 THEN 'Legacy'
    WHEN s.enrollment_year BETWEEN 2018 AND 2020 THEN 'Midstream'
    ELSE 'Recent'
END AS student_category,

e.overall_grade,

CASE
    WHEN c.course_code LIKE 'CS%' THEN 'Computer Science'
    WHEN c.course_code LIKE 'MA%' THEN 'Mathematics'
    WHEN c.course_code LIKE 'PH%' THEN 'Physics'
    ELSE 'Other'
END AS course_category,

e.pass_status

FROM
    students s
LEFT JOIN
    enrolment_with_grades e ON s.student_id = e.student_id
LEFT JOIN
    courses c ON e.course_id = c.course_id
LEFT JOIN
    departments d ON s.department = d.department_id
WHERE s.status = 'active'
ORDER BY s.full_name;


/*
SQL 09
Translate the grading back to columns
This may involve a Cross Apply
Or maybe correlated SELECTs in the main query - try this as it may be simpler
*/



WITH enrolment_with_grades AS (
    SELECT e.student_id,
    e.semester,
    e.year,
    e.course_id,
    (
        SELECT s.grade_letter
        FROM enrolments en
        INNER JOIN enrolment_grades eg ON en.id = eg.enrolment_id
        INNER JOIN score_grades s ON eg.score >= s.lower_limit AND eg.score < s.upper_limit
        WHERE eg.grade_index_number = 1
        AND en.id = e.id
    ) AS grade_score1,


    CASE
        WHEN e.attendance >= 95 THEN 'Excellent'
        WHEN e.attendance >= 85 THEN 'Good'
        WHEN e.attendance >= 75 THEN 'Satisfactory'
        WHEN e.attendance >= 60 THEN 'Poor'
        ELSE 'Fail'
    END AS attendance_rating,
    CASE
        WHEN e.final_score >= 90 THEN 'High Distinction'
        WHEN e.final_score >= 80 THEN 'Distinction'
        WHEN e.final_score >= 70 THEN 'Credit'
        WHEN e.final_score >= 60 THEN 'Pass'
        ELSE 'Fail'
    END AS overall_grade,

    CASE
        WHEN e.is_pass = 'Y' THEN 'Passed'
        ELSE 'Not Passed'
    END AS pass_status
    FROM enrolments e
    WHERE e.year >= 2020
    AND (e.score1 > 50 OR e.score2 > 50 OR e.score3 > 50 OR e.score4 > 50)
)
SELECT
s.student_id,
s.full_name,
s.department,
s.enrollment_year,
d.advisor_name,
d.office_location, 
c.course_name,
c.course_code,
e.semester,
e.year,
e.grade_score1,
e.attendance_rating,

CASE
    WHEN s.enrollment_year < 2018 THEN 'Legacy'
    WHEN s.enrollment_year BETWEEN 2018 AND 2020 THEN 'Midstream'
    ELSE 'Recent'
END AS student_category,

e.overall_grade,

CASE
    WHEN c.course_code LIKE 'CS%' THEN 'Computer Science'
    WHEN c.course_code LIKE 'MA%' THEN 'Mathematics'
    WHEN c.course_code LIKE 'PH%' THEN 'Physics'
    ELSE 'Other'
END AS course_category,

e.pass_status

FROM
    students s
LEFT JOIN
    enrolment_with_grades e ON s.student_id = e.student_id
LEFT JOIN
    courses c ON e.course_id = c.course_id
LEFT JOIN
    departments d ON s.department = d.department_id
WHERE s.status = 'active'
ORDER BY s.full_name;


/*
SQL 10
Here, the query should work with one grade, but if we keep expanding, it could get messy.
What else could we try?
Maybe a function
*/
DROP FUNCTION calculate_grade_from_score;

CREATE OR REPLACE FUNCTION calculate_grade_from_score (score INT)
RETURNS CHAR
AS $$
DECLARE
  grade_letter CHAR(1);
BEGIN
    SELECT
    CASE
        WHEN score >= 90 THEN 'A'
        WHEN score >= 80 THEN 'B'
        WHEN score >= 70 THEN 'C'
        WHEN score >= 60 THEN 'D'
        ELSE 'F'
    END
    INTO grade_letter;

    RETURN grade_letter;
END;

$$ LANGUAGE plpgsql;

/*
 Test the function by calling it
 */

SELECT calculate_grade_from_score(85);
SELECT calculate_grade_from_score(62);


/*
SQL 11
Add this function into the main query
*/



WITH enrolment_with_grades AS (
    SELECT e.student_id,
    e.semester,
    e.year,
    e.course_id,
    calculate_grade_from_score(e.score1) AS grade_score1,
    calculate_grade_from_score(e.score1) AS grade_score2,
    calculate_grade_from_score(e.score1) AS grade_score3,
    calculate_grade_from_score(e.score1) AS grade_score4,
    calculate_grade_from_score(e.score1) AS grade_score5,
    calculate_grade_from_score(e.score1) AS grade_score6,
    calculate_grade_from_score(e.score1) AS grade_score7,
    calculate_grade_from_score(e.score1) AS grade_score8,
    calculate_grade_from_score(e.score1) AS grade_score9,
    calculate_grade_from_score(e.score1) AS grade_score10,

    CASE
        WHEN e.attendance >= 95 THEN 'Excellent'
        WHEN e.attendance >= 85 THEN 'Good'
        WHEN e.attendance >= 75 THEN 'Satisfactory'
        WHEN e.attendance >= 60 THEN 'Poor'
        ELSE 'Fail'
    END AS attendance_rating,
    CASE
        WHEN e.final_score >= 90 THEN 'High Distinction'
        WHEN e.final_score >= 80 THEN 'Distinction'
        WHEN e.final_score >= 70 THEN 'Credit'
        WHEN e.final_score >= 60 THEN 'Pass'
        ELSE 'Fail'
    END AS overall_grade,

    CASE
        WHEN e.is_pass = 'Y' THEN 'Passed'
        ELSE 'Not Passed'
    END AS pass_status
    FROM enrolments e
    WHERE e.year >= 2020
    AND (e.score1 > 50 OR e.score2 > 50 OR e.score3 > 50 OR e.score4 > 50)
)
SELECT
s.student_id,
s.full_name,
s.department,
s.enrollment_year,
d.advisor_name,
d.office_location, 
c.course_name,
c.course_code,
e.semester,
e.year,
e.grade_score1,
e.grade_score2,
e.grade_score3,
e.grade_score4,
e.grade_score5,
e.grade_score6,
e.grade_score7,
e.grade_score8,
e.grade_score9,
e.grade_score10,
e.attendance_rating,

CASE
    WHEN s.enrollment_year < 2018 THEN 'Legacy'
    WHEN s.enrollment_year BETWEEN 2018 AND 2020 THEN 'Midstream'
    ELSE 'Recent'
END AS student_category,

e.overall_grade,

CASE
    WHEN c.course_code LIKE 'CS%' THEN 'Computer Science'
    WHEN c.course_code LIKE 'MA%' THEN 'Mathematics'
    WHEN c.course_code LIKE 'PH%' THEN 'Physics'
    ELSE 'Other'
END AS course_category,

e.pass_status

FROM
    students s
LEFT JOIN
    enrolment_with_grades e ON s.student_id = e.student_id
LEFT JOIN
    courses c ON e.course_id = c.course_id
LEFT JOIN
    departments d ON s.department = d.department_id
WHERE s.status = 'active'
ORDER BY s.full_name;


/*
Next steps:
Lookup table for course category - get all the course codes and have a simple lookup
Point out the e.year filter and the s.enrolment year, but they are different things
Optional: we could move the attendance and final score calculations to a function,
but they are only used once in this query, so we may not want to
Optional: you could use the normalised grades, then use correlated subqueries,
depends which approach you prefer
*/

/*
Create course category table and populate it
Not normalised, we could normalise it, then we would need to add a category_id to the course table
Assume we can't modify the base tables?
*/

CREATE TABLE course_category (
    course_code VARCHAR(10),
    category_name VARCHAR(100),
    CONSTRAINT pk_coursecategory
        PRIMARY KEY (course_code)
);

SELECT DISTINCT course_code
    FROM courses;

/*
 SQL 12
 */
INSERT INTO course_category (course_code, category_name) VALUES
('CS100', 'Computer Science'),
('CS200', 'Computer Science'),
('CS300', 'Computer Science'),
('MA100', 'Mathematics'),
('MA120', 'Mathematics'),
('PH100', 'Physics'),
('PH250', 'Physics'),
('PH400', 'Physics');


/*
SQL 13
Update main query to use course category table
*/


WITH enrolment_with_grades AS (
    SELECT e.student_id,
    e.semester,
    e.year,
    e.course_id,
    calculate_grade_from_score(e.score1) AS grade_score1,
    calculate_grade_from_score(e.score1) AS grade_score2,
    calculate_grade_from_score(e.score1) AS grade_score3,
    calculate_grade_from_score(e.score1) AS grade_score4,
    calculate_grade_from_score(e.score1) AS grade_score5,
    calculate_grade_from_score(e.score1) AS grade_score6,
    calculate_grade_from_score(e.score1) AS grade_score7,
    calculate_grade_from_score(e.score1) AS grade_score8,
    calculate_grade_from_score(e.score1) AS grade_score9,
    calculate_grade_from_score(e.score1) AS grade_score10,

    CASE
        WHEN e.attendance >= 95 THEN 'Excellent'
        WHEN e.attendance >= 85 THEN 'Good'
        WHEN e.attendance >= 75 THEN 'Satisfactory'
        WHEN e.attendance >= 60 THEN 'Poor'
        ELSE 'Fail'
    END AS attendance_rating,
    CASE
        WHEN e.final_score >= 90 THEN 'High Distinction'
        WHEN e.final_score >= 80 THEN 'Distinction'
        WHEN e.final_score >= 70 THEN 'Credit'
        WHEN e.final_score >= 60 THEN 'Pass'
        ELSE 'Fail'
    END AS overall_grade,

    CASE
        WHEN e.is_pass = 'Y' THEN 'Passed'
        ELSE 'Not Passed'
    END AS pass_status
    FROM enrolments e
    WHERE e.year >= 2020
    AND (e.score1 > 50 OR e.score2 > 50 OR e.score3 > 50 OR e.score4 > 50)
)
SELECT
s.student_id,
s.full_name,
s.department,
s.enrollment_year,
d.advisor_name,
d.office_location, 
c.course_name,
c.course_code,
e.semester,
e.year,
e.grade_score1,
e.grade_score2,
e.grade_score3,
e.grade_score4,
e.grade_score5,
e.grade_score6,
e.grade_score7,
e.grade_score8,
e.grade_score9,
e.grade_score10,
e.attendance_rating,

CASE
    WHEN s.enrollment_year < 2018 THEN 'Legacy'
    WHEN s.enrollment_year BETWEEN 2018 AND 2020 THEN 'Midstream'
    ELSE 'Recent'
END AS student_category,
e.overall_grade,
cc.category_name AS course_category,
e.pass_status
FROM
    students s
LEFT JOIN
    enrolment_with_grades e ON s.student_id = e.student_id
LEFT JOIN
    courses c ON e.course_id = c.course_id
LEFT JOIN
    departments d ON s.department = d.department_id
LEFT JOIN course_category cc ON c.course_code = cc.course_code
WHERE s.status = 'active'
ORDER BY s.full_name;
