CREATE TABLE dsa_dates (
  id NUMBER,
  created_date DATE
);

/* INSERT */
INSERT INTO dsa_dates (id, created_date)
VALUES (1, '10-APR-2017');

INSERT INTO dsa_dates (id, created_date)
VALUES (2, '11/APR/2017');

INSERT INTO dsa_dates (id, created_date)
VALUES (3, '12/APR/17');

INSERT INTO dsa_dates (id, created_date)
VALUES (4, '13 APR 17');

/* SELECT */
SELECT id, created_date
FROM dsa_dates;

SELECT *
FROM SYS.nls_session_parameters;


SELECT id, created_date, TO_CHAR(created_date, 'DD/MON/YY HH:MI:SS AM') AS date_converted
FROM dsa_dates;

/* INSERT with Conversion */

INSERT INTO dsa_dates (id, created_date)
VALUES (5, '14/04/17');


INSERT INTO dsa_dates (id, created_date)
VALUES (6, TO_DATE('15/04/17', 'DD/MM/YY'));

SELECT id, created_date, TO_CHAR(created_date, 'DD/MON/YY HH:MI:SS AM') AS date_converted
FROM dsa_dates;

/* INSERT with Time */
INSERT INTO dsa_dates (id, created_date)
VALUES (7, TO_DATE('16/04/17 6:02:43 PM', 'DD/MM/YY'));

INSERT INTO dsa_dates (id, created_date)
VALUES (8, TO_DATE('16/04/17 6:02:43 PM', 'DD/MM/YY HH:MI:SS AM'));


SELECT id, created_date, TO_CHAR(created_date, 'DD/MON/YY HH:MI:SS AM') AS date_converted
FROM dsa_dates;

/* ANSI Date Literal - must be YYYY-MM-DD */
INSERT INTO dsa_dates (id, created_date)
VALUES (9, DATE'2017-04-18');

/* UPDATE */

SELECT id, created_date, TO_CHAR(created_date, 'DD/MON/YY HH:MI:SS AM') AS date_converted
FROM dsa_dates;

UPDATE dsa_dates
SET created_date = '20-APR-2017'
WHERE id = 1;


UPDATE dsa_dates
SET created_date = TO_DATE('21/10/1982 3:12:09 AM', 'DD/MM/YYYY HH:MI:SS AM')
WHERE id = 2;

/* NLS SESSION */

SELECT id, created_date
FROM dsa_dates;

SELECT *
FROM SYS.nls_session_parameters
WHERE parameter = 'NLS_DATE_FORMAT';

ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MON-YYYY HH:MI:SS AM';

/* TIMESTAMP */

CREATE TABLE dsa_timestamp (
  id NUMBER,
  created_timestamp TIMESTAMP
);

INSERT INTO dsa_timestamp (id, created_timestamp)
VALUES (1, '10-APR-2017');

INSERT INTO dsa_timestamp (id, created_timestamp)
VALUES (2, '11-APR-2017 10:45:02.123 AM');

INSERT INTO dsa_timestamp (id, created_timestamp)
VALUES (3, '12-APR-2017 9:08:16');

SELECT id, created_timestamp
FROM dsa_timestamp;

INSERT INTO dsa_timestamp (id, created_timestamp)
VALUES (4, TO_TIMESTAMP('13-APR-2017 6:55:20.1032 PM', 'DD-MON-YYYY HH:MI:SS.FF AM'));

/* SELECT Parts */

SELECT id, 
created_timestamp, 
EXTRACT(YEAR FROM created_timestamp) AS extracted_value
FROM dsa_timestamp;


SELECT id, 
created_timestamp, 
EXTRACT(DAY FROM created_timestamp) AS extracted_value
FROM dsa_timestamp;

SELECT id, 
created_timestamp, 
EXTRACT(HOUR FROM created_timestamp) AS extracted_value
FROM dsa_timestamp;


DROP TABLE dsa_dates;
DROP TABLE dsa_timestamp;