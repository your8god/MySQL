/*  
****    5.1    ****
*/

DROP TABLE IF EXISTS Directors;
CREATE TABLE Directors
(
    id      INT PRIMARY KEY AUTO_INCREMENT,
    name    VARCHAR(40),
    surname VARCHAR(40),
    country VARCHAR(40),
    rating  INT
);

TRUNCATE Directors;
INSERT INTO Directors (name, surname, country, rating)
VALUES ('Christopher', 'Nolan', 'England', 90),
       ('Steven', 'Spielberg', 'USA', 79),
       ('Quentin', 'Tarantino', 'USA', 95),
       ('Martin', 'Scorsese', 'USA', 68),
       ('David', 'Fincher', 'USA', 100),
       ('Ridley', 'Scott', 'England', 54),
       ('Stanley', 'Kubrick', 'USA', 9),
       ('Clint', 'Eastwood', 'USA', 74),
       ('James', 'Cameron', 'Canada', 8),
       ('Tim', 'Burton', 'USA', 41);

--1
SELECT AVG(rating) AS avg_usa_rating
FROM Directors
WHERE country = 'USA';

--2
SELECT COUNT(rating) AS num_of_rated_directors
FROM Directors;

--3
SELECT COUNT(rating) AS num_of_rated_usa_directors
FROM Directors
WHERE country = 'USA' AND rating > 50;

--4
SELECT COUNT(DISTINCT country) AS num_of_countries FROM Directors;

--5
SELECT 
    MIN(rating) AS min_rating,
    MAX(rating) AS max_rating
FROM Directors
WHERE country = 'USA';

--6
SELECT 
    GROUP_CONCAT(DISTINCT country ORDER BY country SEPARATOR ', ') AS countries
FROM Directors;


/*  
****    5.2    ****
*/

DROP TABLE IF EXISTS Directors;
CREATE TABLE Directors
(
    id      INT PRIMARY KEY AUTO_INCREMENT,
    name    VARCHAR(40),
    surname VARCHAR(40),
    country VARCHAR(40),
    rating  INT
);

TRUNCATE Directors;
INSERT INTO Directors (name, surname, country, rating)
VALUES ('Christopher', 'Nolan', 'England', 90),
       ('Steven', 'Spielberg', 'USA', 79),
       ('Quentin', 'Tarantino', 'USA', 95),
       ('Martin', 'Scorsese', 'USA', 68),
       ('David', 'Fincher', 'USA', 100),
       ('Ridley', 'Scott', 'England', 54),
       ('Stanley', 'Kubrick', 'USA', 9),
       ('Clint', 'Eastwood', 'USA', 74),
       ('James', 'Cameron', 'Canada', 8),
       ('Tim', 'Burton', 'USA', 41);

--1
SELECT country, AVG(rating) AS avg_rating
FROM Directors
GROUP BY country
ORDER BY avg_rating;

--2
SELECT country, 
    MIN(rating) AS min_rating, 
    MAX(rating) AS max_rating
FROM Directors
GROUP BY country
ORDER BY country;

--3
SELECT country, rating, COUNT(*) AS num_of_directors
FROM Directors
GROUP BY country, rating
ORDER BY num_of_directors, country, rating;

--4
SELECT LEFT(name, 1) AS letter, COUNT(*) AS num_of_names
FROM Directors
GROUP BY letter
ORDER BY num_of_names, letter;

--5
DROP TABLE IF EXISTS Directors;
CREATE TABLE Directors
(
    id      INT PRIMARY KEY AUTO_INCREMENT,
    name    VARCHAR(40),
    surname VARCHAR(40),
    email   VARCHAR(40)
);

TRUNCATE Directors;
INSERT INTO Directors (name, surname, email)
VALUES ('Christopher', 'Nolan', 'chris@gmail.com'),
       ('Steven', 'Spielberg', 'sspil@outlook.com'),
       ('Quentin', 'Tarantino', 'queen@gmail.com'),
       ('Martin', 'Scorsese', 'martins@outlook.com'),
       ('David', 'Fincher', 'dfincher@outlook.com'),
       ('Ridley', 'Scott', 'riddler@gmail.com'),
       ('Stanley', 'Kubrick', 'bigstan@icloud.com'),
       ('Clint', 'Eastwood', 'cowboy@yahoo.com'),
       ('James', 'Cameron', 'jamesava@yahoo.com'),
       ('Tim', 'Burton', 'timmy@icloud.com');

SELECT 
    SUBSTRING_INDEX(email, '@', -1) AS domain,
    GROUP_CONCAT(SUBSTRING_INDEX(email, '@', 1) ORDER BY 1 SEPARATOR ', ') AS users
FROM Directors
GROUP BY domain;

--6
SELECT country, AVG(rating) AS avg_rating
FROM Directors
WHERE rating BETWEEN 11 AND 89
GROUP BY country
ORDER BY avg_rating;

--7
SELECT country, AVG(rating) AS avg_rating
FROM Directors
WHERE rating BETWEEN 31 AND 69
GROUP BY country
HAVING avg_rating < 60
ORDER BY avg_rating;

--8
DROP TABLE IF EXISTS Directors;
CREATE TABLE Directors
(
  id         INT PRIMARY KEY AUTO_INCREMENT,
  name       VARCHAR(20),
  surname    VARCHAR(20),
  birth_date DATE
);

TRUNCATE Directors;
INSERT INTO Directors (name, surname, birth_date)
VALUES ('Christopher', 'Nolan', '1970-07-30'),
       ('Steven', 'Spielberg', '1946-12-18'),
       ('Quentin', 'Tarantino', '1963-03-27'),
       ('Martin', 'Scorsese', '1942-11-17'),
       ('David', 'Fincher', '1962-08-28'),
       ('Ridley', 'Scott', '1937-11-30'),
       ('Stanley', 'Kubrick', '1928-07-26'),
       ('Clint', 'Eastwood', '1930-05-31'),
       ('James', 'Cameron', '1954-08-16'),
       ('Tim', 'Burton', '1958-08-25');

SELECT 
    QUARTER(birth_date) AS quarter,
    GROUP_CONCAT(CONCAT(name, ' ', surname) ORDER BY 1 SEPARATOR ', ') AS directors
FROM Directors
GROUP BY quarter
HAVING LOCATE(',', directors) != 0;


/*  
****    5.3    ****
*/

--1
DROP TABLE IF EXISTS Bills;
CREATE TABLE Bills
(
    id          INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    amount      DECIMAL(10, 2)
);

TRUNCATE Bills;
INSERT INTO Bills (customer_id, amount)
VALUES (4, 123.45),
       (10, 678.90),
       (2, 456.78),
       (10, 789.12),
       (4, 234.56),
       (4, 987.65),
       (9, 345.67),
       (10, 567.89),
       (11, 123.45),
       (2, 456.78),
       (13, 789.12),
       (10, 234.56),
       (15, 987.65),
       (16, 345.67),
       (16, 500),
       (2, 567.89),
       (18, 123.45),
       (2, 456.78),
       (20, 789.12),
       (2, 234.56),
       (22, 987.65);

SELECT COUNT(DISTINCT customer_id) AS customers_count
FROM Bills
WHERE amount > 500;

--2
DROP TABLE IF EXISTS Rides;
CREATE TABLE Rides
(
    id          INT PRIMARY KEY AUTO_INCREMENT,
    bike_number VARCHAR(10),
    start_time  DATETIME,
    end_time    DATETIME
);

TRUNCATE Rides;
INSERT INTO Rides (bike_number, start_time, end_time)
VALUES ('W00678', '2023-03-25 09:15:00', '2023-03-25 10:30:00'),
       ('W00399', '2023-03-26 14:20:00', '2023-03-26 15:40:00'),
       ('W00433', '2023-03-27 16:45:00', '2023-03-27 17:15:00'),
       ('W00455', '2023-03-28 11:30:00', '2023-03-28 12:40:00'),
       ('W00576', '2023-03-28 13:10:00', '2023-03-28 13:40:00'),
       ('W00300', '2023-03-29 08:45:00', '2023-03-29 09:05:00'),
       ('W00455', '2023-03-29 11:20:00', '2023-03-29 12:30:00'),
       ('W00576', '2023-03-30 14:00:00', '2023-03-30 14:45:00'),
       ('W00300', '2023-03-31 17:10:00', '2023-03-31 17:30:00'),
       ('W00678', '2023-04-01 09:30:00', '2023-04-01 10:20:00'),
       ('W00399', '2023-04-01 11:40:00', '2023-04-01 12:20:00'),
       ('W00455', '2023-04-02 13:15:00', '2023-04-02 13:45:00'),
       ('W00576', '2023-04-03 15:25:00', '2023-04-03 15:50:00'),
       ('W00300', '2023-04-03 16:10:00', '2023-04-03 16:35:00'),
       ('W00455', '2023-04-04 10:55:00', '2023-04-04 11:15:00'),
       ('W00399', '2023-04-04 14:30:00', '2023-04-04 14:50:00'),
       ('W00576', '2023-04-05 08:20:00', '2023-04-05 08:45:00'),
       ('W00300', '2023-04-06 12:00:00', '2023-04-06 12:30:00'),
       ('W00433', '2023-04-06 15:10:00', '2023-04-06 15:35:00'),
       ('W00678', '2023-04-07 17:45:00', '2023-04-07 18:05:00');

SELECT bike_number, MAX(end_time) AS last_ride_end
FROM Rides
GROUP BY bike_number
ORDER BY last_ride_end DESC;

--3
DROP TABLE IF EXISTS Actions;
CREATE TABLE Actions
(
    user_id     INT,
    post_id     INT,
    action_date DATE,
    action      VARCHAR(10),
    extra       VARCHAR(50)
);

TRUNCATE Actions;
INSERT INTO Actions (user_id, post_id, action_date, action, extra)
VALUES (1, 1, '2023-07-01', 'view', 'NULL'),
       (1, 1, '2023-07-01', 'like', 'love'),
       (1, 1, '2023-07-01', 'share', 'NULL'),
       (2, 4, '2023-07-04', 'view', 'NULL'),
       (2, 4, '2023-07-04', 'report', 'spam'),
       (3, 4, '2023-07-04', 'like', 'cry'),
       (3, 4, '2023-07-04', 'report', 'spam'),
       (4, 3, '2023-07-02', 'view', 'NULL'),
       (4, 3, '2023-07-02', 'report', 'spam'),
       (5, 2, '2023-07-04', 'view', 'NULL'),
       (5, 2, '2023-07-04', 'report', 'racism'),
       (5, 5, '2023-07-04', 'view', 'NULL'),
       (5, 5, '2023-07-04', 'report', 'racism'),
       (6, 1, '2023-07-05', 'view', 'NULL'),
       (6, 1, '2023-07-05', 'report', 'spam'),
       (7, 3, '2023-07-05', 'like', 'laugh'),
       (7, 3, '2023-07-05', 'report', 'spam'),
       (8, 4, '2023-07-05', 'view', 'NULL'),
       (8, 4, '2023-07-05', 'report', 'spam'),
       (9, 5, '2023-07-05', 'view', 'NULL'),
       (9, 5, '2023-07-05', 'report', 'racism');

SELECT extra AS report_reason, COUNT(*) AS report_count
FROM Actions
WHERE action = 'REPORT' AND 
    action_date = '2023-07-05' AND
    extra IN ('RACISM', 'SPAM')
GROUP BY extra;

--4
DROP TABLE IF EXISTS Salary;
CREATE TABLE Salary
(
    id            INT,
    name          VARCHAR(50),
    surname       VARCHAR(50),
    salary        INT,
    department_id VARCHAR(10)
);

TRUNCATE Salary;
INSERT INTO Salary (id, name, surname, salary, department_id)
VALUES (1, 'Adam', 'Bosworth', 120000, 'D1001'),
       (2, 'Ben', 'Laurie', 135000, 'D1003'),
       (1, 'Adam', 'Bosworth', 98000, 'D1002'),
       (3, 'Craig', 'Martek', 110000, 'D1001'),
       (3, 'Craig', 'Martek', 125000, 'D1004'),
       (4, 'Alon', 'Halevy', 105000, 'D1005'),
       (1, 'Adam', 'Bosworth', 140000, 'D1004'),
       (4, 'Alon', 'Halevy', 95000, 'D1004'),
       (4, 'Alon', 'Halevy', 115000, 'D1004'),
       (3, 'Craig', 'Martek', 130000, 'D1004'),
       (4, 'Alon', 'Halevy', 90000, 'D1002'),
       (3, 'Craig', 'Martek', 100000, 'D1002'),
       (2, 'Ben', 'Laurie', 145000, 'D1002'),
       (3, 'Craig', 'Martek', 105000, 'D1003'),
       (5, 'Joshua', 'Bloch', 120000, 'D1003'),
       (6, 'Chris', 'DiBona', 110000, 'D1001'),
       (3, 'Craig', 'Martek', 135000, 'D1005'),
       (7, 'Brent', 'Callinicos', 95000, 'D1005'),
       (4, 'Alon', 'Halevy', 125000, 'D1005'),
       (2, 'Ben', 'Laurie', 130000, 'D1001');

SELECT id, name, surname, MAX(salary) AS salary
FROM Salary
GROUP BY id, name, surname;

--5
DROP TABLE IF EXISTS Actions;
CREATE TABLE Actions
(
    task_id     INT PRIMARY KEY AUTO_INCREMENT,
    user_id     INT,
    submit_date DATE
);

TRUNCATE Actions;
INSERT INTO Actions (user_id, submit_date)
VALUES (7, '2023-01-10'),
       (2, '2023-01-11'),
       (3, '2023-01-15'),
       (4, '2023-01-17'),
       (5, '2023-01-20'),
       (4, '2023-01-22'),
       (7, '2023-01-23'),
       (6, '2023-01-25'),
       (9, '2023-01-28'),
       (2, '2023-01-30'),
       (4, '2023-02-02'),
       (4, '2023-02-05'),
       (1, '2023-02-08'),
       (5, '2023-02-10'),
       (3, '2023-02-13'),
       (4, '2023-02-15'),
       (5, '2023-02-18'),
       (1, '2023-02-20'),
       (3, '2023-02-23'),
       (4, '2023-02-25');

SELECT SUM(IF (WEEKDAY(submit_date) IN (5, 6), 1, 0)) AS weekend_count,
    SUM(IF (WEEKDAY(submit_date) NOT IN (5, 6), 1, 0)) AS working_count
FROM Actions;

--6
DROP TABLE IF EXISTS Actions;
CREATE TABLE Actions
(
    ad_id   INT,
    user_id INT,
    action  VARCHAR(10)
);

TRUNCATE Actions;
INSERT INTO Actions (ad_id, user_id, action)
VALUES (1, 1, 'clicked'),
       (2, 2, 'clicked'),
       (3, 3, 'viewed'),
       (5, 5, 'ignored'),
       (1, 7, 'ignored'),
       (2, 7, 'viewed'),
       (3, 5, 'clicked'),
       (1, 4, 'viewed'),
       (2, 11, 'viewed'),
       (1, 2, 'clicked'),
       (4, 6, 'viewed'),
       (5, 8, 'ignored'),
       (4, 9, 'viewed'),
       (3, 10, 'viewed'),
       (2, 12, 'clicked'),
       (1, 13, 'clicked'),
       (5, 14, 'ignored'),
       (4, 15, 'clicked'),
       (3, 16, 'viewed'),
       (2, 17, 'clicked');

SELECT ad_id, 
    ROUND(IFNULL(
        (
            SUM(IF(action = 'clicked', 1, 0)) / 
            (SUM(IF(action = 'clicked', 1, 0)) + SUM(IF(action = 'viewed', 1, 0)))
        ) * 100, 0), 2
        ) AS rating
FROM Actions
GROUP BY ad_id
ORDER BY rating DESC;

--7
DROP TABLE IF EXISTS Orders;
CREATE TABLE Orders
(
    id          INT PRIMARY KEY AUTO_INCREMENT,
    order_date  DATE,
    customer_id INT,
    invoice     DECIMAL(10, 2)
);

TRUNCATE Orders;
INSERT INTO Orders (order_date, customer_id, invoice)
VALUES ('2023-02-05', 5, 25.50),
       ('2023-02-05', 5, 23.75),
       ('2023-02-12', 6, 3.20),
       ('2023-02-15', 8, 20.00),
       ('2023-02-20', 9, 19.99),
       ('2023-02-20', 10, 19.99),
       ('2023-02-21', 9, 0.02),
       ('2023-03-01', 11, 15.60),
       ('2023-03-01', 12, 18.75),
       ('2023-03-01', 11, 12.90),
       ('2023-03-06', 13, 30.60),
       ('2023-03-08', 14, 42.75),
       ('2023-03-08', 17, 27.40),
       ('2023-03-15', 18, 8.99),
       ('2023-03-22', 19, 60.00),
       ('2023-04-05', 20, 17.50),
       ('2023-04-11', 22, 23.80),
       ('2023-04-15', 22, 55.30),
       ('2023-04-17', 21, 13.75),
       ('2023-04-22', 22, 45.90);

SELECT 
    DATE_FORMAT(order_date, '%M') AS month,
    COUNT(*) AS order_count,
    COUNT(DISTINCT customer_id) AS customer_count
FROM Orders
WHERE invoice > 20
GROUP BY month;

--8
DROP TABLE IF EXISTS Views;
CREATE TABLE Views
(
    article_id INT,
    author_id  INT,
    viewer_id  INT,
    view_date  DATE
);

TRUNCATE Views;
INSERT INTO Views (article_id, author_id, viewer_id, view_date)
VALUES (7, 5, 17, '2023-08-04'),
       (2, 6, 6, '2023-08-01'),
       (2, 10, 5, '2023-08-01'),
       (10, 2, 22, '2023-08-05'),
       (1, 2, 3, '2023-08-01'),
       (6, 7, 17, '2023-08-04'),
       (3, 6, 9, '2023-08-02'),
       (1, 2, 5, '2023-08-01'),
       (3, 10, 13, '2023-08-03'),
       (1, 2, 2, '2023-08-01'),
       (6, 7, 13, '2023-08-02'),
       (3, 10, 5, '2023-08-02'),
       (6, 7, 5, '2023-08-03'),
       (2, 6, 8, '2023-08-02'),
       (3, 10, 12, '2023-08-02'),
       (9, 10, 20, '2023-08-05'),
       (3, 6, 5, '2023-08-02'),
       (8, 8, 18, '2023-08-04'),
       (4, 13, 5, '2023-08-03'),
       (8, 8, 18, '2023-08-04');

SELECT DISTINCT viewer_id FROM Views
GROUP BY viewer_id, view_date
HAVING COUNT(DISTINCT article_id) > 1

--9
DROP TABLE IF EXISTS Sales;
CREATE TABLE Sales
(
    id           INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(255),
    sale_date    DATE
);

TRUNCATE Sales;
INSERT INTO Sales (product_name, sale_date) VALUES
    ('   Apple iPhone 13 Pro  ', '2023-01-16'),
    ('  Sony WH-1000XM4 Headphones  ', '2023-01-16'),
    ('  Apple iPhone 13 Pro', '2023-01-17'),
    ('  PlayStation 5   ', '2023-01-19'),
    ('  PlayStation 5', '2023-01-22'),
    ('  Sony WH-1000XM4 Headphones', '2023-02-11'),
    ('Apple iPhOne 13 Pro  ', '2023-10-10'),
    ('Sony wH-1000XM4 HeadPhones   ', '2023-01-17'),
    ('PlAyStaTion 5   ', '2023-04-20'),
    ('ApPle iPhOne 13 PRo', '2023-01-16'),
    ('   playstation 5', '2023-04-20'),
    ('apple Iphone 13 pRo            ', '2023-04-10'),
    ('    Sony WH-1000XM4 Headphones', '2023-03-31'),
    ('ApPle iPhoNe 13 Pro           ', '2023-04-10'),
    ('      SONY WH-1000xm4 HeadPhones', '2023-03-31'),
    ('APPLE IPHONE 13 PRO', '2023-04-10'),
    ('PLAYSTATION 5', '2023-03-10'),
    ('SONY WH-1000XM4 HEADPHONES', '2023-03-31'),
    (' apple iphone 13 pro ', '2023-04-20'),
    ('playstation 5', '2023-04-10');

SELECT 
    TRIM(LOWER(product_name)) AS product_name,
    DATE_FORMAT(sale_date, '%Y-%m') AS sale_date,
    COUNT(*) AS total
FROM Sales
GROUP BY product_name, DATE_FORMAT(sale_date, '%Y-%m')
ORDER BY product_name, sale_date;

--10
DROP TABLE IF EXISTS Activity;
CREATE TABLE Activity
(
    user_id     INT,
    action      VARCHAR(10),
    question_id INT,
    answer_id   INT
);

TRUNCATE Activity;
INSERT INTO Activity (user_id, action, question_id, answer_id)
VALUES (1, 'show', 102, null),
       (1, 'skip', 102, null),
       (2, 'show', 101, null),
       (2, 'answer', 101, 56775),
       (2, 'show', 102, null),
       (2, 'answer', 102, 56781),
       (2, 'show', 103, null),
       (2, 'skip', 103, null),
       (3, 'show', 103, null),
       (3, 'answer', 103, 56777),
       (3, 'show', 104, null),
       (2, 'show', 104, null),
       (2, 'skip', 104, null),
       (1, 'show', 101, null),
       (1, 'answer', 101, 56774),
       (4, 'show', 103, null),
       (4, 'answer', 104, 56776),
       (4, 'show', 102, null),
       (4, 'answer', 103, 56780),
       (4, 'show', 105, null),
       (5, 'show', 105, null),
       (5, 'skip', 105, null),
       (5, 'show', 105, null),
       (5, 'answer', 105, 56782),
       (5, 'show', 101, null),
       (5, 'answer', 105, 56783),
       (6, 'show', 102, null),
       (6, 'answer', 102, 56779);

SELECT question_id FROM Activity
GROUP BY question_id
ORDER BY (SUM(action = 'answer') / SUM(action = 'show')) DESC, question_id
LIMIT 1;