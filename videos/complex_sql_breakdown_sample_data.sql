/*
Sample data for complex query breakdown
*/

/*
Drop tables, if you need to rerun the script
*/
DROP TABLE contests;
DROP TABLE challenges;
DROP TABLE colleges;
DROP TABLE submission_stats;
DROP TABLE view_stats;

/*
Create tables
*/

CREATE TABLE contests (
  contest_id INT,
  hacker_id INT,
  name VARCHAR(100)
);

CREATE TABLE challenges (
  challenge_id INT,
  college_id INT
);

CREATE TABLE colleges (
  college_id INT,
  contest_id INT
);

CREATE TABLE submission_stats (
  challenge_id INT,
  total_submissions INT,
  total_accepted_submissions INT
);

CREATE TABLE view_stats (
  challenge_id INT,
  total_views INT,
  total_unique_views INT
);

/*
Insert data
*/

INSERT INTO contests (contest_id, hacker_id,name) VALUES
(66406, 17973, 'Rose'),
(66556, 79153, 'Angela'),
(94828, 80275, 'Frank');

INSERT INTO colleges (college_id, contest_id) VALUES
(11219, 66406),
(32473, 66556),
(56685, 94828);

INSERT INTO challenges (challenge_id, college_id) VALUES
(18765, 11219),
(47127, 11219),
(60292, 32473),
(72974, 56685);

INSERT INTO view_stats (challenge_id, total_views, total_unique_views) VALUES
(47127, 26, 19),
(47127, 15, 14),
(18765, 43, 10),
(18765, 72, 13),
(75516, 35, 17),
(60292, 11, 10),
(72974, 41, 15),
(75516, 75, 11);

INSERT INTO submission_stats (challenge_id, total_submissions, total_accepted_submissions) VALUES
(75516, 34, 12),
(47127, 27, 10),
(47127, 56, 18),
(75516, 74, 12),
(75516, 83, 8),
(72974, 68, 24),
(72974, 82, 14),
(47127, 28, 11);
