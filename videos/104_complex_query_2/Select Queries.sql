/*
Find names of students
*/
SELECT id, name
FROM students;

/*
Find best friend IDs
*/
SELECT
s.id AS student_id,
s.name AS student_name,
f.friend_id
FROM students s
INNER JOIN friends f ON f.id = s.id;

/*
Find student salary
*/
SELECT
s.id AS student_id,
s.name AS student_name,
p.salary AS student_salary,
f.friend_id
FROM students s
INNER JOIN friends f ON f.id = s.id
INNER JOIN packages p ON s.id = p.id;

/*
Find friend salary
Issue, so we need to join to packages twice
*/

SELECT
s.id AS student_id,
s.name AS student_name,
ps.salary AS student_salary,
f.friend_id,
pf.salary AS friend_salary
FROM students s
INNER JOIN friends f ON f.id = s.id
INNER JOIN packages ps ON s.id = ps.id
INNER JOIN packages pf ON f.friend_id = pf.id;

/*
Find the students whose best friends got offered a higher salary than them
Filter on salary
*/
SELECT
s.id AS student_id,
s.name AS student_name,
ps.salary AS student_salary,
f.friend_id,
pf.salary AS friend_salary
FROM students s
INNER JOIN friends f ON f.id = s.id
INNER JOIN packages ps ON s.id = ps.id
INNER JOIN packages pf ON f.friend_id = pf.id
WHERE pf.salary > ps.salary;

/*
Ensure data is ordered
*/
SELECT
s.id AS student_id,
s.name AS student_name,
ps.salary AS student_salary,
f.friend_id,
pf.salary AS friend_salary
FROM students s
INNER JOIN friends f ON f.id = s.id
INNER JOIN packages ps ON s.id = ps.id
INNER JOIN packages pf ON f.friend_id = pf.id
WHERE pf.salary > ps.salary
ORDER BY pf.salary ASC;

/*
Remove columns we don't need to see
*/
SELECT
s.name
FROM students s
INNER JOIN friends f ON f.id = s.id
INNER JOIN packages ps ON s.id = ps.id
INNER JOIN packages pf ON f.friend_id = pf.id
WHERE pf.salary > ps.salary
ORDER BY pf.salary ASC;

