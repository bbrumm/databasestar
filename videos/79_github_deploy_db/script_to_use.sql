/*
These are the commands I'll use in the video.
The actual script to run will be created in a different location.
*/
DROP DATABASE heroes;

CREATE DATABASE heroes;

CREATE TABLE person (
    id INT,
    hero_name VARCHAR(100)
);

INSERT INTO person (id, hero_name) VALUES
(1, 'Joan'),
(2, 'Michael'),
(3, 'Sally'),
(4, 'Roger');