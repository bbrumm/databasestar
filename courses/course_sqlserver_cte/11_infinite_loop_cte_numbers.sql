--More than 100
WITH number_list AS
(
    SELECT 1 AS my_number
    UNION ALL
    SELECT my_number + 1 FROM number_list
    WHERE my_number < 120
 )
SELECT my_number 
FROM number_list;


--Set to more than 120
WITH number_list AS
(
    SELECT 1 AS my_number
    UNION ALL
    SELECT my_number + 1 FROM number_list
    WHERE my_number < 120
 )
SELECT my_number 
FROM number_list
OPTION (MAXRECURSION 150);