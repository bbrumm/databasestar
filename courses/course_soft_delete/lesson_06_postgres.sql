/*
Lesson 06
Postgres
*/

CREATE FUNCTION delete_interaction
(idToDelete INT)
RETURNS void AS $$
BEGIN
  UPDATE interaction
  SET active = 0
  WHERE id = idToDelete;
END
$$ LANGUAGE plpgsql;
