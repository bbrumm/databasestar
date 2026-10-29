CREATE TABLE reviews (
    id INT PRIMARY KEY,
    movie_id INT,
    reviewer_name VARCHAR(100),
    score INT,
    review_text VARCHAR(255)
);

INSERT INTO reviews (id, movie_id, reviewer_name, score, review_text) VALUES
(1, 5, 'Sofia Marin', 8, 'Simple story, told extremely well.'),
(2, 1, 'Amy Chen', 10, 'A perfect film. Every scene earns its place.'),
(3, 10, 'Priya Nair', 10, 'Devastating and essential viewing.'),
(4, 3, 'Tom Reyes', 9, 'Took 2 watches to fully follow, worth it both times.'),
(5, 12, 'Jordan Lee', 8, 'Still holds up, the effects are incredible.'),
(6, 8, 'Leo Fischer', 8, 'Visually stunning, a little long in the middle.'),
(7, 15, 'Grace Kim', 8, 'Gorgeous to look at, the ending stuck with me.'),
(8, 6, 'Ben Osei', 9, 'Changed what action movies could look like.');