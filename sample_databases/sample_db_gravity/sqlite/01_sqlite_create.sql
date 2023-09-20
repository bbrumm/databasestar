DROP TABLE IF EXISTS author;
CREATE TABLE author (
    author_id INTEGER PRIMARY KEY,
    author_name TEXT DEFAULT NULL
);

DROP TABLE IF EXISTS publisher;
CREATE TABLE publisher (
    publisher_id INTEGER PRIMARY KEY,
    publisher_name TEXT
);

DROP TABLE IF EXISTS book_language;
CREATE TABLE book_language (
    language_id INTEGER PRIMARY KEY,
    language_code TEXT,
    language_name TEXT
);

DROP TABLE IF EXISTS book;
CREATE TABLE book (
    book_id INTEGER PRIMARY KEY,
    title TEXT,
    isbn13 TEXT,
    language_id INTEGER,
    num_pages INTEGER,
    publication_date DATE,
    publisher_id INTEGER,
    CONSTRAINT fk_book_lang FOREIGN KEY (language_id) REFERENCES book_language (language_id),
    CONSTRAINT fk_book_pub FOREIGN KEY (publisher_id) REFERENCES publisher (publisher_id)
);

DROP TABLE IF EXISTS book_author;
CREATE TABLE book_author (
    book_id INTEGER NOT NULL,
    author_id INTEGER NOT NULL,
    CONSTRAINT pk_bookauthor PRIMARY KEY (book_id, author_id),
    CONSTRAINT fk_ba_book FOREIGN KEY (book_id) REFERENCES book (book_id),
    CONSTRAINT fk_ba_author FOREIGN KEY (author_id) REFERENCES author (author_id)
);

DROP TABLE IF EXISTS address_status;
CREATE TABLE address_status (
    status_id INTEGER PRIMARY KEY,
    address_status TEXT
);

DROP TABLE IF EXISTS country;
CREATE TABLE country (
    country_id INTEGER PRIMARY KEY,
    country_name TEXT
);

DROP TABLE IF EXISTS address;
CREATE TABLE address (
    address_id INTEGER PRIMARY KEY,
    street_number TEXT,
    street_name TEXT,
    city TEXT,
    country_id INTEGER,
    CONSTRAINT fk_addr_ctry FOREIGN KEY (country_id) REFERENCES country (country_id)
);

DROP TABLE IF EXISTS customer;
CREATE TABLE customer (
    customer_id INTEGER PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    email TEXT
);

DROP TABLE IF EXISTS customer_address;
CREATE TABLE customer_address (
    customer_id INTEGER NOT NULL,
    address_id INTEGER NOT NULL,
    status_id INTEGER,
    CONSTRAINT pk_custaddr PRIMARY KEY (customer_id, address_id),
    CONSTRAINT fk_ca_cust FOREIGN KEY (customer_id) REFERENCES customer (customer_id),
    CONSTRAINT fk_ca_addr FOREIGN KEY (address_id) REFERENCES address (address_id)
);

DROP TABLE IF EXISTS shipping_method;
CREATE TABLE shipping_method (
    method_id INTEGER PRIMARY KEY,
    method_name TEXT,
    cost REAL
);

DROP TABLE IF EXISTS cust_order;
CREATE TABLE cust_order (
    order_id INTEGER PRIMARY KEY,
    order_date DATETIME,
    customer_id INTEGER,
    shipping_method_id INTEGER,
    dest_address_id INTEGER,
    CONSTRAINT fk_order_cust FOREIGN KEY (customer_id) REFERENCES customer (customer_id),
    CONSTRAINT fk_order_ship FOREIGN KEY (shipping_method_id) REFERENCES shipping_method (method_id),
    CONSTRAINT fk_order_addr FOREIGN KEY (dest_address_id) REFERENCES address (address_id)
);

DROP TABLE IF EXISTS order_status;
CREATE TABLE order_status (
    status_id INTEGER PRIMARY KEY,
    status_value TEXT
);

DROP TABLE IF EXISTS order_line;
CREATE TABLE order_line (
    line_id INTEGER PRIMARY KEY,
    order_id INTEGER,
    book_id INTEGER,
    price REAL,
    CONSTRAINT fk_ol_order FOREIGN KEY (order_id) REFERENCES cust_order (order_id),
    CONSTRAINT fk_ol_book FOREIGN KEY (book_id) REFERENCES book (book_id)
);

DROP TABLE IF EXISTS order_history;
CREATE TABLE order_history (
    history_id INTEGER PRIMARY KEY,
    order_id INTEGER,
    status_id INTEGER,
    status_date DATETIME,
    CONSTRAINT fk_oh_order FOREIGN KEY (order_id) REFERENCES cust_order (order_id),
    CONSTRAINT fk_oh_status FOREIGN KEY (status_id) REFERENCES order_status (status_id)
);
