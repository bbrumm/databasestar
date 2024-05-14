/*
Postgres
Create the days table
*/
DROP TABLE calendar_days;


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
  calendar_week_of_month SMALLINT,
  calendar_day_of_week SMALLINT,
  calendar_day_of_year SMALLINT,
  calendar_day_of_month SMALLINT,
  calendar_day_longname VARCHAR(20),
  calendar_day_shortname VARCHAR(5),
  is_weekend SMALLINT,
  is_holiday SMALLINT,
  is_workday SMALLINT,
  holiday_description VARCHAR(100),
  CONSTRAINT pk_calendar PRIMARY KEY (day_id)
);

DELETE FROM calendar_days;

/*
Populate the table just with the IDs
*/

INSERT INTO calendar_days (day_id)
SELECT *
FROM generate_series(1, 365);



/*
Update using the day_id as an increment for the date
Note: the specified calendar date is the day BEFORE the first record to be added
*/

UPDATE calendar_days
SET calendar_date = '2020-12-31'::date + (INTERVAL '1' DAY * day_id);

/*
Calculate and update other fields
*/

UPDATE calendar_days
SET calendar_year = DATE_PART('year', calendar_date),
calendar_quarter = EXTRACT(quarter FROM calendar_date),
calendar_month = DATE_PART('month', calendar_date),
calendar_quarter_name = 'Q' || calendar_quarter || ' ' || calendar_year,
calendar_day_of_year = DATE_PART('doy', calendar_date),
calendar_day_of_week = DATE_PART('dow', calendar_date), -- From 0 (Sunday) to 6 (Saturday),
calendar_day_of_month = DATE_PART('day', calendar_date),
calendar_day_longname = TO_CHAR(calendar_date, 'Day'),
calendar_day_shortname = TO_CHAR(calendar_date, 'Dy'),
calendar_week_of_year = DATE_PART('week', calendar_date),
calendar_month_longname = TO_CHAR(calendar_date, 'Month'),
calendar_month_shortname = TO_CHAR(calendar_date, 'Mon')
WHERE 1=1;

/*
Update table based on previously-calculated columns
*/
UPDATE calendar_days
SET is_weekend = CASE
	WHEN calendar_day_of_week = 0 THEN 1
	WHEN calendar_day_of_week = 6 THEN 1
	ELSE 0
	END,
calendar_week_of_month = CASE
	WHEN calendar_day_of_month BETWEEN 1 AND 7 THEN 1
	WHEN calendar_day_of_month BETWEEN 8 AND 14 THEN 2
	WHEN calendar_day_of_month BETWEEN 15 AND 21 THEN 3
	WHEN calendar_day_of_month BETWEEN 22 AND 28 THEN 4
	ELSE 5
END
WHERE 1=1;
	
	
/*
Add holidays that are on the same day every year
Examples are for USA
Not a complete list!
*/

--MLK Birthday = 3rd Monday in January
UPDATE calendar_days
SET is_holiday = 1,
holiday_description = 'Martin Luther King Jr. birthday'
WHERE calendar_month = 1
AND calendar_day_of_week = 2
AND calendar_week_of_month = 3;

--President's Day = 3rd Monday in February
UPDATE calendar_days
SET is_holiday = 1,
holiday_description = 'President''s Day'
WHERE calendar_month = 2
AND calendar_day_of_week = 2
AND calendar_week_of_month = 3;

--Thanksgiving = 4th Thursday in November
UPDATE calendar_days
SET is_holiday = 1,
holiday_description = 'Thanksgiving'
WHERE calendar_month = 11
AND calendar_day_of_week = 5
AND calendar_week_of_month = 4;

/*
Add holidays where the day may change each year,
for example if it falls on a weekend
*/

--New Years Day, if it is on a Mon-Fri
UPDATE calendar_days
SET is_holiday = 1,
holiday_description = 'New Year''s Day'
WHERE calendar_month = 1
AND calendar_day_of_month = 1
AND is_weekend = 0;

--New Year's Day, if it is on a Sat or Sun, then it is on the next Monday
UPDATE calendar_days
SET is_holiday = 1,
holiday_description = 'New Year''s Day holiday'
WHERE (calendar_month = 1 AND calendar_day_of_month = 2 AND calendar_day_of_week = 0) -- Sun, so it is Mon the 2nd
OR (calendar_month = 1 AND calendar_day_of_month = 3 AND calendar_day_of_week = 6); -- Sat, so it is Mon the 3rd


/*
 * Set is_holiday for all other dates
 */
UPDATE calendar_days
SET is_holiday = 0
WHERE is_holiday IS NULL;


/*
 * Set is_workday for non-weekends and non-holidays
 */
UPDATE calendar_days
SET is_workday = CASE
	WHEN is_weekend = 1 OR is_holiday = 1 THEN 0
	ELSE 1
END
WHERE 1=1;



/*
 * Query the table
 */
SELECT *
FROM calendar_days
ORDER BY calendar_date ASC;


