
CREATE TABLE alignment (
  id NUMBER(11) NOT NULL,
  alignment varchar2(10) DEFAULT NULL,
  PRIMARY KEY (id)
);

INSERT ALL
INTO alignment (id, alignment) VALUES (1,'Good')
INTO alignment (id, alignment) VALUES (2,'Bad')
INTO alignment (id, alignment) VALUES (3,'Neutral')
INTO alignment (id, alignment) VALUES (4,'N/A')
SELECT * FROM dual;

CREATE TABLE attribute (
  id NUMBER(11) NOT NULL,
  attribute_name varchar2(200) DEFAULT NULL,
  PRIMARY KEY (id)
);

INSERT ALL
INTO attribute (id, attribute_name) VALUES (1,'Intelligence')
INTO attribute (id, attribute_name) VALUES (2,'Strength')
INTO attribute (id, attribute_name) VALUES (3,'Speed')
INTO attribute (id, attribute_name) VALUES (4,'Durability')
INTO attribute (id, attribute_name) VALUES (5,'Power')
INTO attribute (id, attribute_name) VALUES (6,'Combat');

CREATE TABLE colour (
  id NUMBER(11) NOT NULL,
  colour varchar2(20) DEFAULT NULL,
  PRIMARY KEY (id)
);

INSERT ALL
INTO colour VALUES (1,'No Colour')
INTO colour (id, colour) VALUES (2,'Amber')
INTO colour (id, colour) VALUES (3,'Auburn')
INTO colour (id, colour) VALUES (4,'Black')
INTO colour (id, colour) VALUES (5,'Black/Blue')
INTO colour (id, colour) VALUES (6,'Blond')
INTO colour (id, colour) VALUES (7,'Blue')
INTO colour (id, colour) VALUES (8,'Blue/White')
INTO colour (id, colour) VALUES (9,'Brown')
INTO colour (id, colour) VALUES (10,'Brown/Black')
INTO colour (id, colour) VALUES (11,'Brown/White')
INTO colour (id, colour) VALUES (12,'Gold')
INTO colour (id, colour) VALUES (13,'Grey')
INTO colour (id, colour) VALUES (14,'Green')
INTO colour (id, colour) VALUES (15,'Green/Blue')
INTO colour (id, colour) VALUES (16,'Hazel')
INTO colour (id, colour) VALUES (17,'Indigo')
INTO colour (id, colour) VALUES (18,'Magenta')
INTO colour (id, colour) VALUES (19,'Orange')
INTO colour (id, colour) VALUES (20,'Orange/White')
INTO colour (id, colour) VALUES (21,'Pink')
INTO colour (id, colour) VALUES (22,'Purple')
INTO colour (id, colour) VALUES (23,'Red')
INTO colour (id, colour) VALUES (24,'Red/Black')
INTO colour (id, colour) VALUES (25,'Red/Grey')
INTO colour (id, colour) VALUES (26,'Red/Orange')
INTO colour (id, colour) VALUES (27,'Red/White')
INTO colour (id, colour) VALUES (28,'Silver')
INTO colour (id, colour) VALUES (29,'Strawberry Blond')
INTO colour (id, colour) VALUES (30,'Violet')
INTO colour (id, colour) VALUES (31,'White')
INTO colour (id, colour) VALUES (32,'White/Red')
INTO colour (id, colour) VALUES (33,'Yellow')
INTO colour (id, colour) VALUES (34,'Yellow/Blue')
INTO colour (id, colour) VALUES (35,'Yellow/Red')
SELECT * FROM dual;

CREATE TABLE gender (
  id NUMBER(11) NOT NULL,
  gender varchar2(20) DEFAULT NULL,
  PRIMARY KEY (id)
);

INSERT ALL
INTO gender (id, gender) VALUES (1,'Male')
INTO gender (id, gender) VALUES (2,'Female')
INTO gender (id, gender) VALUES (3,'N/A')
SELECT * FROM dual;