/*
Complex query - Ollivander's Inventory
*/

/*
Set up tables
*/

DROP TABLE wands;
DROP TABLE wands_property;

CREATE TABLE wands (
  id INT,
  code INT,
  coins_needed INT,
  power INT
);

CREATE TABLE wands_property (
  code INT,
  age INT,
  is_evil INT
);

/*
Insert data
*/

INSERT INTO wands (id, code, coins_needed, power) VALUES
(1, 4, 2688, 8),
(2, 3, 9365, 3),
(3, 3, 7187, 10),
(4, 3, 734, 8),
(5, 1, 6020, 2),
(6, 2, 6773, 7),
(7, 3, 9873, 9),
(8, 3, 7721, 7),
(9, 1, 1647, 10),
(10, 4, 504, 5),
(11, 2, 7587, 5),
(12, 5, 9897, 10),
(13, 3, 4651, 8),
(14, 2, 5408, 1),
(15, 2, 6018, 7),
(16, 4, 7710, 5),
(17, 2, 8798, 7),
(18, 2, 3312, 3),
(19, 4, 7651, 6),
(20, 5, 5689, 3);

INSERT INTO wands_property (code, age, is_evil) VALUES
(1, 45, 0),
(2, 40, 0),
(3, 4, 1),
(4, 20, 0),
(5, 17, 0);
