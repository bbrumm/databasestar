/*
Lesson 05
Postgres
*/

CREATE OR REPLACE RULE delete_interactions AS
  ON DELETE TO interactions
  DO INSTEAD
    UPDATE interactions
    SET active = 0
    WHERE interactions.id = old.id;
