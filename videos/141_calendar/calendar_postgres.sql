/*
Postgres
Create the days table
*/

CREATE TABLE calendar_days (
  day_id INT,
  calendar_date DATE,
  calendar_year SMALLINT,
  calendar_quarter SMALLINT,
  calendar_quarter_name VARCHAR(10),
  calendar_month SMALLINT,
  calendar_month_longname VARCHAR(20),
  calendar_month_shortname VARCHAR(5),
  calendar_week_of_year SMALLINT,
  calendar_day_of_year SMALLINT,
  calendar_day_longname VARCHAR(20),
  calendar_day_shortname VARCHAR(5),
  is_weekend SMALLINT,
  is_holiday SMALLINT,
  is_workday SMALLINT,
  CONSTRAINT pk_calendar PRIMARY KEY (day_id)
);

/*
Populate the table
*/

DO
$do$
BEGIN
	FOR i IN 1..25 LOOP
		INSERT INTO calendar_days (day_id)
		VALUES (i);
	END LOOP;
END
$do$;





SELECT *
FROM calendar_days;
