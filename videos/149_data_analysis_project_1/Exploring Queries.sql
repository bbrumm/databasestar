SELECT *
FROM population_and_demography_csv p;

/*
Records for each country
*/

SELECT 
"Country name",
COUNT(*)
FROM population_and_demography_csv p
GROUP BY "Country name";

/*
 * Countries with "(UN)" in the name are continents
 * I could add a new column to indicate whether an entry is a country or a continent or some other type of record
 * There are also records that group countries together, such as "Land-locked developing countries (LLDC)"
 */

SELECT
"Country name",
"Population aged 20 to 29 years",
population__all__20_24__records,
population__all__25_29__records,
"Population aged 20 to 29 years" - population__all__20_24__records - population__all__25_29__records AS difference
FROM population_and_demography_csv p;

/*
 * Alter table to update column names
 * 
 */



