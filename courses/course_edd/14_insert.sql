/*
Lesson 14 - insert data
*/

INSERT INTO list (id, list_name) VALUES
(1, 'To Read'),
(2, 'Currently Reading'),
(3, 'Have Read');


INSERT INTO genre (id, genre_name) VALUES
(1, 'Sci Fi'),
(2, 'Romance'),
(3, 'Adventure');

INSERT INTO book (id, list_id, title, author, isbn, date_read) VALUES
(1, 1, 'Lessons in Chemistry', 'Bonnie Garmus', '72801735', NULL);
INSERT INTO book (id, list_id, title, author, isbn, date_read) VALUES
(2, 1, 'The Convenant of Water', 'Abraham Verghese', '33161588', NULL);
INSERT INTO book (id, list_id, title, author, isbn, date_read) VALUES
(3, NULL, 'Demon Copperhead', 'Barbara Kingsolver', '54200066', NULL);
INSERT INTO book (id, list_id, title, author, isbn, date_read) VALUES
(4, 2, 'Fourth Wing', 'Rebecca Yarros', '65224074', NULL);
INSERT INTO book (id, list_id, title, author, isbn, date_read) VALUES
(5, 3, 'Harry Potter and the Order of the Phoenix', 'JK Rowling', '31819142', '20220412');
INSERT INTO book (id, list_id, title, author, isbn, date_read) VALUES
(6, 3, 'Harry Potter and the Goblet of Fire', 'JK Rowling', '92072266', '20220901');
INSERT INTO book (id, list_id, title, author, isbn, date_read) VALUES
(7, 2, 'Happy Place', 'Emily Henry', '77945154', NULL);
INSERT INTO book (id, list_id, title, author, isbn, date_read) VALUES
(8, NULL, 'The Five-Star Weekend', 'Elin Hilderbrand', '97648266', NULL);
INSERT INTO book (id, list_id, title, author, isbn, date_read) VALUES
(9, NULL, 'Hello Beautiful', 'Ann Napolitano', '25657698', NULL);
INSERT INTO book (id, list_id, title, author, isbn, date_read) VALUES
(10, 3, 'The Housemaid', 'Freida McFadden', '58899833', '20230518');
INSERT INTO book (id, list_id, title, author, isbn, date_read) VALUES
(11, NULL, 'Never Lie', 'Freida McFadden', '20020379', NULL);
INSERT INTO book (id, list_id, title, author, isbn, date_read) VALUES
(12, 1, 'Identity', 'Nora Roberts', '34138196', NULL);
INSERT INTO book (id, list_id, title, author, isbn, date_read) VALUES
(13, NULL, 'A Court of Thorns and Roses', 'Sarah J Maas', '15183613', NULL);

INSERT INTO review (id, book_id, rating, review, date_reviewed) VALUES
(1, 2, 3, 'This was a good book', 20230410);
