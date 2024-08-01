/*
Character types
*/

--SQL 01
CREATE TABLE char_data (
  character_varying_n CHARACTER VARYING(20),
  character_varying_nolimit CHARACTER VARYING,
  char_n CHAR(5),
  char_nolimit CHAR,
  textval TEXT
);

--SQL 02
INSERT INTO char_data(character_varying_n, character_varying_nolimit, char_n, char_nolimit, textval)
VALUES ('A', 'B', 'C', 'D', 'E');

--SQL 03
SELECT *
FROM char_data;

--SQL 04
--Error
INSERT INTO char_data(character_varying_n, character_varying_nolimit, char_n, char_nolimit, textval)
VALUES ('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday');

--SQL 05
INSERT INTO char_data(character_varying_n, character_varying_nolimit, textval)
VALUES ('Monday', 'Tuesday', 'Wednesday');

--SQL 06
--Error
INSERT INTO char_data(character_varying_n, character_varying_nolimit, textval)
VALUES ('Monday is the start of the week', 'Tuesday is the second day of the week', 'Wednesday is the middle of the week');

--SQL 07
INSERT INTO char_data(character_varying_nolimit, textval)
VALUES ('Tuesday is the second day of the week', 'Wednesday is the middle of the week');
