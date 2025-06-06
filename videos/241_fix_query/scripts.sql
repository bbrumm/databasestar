/*
Create tables and add data
*/




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
    enrollments e ON s.student_id = e.student_id
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
    enrollments e ON s.student_id = e.student_id
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

WITH enrolment_with_grades (
    SELECT e.student_id,
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
    FROM enrolment e
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
WHERE
    e.year >= 2020
    AND s.status = 'active'
    AND (e.score1 > 50 OR e.score2 > 50 OR e.score3 > 50 OR e.score4 > 50)
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


WITH enrolment_with_grades (
    SELECT e.student_id,
    e.semester,
    e.year,
    s1.grade_letter AS grade_score1

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
    FROM enrolment e
    INNER JOIN score_grades s1 ON e.score1 >= s1.lower_limit AND e.score1 < s1.upper_limit
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
WHERE
    e.year >= 2020
    AND s.status = 'active'
    AND (e.score1 > 50 OR e.score2 > 50 OR e.score3 > 50 OR e.score4 > 50)
ORDER BY s.full_name;


/*
SQL 06
Repeat for all other grade scores
*/



WITH enrolment_with_grades (
    SELECT e.student_id,
    e.semester,
    e.year,
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
    FROM enrolment e
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
WHERE
    e.year >= 2020
    AND s.status = 'active'
    AND (e.score1 > 50 OR e.score2 > 50 OR e.score3 > 50 OR e.score4 > 50)
ORDER BY s.full_name;


/*
SQL 07
Normalise the grades
*/

CREATE TABLE enrolment_grades (
    id SERIAL,
    enrolment_id INTEGER,
    grade_index_number INTEGER,
    score INTEGER
);

INSERT INTO enrolment_grades (enrolment_id, grade_index_number, score)
SELECT enrolment_id, 1, score1
FROM enrolment
UNION ALL
SELECT enrolment_id, 2, score2
FROM enrolment
UNION ALL
SELECT enrolment_id, 3, score3
FROM enrolment
UNION ALL
SELECT enrolment_id, 4, score4
FROM enrolment
UNION ALL
SELECT enrolment_id, 15, score5
FROM enrolment
UNION ALL
SELECT enrolment_id, 6, score6
FROM enrolment
UNION ALL
SELECT enrolment_id, 7, score7
FROM enrolment
UNION ALL
SELECT enrolment_id, 8, score8
FROM enrolment
UNION ALL
SELECT enrolment_id, 9, score9
FROM enrolment
UNION ALL
SELECT enrolment_id, 10, score10
FROM enrolment;

/*
SQL 08
Update main query to use normalised data
It should show the grades and scores in a different format (rows instead of columns),
so we need to fix that
*/



WITH enrolment_with_grades (
    SELECT e.student_id,
    e.semester,
    e.year,
    eg.grade_index_number,
    s.grade_letter

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
    FROM enrolment e
    INNER JOIN enrolment_grades eg ON e.id = eg.enrolment_id
    INNER JOIN score_grades s ON eg.score >= s.lower_limit AND eg.score < s.upper_limit
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
WHERE
    e.year >= 2020
    AND s.status = 'active'
    AND (e.score1 > 50 OR e.score2 > 50 OR e.score3 > 50 OR e.score4 > 50)
ORDER BY s.full_name;


/*
Translate the grading back to columns
This may involve a Cross Apply
Or maybe correlated SELECTs in the main query - try this as it may be simpler
*/



WITH enrolment_with_grades (
    SELECT e.student_id,
    e.semester,
    e.year,
    (
        SELECT s.grade_letter
        FROM enrolment en
        INNER JOIN enrolment_grades eg ON en.id = eg.enrolment_id
        INNER JOIN score_grades s ON eg.score >= s.lower_limit AND eg.score < s.upper_limit
        WHERE eg.grade_index_number = 1
        AND en.enrolment_id = e.enrolment_id
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
    FROM enrolment e
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
WHERE
    e.year >= 2020
    AND s.status = 'active'
    AND (e.score1 > 50 OR e.score2 > 50 OR e.score3 > 50 OR e.score4 > 50)
ORDER BY s.full_name;


/*
Here, the query should work with one grade, but if we keep expanding, it could get messy.
What else could we try?
Maybe a function
*/

CREATE OR REPLACE FUNCTION calculate_grade_from_score (score INT)
RETURNS INT
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
END;

$$ LANGUAGE plpgsql;

/*
Add this function into the main query
*/



WITH enrolment_with_grades (
    SELECT e.student_id,
    e.semester,
    e.year,
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
    FROM enrolment e
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
WHERE
    e.year >= 2020
    AND s.status = 'active'
    AND (e.score1 > 50 OR e.score2 > 50 OR e.score3 > 50 OR e.score4 > 50)
ORDER BY s.full_name;

/*
TODO:
Move the WHERE clause that mentions e.year and all of the e.score values into the first CTE in all queries
*/

/*
Next steps:
Lookup table for course category - get all the course codes and have a simple lookup
Point out the e.year filter and the s.enrolment year, but they are different things
Optional: we could move the attendance and final score calculations to a function,
but they are only used once in this query, so we may not want to
Optional: you could use the normalised grades, then use correlated subqueries,
depends which approach you prefer
*/