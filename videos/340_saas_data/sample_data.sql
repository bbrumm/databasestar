-- ============================================
-- Video 340 — SaaS Metrics Sample Dataset
-- PostgreSQL
-- ============================================
-- 82 customers across 14 cohort months (Jan 2023 – Feb 2024)
-- Plans: $29 (Starter), $49 (Pro), $99 (Business), $199 (Enterprise)
-- ~44% of subscriptions churned, ~56% still active
-- ============================================

DROP TABLE IF EXISTS subscriptions;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
    customer_id   INT PRIMARY KEY,
    name          VARCHAR(100) NOT NULL,
    created_at    DATE NOT NULL
);

CREATE TABLE subscriptions (
    subscription_id  INT PRIMARY KEY,
    customer_id      INT NOT NULL REFERENCES customers(customer_id),
    started_at       DATE NOT NULL,
    ended_at         DATE,
    monthly_amount   NUMERIC(10,2) NOT NULL
);

-- ============================================
-- CUSTOMERS
-- ============================================

INSERT INTO customers (customer_id, name, created_at) VALUES
-- January 2023 cohort
(1,  'Alice Johnson',     '2023-01-05'),
(2,  'Bob Williams',      '2023-01-09'),
(3,  'Carol Smith',       '2023-01-14'),
(4,  'David Brown',       '2023-01-18'),
(5,  'Emma Davis',        '2023-01-21'),
(6,  'Frank Miller',      '2023-01-24'),
(7,  'Grace Wilson',      '2023-01-27'),
(8,  'Henry Moore',       '2023-01-30'),

-- February 2023 cohort
(9,  'Iris Taylor',       '2023-02-03'),
(10, 'Jack Anderson',     '2023-02-07'),
(11, 'Karen Thomas',      '2023-02-11'),
(12, 'Leo Jackson',       '2023-02-15'),
(13, 'Mia White',         '2023-02-19'),
(14, 'Noah Harris',       '2023-02-23'),
(15, 'Olivia Martin',     '2023-02-27'),

-- March 2023 cohort
(16, 'Peter Garcia',      '2023-03-02'),
(17, 'Quinn Martinez',    '2023-03-06'),
(18, 'Rachel Robinson',   '2023-03-10'),
(19, 'Sam Clark',         '2023-03-14'),
(20, 'Tara Rodriguez',    '2023-03-18'),
(21, 'Umar Lewis',        '2023-03-22'),
(22, 'Victoria Lee',      '2023-03-26'),
(23, 'William Walker',    '2023-03-29'),

-- April 2023 cohort
(24, 'Xena Hall',         '2023-04-04'),
(25, 'Yusuf Allen',       '2023-04-08'),
(26, 'Zoe Young',         '2023-04-12'),
(27, 'Aaron King',        '2023-04-16'),
(28, 'Beth Wright',       '2023-04-20'),
(29, 'Carlos Scott',      '2023-04-24'),
(30, 'Diana Green',       '2023-04-28'),

-- May 2023 cohort
(31, 'Ethan Baker',       '2023-05-03'),
(32, 'Fiona Nelson',      '2023-05-08'),
(33, 'George Carter',     '2023-05-12'),
(34, 'Hannah Mitchell',   '2023-05-17'),
(35, 'Ian Perez',         '2023-05-21'),
(36, 'Julia Roberts',     '2023-05-25'),
(37, 'Kevin Turner',      '2023-05-29'),

-- June 2023 cohort
(38, 'Laura Phillips',    '2023-06-02'),
(39, 'Marcus Campbell',   '2023-06-07'),
(40, 'Nina Parker',       '2023-06-12'),
(41, 'Oscar Evans',       '2023-06-17'),
(42, 'Priya Edwards',     '2023-06-22'),
(43, 'Quinn Collins',     '2023-06-27'),

-- July 2023 cohort
(44, 'Ryan Stewart',      '2023-07-04'),
(45, 'Sara Sanchez',      '2023-07-09'),
(46, 'Tom Morris',        '2023-07-14'),
(47, 'Uma Rogers',        '2023-07-19'),
(48, 'Victor Reed',       '2023-07-24'),
(49, 'Wendy Cook',        '2023-07-29'),

-- August 2023 cohort
(50, 'Xavier Morgan',     '2023-08-03'),
(51, 'Yasmin Bell',       '2023-08-09'),
(52, 'Zach Murphy',       '2023-08-15'),
(53, 'Amy Bailey',        '2023-08-21'),
(54, 'Brian Rivera',      '2023-08-27'),

-- September 2023 cohort
(55, 'Chloe Cooper',      '2023-09-04'),
(56, 'Derek Richardson',  '2023-09-09'),
(57, 'Elena Cox',         '2023-09-14'),
(58, 'Felix Howard',      '2023-09-19'),
(59, 'Grace Ward',        '2023-09-24'),
(60, 'Hank Torres',       '2023-09-28'),

-- October 2023 cohort
(61, 'Isla Peterson',     '2023-10-05'),
(62, 'Jake Gray',         '2023-10-10'),
(63, 'Kira Ramirez',      '2023-10-15'),
(64, 'Liam James',        '2023-10-20'),
(65, 'Maya Watson',       '2023-10-25'),

-- November 2023 cohort
(66, 'Nathan Brooks',     '2023-11-04'),
(67, 'Olivia Kelly',      '2023-11-10'),
(68, 'Patrick Sanders',   '2023-11-16'),
(69, 'Quinn Price',       '2023-11-22'),
(70, 'Rose Bennett',      '2023-11-28'),

-- December 2023 cohort
(71, 'Sam Wood',          '2023-12-05'),
(72, 'Tina Barnes',       '2023-12-11'),
(73, 'Ulrich Ross',       '2023-12-17'),
(74, 'Vera Henderson',    '2023-12-23'),

-- January 2024 cohort
(75, 'William Coleman',   '2024-01-06'),
(76, 'Xena Jenkins',      '2024-01-13'),
(77, 'Yara Perry',        '2024-01-19'),
(78, 'Zack Powell',       '2024-01-25'),

-- February 2024 cohort
(79, 'Amy Long',          '2024-02-04'),
(80, 'Brad Patterson',    '2024-02-12'),
(81, 'Cindy Hughes',      '2024-02-20'),
(82, 'Dan Foster',        '2024-02-27');

-- ============================================
-- SUBSCRIPTIONS
-- (subscription_id matches customer_id for simplicity)
-- ended_at NULL = still active
-- ============================================

INSERT INTO subscriptions (subscription_id, customer_id, started_at, ended_at, monthly_amount) VALUES
-- January 2023 cohort
(1,  1,  '2023-01-05', '2023-04-15', 49.00),   -- Alice    churned month 3
(2,  2,  '2023-01-09', '2023-03-10', 29.00),   -- Bob      churned month 2
(3,  3,  '2023-01-14', NULL,         99.00),   -- Carol    active
(4,  4,  '2023-01-18', '2023-08-20', 49.00),   -- David    churned month 7
(5,  5,  '2023-01-21', '2023-05-05', 29.00),   -- Emma     churned month 4
(6,  6,  '2023-01-24', NULL,         199.00),  -- Frank    active
(7,  7,  '2023-01-27', '2023-07-12', 49.00),   -- Grace    churned month 6
(8,  8,  '2023-01-30', NULL,         29.00),   -- Henry    active

-- February 2023 cohort
(9,  9,  '2023-02-03', '2023-05-18', 49.00),   -- Iris     churned month 3
(10, 10, '2023-02-07', NULL,         99.00),   -- Jack     active
(11, 11, '2023-02-11', '2023-04-22', 29.00),   -- Karen    churned month 2
(12, 12, '2023-02-15', NULL,         49.00),   -- Leo      active
(13, 13, '2023-02-19', '2023-06-08', 29.00),   -- Mia      churned month 4
(14, 14, '2023-02-23', '2023-09-14', 199.00),  -- Noah     churned month 7
(15, 15, '2023-02-27', NULL,         49.00),   -- Olivia   active

-- March 2023 cohort
(16, 16, '2023-03-02', '2023-05-30', 29.00),   -- Peter    churned month 2
(17, 17, '2023-03-06', NULL,         49.00),   -- Quinn    active
(18, 18, '2023-03-10', '2023-07-25', 99.00),   -- Rachel   churned month 4
(19, 19, '2023-03-14', '2023-09-03', 49.00),   -- Sam      churned month 6
(20, 20, '2023-03-18', NULL,         29.00),   -- Tara     active
(21, 21, '2023-03-22', NULL,         199.00),  -- Umar     active
(22, 22, '2023-03-26', '2023-08-17', 49.00),   -- Victoria churned month 5
(23, 23, '2023-03-29', '2023-06-14', 29.00),   -- William  churned month 3

-- April 2023 cohort
(24, 24, '2023-04-04', NULL,         49.00),   -- Xena     active
(25, 25, '2023-04-08', '2023-07-08', 29.00),   -- Yusuf    churned month 3
(26, 26, '2023-04-12', NULL,         99.00),   -- Zoe      active
(27, 27, '2023-04-16', '2023-08-22', 49.00),   -- Aaron    churned month 4
(28, 28, '2023-04-20', '2023-06-30', 29.00),   -- Beth     churned month 2
(29, 29, '2023-04-24', NULL,         199.00),  -- Carlos   active
(30, 30, '2023-04-28', '2023-10-15', 49.00),   -- Diana    churned month 6

-- May 2023 cohort
(31, 31, '2023-05-03', '2023-08-05', 49.00),   -- Ethan    churned month 3
(32, 32, '2023-05-08', NULL,         29.00),   -- Fiona    active
(33, 33, '2023-05-12', '2023-09-18', 99.00),   -- George   churned month 4
(34, 34, '2023-05-17', NULL,         49.00),   -- Hannah   active
(35, 35, '2023-05-21', '2023-07-20', 29.00),   -- Ian      churned month 2
(36, 36, '2023-05-25', NULL,         199.00),  -- Julia    active
(37, 37, '2023-05-29', '2023-11-02', 49.00),   -- Kevin    churned month 5

-- June 2023 cohort
(38, 38, '2023-06-02', '2023-09-08', 29.00),   -- Laura    churned month 3
(39, 39, '2023-06-07', NULL,         49.00),   -- Marcus   active
(40, 40, '2023-06-12', NULL,         99.00),   -- Nina     active
(41, 41, '2023-06-17', '2023-08-14', 29.00),   -- Oscar    churned month 2
(42, 42, '2023-06-22', NULL,         49.00),   -- Priya    active
(43, 43, '2023-06-27', '2023-10-22', 29.00),   -- Quinn    churned month 4

-- July 2023 cohort
(44, 44, '2023-07-04', NULL,         49.00),   -- Ryan     active
(45, 45, '2023-07-09', '2023-10-05', 29.00),   -- Sara     churned month 3
(46, 46, '2023-07-14', NULL,         99.00),   -- Tom      active
(47, 47, '2023-07-19', '2023-11-18', 49.00),   -- Uma      churned month 4
(48, 48, '2023-07-24', NULL,         29.00),   -- Victor   active
(49, 49, '2023-07-29', NULL,         199.00),  -- Wendy    active

-- August 2023 cohort
(50, 50, '2023-08-03', '2023-11-12', 49.00),   -- Xavier   churned month 3
(51, 51, '2023-08-09', NULL,         29.00),   -- Yasmin   active
(52, 52, '2023-08-15', NULL,         99.00),   -- Zach     active
(53, 53, '2023-08-21', '2023-12-20', 49.00),   -- Amy      churned month 4
(54, 54, '2023-08-27', NULL,         29.00),   -- Brian    active

-- September 2023 cohort
(55, 55, '2023-09-04', NULL,         49.00),   -- Chloe    active
(56, 56, '2023-09-09', '2024-01-15', 99.00),   -- Derek    churned month 4
(57, 57, '2023-09-14', NULL,         29.00),   -- Elena    active
(58, 58, '2023-09-19', NULL,         49.00),   -- Felix    active
(59, 59, '2023-09-24', NULL,         199.00),  -- Grace    active
(60, 60, '2023-09-28', '2024-02-08', 29.00),   -- Hank     churned month 4

-- October 2023 cohort
(61, 61, '2023-10-05', NULL,         49.00),   -- Isla     active
(62, 62, '2023-10-10', '2024-01-22', 29.00),   -- Jake     churned month 3
(63, 63, '2023-10-15', NULL,         99.00),   -- Kira     active
(64, 64, '2023-10-20', NULL,         49.00),   -- Liam     active
(65, 65, '2023-10-25', '2024-02-14', 29.00),   -- Maya     churned month 4

-- November 2023 cohort
(66, 66, '2023-11-04', NULL,         49.00),   -- Nathan   active
(67, 67, '2023-11-10', NULL,         29.00),   -- Olivia   active
(68, 68, '2023-11-16', NULL,         99.00),   -- Patrick  active
(69, 69, '2023-11-22', '2024-03-05', 49.00),   -- Quinn    churned month 4
(70, 70, '2023-11-28', NULL,         29.00),   -- Rose     active

-- December 2023 cohort
(71, 71, '2023-12-05', NULL,         49.00),   -- Sam      active
(72, 72, '2023-12-11', NULL,         29.00),   -- Tina     active
(73, 73, '2023-12-17', NULL,         99.00),   -- Ulrich   active
(74, 74, '2023-12-23', NULL,         199.00),  -- Vera     active

-- January 2024 cohort
(75, 75, '2024-01-06', NULL,         49.00),   -- William  active
(76, 76, '2024-01-13', '2024-04-10', 29.00),   -- Xena     churned month 3
(77, 77, '2024-01-19', NULL,         99.00),   -- Yara     active
(78, 78, '2024-01-25', NULL,         49.00),   -- Zack     active

-- February 2024 cohort
(79, 79, '2024-02-04', NULL,         29.00),   -- Amy      active
(80, 80, '2024-02-12', NULL,         49.00),   -- Brad     active
(81, 81, '2024-02-20', NULL,         99.00),   -- Cindy    active
(82, 82, '2024-02-27', NULL,         49.00);   -- Dan      active