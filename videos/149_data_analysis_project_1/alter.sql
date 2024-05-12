
ALTER TABLE population_and_demography_csv RENAME COLUMN "Country name" TO country_name;
ALTER TABLE population_and_demography_csv RENAME COLUMN "Year" TO population_year;
ALTER TABLE population_and_demography_csv RENAME COLUMN "Population of children under the age of 1" TO population_children_under_1;
ALTER TABLE population_and_demography_csv RENAME COLUMN "Population of children under the age of 5" TO population_children_under_5;
ALTER TABLE population_and_demography_csv RENAME COLUMN "Population of children under the age of 15" TO population_children_under_15;
ALTER TABLE population_and_demography_csv RENAME COLUMN "Population under the age of 25" TO population_under_25;
ALTER TABLE population_and_demography_csv RENAME COLUMN "Population aged 15 to 64 years" TO population_15_to_64;
ALTER TABLE population_and_demography_csv RENAME COLUMN "Population older than 15 years" TO population_older_15;
ALTER TABLE population_and_demography_csv RENAME COLUMN "Population older than 18 years" TO population_older_18;
ALTER TABLE population_and_demography_csv RENAME COLUMN "Population at age 1" TO population_at_1;
ALTER TABLE population_and_demography_csv RENAME COLUMN "Population aged 1 to 4 years" TO population_1_to_4;
ALTER TABLE population_and_demography_csv RENAME COLUMN "Population aged 5 to 9 years" TO population_5_to_9;
ALTER TABLE population_and_demography_csv RENAME COLUMN "Population aged 10 to 14 years" TO population_10_to_14;
ALTER TABLE population_and_demography_csv RENAME COLUMN "Population aged 15 to 19 years" TO population_15_to_19;
ALTER TABLE population_and_demography_csv RENAME COLUMN "Population aged 20 to 29 years" TO population_20_to_29;
ALTER TABLE population_and_demography_csv RENAME COLUMN "Population aged 30 to 39 years" TO population_30_to_39;
ALTER TABLE population_and_demography_csv RENAME COLUMN "Population aged 40 to 49 years" TO population_40_to_49;
ALTER TABLE population_and_demography_csv RENAME COLUMN "Population aged 50 to 59 years" TO population_50_to_59;
ALTER TABLE population_and_demography_csv RENAME COLUMN "Population aged 60 to 69 years" TO population_60_to_69;
ALTER TABLE population_and_demography_csv RENAME COLUMN "Population aged 70 to 79 years" TO population_70_to_79;
ALTER TABLE population_and_demography_csv RENAME COLUMN "Population aged 80 to 89 years" TO population_80_to_89;
ALTER TABLE population_and_demography_csv RENAME COLUMN "Population aged 90 to 99 years" TO population_90_to_99;
ALTER TABLE population_and_demography_csv RENAME COLUMN "Population older than 100 years" TO population_100_above;
ALTER TABLE population_and_demography_csv RENAME COLUMN population__all__20_24__records TO population_all_20_to_24;
ALTER TABLE population_and_demography_csv RENAME COLUMN population__all__25_29__records TO population_all_25_to_29;
ALTER TABLE population_and_demography_csv RENAME COLUMN population__all__30_34__records TO population_all_30_to_34;
ALTER TABLE population_and_demography_csv RENAME COLUMN population__all__35_39__records TO population_all_35_to_39;
ALTER TABLE population_and_demography_csv RENAME COLUMN population__all__40_44__records TO population_all_40_to_44;
ALTER TABLE population_and_demography_csv RENAME COLUMN population__all__45_49__records TO population_all_45_to_49;
ALTER TABLE population_and_demography_csv RENAME COLUMN population__all__50_54__records TO population_all_50_to_54;
ALTER TABLE population_and_demography_csv RENAME COLUMN population__all__55_59__records TO population_all_55_to_59;
ALTER TABLE population_and_demography_csv RENAME COLUMN population__all__60_64__records TO population_all_60_to_64;
ALTER TABLE population_and_demography_csv RENAME COLUMN population__all__65_69__records TO population_all_65_to_69;
ALTER TABLE population_and_demography_csv RENAME COLUMN population__all__70_74__records TO population_all_70_to_74;
ALTER TABLE population_and_demography_csv RENAME COLUMN population__all__75_79__records TO population_all_75_to_79;
ALTER TABLE population_and_demography_csv RENAME COLUMN population__all__80_84__records TO population_all_80_to_84;
ALTER TABLE population_and_demography_csv RENAME COLUMN population__all__85_89__records TO population_all_85_to_89;
ALTER TABLE population_and_demography_csv RENAME COLUMN population__all__90_94__records TO population_all_90_to_94;
ALTER TABLE population_and_demography_csv RENAME COLUMN population__all__95_99__records TO population_all_95_to_99;



/*
Add record_type to table
*/

ALTER TABLE population_and_demography_csv
ADD COLUMN record_type VARCHAR(100);

/*
Update records
*/

SELECT DISTINCT country_name
FROM population_and_demography_csv
WHERE country_name LIKE '%(UN)%';

UPDATE population_and_demography_csv
SET record_type = 'Continent'
WHERE country_name LIKE '%(UN)%';

SELECT DISTINCT country_name
FROM population_and_demography_csv
WHERE record_type IS NULL;

UPDATE population_and_demography_csv
SET record_type = 'Category'
WHERE country_name IN (
'High-income countries',
'Land-locked developing countries (LLDC)',
'Least developed countries',
'Less developed regions',
'Less developed regions, excluding China',
'Less developed regions, excluding least developed countries',
'Low-income countries',
'Lower-middle-income countries',
'More developed regions',
'Small island developing states (SIDS)',
'Upper-middle-income countries',
'World'
);


UPDATE population_and_demography_csv
SET record_type = 'Country'
WHERE record_type IS NULL;