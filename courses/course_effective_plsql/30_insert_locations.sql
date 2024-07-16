SELECT *
FROM locations;

CREATE OR REPLACE PROCEDURE InsertLocations
AS
  v_loop_counter NUMBER := 1;
BEGIN
  LOOP
    INSERT INTO locations (location_id, street_address, postal_code, 
    city, state_province, country_id)
    VALUES (locations_seq.nextval, 'Temp Address' || v_loop_counter, 12345,
    'Sydney', 'New South Wales', 'AU');

    v_loop_counter := v_loop_counter + 1;
    
    IF (v_loop_counter > 4) THEN
      EXIT;
    END IF;
  END LOOP;
END;


CALL InsertLocations();