/*
Lesson 05
Postgres
*/

CREATE OR REPLACE RULE delete_interactions AS
  ON DELETE TO interaction
  DO INSTEAD
    UPDATE interaction
    SET active = 0
    WHERE interactions.id = old.id;
