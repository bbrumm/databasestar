--Create View

CREATE VIEW person_summary AS
SELECT id, full_name, gender
FROM person;

SELECT * FROM person_summary;

CREATE VIEW games_summary AS
SELECT id, games_year, season AS games_season
FROM games;

SELECT * FROM games_summary;
