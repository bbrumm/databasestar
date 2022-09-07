

DROP TABLE event;
DROP TABLE sport;
DROP TABLE games_city;
DROP TABLE games;
DROP TABLE city;
DROP TABLE person_region;
DROP TABLE noc_region;
DROP TABLE person;
DROP TABLE medal;
DROP TABLE competitor_event;
DROP TABLE games_competitor;




CREATE TABLE sport (
	id INT PRIMARY KEY AUTO_INCREMENT,
	sport_name VARCHAR(200)
);


CREATE TABLE event (
	id INT PRIMARY KEY AUTO_INCREMENT,
    sport_id INT,
	event_name VARCHAR(200),
    CONSTRAINT fk_ev_sp FOREIGN KEY (sport_id) REFERENCES sport(id)
);

CREATE TABLE city (
	id INT PRIMARY KEY AUTO_INCREMENT,
	city_name VARCHAR(200)
);

CREATE TABLE games (
	id INT PRIMARY KEY AUTO_INCREMENT,
    games_year INT,
    games_name VARCHAR(100),
    season VARCHAR(100)
);

CREATE TABLE games_city (
	games_id INT,
	city_id INT,
	CONSTRAINT fk_gci_city FOREIGN KEY (city_id) REFERENCES city(id),
	CONSTRAINT fk_gci_gam FOREIGN KEY (games_id) REFERENCES games(id)
);


CREATE TABLE noc_region (
	id INT PRIMARY KEY AUTO_INCREMENT,
    noc VARCHAR(5),
    region_name VARCHAR(200)
);

CREATE TABLE medal (
	id INT PRIMARY KEY AUTO_INCREMENT,
	medal_name VARCHAR(50)
);


CREATE TABLE person (
	id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(500),
    gender VARCHAR(10),
    height INT,
    weight INT
);

CREATE TABLE person_region (
	person_id INT,
    region_id INT,
    CONSTRAINT fk_per_per FOREIGN KEY (person_id) REFERENCES person(id),
    CONSTRAINT fk_per_reg FOREIGN KEY (region_id) REFERENCES noc_region(id)
);


CREATE TABLE games_competitor (
	id INT PRIMARY KEY AUTO_INCREMENT,
    games_id INT,
    person_id INT,
    age INT,
    CONSTRAINT fk_gc_gam FOREIGN KEY (games_id) REFERENCES games(id),
    CONSTRAINT fk_gc_per FOREIGN KEY (person_id) REFERENCES person(id)
);


CREATE TABLE competitor_event (
	event_id INT,
    competitor_id INT,
    medal_id INT,
    CONSTRAINT fk_ce_ev FOREIGN KEY (event_id) REFERENCES event(id),
    CONSTRAINT fk_ce_com FOREIGN KEY (competitor_id) REFERENCES games_competitor(id),
    CONSTRAINT fk_ce_med FOREIGN KEY (medal_id) REFERENCES medal(id)
);