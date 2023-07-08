DROP TABLE IF EXISTS country;

CREATE TABLE country (
  country_id INTEGER PRIMARY KEY,
  country_iso_code TEXT DEFAULT NULL,
  country_name TEXT DEFAULT NULL
);

INSERT INTO country (country_id, country_iso_code, country_name) VALUES
(128,'AE','United Arab Emirates'),
(129,'AF','Afghanistan'),
(130,'AO','Angola'),
(131,'AR','Argentina'),
(132,'AT','Austria'),
(133,'AU','Australia'),
(134,'AW','Aruba'),
(135,'BA','Bosnia and Herzegovina'),
(136,'BE','Belgium'),
(137,'BG','Bulgaria'),
(138,'BO','Bolivia'),
(139,'BR','Brazil'),
(140,'BS','Bahamas'),
(141,'BT','Bhutan'),
(142,'CA','Canada'),
(143,'CH','Switzerland'),
(144,'CL','Chile'),
(145,'CM','Cameroon'),
(146,'CN','China'),
(147,'CO','Colombia'),
(148,'CS','Serbia and Montenegro'),
(149,'CY','Cyprus'),
(150,'CZ','Czech Republic'),
(151,'DE','Germany'),
(152,'DK','Denmark'),
(153,'DM','Dominica'),
(154,'DO','Dominican Republic'),
(155,'DZ','Algeria'),
(156,'EC','Ecuador'),
(157,'EG','Egypt'),
(158,'ES','Spain'),
(159,'FI','Finland'),
(160,'FJ','Fiji'),
(161,'FR','France'),
(162,'GB','United Kingdom'),
(163,'GP','Guadaloupe'),
(164,'GR','Greece'),
(165,'GY','Guyana'),
(166,'HK','Hong Kong'),
(167,'HU','Hungary'),
(168,'ID','Indonesia'),
(169,'IE','Ireland'),
(170,'IL','Israel'),
(171,'IN','India'),
(172,'IR','Iran'),
(173,'IS','Iceland'),
(174,'IT','Italy'),
(175,'JM','Jamaica'),
(176,'JO','Jordan'),
(177,'JP','Japan'),
(178,'KE','Kenya'),
(179,'KG','Kyrgyz Republic'),
(180,'KH','Cambodia'),
(181,'KR','South Korea'),
(182,'KZ','Kazakhstan'),
(183,'LB','Lebanon'),
(184,'LT','Lithuania'),
(185,'LU','Luxembourg'),
(186,'LY','Libyan Arab Jamahiriya'),
(187,'MA','Morocco'),
(188,'MC','Monaco'),
(189,'MT','Malta'),
(190,'MX','Mexico'),
(191,'MY','Malaysia'),
(192,'NG','Nigeria'),
(193,'NL','Netherlands'),
(194,'NO','Norway'),
(195,'NZ','New Zealand'),
(196,'PA','Panama'),
(197,'PE','Peru'),
(198,'PH','Philippines'),
(199,'PK','Pakistan'),
(200,'PL','Poland'),
(201,'PT','Portugal'),
(202,'RO','Romania'),
(203,'RS','Serbia'),
(204,'RU','Russia'),
(205,'SE','Sweden'),
(206,'SG','Singapore'),
(207,'SI','Slovenia'),
(208,'SK','Slovakia'),
(209,'TH','Thailand'),
(210,'TN','Tunisia'),
(211,'TR','Turkey'),
(212,'TW','Taiwan'),
(213,'UA','Ukraine'),
(214,'US','United States of America'),
(215,'ZA','South Africa');

DROP TABLE IF EXISTS gender;

CREATE TABLE gender (
  gender_id INTEGER PRIMARY KEY,
  gender TEXT DEFAULT NULL
);

INSERT INTO gender (gender_id, gender) VALUES
(0,'Unspecified'),
(1,'Female'),
(2,'Male');

DROP TABLE IF EXISTS genre;

CREATE TABLE genre (
  genre_id INTEGER PRIMARY KEY,
  genre_name TEXT DEFAULT NULL
);

INSERT INTO genre (genre_id, genre_name) VALUES
(12,'Adventure'),
(14,'Fantasy'),
(16,'Animation'),
(18,'Drama'),
(27,'Horror'),
(28,'Action'),
(35,'Comedy'),
(36,'History'),
(37,'Western'),
(53,'Thriller'),
(80,'Crime'),
(99,'Documentary'),
(878,'Science Fiction'),
(9648,'Mystery'),
(10402,'Music'),
(10749,'Romance'),
(10751,'Family'),
(10752,'War'),
(10769,'Foreign'),
(10770,'TV Movie');

DROP TABLE IF EXISTS language;

CREATE TABLE language (
  language_id INTEGER PRIMARY KEY,
  language_code TEXT DEFAULT NULL,
  language_name TEXT DEFAULT NULL
);

INSERT INTO language (language_id, language_code, language_name) VALUES
(24574, 'en', 'English'),
(24575, 'sv', 'Svenska'),
(24576, 'de', 'Deutsch'),
(24577, 'xx', 'No language'),
(24578, 'ja', '日本語'),
(24579, 'fr', 'Français'),
(24580, 'es', 'Español'),
(24581, 'ar', 'العربية'),
(24582, 'la', 'Latin'),
(24583, 'km', 'ភាសាខ្មែរ'),
(24584, 'vi', 'Tiếng Việt'),
(24585, 'tr', 'Türkçe'),
(24586, 'el', 'ελληνικά'),
(24587, 'zh', '普通话'),
(24588, 'ru', 'Pусский'),
(24589, 'ga', 'Gaeilge'),
(24590, 'cn', '广州话 / 廣州話'),
(24591, 'hu', 'Magyar'),
(24592, 'he', 'עִבְרִית'),
(24593, 'ne', 'नेपाली'),
(24594, 'si', 'සිංහල'),
(24595, 'it', 'Italiano'),
(24596, 'nl', 'Nederlands'),
(24597, 'fi', 'Suomi'),
(24598, 'pt', 'Português'),
(24599, 'gd', 'Gàidhlig'),
(24600, 'fa', 'فارسی'),
(24601, 'ur', 'اردو'),
(24602, 'da', 'Dansk'),
(24603, 'th', 'ภาษาไทย'),
(24604, 'no', 'Norsk'),
(24605, 'sq', 'Shqip'),
(24606, 'pl', 'Polski'),
(24607, 'is', 'Íslenska'),
(24608, 'tl', 'Tagalog'),
(24609, 'pa', 'ਪੰਜਾਬੀ'),
(24610, 'hi', 'हिन्दी'),
(24611, 'kk', 'қазақ'),
(24612, 'bg', 'български'),
(24613, 'sw', 'Kiswahili'),
(24614, 'ro', 'Română'),
(24615, 'ko', '한국어조선말'),
(24616, 'cs', 'Český'),
(24617, 'sk', 'Slovenčina'),
(24618, 'mi', 'Māori'),
(24619, 'eo', 'Esperanto'),
(24620, 'so', 'Somali'),
(24621, 'af', 'Afrikaans'),
(24622, 'xh', 'isiXhosa'),
(24623, 'zu', 'isiZulu'),
(24624, 'yi', 'ייִדיש'),
(24625, 'ca', 'Català'),
(24626, 'sr', 'српски'),
(24627, 'sa', 'संस्कृतम्'),
(24628, 'uk', 'Український'),
(24629, 'hr', 'Hrvatski'),
(24630, 'gl', 'Galego'),
(24631, 'sh', 'Српскохрватски'),
(24632, 'co', 'Corsu'),
(24633, 'kw', 'Kernewek'),
(24634, 'bo', 'བོད་ཡིག'),
(24635, 'bs', 'Bosanski'),
(24636, 'ps', 'پښتو'),
(24637, 'iu', 'ᐃᓄᒃᑎᑐᑦ'),
(24638, 'hy', 'Հայերեն լեզու'),
(24639, 'am', 'አማርኛ'),
(24640, 'ce', 'нохчийн мотт'),
(24641, 'et', 'Eesti'),
(24642, 'ku', 'كوردی'),
(24643, 'nv', 'Diné bizaad'),
(24644, 'mn', 'монгол хэл'),
(24645, 'to', 'Faka-Tonga'),
(24646, 'bn', 'বাংলা'),
(24647, 'ny', 'chiCheŵa'),
(24648, 'st', 'seSotho'),
(24649, 'dz', 'རྫོང་ཁ'),
(24650, 'cy', 'Cymraeg'),
(24651, 'wo', 'Wolof'),
(24652, 'ka', 'ქართული'),
(24653, 'br', 'Brezhoneg'),
(24654, 'ta', 'தமிழ்'),
(24655, 'id', 'Bahasa indonesia'),
(24656, 'ml', 'മലയാളം'),
(24657, 'te', 'తెలుగు'),
(24658, 'ky', 'кыргыз тили'),
(24659, 'bm', 'Bamanankan'),
(24660, 'sl', 'Slovenščina'),
(24701, 'nb', 'Norsk Bokmål');

DROP TABLE IF EXISTS language_role;

CREATE TABLE language_role (
  role_id INTEGER PRIMARY KEY,
  language_role TEXT DEFAULT NULL
);

INSERT INTO language_role (role_id, language_role) VALUES
(1,'Original'),
(2,'Spoken');

DROP TABLE IF EXISTS department;

CREATE TABLE department (
  department_id INTEGER PRIMARY KEY,
  department_name TEXT DEFAULT NULL
);

INSERT INTO department (department_id, department_name) VALUES
(1,'Camera'),
(2,'Directing'),
(3,'Production'),
(4,'Writing'),
(5,'Editing'),
(6,'Sound'),
(7,'Art'),
(8,'Costume & Make-Up'),
(9,'Crew'),
(10,'Visual Effects'),
(11,'Lighting'),
(12,'Actors');