--Rename and Drop View

EXEC sp_rename 'person_with_region', 'person_regions';

SELECT * FROM person_regions;

SELECT * FROM person_with_region;

--Drop view
DROP VIEW person_regions;

SELECT * FROM person_regions;
