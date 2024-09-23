/*
Exercises from the PostgreSQL Mastery course
Module 3
*/

/* 21-01 */

SELECT
os.status_value,
SUM(CASE WHEN EXTRACT('year' FROM co.order_date) = 2021 THEN 1 ELSE 0 END) AS orders_2021,
SUM(CASE WHEN EXTRACT('year' FROM co.order_date) = 2022 THEN 1 ELSE 0 END) AS orders_2022,
SUM(CASE WHEN EXTRACT('year' FROM co.order_date) = 2023 THEN 1 ELSE 0 END) AS orders_2023,
SUM(CASE WHEN EXTRACT('year' FROM co.order_date) = 2024 THEN 1 ELSE 0 END) AS orders_2024
FROM cust_order co
INNER JOIN order_history oh ON co.order_id = oh.order_id 
INNER JOIN order_status os ON oh.status_id = os.status_id
GROUP BY os.status_value
ORDER BY os.status_value ASC;


/* 21-02 */

/*
Note: this is a long query that seems repetitive.
It could also be done using dynamic SQL.
*/

SELECT
a.author_name,
SUM(CASE WHEN EXTRACT('year' FROM b.publication_date) = 1900 THEN 1 ELSE 0 END) AS books_1900,
SUM(CASE WHEN EXTRACT('year' FROM b.publication_date) = 1913 THEN 1 ELSE 0 END) AS books_1913,
SUM(CASE WHEN EXTRACT('year' FROM b.publication_date) = 1914 THEN 1 ELSE 0 END) AS books_1914,
SUM(CASE WHEN EXTRACT('year' FROM b.publication_date) = 1919 THEN 1 ELSE 0 END) AS books_1919,
SUM(CASE WHEN EXTRACT('year' FROM b.publication_date) = 1921 THEN 1 ELSE 0 END) AS books_1921,
SUM(CASE WHEN EXTRACT('year' FROM b.publication_date) = 1922 THEN 1 ELSE 0 END) AS books_1922,
SUM(CASE WHEN EXTRACT('year' FROM b.publication_date) = 1923 THEN 1 ELSE 0 END) AS books_1923,
SUM(CASE WHEN EXTRACT('year' FROM b.publication_date) = 1925 THEN 1 ELSE 0 END) AS books_1925,
SUM(CASE WHEN EXTRACT('year' FROM b.publication_date) = 1928 THEN 1 ELSE 0 END) AS books_1928,
SUM(CASE WHEN EXTRACT('year' FROM b.publication_date) = 1929 THEN 1 ELSE 0 END) AS books_1929,
SUM(CASE WHEN EXTRACT('year' FROM b.publication_date) = 1931 THEN 1 ELSE 0 END) AS books_1931,
SUM(CASE WHEN EXTRACT('year' FROM b.publication_date) = 1935 THEN 1 ELSE 0 END) AS books_1935,
SUM(CASE WHEN EXTRACT('year' FROM b.publication_date) = 1940 THEN 1 ELSE 0 END) AS books_1940,
SUM(CASE WHEN EXTRACT('year' FROM b.publication_date) = 1943 THEN 1 ELSE 0 END) AS books_1943,
SUM(CASE WHEN EXTRACT('year' FROM b.publication_date) = 1947 THEN 1 ELSE 0 END) AS books_1947,
SUM(CASE WHEN EXTRACT('year' FROM b.publication_date) = 1948 THEN 1 ELSE 0 END) AS books_1948,
SUM(CASE WHEN EXTRACT('year' FROM b.publication_date) = 1949 THEN 1 ELSE 0 END) AS books_1949,
SUM(CASE WHEN EXTRACT('year' FROM b.publication_date) = 1950 THEN 1 ELSE 0 END) AS books_1950,
SUM(CASE WHEN EXTRACT('year' FROM b.publication_date) = 1952 THEN 1 ELSE 0 END) AS books_1952,
SUM(CASE WHEN EXTRACT('year' FROM b.publication_date) = 1953 THEN 1 ELSE 0 END) AS books_1953,
SUM(CASE WHEN EXTRACT('year' FROM b.publication_date) = 1954 THEN 1 ELSE 0 END) AS books_1954,
SUM(CASE WHEN EXTRACT('year' FROM b.publication_date) = 1955 THEN 1 ELSE 0 END) AS books_1955,
SUM(CASE WHEN EXTRACT('year' FROM b.publication_date) = 1956 THEN 1 ELSE 0 END) AS books_1956,
SUM(CASE WHEN EXTRACT('year' FROM b.publication_date) = 1957 THEN 1 ELSE 0 END) AS books_1957,
SUM(CASE WHEN EXTRACT('year' FROM b.publication_date) = 1958 THEN 1 ELSE 0 END) AS books_1958,
SUM(CASE WHEN EXTRACT('year' FROM b.publication_date) = 1959 THEN 1 ELSE 0 END) AS books_1959,
SUM(CASE WHEN EXTRACT('year' FROM b.publication_date) = 1960 THEN 1 ELSE 0 END) AS books_1960,
SUM(CASE WHEN EXTRACT('year' FROM b.publication_date) = 1961 THEN 1 ELSE 0 END) AS books_1961,
SUM(CASE WHEN EXTRACT('year' FROM b.publication_date) = 1962 THEN 1 ELSE 0 END) AS books_1962,
SUM(CASE WHEN EXTRACT('year' FROM b.publication_date) = 1963 THEN 1 ELSE 0 END) AS books_1963,
SUM(CASE WHEN EXTRACT('year' FROM b.publication_date) = 1964 THEN 1 ELSE 0 END) AS books_1964,
SUM(CASE WHEN EXTRACT('year' FROM b.publication_date) = 1965 THEN 1 ELSE 0 END) AS books_1965,
SUM(CASE WHEN EXTRACT('year' FROM b.publication_date) = 1966 THEN 1 ELSE 0 END) AS books_1966,
SUM(CASE WHEN EXTRACT('year' FROM b.publication_date) = 1967 THEN 1 ELSE 0 END) AS books_1967,
SUM(CASE WHEN EXTRACT('year' FROM b.publication_date) = 1968 THEN 1 ELSE 0 END) AS books_1968,
SUM(CASE WHEN EXTRACT('year' FROM b.publication_date) = 1969 THEN 1 ELSE 0 END) AS books_1969,
SUM(CASE WHEN EXTRACT('year' FROM b.publication_date) = 1970 THEN 1 ELSE 0 END) AS books_1970,
SUM(CASE WHEN EXTRACT('year' FROM b.publication_date) = 1971 THEN 1 ELSE 0 END) AS books_1971,
SUM(CASE WHEN EXTRACT('year' FROM b.publication_date) = 1972 THEN 1 ELSE 0 END) AS books_1972,
SUM(CASE WHEN EXTRACT('year' FROM b.publication_date) = 1973 THEN 1 ELSE 0 END) AS books_1973,
SUM(CASE WHEN EXTRACT('year' FROM b.publication_date) = 1974 THEN 1 ELSE 0 END) AS books_1974,
SUM(CASE WHEN EXTRACT('year' FROM b.publication_date) = 1975 THEN 1 ELSE 0 END) AS books_1975,
SUM(CASE WHEN EXTRACT('year' FROM b.publication_date) = 1976 THEN 1 ELSE 0 END) AS books_1976,
SUM(CASE WHEN EXTRACT('year' FROM b.publication_date) = 1977 THEN 1 ELSE 0 END) AS books_1977,
SUM(CASE WHEN EXTRACT('year' FROM b.publication_date) = 1978 THEN 1 ELSE 0 END) AS books_1978,
SUM(CASE WHEN EXTRACT('year' FROM b.publication_date) = 1979 THEN 1 ELSE 0 END) AS books_1979,
SUM(CASE WHEN EXTRACT('year' FROM b.publication_date) = 1980 THEN 1 ELSE 0 END) AS books_1980,
SUM(CASE WHEN EXTRACT('year' FROM b.publication_date) = 1981 THEN 1 ELSE 0 END) AS books_1981,
SUM(CASE WHEN EXTRACT('year' FROM b.publication_date) = 1982 THEN 1 ELSE 0 END) AS books_1982,
SUM(CASE WHEN EXTRACT('year' FROM b.publication_date) = 1983 THEN 1 ELSE 0 END) AS books_1983,
SUM(CASE WHEN EXTRACT('year' FROM b.publication_date) = 1984 THEN 1 ELSE 0 END) AS books_1984,
SUM(CASE WHEN EXTRACT('year' FROM b.publication_date) = 1985 THEN 1 ELSE 0 END) AS books_1985,
SUM(CASE WHEN EXTRACT('year' FROM b.publication_date) = 1986 THEN 1 ELSE 0 END) AS books_1986,
SUM(CASE WHEN EXTRACT('year' FROM b.publication_date) = 1987 THEN 1 ELSE 0 END) AS books_1987,
SUM(CASE WHEN EXTRACT('year' FROM b.publication_date) = 1988 THEN 1 ELSE 0 END) AS books_1988,
SUM(CASE WHEN EXTRACT('year' FROM b.publication_date) = 1989 THEN 1 ELSE 0 END) AS books_1989,
SUM(CASE WHEN EXTRACT('year' FROM b.publication_date) = 1990 THEN 1 ELSE 0 END) AS books_1990,
SUM(CASE WHEN EXTRACT('year' FROM b.publication_date) = 1991 THEN 1 ELSE 0 END) AS books_1991,
SUM(CASE WHEN EXTRACT('year' FROM b.publication_date) = 1992 THEN 1 ELSE 0 END) AS books_1992,
SUM(CASE WHEN EXTRACT('year' FROM b.publication_date) = 1993 THEN 1 ELSE 0 END) AS books_1993,
SUM(CASE WHEN EXTRACT('year' FROM b.publication_date) = 1994 THEN 1 ELSE 0 END) AS books_1994,
SUM(CASE WHEN EXTRACT('year' FROM b.publication_date) = 1995 THEN 1 ELSE 0 END) AS books_1995,
SUM(CASE WHEN EXTRACT('year' FROM b.publication_date) = 1996 THEN 1 ELSE 0 END) AS books_1996,
SUM(CASE WHEN EXTRACT('year' FROM b.publication_date) = 1997 THEN 1 ELSE 0 END) AS books_1997,
SUM(CASE WHEN EXTRACT('year' FROM b.publication_date) = 1998 THEN 1 ELSE 0 END) AS books_1998,
SUM(CASE WHEN EXTRACT('year' FROM b.publication_date) = 1999 THEN 1 ELSE 0 END) AS books_1999,
SUM(CASE WHEN EXTRACT('year' FROM b.publication_date) = 2000 THEN 1 ELSE 0 END) AS books_2000,
SUM(CASE WHEN EXTRACT('year' FROM b.publication_date) = 2001 THEN 1 ELSE 0 END) AS books_2001,
SUM(CASE WHEN EXTRACT('year' FROM b.publication_date) = 2002 THEN 1 ELSE 0 END) AS books_2002,
SUM(CASE WHEN EXTRACT('year' FROM b.publication_date) = 2003 THEN 1 ELSE 0 END) AS books_2003,
SUM(CASE WHEN EXTRACT('year' FROM b.publication_date) = 2004 THEN 1 ELSE 0 END) AS books_2004,
SUM(CASE WHEN EXTRACT('year' FROM b.publication_date) = 2005 THEN 1 ELSE 0 END) AS books_2005,
SUM(CASE WHEN EXTRACT('year' FROM b.publication_date) = 2006 THEN 1 ELSE 0 END) AS books_2006,
SUM(CASE WHEN EXTRACT('year' FROM b.publication_date) = 2007 THEN 1 ELSE 0 END) AS books_2007,
SUM(CASE WHEN EXTRACT('year' FROM b.publication_date) = 2008 THEN 1 ELSE 0 END) AS books_2008,
SUM(CASE WHEN EXTRACT('year' FROM b.publication_date) = 2009 THEN 1 ELSE 0 END) AS books_2009,
SUM(CASE WHEN EXTRACT('year' FROM b.publication_date) = 2010 THEN 1 ELSE 0 END) AS books_2010,
SUM(CASE WHEN EXTRACT('year' FROM b.publication_date) = 2011 THEN 1 ELSE 0 END) AS books_2011,
SUM(CASE WHEN EXTRACT('year' FROM b.publication_date) = 2012 THEN 1 ELSE 0 END) AS books_2012,
SUM(CASE WHEN EXTRACT('year' FROM b.publication_date) = 2013 THEN 1 ELSE 0 END) AS books_2013,
SUM(CASE WHEN EXTRACT('year' FROM b.publication_date) = 2014 THEN 1 ELSE 0 END) AS books_2014,
SUM(CASE WHEN EXTRACT('year' FROM b.publication_date) = 2015 THEN 1 ELSE 0 END) AS books_2015,
SUM(CASE WHEN EXTRACT('year' FROM b.publication_date) = 2016 THEN 1 ELSE 0 END) AS books_2016,
SUM(CASE WHEN EXTRACT('year' FROM b.publication_date) = 2017 THEN 1 ELSE 0 END) AS books_2017,
SUM(CASE WHEN EXTRACT('year' FROM b.publication_date) = 2018 THEN 1 ELSE 0 END) AS books_2018,
SUM(CASE WHEN EXTRACT('year' FROM b.publication_date) = 2019 THEN 1 ELSE 0 END) AS books_2019,
SUM(CASE WHEN EXTRACT('year' FROM b.publication_date) = 2020 THEN 1 ELSE 0 END) AS books_2020
FROM book b
INNER JOIN book_author ba ON ba.book_id = b.book_id
INNER JOIN author a ON ba.author_id = a.author_id
GROUP BY a.author_name
ORDER BY a.author_name ASC;

/* 21-03 */

SELECT
order_year,
order_month,
SUM(CASE WHEN order_amount > 25 THEN 1 ELSE 0 END) AS order_over_25,
SUM(CASE WHEN order_amount BETWEEN 10 AND 25 THEN 1 ELSE 0 END) AS order_10_to_25,
SUM(CASE WHEN order_amount < 10 THEN 1 ELSE 0 END) AS order_under_10
FROM (
	SELECT
	co.order_id,
	EXTRACT('year' FROM co.order_date) AS order_year,
	EXTRACT('month' FROM co.order_date) AS order_month,
	SUM(ol.price) AS order_amount
	FROM cust_order co
	INNER JOIN order_line ol ON co.order_id = ol.order_id
	GROUP BY co.order_id
) s
GROUP BY order_year, order_month
ORDER BY order_year ASC, order_month ASC;

/* 22-01 */

SELECT
os.status_value,
COUNT(*) FILTER (WHERE EXTRACT('year' FROM co.order_date) = 2021) AS orders_2021,
COUNT(*) FILTER (WHERE EXTRACT('year' FROM co.order_date) = 2022) AS orders_2022,
COUNT(*) FILTER (WHERE EXTRACT('year' FROM co.order_date) = 2023) AS orders_2023,
COUNT(*) FILTER (WHERE EXTRACT('year' FROM co.order_date) = 2024) AS orders_2024
FROM cust_order co
INNER JOIN order_history oh ON co.order_id = oh.order_id 
INNER JOIN order_status os ON oh.status_id = os.status_id
GROUP BY os.status_value
ORDER BY os.status_value ASC;

/* 22-03 */

SELECT
order_year,
order_month,
COUNT(*) FILTER (WHERE order_amount > 25) AS order_over_25,
COUNT(*) FILTER (WHERE order_amount BETWEEN 10 AND 25) AS order_10_to_25,
COUNT(*) FILTER (WHERE order_amount < 10) AS order_under_10
FROM (
	SELECT
	co.order_id,
	EXTRACT('year' FROM co.order_date) AS order_year,
	EXTRACT('month' FROM co.order_date) AS order_month,
	SUM(ol.price) AS order_amount
	FROM cust_order co
	INNER JOIN order_line ol ON co.order_id = ol.order_id
	GROUP BY co.order_id
) s
GROUP BY order_year, order_month
ORDER BY order_year ASC, order_month ASC;