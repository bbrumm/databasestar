CREATE TABLE employee (
  first_name VARCHAR(100),
  last_name VARCHAR(100),
  hire_date DATE
);

CREATE TABLE customer (
  fname VARCHAR(100),
  lname VARCHAR(100),
  joined_date DATE,
  cust_status VARCHAR(10)
);

INSERT INTO employee (first_name, last_name, hire_date) VALUES
('John', 'Smith', '2019-04-19'),
('Sarah', 'Brown', '2021-06-04'),
('Michael', 'Jones', '2018-09-01'),
('Tom', 'Anderson', '2021-01-25'),
('Claire', 'Crawford', '2020-11-09');


INSERT INTO customer (fname, lname, joined_date, cust_status) VALUES
('John', 'Smith', '2019-04-19', 'Active'),
('Mitch', 'Anderson', '2020-09-06', 'Active'),
('Glen', 'McDonald', '2020-01-17', 'Active'),
('Amanda', 'Bloom', '2021-12-30', 'Active'),
('Sarah', 'Brown', '2017-03-27', 'Active'),
('Kate', 'Smith', '2018-04-02', 'Active');


SELECT first_name, last_name, hire_date
FROM employee;

SELECT fname, lname, joined_date
FROM customer;

SELECT first_name, last_name, hire_date
FROM employee
UNION
SELECT fname, lname, joined_date
FROM customer;