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