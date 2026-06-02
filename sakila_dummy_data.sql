-- ============================================================
-- Sakila Data Generator
-- Inserts large volumes of test data into key Sakila tables
-- Adjust the row counts at the top to suit your needs
-- ============================================================

USE sakila;

DELIMITER $$

-- ============================================================
-- Helper: random string of given length
-- ============================================================
DROP FUNCTION IF EXISTS rand_str$$
CREATE FUNCTION rand_str(len INT) RETURNS VARCHAR(255) DETERMINISTIC
BEGIN
    DECLARE chars VARCHAR(62) DEFAULT 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    DECLARE result VARCHAR(255) DEFAULT '';
    DECLARE i INT DEFAULT 0;
    WHILE i < len DO
        SET result = CONCAT(result, SUBSTR(chars, FLOOR(1 + RAND() * 62), 1));
        SET i = i + 1;
    END WHILE;
    RETURN result;
END$$

-- ============================================================
-- 1. CUSTOMER  (depends on: store, address)
-- ============================================================
DROP PROCEDURE IF EXISTS gen_customers$$
CREATE PROCEDURE gen_customers(IN n INT)
BEGIN
    DECLARE i INT DEFAULT 0;
    DECLARE max_store    INT;
    DECLARE max_address  INT;
    SELECT MAX(store_id)   INTO max_store   FROM store;
    SELECT MAX(address_id) INTO max_address FROM address;

    WHILE i < n DO
        INSERT INTO customer (store_id, first_name, last_name, email, address_id, active, create_date)
        VALUES (
            FLOOR(1 + RAND() * max_store),
            rand_str(6),
            rand_str(8),
            CONCAT(rand_str(8), '@', rand_str(5), '.com'),
            FLOOR(1 + RAND() * max_address),
            IF(RAND() > 0.1, 1, 0),
            DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 1825) DAY)
        );
        SET i = i + 1;
    END WHILE;
END$$

-- ============================================================
-- 2. FILM  (depends on: language)
-- ============================================================
DROP PROCEDURE IF EXISTS gen_films$$
CREATE PROCEDURE gen_films(IN n INT)
BEGIN
    DECLARE i INT DEFAULT 0;
    DECLARE max_lang INT;
    SELECT MAX(language_id) INTO max_lang FROM language;

    WHILE i < n DO
        INSERT INTO film (
            title, description, release_year, language_id,
            rental_duration, rental_rate, length, replacement_cost,
            rating, special_features, last_update
        )
        VALUES (
            UPPER(rand_str(FLOOR(3 + RAND() * 10))),
            CONCAT('A ', rand_str(10), ' story about ', rand_str(8), '.'),
            FLOOR(1990 + RAND() * 35),
            FLOOR(1 + RAND() * max_lang),
            FLOOR(3 + RAND() * 5),
            ROUND(0.99 + RAND() * 4, 2),
            FLOOR(60 + RAND() * 120),
            ROUND(9.99 + RAND() * 20, 2),
            ELT(FLOOR(1 + RAND() * 5), 'G', 'PG', 'PG-13', 'R', 'NC-17'),
            ELT(FLOOR(1 + RAND() * 4),
                'Trailers',
                'Commentaries',
                'Deleted Scenes',
                'Behind the Scenes'),
            NOW()
        );
        SET i = i + 1;
    END WHILE;
END$$

-- ============================================================
-- 3. INVENTORY  (depends on: film, store)
-- ============================================================
DROP PROCEDURE IF EXISTS gen_inventory$$
CREATE PROCEDURE gen_inventory(IN n INT)
BEGIN
    DECLARE i INT DEFAULT 0;
    DECLARE max_film  INT;
    DECLARE max_store INT;
    SELECT MAX(film_id)  INTO max_film  FROM film;
    SELECT MAX(store_id) INTO max_store FROM store;

    WHILE i < n DO
        INSERT INTO inventory (film_id, store_id, last_update)
        VALUES (
            FLOOR(1 + RAND() * max_film),
            FLOOR(1 + RAND() * max_store),
            NOW()
        );
        SET i = i + 1;
    END WHILE;
END$$

-- ============================================================
-- 4. RENTAL  (depends on: inventory, customer, staff)
--    Also inserts a matching payment row for each rental.
-- ============================================================
DROP PROCEDURE IF EXISTS gen_rentals$$
CREATE PROCEDURE gen_rentals(IN n INT)
BEGIN
    DECLARE i           INT DEFAULT 0;
    DECLARE max_inv     INT;
    DECLARE max_cust    INT;
    DECLARE max_staff   INT;
    DECLARE v_rental_id INT;
    DECLARE v_amount    DECIMAL(5,2);
    DECLARE v_rent_date DATETIME;

    SELECT MAX(inventory_id) INTO max_inv   FROM inventory;
    SELECT MAX(customer_id)  INTO max_cust  FROM customer;
    SELECT MAX(staff_id)     INTO max_staff FROM staff;

    WHILE i < n DO
        SET v_rent_date = DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 1825 * 86400) SECOND);
        SET v_amount    = ROUND(0.99 + RAND() * 9, 2);

        INSERT IGNORE INTO rental (rental_date, inventory_id, customer_id, return_date, staff_id, last_update)
        VALUES (
            v_rent_date,
            FLOOR(1 + RAND() * max_inv),
            FLOOR(1 + RAND() * max_cust),
            IF(RAND() > 0.05,
               DATE_ADD(v_rent_date, INTERVAL FLOOR(1 + RAND() * 14) DAY),
               NULL),                         -- ~5 % never returned
            FLOOR(1 + RAND() * max_staff),
            NOW()
        );

        SET v_rental_id = LAST_INSERT_ID();

        INSERT INTO payment (customer_id, staff_id, rental_id, amount, payment_date, last_update)
        SELECT customer_id,
               FLOOR(1 + RAND() * max_staff),
               v_rental_id,
               v_amount,
               v_rent_date,
               NOW()
        FROM   rental
        WHERE  rental_id = v_rental_id;

        SET i = i + 1;
    END WHILE;
END$$

-- ============================================================
-- 5. FILM_ACTOR  (depends on: film, actor)
-- ============================================================
DROP PROCEDURE IF EXISTS gen_film_actors$$
CREATE PROCEDURE gen_film_actors(IN n INT)
BEGIN
    DECLARE i          INT DEFAULT 0;
    DECLARE max_film   INT;
    DECLARE max_actor  INT;
    SELECT MAX(film_id)  INTO max_film  FROM film;
    SELECT MAX(actor_id) INTO max_actor FROM actor;

    WHILE i < n DO
        -- INSERT IGNORE skips duplicate (film_id, actor_id) pairs
        INSERT IGNORE INTO film_actor (actor_id, film_id, last_update)
        VALUES (
            FLOOR(1 + RAND() * max_actor),
            FLOOR(1 + RAND() * max_film),
            NOW()
        );
        SET i = i + 1;
    END WHILE;
END$$

DELIMITER ;

-- ============================================================
-- RUN THE GENERATORS
-- Tweak the numbers below to get the volume you want.
-- A good starting point for performance testing:
--   customers  : 10 000
--   films      : 5 000
--   inventory  : 20 000
--   rentals    : 100 000  (also inserts 100 000 payments)
--   film_actor : 50 000 attempts (dupes silently skipped)
-- ============================================================

-- Disable indexes / FK checks for speed while loading
SET foreign_key_checks = 0;
SET unique_checks      = 0;
SET autocommit         = 0;

#CALL gen_customers(10000);  COMMIT;
#CALL gen_films(5000);       COMMIT;
#CALL gen_inventory(20000);  COMMIT;
CALL gen_rentals(100000);   COMMIT;
CALL gen_film_actors(50000);COMMIT;

-- Restore normal settings
SET foreign_key_checks = 1;
SET unique_checks      = 1;
SET autocommit         = 1;

-- Quick row-count check
SELECT 'customer'   AS tbl, COUNT(*) AS num_rows FROM customer   UNION ALL
SELECT 'film',              COUNT(*)          FROM film       UNION ALL
SELECT 'inventory',         COUNT(*)          FROM inventory  UNION ALL
SELECT 'rental',            COUNT(*)          FROM rental     UNION ALL
SELECT 'payment',           COUNT(*)          FROM payment    UNION ALL
SELECT 'film_actor',        COUNT(*)          FROM film_actor;