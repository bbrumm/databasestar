CREATE TABLE office_location (
    location_id NUMBER(10) PRIMARY KEY,
    location_state VARCHAR2(2),
    created_date DATE,
    floor_size NUMBER(10)
);


SELECT *
FROM office_location;

INSERT INTO office_location(location_id, location_state, created_date, floor_size)
VALUES (1, 'MI', '10-OCT-2017', 150);
INSERT INTO office_location(location_id, location_state, created_date, floor_size)
VALUES (2, 'CA', '5-MAR-2017', 200);
INSERT INTO office_location(location_id, location_state, created_date, floor_size)
VALUES (3, 'WA', '16-APR-2017', 220);


INSERT ALL
INTO office_location(location_id, location_state, created_date, floor_size)
VALUES (4, 'OR', '7-JAN-2017', 400)
INTO office_location(location_id, location_state, created_date, floor_size)
VALUES (5, 'FL', '21-SEP-2017', 310)
INTO office_location(location_id, location_state, created_date, floor_size)
VALUES (6, 'IL', '9-JUN-2017', 190)
SELECT * FROM dual;

DELETE FROM office_location;