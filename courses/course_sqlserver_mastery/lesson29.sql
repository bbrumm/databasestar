CREATE TABLE date_test (
  id INT,
  my_date DATE,
  my_datetime DATETIME2
);


INSERT INTO date_test (id, my_date, my_datetime)
VALUES (1, '2025-04-20', '2025-04-20 21:08:15');


SELECT id, my_date, my_datetime
FROM date_test;


INSERT INTO date_test (id, my_date, my_datetime)
VALUES (2, GETDATE(), SYSDATETIME());


CREATE TABLE timezone_test (
  id INT,
  my_fulldate DATETIMEOFFSET
);


INSERT INTO timezone_test (id, my_fulldate)
VALUES (1, SYSDATETIMEOFFSET);


SELECT id, my_fulldate
FROM timezone_test;


INSERT INTO timezone_test (id, my_fulldate)
VALUES (2, '2024-09-14 08:45:11 -7:00');