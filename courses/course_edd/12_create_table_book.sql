/*
Lesson 12 - create a table
*/

CREATE TABLE book (
	id INT,
	list_id INT,
	genre_id INT,
	title VARCHAR(500),
	author VARCHAR(500),
	isbn VARCHAR(20),
	date_read DATE,
	created_date DATE,
	created_by VARCHAR(200),
	updated_date DATE,
	updated_by VARCHAR(200),
	CONSTRAINT pk_book PRIMARY KEY (id),
    CONSTRAINT fk_book_listid FOREIGN KEY (list_id) REFERENCES list (id),
    CONSTRAINT fk_book_genreid FOREIGN KEY (genre_id) REFERENCES genre (id)
);