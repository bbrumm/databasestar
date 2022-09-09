DROP DATABASE IF EXISTS universities;
CREATE DATABASE universities;


DROP TABLE IF EXISTS universities.country;

CREATE TABLE universities.country (
  id INT NOT NULL AUTO_INCREMENT,
  country_name varchar(100) DEFAULT NULL,
  CONSTRAINT pk_country PRIMARY KEY (id)
);


INSERT INTO universities.country (id, country_name) VALUES
(1,'Argentina'),
(2,'Australia'),
(3,'Austria'),
(4,'Bangladesh'),
(5,'Belarus'),
(6,'Belgium'),
(7,'Brazil'),
(8,'Bulgaria'),
(9,'Canada'),
(10,'Chile'),
(11,'China'),
(12,'Colombia'),
(13,'Croatia'),
(14,'Cyprus'),
(15,'Czech Republic'),
(16,'Denmark'),
(17,'Egypt'),
(18,'Estonia'),
(19,'Finland'),
(20,'France'),
(21,'Germany'),
(22,'Ghana'),
(23,'Greece'),
(24,'Hong Kong'),
(25,'Hungary'),
(26,'Iceland'),
(27,'India'),
(28,'Indonesia'),
(29,'Iran'),
(30,'Ireland'),
(31,'Israel'),
(32,'Italy'),
(33,'Japan'),
(34,'Jordan'),
(35,'Kenya'),
(36,'Latvia'),
(37,'Lebanon'),
(38,'Lithuania'),
(39,'Luxembourg'),
(40,'Macau'),
(41,'Malaysia'),
(42,'Mexico'),
(43,'Morocco'),
(44,'Netherlands'),
(45,'New Zealand'),
(46,'Nigeria'),
(47,'Norway'),
(48,'Oman'),
(49,'Pakistan'),
(50,'Poland'),
(51,'Portugal'),
(52,'Puerto Rico'),
(53,'Qatar'),
(54,'Romania'),
(55,'Russia'),
(56,'Saudi Arabia'),
(57,'Serbia'),
(58,'Singapore'),
(59,'Slovakia'),
(60,'Slovenia'),
(61,'South Africa'),
(62,'South Korea'),
(63,'Spain'),
(64,'Sweden'),
(65,'Switzerland'),
(66,'Taiwan'),
(67,'Thailand'),
(68,'Turkey'),
(69,'Uganda'),
(70,'Ukraine'),
(71,'United Arab Emirates'),
(72,'United Kingdom'),
(73,'United States of America'),
(74,'Uruguay');


DROP TABLE IF EXISTS universities.ranking_system;

CREATE TABLE universities.ranking_system (
  id INT NOT NULL AUTO_INCREMENT,
  system_name VARCHAR(100) DEFAULT NULL,
  CONSTRAINT pk_ranksys PRIMARY KEY (id)
);


INSERT INTO universities.ranking_system (id, system_name) VALUES
(1,'Times Higher Education World University Ranking'),
(2,'Shanghai Ranking'),
(3,'Center for World University Rankings');



DROP TABLE IF EXISTS universities.ranking_criteria;

CREATE TABLE universities.ranking_criteria (
  id INT NOT NULL AUTO_INCREMENT,
  ranking_system_id INT DEFAULT NULL,
  criteria_name VARCHAR(200) DEFAULT NULL,
  CONSTRAINT pk_rankcrit PRIMARY KEY (id),
  CONSTRAINT fk_rc_rs FOREIGN KEY (ranking_system_id) REFERENCES universities.ranking_system (id)
);


INSERT INTO universities.ranking_criteria (id, ranking_system_id, criteria_name) VALUES
(1,1,'Teaching'),
(2,1,'International'),
(3,1,'Research'),
(4,1,'Citations'),
(5,1,'Income'),
(6,1,'Total Times'),
(7,2,'Alumni'),
(8,2,'Award'),
(9,2,'HiCi'),
(10,2,'N and S'),
(11,2,'Pub'),
(12,2,'PCP'),
(13,2,'Total Shanghai'),
(14,3,'Quality of Education Rank'),
(15,3,'Alumni Employment Rank'),
(16,3,'Quality of Faculty Rank'),
(17,3,'Publications Rank'),
(18,3,'Influence Rank'),
(19,3,'Citations Rank'),
(20,3,'Patents Rank'),
(21,3,'Total CWUR');

COMMIT;