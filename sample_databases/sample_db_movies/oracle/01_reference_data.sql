

DROP TABLE IF EXISTS country;

CREATE TABLE country (
  country_id NUMBER(10) NOT NULL,
  country_iso_code varchar2(10) DEFAULT NULL,
  country_name varchar2(200) DEFAULT NULL,
  PRIMARY KEY (country_id)
);


INSERT ALL
INTO country (country_id, country_iso_code, country_name) VALUES (128,'AE','United Arab Emirates')
INTO country (country_id, country_iso_code, country_name) VALUES (129,'AF','Afghanistan')
INTO country (country_id, country_iso_code, country_name) VALUES (130,'AO','Angola')
INTO country (country_id, country_iso_code, country_name) VALUES (131,'AR','Argentina')
INTO country (country_id, country_iso_code, country_name) VALUES (132,'AT','Austria')
INTO country (country_id, country_iso_code, country_name) VALUES (133,'AU','Australia')
INTO country (country_id, country_iso_code, country_name) VALUES (134,'AW','Aruba')
INTO country (country_id, country_iso_code, country_name) VALUES (135,'BA','Bosnia and Herzegovina')
INTO country (country_id, country_iso_code, country_name) VALUES (136,'BE','Belgium')
INTO country (country_id, country_iso_code, country_name) VALUES (137,'BG','Bulgaria')
INTO country (country_id, country_iso_code, country_name) VALUES (138,'BO','Bolivia')
INTO country (country_id, country_iso_code, country_name) VALUES (139,'BR','Brazil')
INTO country (country_id, country_iso_code, country_name) VALUES (140,'BS','Bahamas')
INTO country (country_id, country_iso_code, country_name) VALUES (141,'BT','Bhutan')
INTO country (country_id, country_iso_code, country_name) VALUES (142,'CA','Canada')
INTO country (country_id, country_iso_code, country_name) VALUES (143,'CH','Switzerland')
INTO country (country_id, country_iso_code, country_name) VALUES (144,'CL','Chile')
INTO country (country_id, country_iso_code, country_name) VALUES (145,'CM','Cameroon')
INTO country (country_id, country_iso_code, country_name) VALUES (146,'CN','China')
INTO country (country_id, country_iso_code, country_name) VALUES (147,'CO','Colombia')
INTO country (country_id, country_iso_code, country_name) VALUES (148,'CS','Serbia and Montenegro')
INTO country (country_id, country_iso_code, country_name) VALUES (149,'CY','Cyprus')
INTO country (country_id, country_iso_code, country_name) VALUES (150,'CZ','Czech Republic')
INTO country (country_id, country_iso_code, country_name) VALUES (151,'DE','Germany')
INTO country (country_id, country_iso_code, country_name) VALUES (152,'DK','Denmark')
INTO country (country_id, country_iso_code, country_name) VALUES (153,'DM','Dominica')
INTO country (country_id, country_iso_code, country_name) VALUES (154,'DO','Dominican Republic')
INTO country (country_id, country_iso_code, country_name) VALUES (155,'DZ','Algeria')
INTO country (country_id, country_iso_code, country_name) VALUES (156,'EC','Ecuador')
INTO country (country_id, country_iso_code, country_name) VALUES (157,'EG','Egypt')
INTO country (country_id, country_iso_code, country_name) VALUES (158,'ES','Spain')
INTO country (country_id, country_iso_code, country_name) VALUES (159,'FI','Finland')
INTO country (country_id, country_iso_code, country_name) VALUES (160,'FJ','Fiji')
INTO country (country_id, country_iso_code, country_name) VALUES (161,'FR','France')
INTO country (country_id, country_iso_code, country_name) VALUES (162,'GB','United Kingdom')
INTO country (country_id, country_iso_code, country_name) VALUES (163,'GP','Guadaloupe')
INTO country (country_id, country_iso_code, country_name) VALUES (164,'GR','Greece')
INTO country (country_id, country_iso_code, country_name) VALUES (165,'GY','Guyana')
INTO country (country_id, country_iso_code, country_name) VALUES (166,'HK','Hong Kong')
INTO country (country_id, country_iso_code, country_name) VALUES (167,'HU','Hungary')
INTO country (country_id, country_iso_code, country_name) VALUES (168,'ID','Indonesia')
INTO country (country_id, country_iso_code, country_name) VALUES (169,'IE','Ireland')
INTO country (country_id, country_iso_code, country_name) VALUES (170,'IL','Israel')
INTO country (country_id, country_iso_code, country_name) VALUES (171,'IN','India')
INTO country (country_id, country_iso_code, country_name) VALUES (172,'IR','Iran')
INTO country (country_id, country_iso_code, country_name) VALUES (173,'IS','Iceland')
INTO country (country_id, country_iso_code, country_name) VALUES (174,'IT','Italy')
INTO country (country_id, country_iso_code, country_name) VALUES (175,'JM','Jamaica')
INTO country (country_id, country_iso_code, country_name) VALUES (176,'JO','Jordan')
INTO country (country_id, country_iso_code, country_name) VALUES (177,'JP','Japan')
INTO country (country_id, country_iso_code, country_name) VALUES (178,'KE','Kenya')
INTO country (country_id, country_iso_code, country_name) VALUES (179,'KG','Kyrgyz Republic')
INTO country (country_id, country_iso_code, country_name) VALUES (180,'KH','Cambodia')
INTO country (country_id, country_iso_code, country_name) VALUES (181,'KR','South Korea')
INTO country (country_id, country_iso_code, country_name) VALUES (182,'KZ','Kazakhstan')
INTO country (country_id, country_iso_code, country_name) VALUES (183,'LB','Lebanon')
INTO country (country_id, country_iso_code, country_name) VALUES (184,'LT','Lithuania')
INTO country (country_id, country_iso_code, country_name) VALUES (185,'LU','Luxembourg')
INTO country (country_id, country_iso_code, country_name) VALUES (186,'LY','Libyan Arab Jamahiriya')
INTO country (country_id, country_iso_code, country_name) VALUES (187,'MA','Morocco')
INTO country (country_id, country_iso_code, country_name) VALUES (188,'MC','Monaco')
INTO country (country_id, country_iso_code, country_name) VALUES (189,'MT','Malta')
INTO country (country_id, country_iso_code, country_name) VALUES (190,'MX','Mexico')
INTO country (country_id, country_iso_code, country_name) VALUES (191,'MY','Malaysia')
INTO country (country_id, country_iso_code, country_name) VALUES (192,'NG','Nigeria')
INTO country (country_id, country_iso_code, country_name) VALUES (193,'NL','Netherlands')
INTO country (country_id, country_iso_code, country_name) VALUES (194,'NO','Norway')
INTO country (country_id, country_iso_code, country_name) VALUES (195,'NZ','New Zealand')
INTO country (country_id, country_iso_code, country_name) VALUES (196,'PA','Panama')
INTO country (country_id, country_iso_code, country_name) VALUES (197,'PE','Peru')
INTO country (country_id, country_iso_code, country_name) VALUES (198,'PH','Philippines')
INTO country (country_id, country_iso_code, country_name) VALUES (199,'PK','Pakistan')
INTO country (country_id, country_iso_code, country_name) VALUES (200,'PL','Poland')
INTO country (country_id, country_iso_code, country_name) VALUES (201,'PT','Portugal')
INTO country (country_id, country_iso_code, country_name) VALUES (202,'RO','Romania')
INTO country (country_id, country_iso_code, country_name) VALUES (203,'RS','Serbia')
INTO country (country_id, country_iso_code, country_name) VALUES (204,'RU','Russia')
INTO country (country_id, country_iso_code, country_name) VALUES (205,'SE','Sweden')
INTO country (country_id, country_iso_code, country_name) VALUES (206,'SG','Singapore')
INTO country (country_id, country_iso_code, country_name) VALUES (207,'SI','Slovenia')
INTO country (country_id, country_iso_code, country_name) VALUES (208,'SK','Slovakia')
INTO country (country_id, country_iso_code, country_name) VALUES (209,'TH','Thailand')
INTO country (country_id, country_iso_code, country_name) VALUES (210,'TN','Tunisia')
INTO country (country_id, country_iso_code, country_name) VALUES (211,'TR','Turkey')
INTO country (country_id, country_iso_code, country_name) VALUES (212,'TW','Taiwan')
INTO country (country_id, country_iso_code, country_name) VALUES (213,'UA','Ukraine')
INTO country (country_id, country_iso_code, country_name) VALUES (214,'US','United States of America')
INTO country (country_id, country_iso_code, country_name) VALUES (215,'ZA','South Africa')
SELECT * FROM dual;




CREATE TABLE gender (
  gender_id NUMBER(10) NOT NULL,
  gender varchar2(20) DEFAULT NULL,
  PRIMARY KEY (gender_id)
);


INSERT ALL
INTO gender (gender_id, gender) VALUES (0,'Unspecified')
INTO gender (gender_id, gender) VALUES (1,'Female')
INTO gender (gender_id, gender) VALUES (2,'Male')
SELECT * FROM dual;




CREATE TABLE genre (
  genre_id NUMBER(10) NOT NULL,
  genre_name varchar2(100) DEFAULT NULL,
  PRIMARY KEY (genre_id)
);


INSERT ALL
INTO genre (genre_id, genre_name) VALUES (12,'Adventure')
INTO genre (genre_id, genre_name) VALUES (14,'Fantasy')
INTO genre (genre_id, genre_name) VALUES (16,'Animation')
INTO genre (genre_id, genre_name) VALUES (18,'Drama')
INTO genre (genre_id, genre_name) VALUES (27,'Horror')
INTO genre (genre_id, genre_name) VALUES (28,'Action')
INTO genre (genre_id, genre_name) VALUES (35,'Comedy')
INTO genre (genre_id, genre_name) VALUES (36,'History')
INTO genre (genre_id, genre_name) VALUES (37,'Western')
INTO genre (genre_id, genre_name) VALUES (53,'Thriller')
INTO genre (genre_id, genre_name) VALUES (80,'Crime')
INTO genre (genre_id, genre_name) VALUES (99,'Documentary')
INTO genre (genre_id, genre_name) VALUES (878,'Science Fiction')
INTO genre (genre_id, genre_name) VALUES (9648,'Mystery')
INTO genre (genre_id, genre_name) VALUES (10402,'Music')
INTO genre (genre_id, genre_name) VALUES (10749,'Romance')
INTO genre (genre_id, genre_name) VALUES (10751,'Family')
INTO genre (genre_id, genre_name) VALUES (10752,'War')
INTO genre (genre_id, genre_name) VALUES (10769,'Foreign')
INTO genre (genre_id, genre_name) VALUES (10770,'TV Movie')
SELECT * FROM dual;



DROP TABLE IF EXISTS language;



CREATE TABLE language (
  language_id NUMBER(10) NOT NULL,
  language_code varchar2(10) DEFAULT NULL,
  language_name varchar2(500) DEFAULT NULL,
  PRIMARY KEY (language_id)
);


INSERT ALL
INTO language (language_id, language_code, language_name) VALUES (24574,'en','English')
INTO language (language_id, language_code, language_name) VALUES (24575,'sv','svenska')
INTO language (language_id, language_code, language_name) VALUES (24576,'de','Deutsch')
INTO language (language_id, language_code, language_name) VALUES (24577,'xx','No Language')
INTO language (language_id, language_code, language_name) VALUES (24578,'ja','u65e5u672cu8a9e')
INTO language (language_id, language_code, language_name) VALUES (24579,'fr','Franu00e7ais')
INTO language (language_id, language_code, language_name) VALUES (24580,'es','Espau00f1ol')
INTO language (language_id, language_code, language_name) VALUES (24581,'ar','u0627u0644u0639u0631u0628u064au0629')
INTO language (language_id, language_code, language_name) VALUES (24582,'la','Latin')
INTO language (language_id, language_code, language_name) VALUES (24583,'km','')
INTO language (language_id, language_code, language_name) VALUES (24584,'vi','Tiu1ebfng Viu1ec7t')
INTO language (language_id, language_code, language_name) VALUES (24585,'tr','Tu00fcrku00e7e')
INTO language (language_id, language_code, language_name) VALUES (24586,'el','u03b5u03bbu03bbu03b7u03bdu03b9u03bau03ac')
INTO language (language_id, language_code, language_name) VALUES (24587,'zh','u666eu901au8bdd')
INTO language (language_id, language_code, language_name) VALUES (24588,'ru','Pu0443u0441u0441u043au0438u0439')
INTO language (language_id, language_code, language_name) VALUES (24589,'ga','Gaeilge')
INTO language (language_id, language_code, language_name) VALUES (24590,'cn','u5e7fu5ddeu8bdd / u5ee3u5ddeu8a71')
INTO language (language_id, language_code, language_name) VALUES (24591,'hu','Magyar')
INTO language (language_id, language_code, language_name) VALUES (24592,'he','u05e2u05b4u05d1u05b0u05e8u05b4u05d9u05ea')
INTO language (language_id, language_code, language_name) VALUES (24593,'ne','')
INTO language (language_id, language_code, language_name) VALUES (24594,'si','')
INTO language (language_id, language_code, language_name) VALUES (24595,'it','Italiano')
INTO language (language_id, language_code, language_name) VALUES (24596,'nl','Nederlands')
INTO language (language_id, language_code, language_name) VALUES (24597,'fi','suomi')
INTO language (language_id, language_code, language_name) VALUES (24598,'pt','Portuguu00eas')
INTO language (language_id, language_code, language_name) VALUES (24599,'gd','')
INTO language (language_id, language_code, language_name) VALUES (24600,'fa','u0641u0627u0631u0633u06cc')
INTO language (language_id, language_code, language_name) VALUES (24601,'ur','u0627u0631u062fu0648')
INTO language (language_id, language_code, language_name) VALUES (24602,'da','Dansk')
INTO language (language_id, language_code, language_name) VALUES (24603,'th','u0e20u0e32u0e29u0e32u0e44u0e17u0e22')
INTO language (language_id, language_code, language_name) VALUES (24604,'no','Norsk')
INTO language (language_id, language_code, language_name) VALUES (24605,'sq','shqip')
INTO language (language_id, language_code, language_name) VALUES (24606,'pl','Polski')
INTO language (language_id, language_code, language_name) VALUES (24607,'is','u00cdslenska')
INTO language (language_id, language_code, language_name) VALUES (24608,'tl','')
INTO language (language_id, language_code, language_name) VALUES (24609,'pa','u0a2au0a70u0a1cu0a3eu0a2cu0a40')
INTO language (language_id, language_code, language_name) VALUES (24610,'hi','u0939u093fu0928u094du0926u0940')
INTO language (language_id, language_code, language_name) VALUES (24611,'kk','u049bu0430u0437u0430u049b')
INTO language (language_id, language_code, language_name) VALUES (24612,'bg','u0431u044au043bu0433u0430u0440u0441u043au0438 u0435u0437u0438u043a')
INTO language (language_id, language_code, language_name) VALUES (24613,'sw','Kiswahili')
INTO language (language_id, language_code, language_name) VALUES (24614,'ro','Romu00e2nu0103')
INTO language (language_id, language_code, language_name) VALUES (24615,'ko','ud55cuad6duc5b4/uc870uc120ub9d0')
INTO language (language_id, language_code, language_name) VALUES (24616,'cs','u010cesku00fd')
INTO language (language_id, language_code, language_name) VALUES (24617,'sk','Slovenu010dina')
INTO language (language_id, language_code, language_name) VALUES (24618,'mi','')
INTO language (language_id, language_code, language_name) VALUES (24619,'eo','Esperanto')
INTO language (language_id, language_code, language_name) VALUES (24620,'so','Somali')
INTO language (language_id, language_code, language_name) VALUES (24621,'af','Afrikaans')
INTO language (language_id, language_code, language_name) VALUES (24622,'xh','')
INTO language (language_id, language_code, language_name) VALUES (24623,'zu','isiZulu')
INTO language (language_id, language_code, language_name) VALUES (24624,'yi','')
INTO language (language_id, language_code, language_name) VALUES (24625,'ca','Catalu00e0')
INTO language (language_id, language_code, language_name) VALUES (24626,'sr','Srpski')
INTO language (language_id, language_code, language_name) VALUES (24627,'sa','')
INTO language (language_id, language_code, language_name) VALUES (24628,'uk','u0423u043au0440u0430u0457u043du0441u044cu043au0438u0439')
INTO language (language_id, language_code, language_name) VALUES (24629,'hr','Hrvatski')
INTO language (language_id, language_code, language_name) VALUES (24630,'gl','Galego')
INTO language (language_id, language_code, language_name) VALUES (24631,'sh','')
INTO language (language_id, language_code, language_name) VALUES (24632,'co','')
INTO language (language_id, language_code, language_name) VALUES (24633,'kw','')
INTO language (language_id, language_code, language_name) VALUES (24634,'bo','')
INTO language (language_id, language_code, language_name) VALUES (24635,'bs','Bosanski')
INTO language (language_id, language_code, language_name) VALUES (24636,'ps','u067eu069au062au0648')
INTO language (language_id, language_code, language_name) VALUES (24637,'iu','')
INTO language (language_id, language_code, language_name) VALUES (24638,'hy','')
INTO language (language_id, language_code, language_name) VALUES (24639,'am','')
INTO language (language_id, language_code, language_name) VALUES (24640,'ce','')
INTO language (language_id, language_code, language_name) VALUES (24641,'et','Eesti')
INTO language (language_id, language_code, language_name) VALUES (24642,'ku','')
INTO language (language_id, language_code, language_name) VALUES (24643,'nv','')
INTO language (language_id, language_code, language_name) VALUES (24644,'mn','')
INTO language (language_id, language_code, language_name) VALUES (24645,'to','')
INTO language (language_id, language_code, language_name) VALUES (24646,'bn','u09acu09beu0982u09b2u09be')
INTO language (language_id, language_code, language_name) VALUES (24647,'ny','')
INTO language (language_id, language_code, language_name) VALUES (24648,'st','')
INTO language (language_id, language_code, language_name) VALUES (24649,'dz','')
INTO language (language_id, language_code, language_name) VALUES (24650,'cy','Cymraeg')
INTO language (language_id, language_code, language_name) VALUES (24651,'wo','Wolof')
INTO language (language_id, language_code, language_name) VALUES (24652,'ka','u10e5u10d0u10e0u10d7u10e3u10dau10d8')
INTO language (language_id, language_code, language_name) VALUES (24653,'br','')
INTO language (language_id, language_code, language_name) VALUES (24654,'ta','u0ba4u0baeu0bbfu0bb4u0bcd')
INTO language (language_id, language_code, language_name) VALUES (24655,'id','Bahasa indonesia')
INTO language (language_id, language_code, language_name) VALUES (24656,'ml','')
INTO language (language_id, language_code, language_name) VALUES (24657,'te','u0c24u0c46u0c32u0c41u0c17u0c41')
INTO language (language_id, language_code, language_name) VALUES (24658,'ky','??????')
INTO language (language_id, language_code, language_name) VALUES (24659,'bm','Bamanankan')
INTO language (language_id, language_code, language_name) VALUES (24660,'sl','Slovenu0161u010dina')
INTO language (language_id, language_code, language_name) VALUES (24701,'nb','Unknown')
SELECT * FROM dual;





DROP TABLE IF EXISTS language_role;


CREATE TABLE language_role (
  role_id NUMBER(10) NOT NULL,
  language_role varchar2(20) DEFAULT NULL,
  PRIMARY KEY (role_id)
);


INSERT INTO language_role (role_id, language_role) VALUES (1,'Original');
INSERT INTO language_role (role_id, language_role) VALUES (2,'Spoken');


CREATE TABLE department (
  department_id NUMBER(10) NOT NULL,
  department_name varchar2(200) DEFAULT NULL,
  PRIMARY KEY (department_id)
);


INSERT ALL
INTO department (department_id, department_name) VALUES (1,'Camera')
INTO department (department_id, department_name) VALUES (2,'Directing')
INTO department (department_id, department_name) VALUES (3,'Production')
INTO department (department_id, department_name) VALUES (4,'Writing')
INTO department (department_id, department_name) VALUES (5,'Editing')
INTO department (department_id, department_name) VALUES (6,'Sound')
INTO department (department_id, department_name) VALUES (7,'Art')
INTO department (department_id, department_name) VALUES (8,'Costume & Make-Up')
INTO department (department_id, department_name) VALUES (9,'Crew')
INTO department (department_id, department_name) VALUES (10,'Visual Effects')
INTO department (department_id, department_name) VALUES (11,'Lighting')
INTO department (department_id, department_name) VALUES (12,'Actors')
SELECT * FROM dual;
