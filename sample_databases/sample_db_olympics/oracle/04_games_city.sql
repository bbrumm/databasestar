


DROP TABLE IF EXISTS games_city;

CREATE TABLE games_city (
  games_id NUMBER(11) DEFAULT NULL,
  city_id NUMBER(11) DEFAULT NULL,
  CONSTRAINT fk_gci_city FOREIGN KEY (city_id) REFERENCES city (id),
  CONSTRAINT fk_gci_gam FOREIGN KEY (games_id) REFERENCES games (id)
);



INSERT INTO games_city (games_id, city_id) VALUES (1,1);
INSERT INTO games_city (games_id, city_id) VALUES (2,2);
INSERT INTO games_city (games_id, city_id) VALUES (3,3);
INSERT INTO games_city (games_id, city_id) VALUES (4,4);
INSERT INTO games_city (games_id, city_id) VALUES (5,5);
INSERT INTO games_city (games_id, city_id) VALUES (6,6);
INSERT INTO games_city (games_id, city_id) VALUES (7,7);
INSERT INTO games_city (games_id, city_id) VALUES (8,8);
INSERT INTO games_city (games_id, city_id) VALUES (9,9);
INSERT INTO games_city (games_id, city_id) VALUES (10,10);
INSERT INTO games_city (games_id, city_id) VALUES (11,11);
INSERT INTO games_city (games_id, city_id) VALUES (12,12);
INSERT INTO games_city (games_id, city_id) VALUES (13,13);
INSERT INTO games_city (games_id, city_id) VALUES (14,14);
INSERT INTO games_city (games_id, city_id) VALUES (15,4);
INSERT INTO games_city (games_id, city_id) VALUES (16,15);
INSERT INTO games_city (games_id, city_id) VALUES (17,2);
INSERT INTO games_city (games_id, city_id) VALUES (18,16);
INSERT INTO games_city (games_id, city_id) VALUES (19,17);
INSERT INTO games_city (games_id, city_id) VALUES (20,18);
INSERT INTO games_city (games_id, city_id) VALUES (21,19);
INSERT INTO games_city (games_id, city_id) VALUES (22,20);
INSERT INTO games_city (games_id, city_id) VALUES (23,21);
INSERT INTO games_city (games_id, city_id) VALUES (24,22);
INSERT INTO games_city (games_id, city_id) VALUES (25,23);
INSERT INTO games_city (games_id, city_id) VALUES (26,8);
INSERT INTO games_city (games_id, city_id) VALUES (27,24);
INSERT INTO games_city (games_id, city_id) VALUES (28,25);
INSERT INTO games_city (games_id, city_id) VALUES (29,26);
INSERT INTO games_city (games_id, city_id) VALUES (30,27);
INSERT INTO games_city (games_id, city_id) VALUES (31,28);
INSERT INTO games_city (games_id, city_id) VALUES (32,29);
INSERT INTO games_city (games_id, city_id) VALUES (33,30);
INSERT INTO games_city (games_id, city_id) VALUES (34,31);
INSERT INTO games_city (games_id, city_id) VALUES (35,32);
INSERT INTO games_city (games_id, city_id) VALUES (36,33);
INSERT INTO games_city (games_id, city_id) VALUES (37,34);
INSERT INTO games_city (games_id, city_id) VALUES (38,35);
INSERT INTO games_city (games_id, city_id) VALUES (39,36);
INSERT INTO games_city (games_id, city_id) VALUES (40,37);
INSERT INTO games_city (games_id, city_id) VALUES (41,38);
INSERT INTO games_city (games_id, city_id) VALUES (42,22);
INSERT INTO games_city (games_id, city_id) VALUES (43,39);
INSERT INTO games_city (games_id, city_id) VALUES (44,40);
INSERT INTO games_city (games_id, city_id) VALUES (45,20);
INSERT INTO games_city (games_id, city_id) VALUES (46,41);
INSERT INTO games_city (games_id, city_id) VALUES (47,2);
INSERT INTO games_city (games_id, city_id) VALUES (48,41);
INSERT INTO games_city (games_id, city_id) VALUES (49,11);
INSERT INTO games_city (games_id, city_id) VALUES (50,42);
INSERT INTO games_city (games_id, city_id) VALUES (33,14);
INSERT INTO games_city (games_id, city_id) VALUES (51,20);
