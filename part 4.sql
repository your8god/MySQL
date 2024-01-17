/*  
****    6.1    ****
*/

DROP TABLE IF EXISTS Films;
CREATE TABLE Films
(
    id           INT PRIMARY KEY AUTO_INCREMENT,
    title        VARCHAR(40),
    director     VARCHAR(20),
    running_time INT
);

TRUNCATE Films;
INSERT INTO Films (title, director, running_time)
VALUES ('Toy Story 3', 'Lee Unkrich', 103),
       ('Monsters University', 'Dan Scanlon', 104),
       ('Toy Story 2', 'John Lasseter', 92),
       ('WALL-E', 'Andrew Stanton', 97),
       ('Ratatouille', 'Brad Bird', 111),
       ('Up', 'Pete Docter', 96),
       ('Brave', 'Brenda Chapman', 92),
       ('Finding Nemo', 'Andrew Stanton', 100),
       ('Toy Story', 'John Lasseter', 92),
       ('The Incredibles', 'Brad Bird', 115);

--1
SELECT title FROM Films
WHERE running_time > (SELECT MIN(running_time) FROM Films)
ORDER BY title;

--2
SELECT director FROM Films
GROUP BY director
HAVING AVG(running_time) > (SELECT AVG(running_time) FROM Films)
ORDER BY director;

--3
SELECT DISTINCT director FROM Films
WHERE running_time = (SELECT MIN(running_time) FROM Films)
ORDER BY director;

--4
SELECT DISTINCT director FROM Films
WHERE running_time > (SELECT MIN(running_time) FROM Films)
ORDER BY director;

--5
SELECT title FROM Films 
WHERE running_time = (SELECT running_time FROM Films WHERE title = 'wall-e') AND title != 'wall-e'
ORDER BY title;

--6
SELECT director, COUNT(*) AS num_of_films 
FROM Films
WHERE running_time > (SELECT AVG(running_time) FROM Films)
GROUP BY director
ORDER BY num_of_films DESC, director;

--7
SELECT title FROM Films
WHERE running_time > ANY(SELECT running_time FROM Films WHERE director = 'brad bird')
ORDER BY title;

--8
SELECT title FROM Films 
WHERE running_time < ALL(SELECT running_time FROM Films WHERE director = 'john lasseter')
ORDER BY title;

--9
SELECT 
    (SELECT COUNT(*) FROM Films WHERE running_time = 
        (SELECT MIN(running_time) FROM Films)
    ) AS shortest_films,
    (SELECT COUNT(*) FROM Films WHERE running_time =
        (SELECT MAX(running_time) FROM Films)
    ) AS longest_films;


/*  
****    6.2    ****
*/

--1
DROP TABLE IF EXISTS Films;
CREATE TABLE Films
(
    id           INT PRIMARY KEY AUTO_INCREMENT,
    show_date    DATE,
    title        VARCHAR(40),
    director     VARCHAR(20),
    running_time INT
);

TRUNCATE Films;
INSERT INTO Films (show_date, title, director, running_time)
VALUES ('2023-07-13', 'Toy Story 3', 'Lee Unkrich', 115),
       ('2023-07-18', 'Monsters University', 'Dan Scanlon', 104),
       ('2023-07-15', 'Toy Story 2', 'John Lasseter', 92),
       ('2023-07-01', 'WALL-E', 'Andrew Stanton', 97),
       ('2023-07-17', 'Ratatouille', 'Brad Bird', 111),
       ('2023-07-16', 'Up', 'Pete Docter', 96),
       ('2023-07-22', 'Brave', 'Brenda Chapman', 92),
       ('2023-07-14', 'Finding Nemo', 'Andrew Stanton', 100),
       ('2023-06-30', 'Toy Story', 'John Lasseter', 92),
       ('2023-07-19', 'The Incredibles', 'Brad Bird', 115);

SELECT title FROM Films
WHERE running_time > (SELECT running_time FROM Films AS InnerFilms
                    WHERE DATEDIFF(Films.show_date, show_date) = 1)
ORDER BY title;

--2
DROP TABLE IF EXISTS Math;
CREATE TABLE Math
(
    id      INT PRIMARY KEY AUTO_INCREMENT,
    name    VARCHAR(20),
    surname VARCHAR(20),
    grade   INT
);

TRUNCATE Math;
INSERT INTO Math (name, surname, grade)
VALUES ('Flash', 'Thompson', 2),
       ('Peter', 'Parker', 2),
       ('Mary', 'Jane', 3),
       ('Gwen', 'Stacy', 2),
       ('Harry', 'Osborn', 3),
       ('May', 'Parker', 4),
       ('Miles', 'Morales', 2),
       ('John', 'Jameson', 1),
       ('Norman', 'Osborn', 5),
       ('Ben', 'Parker', 3);

SELECT name, surname, grade FROM Math
WHERE grade > (SELECT AVG(grade) FROM Math AS M WHERE id < Math.id)
ORDER BY grade, name;

--3
SELECT name, surname, grade FROM Math
WHERE grade IN (SELECT grade FROM Math AS M
                WHERE (id = Math.id - 1) OR id = Math.id + 1)
ORDER BY name;

--4
SELECT name, surname, grade FROM Math 
WHERE grade = (SELECT grade From Math
               GROUP BY grade 
               HAVING COUNT(*) = 
                   (SELECT COUNT(*) FROM Math 
                    GROUP BY grade 
                    ORDER BY 1 DESC LIMIT 1)
              )
ORDER BY name;


SELECT name, surname, grade FROM Math 
WHERE grade = (SELECT grade FROM Math
               GROUP BY grade 
               ORDER BY COUNT(*) DESC
               LIMIT 1
              )
ORDER BY name;

--5
SELECT name, surname FROM Math
WHERE (SELECT COUNT(*) From Math AS M WHERE surname = Math.surname) > 1
ORDER BY surname, name;


/*  
****    6.3    ****
*/

DROP TABLE IF EXISTS Purchases;
DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS Films;

-- Создание таблицы Films
CREATE TABLE Films
(
    id       INT PRIMARY KEY AUTO_INCREMENT,
    title    VARCHAR(20),
    director VARCHAR(20),
    price    FLOAT
);

INSERT INTO Films (title, director, price)
VALUES ('Toy Story 2', 'John Lasseter', 2.99),
       ('WALL-E', 'Andrew Stanton', 4.99),
       ('Ratatouille', 'Brad Bird', 4.99),
       ('Up', 'Pete Docter', 4.99),
       ('Brave', 'Brenda Chapman', 7.99),
       ('Monsters University', 'Dan Scanlon', 7.99),
       ('Cars 2', 'John Lasseter', 7.99),
       ('Finding Nemo', 'Andrew Stanton', 4.99),
       ('Toy Story', 'John Lasseter', 2.99),
       ('The Incredibles', 'Brad Bird', 4.99);

-- Создание таблицы Users
CREATE TABLE Users
(
    id      INT PRIMARY KEY AUTO_INCREMENT,
    name    VARCHAR(40),
    surname VARCHAR(40)
);

INSERT INTO Users (name, surname)
VALUES ('Matt', 'Damon'),
       ('Edward', 'Norton'),
       ('Nicolas', 'Cage'),
       ('Ben', 'Affleck'),
       ('John', 'Travolta');

-- Создание таблицы Purchases
CREATE TABLE Purchases
(
    id      INT PRIMARY KEY AUTO_INCREMENT,
    film_id INT,
    user_id INT
);

TRUNCATE Purchases;
INSERT INTO Purchases (film_id, user_id)
VALUES (1, 1),
       (1, 3),
       (2, 4),
       (1, 2),
       (9, 4),
       (6, 1),
       (7, 2),
       (6, 3),
       (5, 1),
       (10, 1);

--1
SELECT name, surname FROM Users
WHERE id NOT IN (SELECT user_id FROM Purchases);

--2
SELECT title, director FROM Films
WHERE id IN (SELECT film_id FROM Purchases)
ORDER BY title;

--3
SELECT COUNT(*) AS num_of_users FROM Purchases
WHERE film_id = (SELECT id FROM Films WHERE title = 'TOY STORY 2');

--4
SELECT name, surname FROM Users
WHERE id IN (SELECT user_id FROM Purchases 
            WHERE film_id = (SELECT id FROM Films WHERE title = 'TOY STORY 2'))
ORDER BY name;

--5
SELECT 
    name, 
    surname, 
    (SELECT COUNT(*) FROM Purchases WHERE user_id = Users.id) AS num_of_films
FROM Users
ORDER BY num_of_films DESC, name;

--6
SELECT name, surname FROM Users
WHERE (SELECT COUNT(*) FROM Purchases WHERE user_id = Users.id) = 2
ORDER BY name;

--7
SELECT name, surname FROM Users
ORDER BY (SELECT COUNT(*) FROM Purchases WHERE user_id = Users.id) DESC
LIMIT 1;

--8
SELECT name, surname, 
    (SELECT title FROM Films WHERE id = 
        (SELECT film_id FROM Purchases WHERE Users.id = user_id LIMIT 1)
    ) AS first_film
FROM Users
HAVING NOT ISNULL(first_film)
ORDER BY name;

--9
SELECT name, surname,
    (SELECT IFNULL(SUM(price), 0.00) FROM Films WHERE id IN
        (SELECT film_id FROM Purchases WHERE Users.id = user_id)
    ) AS total_spending
FROM Users
ORDER BY total_spending DESC, name;

--10
SELECT name, surname,
    (SELECT title FROM Films AS F WHERE id = 
        (SELECT film_id FROM Purchases AS P WHERE Users.id = user_id ORDER BY 
            (SELECT price FROM Films WHERE id IN 
                (SELECT film_id FROM Purchases WHERE Users.id = user_id AND P.film_id = film_id) 
            ) DESC,
            (SELECT title FROM Films WHERE id IN 
                (SELECT film_id FROM Purchases WHERE Users.id = user_id AND P.film_id = film_id)
            )
        LIMIT 1
        )
    ) AS most_expensive_film
FROM Users
ORDER BY 
    (SELECT price FROM Films WHERE title = most_expensive_film) DESC
    most_expensive_film,
    name;

SELECT name, surname,
    (SELECT title FROM Films AS F WHERE id IN 
        (SELECT film_id FROM Purchases WHERE Users.id = user_id) 
     ORDER BY 
     price DESC, title
     LIMIT 1   
    ) AS most_expensive_film
FROM Users
HAVING NOT ISNULL(most_expensive_film )
ORDER BY 
    (SELECT price FROM Films WHERE title = most_expensive_film) DESC,
    most_expensive_film,
    name;


/*  
****    6.4    ****
*/

--1
DROP TABLE IF EXISTS RequestsAccepted;
DROP TABLE IF EXISTS FriendRequests;

-- Создание таблицы FriendRequests
CREATE TABLE FriendRequests
(
    sender_id    INT,
    send_to_id   INT,
    request_date DATE
);

INSERT INTO FriendRequests (sender_id, send_to_id, request_date)
VALUES (1, 2, '2023-06-01'),
       (1, 2, '2023-06-02'),
       (1, 3, '2023-06-01'),
       (1, 3, '2023-06-21'),
       (2, 1, '2023-06-12'),
       (2, 1, '2023-06-23'),
       (2, 3, '2023-06-02'),
       (3, 1, '2023-06-12'),
       (3, 2, '2023-06-13'),
       (3, 4, '2023-06-09'),
       (4, 1, '2023-06-25'),
       (4, 2, '2023-06-29'),
       (4, 3, '2023-06-15'),
       (4, 5, '2023-06-10'),
       (5, 3, '2023-06-21'),
       (5, 3, '2023-06-28'),
       (5, 4, '2023-06-16'),
       (5, 6, '2023-06-11'),
       (5, 6, '2023-06-11'),
       (6, 5, '2023-06-20');

-- Создание таблицы RequestsAccepted
CREATE TABLE RequestsAccepted
(
    requester_id INT,
    accepter_id  INT,
    accept_date  DATE
);

TRUNCATE RequestsAccepted;
INSERT INTO RequestsAccepted (requester_id, accepter_id, accept_date)
VALUES (1, 2, '2023-06-02'),
       (1, 2, '2023-06-02'),
       (1, 3, '2023-06-23'),
       (2, 3, '2023-06-02'),
       (3, 1, '2023-06-15'),
       (3, 2, '2023-06-14'),
       (3, 4, '2023-06-19'),
       (4, 1, '2023-06-25'),
       (4, 1, '2023-06-25'),
       (4, 2, '2023-06-30'),
       (5, 3, '2023-06-21'),
       (5, 3, '2023-06-28'),
       (5, 4, '2023-06-17'),
       (5, 6, '2023-06-15'),
       (6, 5, '2023-06-20');

SELECT ROUND(
    (SELECT COUNT(*) FROM 
         (SELECT DISTINCT requester_id, accepter_id FROM RequestsAccepted) AS T
    ) / 
    (SELECT COUNT(*) FROM
        (SELECT DISTINCT sender_id, send_to_id  FROM FriendRequests) AS TT
    ), 2) AS accept_rate;

--2
DROP TABLE IF EXISTS Scores;
CREATE TABLE Scores
(
    id    INT PRIMARY KEY AUTO_INCREMENT,
    score DECIMAL(4, 2)
);

TRUNCATE Scores;
INSERT INTO Scores (score)
VALUES (3.50),
       (3.50),
       (4.00),
       (3.50),
       (4.20),
       (3.65),
       (4.20),
       (3.65),
       (4.20),
       (3.95),
       (4.05),
       (3.65),
       (4.05),
       (3.70),
       (3.80),
       (4.25),
       (3.55),
       (4.40),
       (4.30),
       (4.40);

SELECT score, 
    (SELECT SUM(Scores.score < score) + 1
     FROM (SELECT DISTINCT score FROM Scores) AS S) AS gamer_rank
FROM Scores
ORDER BY gamer_rank DESC;

SELECT score, 
    (SELECT COUNT(DISTINCT score) FROM Scores AS S WHERE Scores.score <= score) AS gamer_rank
FROM Scores
ORDER BY gamer_rank DESC;

--3
DROP TABLE IF EXISTS Follow;
CREATE TABLE Follow
(
    followee VARCHAR(50),
    follower VARCHAR(50)
);

TRUNCATE Follow;
INSERT INTO Follow (followee, follower)
VALUES ('John', 'Alice'),
       ('Alice', 'Bob'),
       ('Bob', 'Edward'),
       ('Bob', 'George'),
       ('Donald', 'Edward'),
       ('Edward', 'Frank'),
       ('Edward', 'George'),
       ('George', 'Helen'),
       ('Helen', 'Isabel'),
       ('Isabel', 'John'),
       ('Cena', 'John'),
       ('David', 'Alice'),
       ('Eva', 'John'),
       ('Cena', 'Isabel'),
       ('Eva', 'John'),
       ('Alice', 'David'),
       ('Helen', 'Alice'),
       ('David', 'Helen'),
       ('Isabel', 'David'),
       ('Eva', 'George');

SELECT followee AS user, COUNT(follower) AS followers
FROM Follow
GROUP BY 1
HAVING user IN (SELECT follower FROM Follow)
ORDER BY 1;

--4
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Books;

-- Создание таблицы Books
CREATE TABLE Books
(
    id             INT PRIMARY KEY AUTO_INCREMENT,
    name           VARCHAR(255),
    available_from DATE
);

INSERT INTO Books (name, available_from)
VALUES ('To Kill a Mockingbird', '2021-12-31'),
       ('Great War', '2021-12-31'),
       ('The Great Gatsby', '2023-09-10'),
       ('Pride and Prejudice', '2022-01-01'),
       ('The Catcher in the Rye', '2023-09-19'),
       ('Brave New World', '2021-01-01'),
       ('The Lord of the Rings', '2022-07-29'),
       ('Moby-Dick', '2022-10-18'),
       ('To the Lighthouse', '2020-05-05'),
       ('War and Peace', '2020-01-20'),
       ('Frankenstein', '2020-01-01'),
       ('Dracula', '2023-09-20'),
       ('The Grapes of Wrath', '2021-04-14'),
       ('The Hobbit', '2022-09-21'),
       ('The Shining', '2023-01-01'),
       ('Wuthering Heights', '2023-01-01'),
       ('The Road', '2023-08-20'),
       ('The Girl with the Dragon Tattoo', '2021-08-01'),
       ('The Alchemist', '2021-01-01');


-- Создание таблицы Orders
CREATE TABLE Orders
(
    id            INT PRIMARY KEY AUTO_INCREMENT,
    book_id       INT,
    quantity      INT,
    dispatch_date DATE
);

TRUNCATE Orders;
INSERT INTO Orders (book_id, quantity, dispatch_date)
VALUES (1, 5, '2023-09-10'),
       (2, 6, '2023-09-05'),
       (3, 3, '2023-09-15'),
       (4, 7, '2023-09-02'),
       (5, 4, '2023-09-19'),
       (6, 12, '2023-08-19'),
       (7, 8, '2023-03-21'),
       (1, 8, '2022-05-11'),
       (8, 6, '2023-07-08'),
       (9, 8, '2022-01-01'),
       (10, 2, '2023-09-18'),
       (2, 2, '2022-09-05'),
       (11, 3, '2023-09-14'),
       (12, 4, '2023-09-20'),
       (7, 5, '2023-08-02'),
       (13, 2, '2023-08-25'),
       (3, 7, '2023-09-20'),
       (14, 5, '2023-09-03'),
       (8, 5, '2023-08-21'),
       (15, 9, '2023-09-20'),
       (16, 3, '2023-08-20'),
       (4, 1, '2023-07-20'),
       (17, 2, '2023-08-30'),
       (4, 7, '2023-09-20'),
       (19, 1, '2023-08-10'),
       (19, 1, '2023-08-10'),
       (13, 8, '2022-01-01'),
       (15, 2, '2022-09-18'),
       (18, 2, '2021-09-05'),
       (11, 3, '2022-09-14'),
       (9, 10, '2022-09-20'),
       (18, 10, '2022-09-20');

SELECT id, name FROM Books
WHERE (
    SELECT IFNULL(SUM(quantity), 0) FROM Orders 
    WHERE book_id = Books.id AND dispatch_date >= SUBDATE('2023-09-20', INTERVAL 365 DAY)
    ) < 10 AND 
    available_from < SUBDATE('2023-09-20', INTERVAL 31 DAY);

--5
DROP TABLE IF EXISTS Orders;
CREATE TABLE Orders
(
    id         INT,
    product_id INT,
    quantity   INT
);

TRUNCATE Orders;
INSERT INTO Orders (id, product_id, quantity)
VALUES (1, 1, 12),
       (1, 2, 8),
       (1, 3, 10),
       (2, 1, 9),
       (2, 4, 5),
       (2, 5, 6),
       (3, 3, 8),
       (3, 4, 18),
       (4, 5, 4),
       (4, 6, 8),
       (5, 7, 9),
       (5, 8, 9),
       (6, 2, 12),
       (6, 5, 3),
       (7, 3, 10),
       (7, 4, 13),
       (8, 1, 7),
       (8, 6, 6),
       (9, 7, 8),
       (9, 8, 18);

SELECT DISTINCT id FROM Orders
WHERE
    (SELECT MAX(quantity) FROM Orders AS O WHERE id = Orders.id) >
    ALL(SELECT AVG(quantity) FROM Orders AS O GROUP BY id);

--6
DROP TABLE IF EXISTS Rounds;
DROP TABLE IF EXISTS Candidates;

-- Создание таблицы Candidates
CREATE TABLE Candidates
(
    id           INT PRIMARY KEY AUTO_INCREMENT,
    name         VARCHAR(255),
    years_of_exp INT,
    interview_id INT
);

INSERT INTO Candidates (name, years_of_exp, interview_id)
VALUES ('Emily', 4, 301),
       ('Oliver', 2, 302),
       ('Ava', 6, 303),
       ('Liam', 1, 304),
       ('Sophia', 7, 305),
       ('Noah', 1, 306),
       ('Emma', 5, 307),
       ('Mason', 2, 308),
       ('Isabella', 2, 309),
       ('William', 2, 310);

-- Создание таблицы Rounds
CREATE TABLE Rounds
(
    interview_id INT,
    round_id     INT,
    score        INT
);

TRUNCATE Rounds;
INSERT INTO Rounds (interview_id, round_id, score)
VALUES (301, 1, 8),
       (301, 2, 8),
       (302, 1, 9),
       (302, 2, 8),
       (302, 3, 6),
       (303, 1, 3),
       (303, 2, 2),
       (304, 1, 5),
       (304, 2, 6),
       (304, 3, 6),
       (304, 4, 6),
       (305, 1, 9),
       (306, 1, 4),
       (306, 2, 5),
       (307, 1, 7),
       (307, 2, 6),
       (308, 1, 2),
       (309, 1, 5),
       (309, 2, 6),
       (309, 3, 4),
       (310, 1, 8),
       (310, 2, 9);

SELECT C.id FROM Candidates C 
JOIN Rounds R ON R.interview_id  = C.interview_id 
WHERE C.years_of_exp >= 2
GROUP BY C.id
HAVING SUM(R.score) > 15;

--7
DROP TABLE IF EXISTS Orders;
CREATE TABLE Orders
(
    id          INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_type  INT
);

TRUNCATE Orders;
INSERT INTO Orders (customer_id, order_type)
VALUES (5, 0),
       (5, 1),
       (6, 1),
       (7, 0),
       (8, 1),
       (8, 0),
       (9, 1),
       (10, 1),
       (11, 0),
       (12, 0),
       (13, 1),
       (13, 1),
       (20, 1),
       (14, 1),
       (14, 1),
       (14, 1),
       (17, 0),
       (19, 0),
       (19, 1),
       (20, 1),
       (14, 1),
       (12, 0);

SELECT * FROM Orders
WHERE 1 =    
    CASE
        WHEN 0 = ANY(
            SELECT order_type FROM Orders O WHERE Orders.customer_id = customer_id)
        THEN order_type = 0
        ELSE 1
    END;

--8
DROP TABLE IF EXISTS SaintPetersburg;
DROP TABLE IF EXISTS Moscow;

-- Создание таблицы Moscow
CREATE TABLE Moscow
(
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    score      INT
);

TRUNCATE Moscow;
INSERT INTO Moscow (score)
VALUES (90),
       (87),
       (88),
       (91),
       (89),
       (92),
       (86),
       (93),
       (85),
       (94),
       (84),
       (95),
       (83),
       (96),
       (82),
       (97),
       (81),
       (98),
       (80),
       (99);

-- Создание таблицы SaintPetersburg
CREATE TABLE SaintPetersburg
(
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    score      INT
);

TRUNCATE SaintPetersburg ;
INSERT INTO SaintPetersburg (score)
VALUES (89),
       (88),
       (90),
       (87),
       (91),
       (86),
       (92),
       (85),
       (93),
       (84),
       (94),
       (83),
       (95),
       (82),
       (96),
       (81),
       (97),
       (80),
       (98),
       (79);

SELECT CASE
    WHEN (SELECT COUNT(score) FROM Moscow WHERE score >= 90) >
    (SELECT COUNT(score) FROM SaintPetersburg WHERE score >= 90)
        THEN 'Moscow University'
    WHEN (SELECT COUNT(score) FROM Moscow WHERE score >= 90) <
    (SELECT COUNT(score) FROM SaintPetersburg WHERE score >= 90)
        THEN 'Saint Petersburg University'
    ELSE 'No winner'
    END AS winner;

--9
DROP TABLE IF EXISTS Scores;
CREATE TABLE Scores
(
    player_name  VARCHAR(50),
    team         CHAR(1),
    day          DATE,
    score_points INT
);

TRUNCATE Scores;
INSERT INTO Scores (player_name, team, day, score_points)
VALUES ('David', 'M', '2023-09-05', 14),
       ('Felicia', 'F', '2023-09-05', 20),
       ('Eva', 'F', '2023-02-07', 20),
       ('Michael', 'M', '2023-02-07', 9),
       ('Sophia', 'F', '2023-06-10', 26),
       ('Matthew', 'M', '2023-06-10', 11),
       ('Olivia', 'F', '2023-02-15', 29),
       ('Jacob', 'M', '2023-02-15', 17),
       ('Ava', 'F', '2023-08-21', 24),
       ('Liam', 'M', '2023-08-21', 12),
       ('Chloe', 'F', '2023-06-29', 23),
       ('John', 'M', '2023-02-03', 23);

SELECT team, day, 
    (SELECT SUM(score_points) FROM Scores AS S 
        WHERE team = Scores.team AND Scores.day <= day 
    ) AS total
FROM Scores
ORDER BY team, day;