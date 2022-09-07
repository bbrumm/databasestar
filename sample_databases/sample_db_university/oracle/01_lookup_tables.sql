

DROP TABLE country;

CREATE TABLE country (
  id NUMBER(11) NOT NULL,
  country_name VARCHAR2(100) DEFAULT NULL,
  PRIMARY KEY (id)
);


INSERT ALL
INTO country (id, country_name) VALUES (1,'Argentina')
INTO country (id, country_name) VALUES (2,'Australia')
INTO country (id, country_name) VALUES (3,'Austria')
INTO country (id, country_name) VALUES (4,'Bangladesh')
INTO country (id, country_name) VALUES (5,'Belarus')
INTO country (id, country_name) VALUES (6,'Belgium')
INTO country (id, country_name) VALUES (7,'Brazil')
INTO country (id, country_name) VALUES (8,'Bulgaria')
INTO country (id, country_name) VALUES (9,'Canada')
INTO country (id, country_name) VALUES (10,'Chile')
INTO country (id, country_name) VALUES (11,'China')
INTO country (id, country_name) VALUES (12,'Colombia')
INTO country (id, country_name) VALUES (13,'Croatia')
INTO country (id, country_name) VALUES (14,'Cyprus')
INTO country (id, country_name) VALUES (15,'Czech Republic')
INTO country (id, country_name) VALUES (16,'Denmark')
INTO country (id, country_name) VALUES (17,'Egypt')
INTO country (id, country_name) VALUES (18,'Estonia')
INTO country (id, country_name) VALUES (19,'Finland')
INTO country (id, country_name) VALUES (20,'France')
INTO country (id, country_name) VALUES (21,'Germany')
INTO country (id, country_name) VALUES (22,'Ghana')
INTO country (id, country_name) VALUES (23,'Greece')
INTO country (id, country_name) VALUES (24,'Hong Kong')
INTO country (id, country_name) VALUES (25,'Hungary')
INTO country (id, country_name) VALUES (26,'Iceland')
INTO country (id, country_name) VALUES (27,'India')
INTO country (id, country_name) VALUES (28,'Indonesia')
INTO country (id, country_name) VALUES (29,'Iran')
INTO country (id, country_name) VALUES (30,'Ireland')
INTO country (id, country_name) VALUES (31,'Israel')
INTO country (id, country_name) VALUES (32,'Italy')
INTO country (id, country_name) VALUES (33,'Japan')
INTO country (id, country_name) VALUES (34,'Jordan')
INTO country (id, country_name) VALUES (35,'Kenya')
INTO country (id, country_name) VALUES (36,'Latvia')
INTO country (id, country_name) VALUES (37,'Lebanon')
INTO country (id, country_name) VALUES (38,'Lithuania')
INTO country (id, country_name) VALUES (39,'Luxembourg')
INTO country (id, country_name) VALUES (40,'Macau')
INTO country (id, country_name) VALUES (41,'Malaysia')
INTO country (id, country_name) VALUES (42,'Mexico')
INTO country (id, country_name) VALUES (43,'Morocco')
INTO country (id, country_name) VALUES (44,'Netherlands')
INTO country (id, country_name) VALUES (45,'New Zealand')
INTO country (id, country_name) VALUES (46,'Nigeria')
INTO country (id, country_name) VALUES (47,'Norway')
INTO country (id, country_name) VALUES (48,'Oman')
INTO country (id, country_name) VALUES (49,'Pakistan')
INTO country (id, country_name) VALUES (50,'Poland')
INTO country (id, country_name) VALUES (51,'Portugal')
INTO country (id, country_name) VALUES (52,'Puerto Rico')
INTO country (id, country_name) VALUES (53,'Qatar')
INTO country (id, country_name) VALUES (54,'Romania')
INTO country (id, country_name) VALUES (55,'Russia')
INTO country (id, country_name) VALUES (56,'Saudi Arabia')
INTO country (id, country_name) VALUES (57,'Serbia')
INTO country (id, country_name) VALUES (58,'Singapore')
INTO country (id, country_name) VALUES (59,'Slovakia')
INTO country (id, country_name) VALUES (60,'Slovenia')
INTO country (id, country_name) VALUES (61,'South Africa')
INTO country (id, country_name) VALUES (62,'South Korea')
INTO country (id, country_name) VALUES (63,'Spain')
INTO country (id, country_name) VALUES (64,'Sweden')
INTO country (id, country_name) VALUES (65,'Switzerland')
INTO country (id, country_name) VALUES (66,'Taiwan')
INTO country (id, country_name) VALUES (67,'Thailand')
INTO country (id, country_name) VALUES (68,'Turkey')
INTO country (id, country_name) VALUES (69,'Uganda')
INTO country (id, country_name) VALUES (70,'Ukraine')
INTO country (id, country_name) VALUES (71,'United Arab Emirates')
INTO country (id, country_name) VALUES (72,'United Kingdom')
INTO country (id, country_name) VALUES (73,'United States of America')
INTO country (id, country_name) VALUES (74,'Uruguay')
SELECT * FROM dual;







DROP TABLE ranking_system;

CREATE TABLE ranking_system (
  id NUMBER(11) NOT NULL,
  system_name VARCHAR2(100) DEFAULT NULL,
  PRIMARY KEY (id)
);



INSERT ALL
INTO ranking_system (id, system_name) VALUES (1,'Times Higher Education World University Ranking')
INTO ranking_system (id, system_name) VALUES (2,'Shanghai Ranking')
INTO ranking_system (id, system_name) VALUES (3,'Center for World University Rankings')
SELECT * FROM dual;



DROP TABLE ranking_criteria;

CREATE TABLE ranking_criteria (
  id NUMBER(11) NOT NULL,
  ranking_system_id NUMBER(11) DEFAULT NULL,
  criteria_name VARCHAR2(200) DEFAULT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_rc_rs FOREIGN KEY (ranking_system_id) REFERENCES ranking_system (id)
);

--
-- Dumping data for table ranking_criteria
--


INSERT ALL
INTO ranking_criteria (id, ranking_system_id, criteria_name) VALUES (1,1,'Teaching')
INTO ranking_criteria (id, ranking_system_id, criteria_name) VALUES (2,1,'International')
INTO ranking_criteria (id, ranking_system_id, criteria_name) VALUES (3,1,'Research')
INTO ranking_criteria (id, ranking_system_id, criteria_name) VALUES (4,1,'Citations')
INTO ranking_criteria (id, ranking_system_id, criteria_name) VALUES (5,1,'Income')
INTO ranking_criteria (id, ranking_system_id, criteria_name) VALUES (6,1,'Total Times')
INTO ranking_criteria (id, ranking_system_id, criteria_name) VALUES (7,2,'Alumni')
INTO ranking_criteria (id, ranking_system_id, criteria_name) VALUES (8,2,'Award')
INTO ranking_criteria (id, ranking_system_id, criteria_name) VALUES (9,2,'HiCi')
INTO ranking_criteria (id, ranking_system_id, criteria_name) VALUES (10,2,'N and S')
INTO ranking_criteria (id, ranking_system_id, criteria_name) VALUES (11,2,'Pub')
INTO ranking_criteria (id, ranking_system_id, criteria_name) VALUES (12,2,'PCP')
INTO ranking_criteria (id, ranking_system_id, criteria_name) VALUES (13,2,'Total Shanghai')
INTO ranking_criteria (id, ranking_system_id, criteria_name) VALUES (14,3,'Quality of Education Rank')
INTO ranking_criteria (id, ranking_system_id, criteria_name) VALUES (15,3,'Alumni Employment Rank')
INTO ranking_criteria (id, ranking_system_id, criteria_name) VALUES (16,3,'Quality of Faculty Rank')
INTO ranking_criteria (id, ranking_system_id, criteria_name) VALUES (17,3,'Publications Rank')
INTO ranking_criteria (id, ranking_system_id, criteria_name) VALUES (18,3,'Influence Rank')
INTO ranking_criteria (id, ranking_system_id, criteria_name) VALUES (19,3,'Citations Rank')
INTO ranking_criteria (id, ranking_system_id, criteria_name) VALUES (20,3,'Patents Rank')
INTO ranking_criteria (id, ranking_system_id, criteria_name) VALUES (21,3,'Total CWUR')
SELECT * FROM dual;
