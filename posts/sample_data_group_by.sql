/*
Sample data for the SQL GROUP BY post.
Post here: https://www.databasestar.com/sql-group-by/
*/

/*
Oracle
*/
CREATE TABLE sample_group_table (
  student_name VARCHAR2(50),
  subject_name VARCHAR2(100),
  school_year NUMBER,
  student_grade NUMBER
);


/*
SQL Server, MySQL, Postgres
*/

CREATE TABLE sample_group_table (
  student_name VARCHAR(50),
  subject_name VARCHAR(100),
  school_year INT,
  student_grade INT
);

/*
Sample data
*/

INSERT INTO sample_group_table (student_name, subject_name, school_year, student_grade)
VALUES ('Andrew', 'Physics', 2020, 76);
INSERT INTO sample_group_table (student_name, subject_name, school_year, student_grade)
VALUES ('Belle', 'Physics', 2020, 85);
INSERT INTO sample_group_table (student_name, subject_name, school_year, student_grade)
VALUES ('Chris', 'Physics', 2020, 40);
INSERT INTO sample_group_table (student_name, subject_name, school_year, student_grade)
VALUES ('Debbie', 'Physics', 2020, 54);
INSERT INTO sample_group_table (student_name, subject_name, school_year, student_grade)
VALUES ('Andrew', 'English', 2020, 96);
INSERT INTO sample_group_table (student_name, subject_name, school_year, student_grade)
VALUES ('Belle', 'English', 2020, 99);
INSERT INTO sample_group_table (student_name, subject_name, school_year, student_grade)
VALUES ('Chris', 'English', 2020, 41);
INSERT INTO sample_group_table (student_name, subject_name, school_year, student_grade)
VALUES ('Debbie', 'English', 2020, 49);
INSERT INTO sample_group_table (student_name, subject_name, school_year, student_grade)
VALUES ('Andrew', 'Mathematics', 2020, 44);
INSERT INTO sample_group_table (student_name, subject_name, school_year, student_grade)
VALUES ('Belle', 'Mathematics', 2020, 42);
INSERT INTO sample_group_table (student_name, subject_name, school_year, student_grade)
VALUES ('Chris', 'Mathematics', 2020, 94);
INSERT INTO sample_group_table (student_name, subject_name, school_year, student_grade)
VALUES ('Debbie', 'Mathematics', 2020, 57);
INSERT INTO sample_group_table (student_name, subject_name, school_year, student_grade)
VALUES ('Andrew', 'Physics', 2021, 53);
INSERT INTO sample_group_table (student_name, subject_name, school_year, student_grade)
VALUES ('Belle', 'Physics', 2021, 85);
INSERT INTO sample_group_table (student_name, subject_name, school_year, student_grade)
VALUES ('Chris', 'Physics', 2021, 74);
INSERT INTO sample_group_table (student_name, subject_name, school_year, student_grade)
VALUES ('Debbie', 'Physics', 2021, 72);
INSERT INTO sample_group_table (student_name, subject_name, school_year, student_grade)
VALUES ('Belle', 'English', 2021, 76);
INSERT INTO sample_group_table (student_name, subject_name, school_year, student_grade)
VALUES ('Chris', 'English', 2021, 86);
INSERT INTO sample_group_table (student_name, subject_name, school_year, student_grade)
VALUES ('Debbie', 'English', 2021, 68);
INSERT INTO sample_group_table (student_name, subject_name, school_year, student_grade)
VALUES ('Andrew', 'Mathematics', 2021, 41);
INSERT INTO sample_group_table (student_name, subject_name, school_year, student_grade)
VALUES ('Belle', 'Mathematics', 2021, 57);
INSERT INTO sample_group_table (student_name, subject_name, school_year, student_grade)
VALUES ('Debbie', 'Mathematics', 2021, 65);