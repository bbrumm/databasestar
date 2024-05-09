

SELECT *
FROM population_and_demography_csv p;

SELECT MAX(population_year)
FROM population_and_demography_csv p;

/*
Q1
What is the population of people aged 90+ in each country?
*/

SELECT
p.country_name,
p.population_90_to_99 + p.population_100_above AS pop_90_above
FROM population_and_demography_csv p
WHERE p.population_year = 2021
AND p.record_type = 'Country'
ORDER BY p.country_name ASC;

/*
Q2
Which country has the highest population growth in the last year (number of people, and by percentage)?
*/

SELECT
p.country_name,
p.population_year,
p.population
FROM population_and_demography_csv p
WHERE p.record_type = 'Country'
AND p.population_year IN (2020, 2021);

--Cast is used because dividing two integers in Postgres will produce a near-zero result.
SELECT
country_name,
population_2020,
population_2021,
population_2021 - population_2020 AS pop_growth_num,
ROUND(CAST((population_2021 - population_2020) AS decimal) / population_2020 * 100, 2) AS pop_growth_pct
FROM (
	SELECT
	p.country_name,
	(
		SELECT p1.population
		FROM population_and_demography_csv p1
		WHERE p1.country_name = p.country_name
		AND p1.population_year = 2020
	) AS population_2020,
	(
		SELECT p1.population
		FROM population_and_demography_csv p1
		WHERE p1.country_name = p.country_name
		AND p1.population_year = 2021
	) AS population_2021
	FROM population_and_demography_csv p
	WHERE p.record_type = 'Country'
	AND p.population_year = 2021
) sub
ORDER BY pop_growth_num DESC;


/*
Q3
Which country has the highest population decline in the last year?
Same as previous query, but different order and using LIMIT
*/

SELECT
country_name,
population_2020,
population_2021,
population_2021 - population_2020 AS pop_growth_num
FROM (
	SELECT
	p.country_name,
	(
		SELECT p1.population
		FROM population_and_demography_csv p1
		WHERE p1.country_name = p.country_name
		AND p1.population_year = 2020
	) AS population_2020,
	(
		SELECT p1.population
		FROM population_and_demography_csv p1
		WHERE p1.country_name = p.country_name
		AND p1.population_year = 2021
	) AS population_2021
	FROM population_and_demography_csv p
	WHERE p.record_type = 'Country'
	AND p.population_year = 2021
) sub
ORDER BY pop_growth_num ASC
LIMIT 1;

/*
Q4
Which age group has the highest population growth over all countries in the last year?
Assumption: we'll use the 10-year groups
*/


SELECT
unnest(array[
	'population_1_to_9',
	'population_10_to_19',
	'population_20_to_29',
	'population_30_to_39',
	'population_40_to_49',
	'population_50_to_59',
	'population_60_to_69',
	'population_70_to_79',
	'population_80_to_89',
	'population_90_to_99'
]) AS age_group,
unnest(array[
	population_1_to_4 + population_5_to_9,
	population_10_to_14 + population_15_to_19,
	population_20_to_29,
	population_30_to_39,
	population_40_to_49,
	population_50_to_59,
	population_60_to_69,
	population_70_to_79,
	population_80_to_89,
	population_90_to_99
]) AS population
FROM population_and_demography_csv p
WHERE p.country_name = 'World'
AND p.population_year = 2021
ORDER BY population DESC;

/*
Q5
Which country has the highest population growth in the last 10 years?
*/

SELECT
country_name,
population_2011,
population_2021,
population_2021 - population_2011 AS pop_growth_num
FROM (
	SELECT
	p.country_name,
	(
		SELECT p1.population
		FROM population_and_demography_csv p1
		WHERE p1.country_name = p.country_name
		AND p1.population_year = 2011
	) AS population_2011,
	(
		SELECT p1.population
		FROM population_and_demography_csv p1
		WHERE p1.country_name = p.country_name
		AND p1.population_year = 2021
	) AS population_2021
	FROM population_and_demography_csv p
	WHERE p.record_type = 'Country'
	AND p.population_year = 2021
) sub
ORDER BY pop_growth_num DESC
LIMIT 10;

/*
Q6
Which country has the highest percentage growth since the first year (1950)? 
We could create a view based on the earlier queries
*/

CREATE VIEW population_by_year AS
SELECT
country_name,
population_1950,
population_2011,
population_2020,
population_2021
FROM (
	SELECT
	p.country_name,
	(
		SELECT p1.population
		FROM population_and_demography_csv p1
		WHERE p1.country_name = p.country_name
		AND p1.population_year = 1950
	) AS population_1950,
	(
		SELECT p1.population
		FROM population_and_demography_csv p1
		WHERE p1.country_name = p.country_name
		AND p1.population_year = 2011
	) AS population_2011,
	(
		SELECT p1.population
		FROM population_and_demography_csv p1
		WHERE p1.country_name = p.country_name
		AND p1.population_year = 2020
	) AS population_2020,
	(
		SELECT p1.population
		FROM population_and_demography_csv p1
		WHERE p1.country_name = p.country_name
		AND p1.population_year = 2021
	) AS population_2021
	FROM population_and_demography_csv p
	WHERE p.record_type = 'Country'
	AND p.population_year = 2021
) sub;


SELECT
p.country_name,
p.population_1950,
p.population_2021,
ROUND(CAST((population_2021 - population_1950) AS decimal) / population_1950 * 100, 2) AS pop_growth_pct
FROM population_by_year p
ORDER BY pop_growth_pct DESC;


/*
Q7
Which country has the highest population at age 1 as a percentage of their overall population?
*/

SELECT
p.country_name,
p.population_at_1,
p.population,
ROUND(CAST(population_at_1 AS decimal) / population * 100, 2) AS pop_ratio
FROM population_and_demography_csv p
WHERE p.record_type = 'Country'
AND p.population_year = 2021
ORDER BY pop_ratio DESC;

/*
Q8
What is the population of each continent in each year, and how much has it changed each year?
*/

SELECT
p.country_name,
p.population_year,
p.population,
p.population - LAG(p.population, 1) OVER(PARTITION BY p.country_name ORDER BY p.population_year ASC) AS population_change
FROM population_and_demography_csv p
WHERE p.record_type = 'Continent'
ORDER BY p.country_name ASC, p.population_year ASC;

