/*  
****    4.1    ****
*/

DROP TABLE IF EXISTS Directors;
CREATE TABLE Directors
(
    id      INT PRIMARY KEY AUTO_INCREMENT,
    name    VARCHAR(40),
    surname VARCHAR(40),
    country VARCHAR(40)
);

INSERT INTO Directors (name, surname, country)
VALUES ('Christopher', 'Nolan', 'England'),
       ('Steven', 'Spielberg', 'USA'),
       ('Quentin', 'Tarantino', 'USA'),
       ('Martin', 'Scorsese', 'USA'),
       ('David', 'Fincher', 'USA'),
       ('Ridley', 'Scott', 'England'),
       ('Stanley', 'Kubrick', 'USA'),
       ('Clint', 'Eastwood', 'USA'),
       ('James', 'Cameron', 'Canada'),
       ('Tim', 'Burton', 'USA');

--1
SELECT name, CHAR_LENGTH(name) AS name_length
FROM Directors
ORDER BY name_length, name;

--2
SELECT name, surname
FROM Directors
WHERE CHAR_LENGTH(name) <= 6
ORDER BY name;

--3
SELECT name, surname
FROM Directors
WHERE BINARY name = LOWER(name) OR BINARY surname = LOWER(surname)
ORDER BY name;

--4
SELECT name, surname, UPPER(country) AS country
FROM Directors
ORDER BY 3, 1;

--5
SELECT REPEAT('*', CHAR_LENGTH(name)) AS name, surname 
FROM Directors
ORDER BY CHAR_LENGTH(name) DESC, surname;

--6
DROP TABLE IF EXISTS Directors;
CREATE TABLE Directors
(
    id      INT PRIMARY KEY AUTO_INCREMENT,
    name    VARCHAR(40),
    surname VARCHAR(40),
    rating  INT
);

INSERT INTO Directors (name, surname, rating)
VALUES ('Christopher', 'Nolan', 90),
       ('Steven', 'Spielberg', 79),
       ('Quentin', 'Tarantino', 95),
       ('Martin', 'Scorsese', 68),
       ('David', 'Fincher', 100),
       ('Ridley', 'Scott', 54),
       ('Stanley', 'Kubrick', 9),
       ('Clint', 'Eastwood', 74),
       ('James', 'Cameron', 8),
       ('Tim', 'Burton', 41);

SELECT name, surname, CONCAT(LPAD(rating, 3, '0'), '%') AS rating
FROM Directors
ORDER BY rating;

--7
DROP TABLE IF EXISTS Palindromes;
CREATE TABLE Palindromes
(
    id      INT PRIMARY KEY AUTO_INCREMENT,
    english VARCHAR(40),
    russian VARCHAR(40)
);

INSERT INTO Palindromes(english, russian)
VALUES ('hut', 'шалаш'),
       ('rotor', 'ротор'),
       ('tenet', 'принцип'),
       ('radar', 'радар'),
       ('flood', 'потоп'),
       ('level', 'уровень'),
       ('madam', 'мадам'),
       ('deed', 'поступок'),
       ('it', 'оно'),
       ('kayak', 'каяк');

SELECT english, russian
FROM Palindromes
WHERE english = REVERSE(english) AND russian = REVERSE(russian)
ORDER BY english;

--8
SELECT REPEAT(english, CHAR_LENGTH(english)) AS english
FROM Palindromes
WHERE english = REVERSE(english) AND russian != REVERSE(russian);


/*  
****    4.2    ****
*/

DROP TABLE IF EXISTS Clients;
CREATE TABLE Clients
(
    id          INT PRIMARY KEY AUTO_INCREMENT,
    name        VARCHAR(40),
    surname     VARCHAR(40),
    card_number VARCHAR(40)
);

INSERT INTO Clients (name, surname, card_number)
VALUES ('Christopher', 'Nolan', '3409-4719-9958-3769'),
       ('Steven', 'Spielberg', '3757-1304-6041-2423'),
       ('Quentin', 'Tarantino', '3456-7725-6011-8486'),
       ('Martin', 'Scorsese', '3717-9339-7641-9962'),
       ('David', 'Fincher', '3789-9065-8560-1250'),
       ('Ridley', 'Scott', '3711-7949-7232-0127'),
       ('Stanley', 'Kubrick', '3736-9259-2982-7717'),
       ('Clint', 'Eastwood', '3484-1457-1207-8953'),
       ('James', 'Cameron', '3430-5919-7308-6348'),
       ('Tim', 'Burton', '3781-9214-6430-8051');

--1
SELECT name, surname, REPLACE(card_number, '-', '') AS card_number
FROM Clients
WHERE LEFT(surname, 1) = 'S'
ORDER BY surname;

--2
SELECT 
    id,
    name, 
    surname, 
    CONCAT(REPEAT('*', 12), RIGHT(card_number, 4)) AS card_number
FROM Clients
LIMIT 5;

--3
DROP TABLE IF EXISTS Directors;
CREATE TABLE Directors
(
    id      INT PRIMARY KEY AUTO_INCREMENT,
    name    VARCHAR(40),
    surname VARCHAR(40),
    email   VARCHAR(40)
);

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

SELECT CONCAT(LEFT(name, 1), '. ', surname) AS director
FROM Directors
ORDER BY director;

--4
SELECT 
    CONCAT(LEFT(name, 1), REPEAT('*', CHAR_LENGTH(name) - 1)) AS name,
    CONCAT(LEFT(surname, 1), REPEAT('*', CHAR_LENGTH(surname) - 1)) AS surname
FROM Directors
ORDER BY LEFT(name, 1), LEFT(surname, 1);

--5
SELECT 
    id,
    name,
    surname,
    LEFT(email, LOCATE('@', email) - 1) AS local_part
FROM Directors
ORDER BY id DESC;


/*  
****    4.3    ****
*/

DROP TABLE IF EXISTS Directors;
CREATE TABLE Directors
(
    id      INT PRIMARY KEY AUTO_INCREMENT,
    name    VARCHAR(40),
    surname VARCHAR(40),
    email   VARCHAR(40)
);

INSERT INTO Directors (name, surname, email)
VALUES ('christopher', 'Nolan', 'chris@gmail.com'),
       ('Steven', 'spielberg', 'sspil@outlook.com'),
       ('Quentin', 'Tarantino', 'queen@gmail.com'),
       ('martin', 'scorsese', 'martins@outlook.com'),
       ('david', 'Fincher', 'dfincher@outlook.com'),
       ('Ridley', 'Scott', 'riddler@gmail.com'),
       ('Stanley', 'Kubrick', 'bigstan@icloud.com'),
       ('clint', 'eastwood', 'cowboy@yahoo.com'),
       ('James', 'Cameron', 'jamesava@yahoo.com'),
       ('Tim', 'burton', 'timmy@icloud.com');

--1
SELECT 
    CONCAT(UPPER(LEFT(name, 1)), SUBSTRING(name, 2)) AS name,
    CONCAT(UPPER(LEFT(surname, 1)), SUBSTRING(surname, 2)) AS surname
FROM Directors
WHERE BINARY LOWER(name) = name OR BINARY LOWER(surname) = surname
ORDER BY name;

--2
SELECT 
    name, 
    surname,
    LEFT(email, LOCATE('@', email) - 1) AS local_part,
    SUBSTRING(email, LOCATE('@', email) + 1) AS domain
FROM Directors
ORDER BY name;

--3
SELECT 
    name,
    surname,
    CONCAT(SUBSTRING_INDEX(email, '@', 1), '@pygen.ru') as email
FROM Directors
WHERE SUBSTRING_INDEX(email, '@', -1) = 'outlook.com'
ORDER BY email;

--4
SELECT 
    name,
    surname,
    CONCAT(REPEAT('*', CHAR_LENGTH(SUBSTRING_INDEX(email, '@', 1))), 
    '@',
    SUBSTRING_INDEX(email, '@', -1)) AS email
FROM Directors
ORDER BY SUBSTRING_INDEX(email, '@', 1);


/*  
****    4.4    ****
*/

DROP TABLE IF EXISTS Films;
CREATE TABLE Films
(
    id       INT PRIMARY KEY AUTO_INCREMENT,
    title    VARCHAR(20),
    director VARCHAR(20)
);

INSERT INTO Films (title, director)
VALUES ('Toy Story 2', 'John Lasseter'),
       ('WALL-E', 'Andrew Stanton'),
       ('Ratatouille', 'Brad Bird'),
       ('Up', 'Pete Docter'),
       ('Brave', 'Brenda Chapman'),
       ('Monsters University', 'Dan Scanlon'),
       ('Cars 2', 'John Lasseter'),
       ('Finding Nemo', 'Andrew Stanton'),
       ('Toy Story', 'John Lasseter'),
       ('The Incredibles', 'Brad Bird');

--1
SELECT title
FROM Films
ORDER BY RAND()
LIMIT 5;

--2
DROP TABLE IF EXISTS Sizes;
CREATE TABLE Sizes
(
    id              INT PRIMARY KEY AUTO_INCREMENT,
    nominal_size    INT,
    limit_deviation DECIMAL(3, 2),
    actual_size     DECIMAL(4, 2)
);

INSERT INTO Sizes (nominal_size, limit_deviation, actual_size)
VALUES (18, 0.3, 17.7),
       (26, 0.2, 25.6),
       (14, 0.4, 14.1),
       (42, 0.9, 41),
       (36, 0.3, 36),
       (24, 0.1, 24.2),
       (8, 0.2, 7.9),
       (4.3, 0.2, 4.1),
       (1, 0.5, 1.5),
       (49, 1, 47);

SELECT 
    actual_size, 
    limit_deviation, 
    ABS(actual_size - nominal_size) AS difference
FROM Sizes
WHERE ABS(actual_size - nominal_size) <= limit_deviation
ORDER BY actual_size;

--3
DROP TABLE IF EXISTS Points;
CREATE TABLE Points
(
    x INT,
    y INT
);

INSERT INTO Points (x, y)
VALUES (5, 7),
       (21, 25),
       (10, 19),
       (19, 29),
       (0, 0),
       (4, 19),
       (23, 1),
       (22, 20),
       (3, 15),
       (6, 18);

SELECT x, y, ROUND(SQRT(x*x + y*y), 2) AS distance
FROM Points
WHERE ROUND(SQRT(x*x + y*y), 2) > 20
ORDER BY distance DESC;

--4
DROP TABLE IF EXISTS Films;
CREATE TABLE Films
(
    id           INT PRIMARY KEY AUTO_INCREMENT,
    title        VARCHAR(20),
    director     VARCHAR(20),
    running_time INT
);

INSERT INTO Films (title, director, running_time)
VALUES ('Toy Story 2', 'John Lasseter', 69),
       ('WALL-E', 'Andrew Stanton', 104),
       ('Ratatouille', 'Brad Bird', 125),
       ('Up', 'Pete Docter', 101),
       ('Brave', 'Brenda Chapman', 102),
       ('Monsters University', 'Dan Scanlon', 110),
       ('Cars 2', 'John Lasseter', 120),
       ('Finding Nemo', 'Andrew Stanton', 107),
       ('Toy Story', 'John Lasseter', 61),
       ('The Incredibles', 'Brad Bird', 126);

SELECT 
    title, 
    director,
    CONCAT(LPAD(running_time DIV 60, 2, 0), ':', LPAD(running_time MOD 60, 2, 0)) AS timing
FROM Films
ORDER BY running_time DESC; 

--5
DROP TABLE IF EXISTS Ranges;
CREATE TABLE Ranges
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    a  INT,
    b  INT
);

INSERT INTO Ranges (a, b)
VALUES (0, 180),
       (-1, 1),
       (-10, 10),
       (-90, 90),
       (10, 100);

SELECT 
    CONCAT('[', a, ';', b, ']') AS 'range',
    ROUND(a + RAND()*(b - a)) AS random_value
FROM Ranges
ORDER BY id;


/*  
****    4.5    ****
*/

DROP TABLE IF EXISTS PrimeNumbers;
CREATE TABLE PrimeNumbers
(
    num INT
);

INSERT INTO PrimeNumbers (num)
VALUES (2),
       (3),
       (5),
       (7),
       (11),
       (13),
       (17),
       (19),
       (23),
       (29);

--1
SELECT 
    num,
    CONV(num, 10, 2) AS bin,
    CONV(num, 10, 8) AS oct,
    CONV(num, 10, 16) AS hex
FROM PrimeNumbers
ORDER BY num DESC;

--2
DROP TABLE IF EXISTS Angles;
CREATE TABLE Angles
(
    angle INT PRIMARY KEY
);

INSERT INTO Angles (angle)
VALUES (0),
       (30),
       (45),
       (60),
       (90),
       (120),
       (135),
       (150),
       (180),
       (210),
       (225),
       (240),
       (270),
       (300),
       (315),
       (330),
       (360);

SELECT 
    CONCAT(angle, '°') AS x,
    ROUND(SIN(RADIANS(angle)), 1) AS 'sin(x)',
    ROUND(COS(RADIANS(angle)), 1) AS 'cos(x)'
FROM Angles
ORDER BY angle;

--3
DROP TABLE IF EXISTS Movies;
CREATE TABLE Movies
(
    id          INT PRIMARY KEY AUTO_INCREMENT,
    title       VARCHAR(40),
    flickmetrix INT,
    metacritic  INT,
    imdb        INT,
    letterboxd  INT,
    kinopoisk   INT
);

INSERT INTO Movies (title, flickmetrix, metacritic, imdb, letterboxd, kinopoisk)
VALUES ('The Godfather', 95, 100, 92, 92, 87),
       ('Parasite', 92, 96, 85, 92, 80),
       ('Pulp Fiction', 90, 94, 89, 86, 87),
       ('Spirited Away', 90, 96, 86, 90, 85),
       ('Alien', 88, 89, 85, 86, 79),
       ('The Dark Knight', 88, 84, 90, 89, 85),
       ('Spider-Man: Across the Spider-Verse', 87, 86, 87, 90, 85),
       ('No Country for Old Men', 87, 92, 82, 86, 72);

SELECT 
    title,
    ROUND(
        (flickmetrix + metacritic + imdb + letterboxd + kinopoisk
        - LEAST(flickmetrix, metacritic, imdb, letterboxd, kinopoisk)
        - GREATEST(flickmetrix, metacritic, imdb, letterboxd, kinopoisk)) / 3
        , 2) 
        AS average_rating
FROM Movies
ORDER BY average_rating DESC, title;


/*  
****    4.6    ****
*/

--1
DROP TABLE IF EXISTS Staff;
CREATE TABLE Staff
(
    id         INT AUTO_INCREMENT PRIMARY KEY,
    name       VARCHAR(20),
    surname    VARCHAR(20),
    hire_year  YEAR,
    hire_day   INT,
    salary     INT
);

INSERT INTO Staff (name, surname, hire_year, hire_day, salary)
VALUES ('Larry', 'Page', 1998, 190, 100000),
       ('Sergey', 'Brin', 2019, 319, 110000),
       ('Sundar', 'Pichai', 2009, 313, 130000),
       ('Ruth', 'Porat', 2005, 330, 90000),
       ('Sundar', 'Nadella', 1995, 8, 125000),
       ('Jeff', 'Bezos', 2003, 131, 85000),
       ('Marissa', 'Mayer', 2007, 267, 95000),
       ('Susan', 'Wojcicki', 1988, 124, 120000),
       ('Eric', 'Schmidt', 1991, 321, 115000),
       ('Sheryl', 'Sandberg', 2012, 201, 90000);

SELECT 
    CONCAT_WS(' ', name, surname) AS staffer,
    MAKEDATE(hire_year, hire_day) AS hire_date
FROM Staff
ORDER BY hire_date DESC;

--2
DROP TABLE IF EXISTS Staff;
CREATE TABLE Staff
(
    id        INT AUTO_INCREMENT PRIMARY KEY,
    name      VARCHAR(20),
    surname   VARCHAR(20),
    hire_date DATE,
    salary    INT
);

INSERT INTO Staff (name, surname, hire_date, salary)
VALUES ('Larry', 'Page', '1998-07-09', 100000),
       ('Sergey', 'Brin', '2019-11-15', 110000),
       ('Sundar', 'Pichai', '2009-11-09', 130000),
       ('Ruth', 'Porat', '2005-11-26', 90000),
       ('Sundar', 'Nadella', '1995-01-08', 125000),
       ('Jeff', 'Bezos', '2003-05-11', 85000),
       ('Marissa', 'Mayer', '2007-09-24', 95000),
       ('Susan', 'Wojcicki', '1988-05-03', 120000),
       ('Eric', 'Schmidt', '1991-11-17', 115000),
       ('Sheryl', 'Sandberg', '2012-07-19', 90000);

SELECT 
    CONCAT_WS(' ', name, surname) AS staffer,
    hire_date + INTERVAL '1 6' YEAR_MONTH AS hire_date
FROM Staff
ORDER BY hire_date DESC;

--3
SELECT 
    CONCAT_WS(' ', name, surname) AS staffer,
    LAST_DAY(hire_date) AS first_salary
FROM Staff
ORDER BY salary DESC;

--4
SELECT 
    CONCAT_WS(' ', name, surname) AS staffer
FROM Staff
WHERE TO_DAYS(LAST_DAY(hire_date)) - TO_DAYS(hire_date) < 14
ORDER BY staffer;

--5
SELECT
    CONCAT_WS(' ', name, surname) AS staffer
FROM Staff
WHERE TO_DAYS('2023/07/15') - TO_DAYS(hire_date) > 9000
ORDER BY hire_date;  


/*  
****    4.7    ****
*/

DROP TABLE IF EXISTS Actors;
CREATE TABLE Actors
(
    id         INT AUTO_INCREMENT PRIMARY KEY,
    actor      VARCHAR(50),
    birth_date DATETIME
);

INSERT INTO Actors (actor, birth_date)
VALUES ('Johnny Depp', '1963-06-09 19:10:00'),
       ('Natalie Portman', '1981-06-09 06:15:00'),
       ('Scarlett Johansson', '1984-11-22 18:30:00'),
       ('Angelina Jolie', '1975-06-04 05:55:00'),
       ('Brad Pitt', '1963-12-18 10:10:00'),
       ('Meryl Streep', '1949-06-22 08:05:00'),
       ('Leonardo DiCaprio', '1974-11-11 02:47:00'),
       ('Tom Hanks', '1956-07-09 15:20:00'),
       ('Jennifer Aniston', '1969-02-11 14:25:00'),
       ('Denzel Washington', '1954-12-28 01:40:00');

--1
SELECT 
    id,
    SUBSTRING_INDEX(actor, ' ', 1) AS name,
    SUBSTRING_INDEX(actor, ' ', -1) AS surname,
    DATE(birth_date) AS birth_date,
    TIME(birth_date) AS birth_time
FROM Actors;

--2
DROP TABLE IF EXISTS Actors;
CREATE TABLE Actors
(
    id         INT AUTO_INCREMENT PRIMARY KEY,
    name       VARCHAR(20),
    surname    VARCHAR(20),
    birth_date DATE,
    birth_time TIME
);

INSERT INTO Actors (name, surname, birth_date, birth_time)
VALUES
  ('Johnny', 'Depp', '1963-06-09', '19:10:00'),
  ('Natalie', 'Portman', '1981-06-09', '18:00:00'),
  ('Scarlett', 'Johansson', '1984-11-22', '18:30:00'),
  ('Angelina', 'Jolie', '1975-06-04', '05:55:00'),
  ('Brad', 'Pitt', '1963-12-18', '10:00:00'),
  ('Meryl', 'Streep', '1949-06-22', '08:05:00'),
  ('Leonardo', 'DiCaprio', '1974-11-11', '09:55:00'),
  ('Tom', 'Hanks', '1956-07-09', '15:20:00'),
  ('Jennifer', 'Aniston', '1969-02-11', '14:25:00'),
  ('Denzel', 'Washington', '1954-12-28', '10:40:00');

SELECT name, surname, birth_time
FROM Actors
WHERE HOUR(birth_time) IN (8, 10, 18)
ORDER BY birth_time;

--3
SELECT name, surname, birth_date
FROM Actors
WHERE DAYOFYEAR(birth_date) < 256
ORDER BY birth_date;

--4
SELECT name, surname, birth_date
FROM Actors
WHERE WEEKDAY(birth_date) = 2
ORDER BY birth_date;

--5
SELECT name, surname, birth_date
FROM Actors
WHERE YEAR(birth_date) > 1975 AND QUARTER(birth_date) IN (2, 4)
ORDER BY birth_time DESC;

--6
SELECT
    name,
    surname,
    CONCAT_WS(' ', DAY(birth_date), MONTHNAME(birth_date), YEAR(birth_date)) AS birth_date
FROM Actors
WHERE MONTH(birth_date) BETWEEN 5 AND 7;


/*  
****    4.8    ****
*/

--1
DROP TABLE IF EXISTS Orders;
CREATE TABLE Orders
(
   id                INT AUTO_INCREMENT PRIMARY KEY,
   customer_name     VARCHAR(50),
   order_time        DATETIME,
   spent_on_delivery TIME
);

INSERT INTO Orders (customer_name, order_time, spent_on_delivery)
VALUES ('John', '2023-10-23 12:00:00', '01:35:00'),
       ('Alice', '2023-10-23 14:30:00', '03:20:00'),
       ('Bob', '2023-10-23 08:45:00', '04:50:00'),
       ('Eve', '2023-10-24 15:30:00', '02:15:00'),
       ('Charlie', '2023-10-24 09:00:00', '03:30:00'),
       ('Grace', '2023-10-24 10:30:00', '05:45:00'),
       ('Daniel', '2023-10-24 14:15:00', '04:10:00'),
       ('Fiona', '2023-10-25 11:00:00', '02:55:00'),
       ('George', '2023-10-25 09:30:00', '03:40:00'),
       ('Helen', '2023-10-26 07:45:00', '04:20:00'),
       ('Ivan', '2023-10-26 11:30:00', '03:25:00'),
       ('Julia', '2023-10-27 12:00:00', '05:30:00'),
       ('Kevin', '2023-10-30 10:15:00', '03:55:00'),
       ('Linda', '2023-11-01 10:30:00', '05:10:00'),
       ('Michael', '2023-11-01 12:45:00', '02:15:00');

SELECT 
    customer_name,
    ADDTIME(order_time, spent_on_delivery) AS delivery_datetime
FROM Orders
WHERE DAY(order_time) = 24
ORDER BY delivery_datetime DESC
LIMIT 1;

--2
DROP TABLE IF EXISTS Tasks;
CREATE TABLE Tasks
(
   id         INT AUTO_INCREMENT PRIMARY KEY,
   executor   VARCHAR(20),
   task       VARCHAR(100),
   task_start DATE,
   task_end   DATE
);

INSERT INTO Tasks (executor, task, task_start, task_end)
VALUES ('Larry Page', 'Develop new search algorithm', '2023-10-23', '2023-10-25'),
       ('Sergey Brin', 'Analyze user data', '2023-10-23', '2023-10-28'),
       ('Sundar Pichai', 'Launch new product', '2023-10-24', '2023-11-03'),
       ('Ruth Porat', 'Financial analysis', '2023-10-24', '2023-10-26'),
       ('Eric Schmidt', 'Meet with investors', '2023-10-25', '2023-10-31'),
       ('Susan Wojcicki', 'Content strategy', '2023-10-25', '2023-10-31'),
       ('Hiroshi Lockheimer', 'Mobile platform development', '2023-10-26', '2023-11-03'),
       ('Thomas Kurian', 'Cloud services expansion', '2023-10-26', '2023-10-28'),
       ('Jeff Dean', 'Machine learning research', '2023-10-27', '2023-11-01'),
       ('Aparna Chennapragada', 'User experience design', '2023-10-28', '2023-11-03');

SELECT task, executor, DATEDIFF(task_end, task_start) + 1 AS days_spent
FROM Tasks
ORDER BY 3 DESC
LIMIT 1;

--3
DROP TABLE IF EXISTS Users;
CREATE TABLE Users
(
    id                 INT AUTO_INCREMENT PRIMARY KEY,
    username           VARCHAR(50),
    subscription_start DATE,
    subscription_end   DATE
);

INSERT INTO Users (username, subscription_start, subscription_end)
VALUES ('s1mple', '2023-10-23', '2023-11-24'),
       ('NiKo', '2023-10-25', '2023-11-03'),
       ('device', '2023-10-27', '2023-12-20'),
       ('EliGE', '2023-10-29', '2023-11-30'),
       ('ZywOo', '2023-11-01', '2024-11-01'),
       ('Magisk', '2023-11-03', '2024-12-04'),
       ('stewie2k', '2023-11-05', '2023-12-26'),
       ('coldzera', '2023-11-10', '2023-11-18'),
       ('dupreeh', '2023-10-19', '2023-12-10'),
       ('olofmeister', '2023-09-11', '2023-12-12'),
       ('scream', '2023-12-13', '2023-12-14'),
       ('kennyS', '2023-11-15', '2023-12-16'),
       ('f0rest', '2023-10-17', '2023-12-18'),
       ('GuardiaN', '2023-12-19', '2024-01-02'),
       ('freakazoid', '2023-11-21', '2023-12-22');

SELECT username, DATEDIFF(subscription_end, subscription_start) + 1 AS days
FROM Users
WHERE DATEDIFF(subscription_end, subscription_start) + 1 > 14
ORDER BY days DESC, username;

--4
DROP TABLE IF EXISTS Tasks;
CREATE TABLE Tasks
(
   id         INT AUTO_INCREMENT PRIMARY KEY,
   executor   VARCHAR(20),
   task       VARCHAR(100),
   task_start DATETIME,
   task_end   DATETIME
);

INSERT INTO Tasks (executor, task, task_start, task_end)
VALUES ('Larry Page', 'Develop new search algorithm', '2023-10-23 12:00:00', '2023-10-25 18:00:00'),
       ('Sergey Brin', 'Analyze user data', '2023-10-23 12:00:00', '2023-10-28 18:00:00'),
       ('Sundar Pichai', 'Launch new product', '2023-10-24 15:00:00', '2023-10-24 16:00:00'),
       ('Ruth Porat', 'Financial analysis', '2023-10-24 14:30:00', '2023-10-26 20:00:00'),
       ('Eric Schmidt', 'Meet with investors', '2023-10-24 15:00:00', '2023-10-24 15:05:00'),
       ('Susan Wojcicki', 'Content strategy', '2023-10-25 07:0:00', '2023-10-25 17:15:00'),
       ('Hiroshi Lockheimer', 'Mobile platform development', '2023-10-26', '2023-11-03'),
       ('Thomas Kurian', 'Cloud services expansion', '2023-10-27 09:30:00', '2023-10-27 15:45:00'),
       ('Jeff Dean', 'Machine learning research', '2023-10-30 10:15:00', '2023-10-30 16:45:00'),
       ('Aparna Chennapragada', 'User experience design', '2023-10-29 12:00:00', '2023-11-04 18:00:00');

SELECT 
    task,
    executor,
    TIMEDIFF(task_end, task_start) AS time_spend
FROM Tasks
ORDER BY time_spend
LIMIT 1;

--5
DROP TABLE IF EXISTS Staff;
CREATE TABLE Staff
(
  id          INT AUTO_INCREMENT PRIMARY KEY,
  name        VARCHAR(20),
  surname     VARCHAR(20),
  work_start  TIME,
  work_end    TIME,
  break_start TIME,
  break_end   TIME
);

INSERT INTO Staff (name, surname, work_start, work_end, break_start, break_end)
VALUES ('Sundar', 'Pichai', '7:00:00', '17:00:00', '12:00:00', '13:00:00'),
       ('Sergey', 'Brin', '8:00:00', '16:30:00', '11:30:00', '12:30:00'),
       ('Larry', 'Page', '6:30:00', '15:45:00', '12:15:00', '12:45:00'),
       ('Ruth', 'Porat', '8:15:00', '17:15:00', '12:30:00', '13:30:00'),
       ('Eric', 'Schmidt', '7:30:00', '17:45:00', '12:00:00', '13:00:00'),
       ('Susan', 'Wojcicki', '8:30:00', '16:30:00', '12:45:00', '13:45:00'),
       ('Hiroshi', 'Lockheimer', '7:45:00', '17:15:00', '12:15:00', '13:15:00'),
       ('Thomas', 'Kurian', '7:00:00', '16:30:00', '12:30:00', '13:30:00'),
       ('Jeff', 'Dean', '8:15:00', '17:00:00', '12:45:00', '13:45:00'),
       ('Aparna', 'Chennapragada', '7:30:00', '17:15:00', '12:00:00', '13:00:00');

SELECT 
    CONCAT(name, ' ', surname) AS staffer,
    SUBTIME(SUBTIME(work_end, work_start), SUBTIME(break_end, break_start)) AS work_time
FROM Staff
ORDER BY work_time DESC, staffer;

--6
DROP TABLE IF EXISTS Actors;
CREATE TABLE Actors
(
    id         INT AUTO_INCREMENT PRIMARY KEY,
    name       VARCHAR(20),
    surname    VARCHAR(20),
    birth_date DATE
);

INSERT INTO Actors (name, surname, birth_date)
VALUES ('Paul', 'Walker', '1973-09-12'),
       ('Emma', 'Wiklund', '1968-09-13'),
       ('Scarlett', 'Johansson', '1984-11-22'),
       ('Angelina', 'Jolie', '1975-06-04'),
       ('Trevor', 'Duke-Moretz', '1986-09-13'),
       ('Meryl', 'Streep', '1949-06-22'),
       ('Tyler', 'Hoechlin', '1987-09-11'),
       ('Tom', 'Hanks', '1956-07-09'),
       ('Jennifer', 'Aniston', '1969-02-11'),
       ('Andrew', 'Lincoln', '1973-09-14');

SELECT 
    name,
    surname,
    TIMESTAMPDIFF(YEAR, birth_date, NOW()) AS age
FROM Actors
ORDER BY age DESC;

--7
SELECT name, surname, birth_date
FROM Actors
WHERE TIMESTAMPDIFF(YEAR, birth_date, '2023-09-12') > 50
ORDER BY birth_date DESC;

--8
DROP TABLE IF EXISTS Rental;
CREATE TABLE Rental
(
   id         INT PRIMARY KEY,
   name       VARCHAR(255),
   car_brand  VARCHAR(255),
   rent_start DATETIME,
   rent_end   DATETIME
);

INSERT INTO Rental (id, name, car_brand, rent_start, rent_end)
VALUES (1, 'John', 'BMW', '2023-10-23 12:30:00', '2023-10-23 18:00:00'),
       (2, 'Alice', 'Honda', '2023-10-23 10:00:00', '2023-10-23 14:30:00'),
       (3, 'Bob', 'Audi', '2023-10-24 14:30:00', '2023-10-24 17:00:00'),
       (4, 'Charlie', 'BMW', '2023-10-25 08:45:00', '2023-10-25 12:30:00'),
       (5, 'Dave', 'Honda', '2023-10-26 15:30:00', '2023-10-26 20:15:00'),
       (6, 'Emily', 'Audi', '2023-10-26 09:00:00', '2023-10-26 15:45:00'),
       (7, 'Frank', 'Mercedes', '2023-10-27 11:15:00', '2023-11-27 17:00:00'),
       (8, 'Grace', 'Honda', '2023-10-28 08:00:00', '2023-10-28 13:45:00'),
       (9, 'Hank', 'Audi', '2023-10-28 13:30:00', '2023-10-28 18:45:00'),
       (10, 'Irene', 'BMW', '2023-10-29 14:00:00', '2023-10-29 19:30:00'),
       (11, 'Jack', 'Honda', '2023-10-30 07:45:00', '2023-10-30 12:15:00'),
       (12, 'Kate', 'BMW', '2023-10-31 16:30:00', '2023-10-31 21:00:00'),
       (13, 'Lucas', 'Audi', '2023-11-01 10:15:00', '2023-11-01 14:45:00'),
       (14, 'Mary', 'Mercedes', '2023-11-02 13:00:00', '2023-11-02 17:30:00'),
       (15, 'Nina', 'BMW', '2023-11-03 09:30:00', '2023-11-03 14:00:00');

SELECT 
    name,
    TIMEDIFF(rent_end, rent_start) AS rent_time,
    CONCAT(TIMESTAMPDIFF(HOUR, rent_start, rent_end) * 10, '€') AS rent_amount
FROM Rental
WHERE car_brand = 'BMW'
ORDER BY rent_amount;


/*  
****    4.9    ****
*/

DROP TABLE IF EXISTS Actors;
CREATE TABLE Actors
(
   id         INT AUTO_INCREMENT PRIMARY KEY,
   name       VARCHAR(20),
   surname    VARCHAR(20),
   birth_date DATE,
   birth_time TIME
);

INSERT INTO Actors (name, surname, birth_date, birth_time)
VALUES ('Paul', 'Walker', '1973-09-12', '19:10:00'),
       ('Emma', 'Wiklund', '1968-09-13', '06:15:00'),
       ('Scarlett', 'Johansson', '1984-11-22', '18:30:00'),
       ('Angelina', 'Jolie', '1975-06-04', '05:55:00'),
       ('Trevor', 'Duke-Moretz', '1986-09-13', '10:10:00'),
       ('Meryl', 'Streep', '1949-06-22', '08:05:00'),
       ('Tyler', 'Hoechlin', '1987-09-11', '02:47:00'),
       ('Tom', 'Hanks', '1956-07-09', '15:20:00'),
       ('Jennifer', 'Aniston', '1969-02-11', '14:25:00'),
       ('Andrew', 'Lincoln', '1973-09-14', '01:40:00');

--1
SELECT 
    name, 
    surname,
    DATE_FORMAT(birth_date, '%d.%m.%Y') AS birth_date,
    TIME_FORMAT(birth_time, '%H:%i') AS birth_time
FROM Actors
WHERE DAY(birth_date) < 15;

--2
SELECT
    name,
    surname,
    DATE_FORMAT(ADDTIME(birth_date, birth_time), '%d %M %Y, %H:%i') AS birth_datetime
FROM Actors
WHERE YEAR(birth_date) BETWEEN 1969 AND 1975;

--3
DROP TABLE IF EXISTS Actors;
CREATE TABLE Actors
(
   id         INT AUTO_INCREMENT PRIMARY KEY,
   name       VARCHAR(20),
   surname    VARCHAR(20),
   birth_date VARCHAR(20),
   birth_time VARCHAR(30)
);

INSERT INTO Actors (name, surname, birth_date, birth_time)
VALUES ('Paul', 'Walker', '12 Sep 1973', 'Hours: 19, Minutes: 10'),
       ('Emma', 'Wiklund', '13 Sep 1968', 'Hours: 6, Minutes: 15'),
       ('Scarlett', 'Johansson', '22 Nov 1984', 'Hours: 18, Minutes: 30'),
       ('Angelina', 'Jolie', '04 Jun 1975', 'Hours: 5, Minutes: 55'),
       ('Trevor', 'Duke-Moretz', '13 Sep 1986', 'Hours: 10, Minutes: 10'),
       ('Meryl', 'Streep', '22 Jun 1949', 'Hours: 8, Minutes: 5'),
       ('Tyler', 'Hoechlin', '11 Sep 1987', 'Hours: 2, Minutes: 47'),
       ('Tom', 'Hanks', '09 Jul 1956', 'Hours: 15, Minutes: 20'),
       ('Jennifer', 'Aniston', '11 Feb 1969', 'Hours: 14, Minutes: 25'),
       ('Andrew', 'Lincoln', '14 Sep 1973', 'Hours: 1, Minutes: 40');

SELECT 
    name,
    surname,
    STR_TO_DATE(birth_date, '%d %b %Y') AS birth_date,
    STR_TO_DATE(birth_time, 'Hours: %H, Minutes: %i') AS birth_time
FROM Actors
WHERE MONTH(STR_TO_DATE(birth_date, '%d %b %Y')) = 9;


/*  
****    4.10    ****
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
SELECT name, surname, 
    IF(country = 'England', country, 'Other country') AS country
FROM Directors
ORDER BY name;

--2
SELECT name, surname,
    IFNULL(rating, 0) AS rating
FROM Directors
ORDER BY rating, name;

--3
SELECT 
    COALESCE(name, surname, 'Unknown') AS director,
    rating
FROM Directors
ORDER BY rating DESC;

--4
SELECT name, surname, country,
    IF(country = 'USA', LEAST(rating + 10, 100), rating) AS rating
FROM Directors
ORDER BY rating DESC, name;


/*  
****    4.11    ****
*/

DROP TABLE IF EXISTS Math;
CREATE TABLE Math
(
    id      INT PRIMARY KEY AUTO_INCREMENT,
    name    VARCHAR(20),
    surname VARCHAR(20),
    grade   VARCHAR(20)
);

INSERT INTO Math (name, surname, grade)
VALUES ('Flash', 'Thompson', 'D'),
       ('Peter', 'Parker', 'A'),
       ('Mary', 'Jane', 'D'),
       ('Gwen', 'Stacy', 'B'),
       ('Harry', 'Osborn', 'A'),
       ('Ben', 'Reilly', 'E'),
       ('Miles', 'Morales', 'A'),
       ('John', 'Jameson', 'E'),
       ('Curtis', 'Connors', 'B'),
       ('Edward', 'Brock', 'C');

--1
SELECT name, surname, 
    CASE grade
        WHEN 'A' THEN 5
        WHEN 'B' THEN 4
        WHEN 'C' THEN 3
        WHEN 'D' THEN 2
        ELSE 1
    END AS grade
FROM Math
ORDER BY grade DESC, name;

--2
SELECT name, surname,
    CASE 
        WHEN grade IN ('A', 'B') THEN 'Great'
        WHEN grade = 'C' THEN 'Well'
        ELSE 'Bad'
    END AS result
FROM Math
ORDER BY grade, name;

--3
SELECT name, surname,
    CASE
        WHEN grade BETWEEN 80 AND 100 THEN 5
        WHEN grade BETWEEN 60 AND 79 THEN 4
        WHEN grade BETWEEN 30 AND 59 THEN 3
        WHEN grade BETWEEN 10 AND 29 THEN 2
        ELSE 1
    END AS grade
FROM Math
ORDER BY grade DESC, name;

--4
DROP TABLE IF EXISTS Students;
CREATE TABLE Students
(
    id      INT PRIMARY KEY AUTO_INCREMENT,
    name    VARCHAR(20),
    surname VARCHAR(20),
    email   VARCHAR(40)
);

INSERT INTO Students (name, surname, email)
VALUES ('Flash', 'Thompson', '99power@midtown.com'),
       ('Peter', 'Parker', 'FriendlyNeighborhood@midtown.com'),
       ('Mary', 'Jane', 'redhead@gmail.com'),
       ('Gwen', 'Stacy', '7@yahoo.com'),
       ('Harry', 'Osborn', '1justharry@outlook.com'),
       ('Ben', 'Reilly', 'R@midtown.com'),
       ('Miles', 'Morales', 'yourspidey2@midtown.com'),
       ('John', 'Jameson', 'boss@bugle.com'),
       ('Curtis', 'Connors', '5@midtown.com'),
       ('Edward', 'Brock', 'WeAreVenom@midtown.com');

SELECT name, surname,
    IF(email LIKE '__%@midtown.com' AND NOT LEFT(email, 1) BETWEEN '0' AND '9', 
       'Correct', 'Incorrect') 
    AS email_status 
FROM Students
ORDER BY name;

--5
DROP TABLE IF EXISTS Clients;
CREATE TABLE Clients
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(20),
    surname VARCHAR(20),
    status VARCHAR(40)
);

INSERT INTO Clients (name, surname, status)
VALUES ('Flash', 'Thompson', 'Gold'),
       ('Peter', 'Parker', 'Basic'),
       ('Mary', 'Jane', 'Bronze'),
       ('Gwen', 'Stacy', 'Silver'),
       ('Harry', 'Osborn', 'Gold'),
       ('Ben', 'Reilly', 'Basic'),
       ('Miles', 'Morales', 'Basic'),
       ('John', 'Jameson', 'Silver'),
       ('Curtis', 'Connors', 'Bronze'),
       ('Edward', 'Brock', 'Silver');

SELECT name, surname, status
FROM Clients
ORDER BY 
    CASE status
        WHEN 'GOLD' THEN 1
        WHEN 'SILVER' THEN 2
        WHEN 'BRONZE' THEN 3
        ELSE 4
    END,
    name;

--6
DROP TABLE IF EXISTS Results;
CREATE TABLE Results
(
    id      INT AUTO_INCREMENT PRIMARY KEY,
    name    VARCHAR(50),
    surname VARCHAR(50),
    time    TIME
);

INSERT INTO Results (name, surname, time)
VALUES ('Joel', 'Miller', '02:21:00'),
       ('Arthur', 'Morgan', '00:10:00'),
       ('Leonhard', 'Euler', '00:59:00'),
       ('Alan', 'Wake', '00:32:00'),
       ('Alyx', 'Vance', '00:16:00'),
       ('Jill', 'Valentine', '00:44:00'),
       ('Isaac', 'Clarke', '01:01:00'),
       ('Gordon', 'Freeman', '00:17:00'),
       ('Alan', 'Turing', '00:31:00'),
       ('Stephen', 'Hawking', '00:23:00'),
       ('Ryu', 'Hayabusa', '00:41:00'),
       ('Johnny', 'Silverhand', '00:11:00'),
       ('Samus', 'Aran', '00:29:00'),
       ('Nathan', 'Drake', '00:54:00'),
       ('Erwin', 'Schrodinger', '00:30:00'),
       ('Max', 'Payne', '01:00:00'),
       ('Tom', 'Nook', '00:12:00');

SELECT name, surname,
    CASE
        WHEN HOUR(time) * 60 + MINUTE(time) > 60 THEN 0
        WHEN HOUR(time) * 60 + MINUTE(time) <= 30 THEN 100
        ELSE 100 - ((HOUR(time) * 60 + MINUTE(time)) - 30)
    END AS score
FROM Results
ORDER BY score DESC, name, surname;