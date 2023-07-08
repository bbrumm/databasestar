/*
Lesson 13 - create all tables
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

CREATE TABLE list (
	id INT,
	list_name VARCHAR(100),
    CONSTRAINT pk_list PRIMARY KEY (id)
);



CREATE TABLE review (
	id INT,
    book_id INT,
    rating INT,
    review VARCHAR(1000),
    date_reviewed DATE,
    CONSTRAINT pk_review PRIMARY KEY (id),
    CONSTRAINT fk_review_bookid FOREIGN KEY (book_id) REFERENCES book (id)
);

CREATE TABLE genre (
	id INT,
    genre_name VARCHAR(100),
    CONSTRAINT pk_genre PRIMARY KEY (id)
);


/*
drop book, then all of the other tables
*/

DROP TABLE IF EXISTS review;
DROP TABLE IF EXISTS book;
DROP TABLE IF EXISTS list;
DROP TABLE IF EXISTS genre;


CREATE TABLE list (
	id INT,
	list_name VARCHAR(100),
    CONSTRAINT pk_list PRIMARY KEY (id)
);



CREATE TABLE genre (
	id INT,
    genre_name VARCHAR(100),
    CONSTRAINT pk_genre PRIMARY KEY (id)
);


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



CREATE TABLE review (
	id INT,
    book_id INT,
    rating INT,
    review VARCHAR(1000),
    date_reviewed DATE,
    CONSTRAINT pk_review PRIMARY KEY (id),
    CONSTRAINT fk_review_bookid FOREIGN KEY (book_id) REFERENCES book (id)
);