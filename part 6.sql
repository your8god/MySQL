/*  
****    8.1    ****
*/

DROP TABLE IF EXISTS Grades;
DROP TABLE IF EXISTS Classes;
DROP TABLE IF EXISTS Students;

-- Создание таблицы Students
CREATE TABLE Students
(
    id      INT PRIMARY KEY AUTO_INCREMENT,
    student VARCHAR(40)
);

INSERT INTO Students (student)
VALUES ('Peter Parker'),
       ('Mary Jane'),
       ('Gwen Stacy');

-- Создание таблицы Classes
CREATE TABLE Classes
(
    id   INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(20)
);

INSERT INTO Classes (name)
VALUES ('Math'),
       ('Chemistry'),
       ('Biology');

-- Создание таблицы Grades
CREATE TABLE Grades
(
    student_id INT,
    class_id   INT,
    grade      INT
);

INSERT INTO Grades (student_id, class_id, grade)
VALUES (3, 3, 5),
       (1, 1, 5),
       (3, 1, 4),
       (1, 2, 5),
       (2, 1, 3),
       (2, 2, 4),
       (1, 3, 5),
       (2, 3, 3),
       (3, 2, 5);

--1
UPDATE Grades
SET grade = 5;

--2
UPDATE Grades
SET grade = 5
WHERE grade = 4;

--3
UPDATE Grades
SET grade = CASE
    WHEN grade IN ('A', 'B') THEN 'Great'
    WHEN grade IN ('D', 'E') THEN 'Bad'
    ELSE 'Well'
    END;

--4
UPDATE Grades
SET grade = 5
WHERE student_id = (
    SELECT id FROM Students 
    WHERE student = 'Peter Parker'
);

--5
UPDATE Grades
SET grade = 5
WHERE student_id = (
    SELECT id FROM Students 
    WHERE student = 'Mary Jane'
) AND
    class_id = (
    SELECT id FROM Classes
    WHERE name = 'Math'
);

--6
UPDATE Grades JOIN Classes
SET grade = NULL
WHERE name = 'Biology' AND date_of_receipt = '2023-07-26';

--7
UPDATE Grades
SET grade = 5
WHERE student_id = (
    SELECT id FROM Students
    WHERE student = 'Gwen Stacy')
ORDER BY date_of_receipt 
LIMIT 1;

--8
UPDATE Grades
SET grade = 5
WHERE student_id = (
    SELECT id FROM Students
    WHERE student = 'Gwen Stacy')
ORDER BY date_of_receipt DESC
LIMIT 1;


/*  
****    8.2    ****
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
       ('Monsters University', 'Dan Scanlon',7.99),
       ('Cars 2', 'John Lasseter', 7.99),
       ('Finding Nemo', 'Andrew Stanton', 4.99),
       ('Toy Story', 'John Lasseter', 2.99),
       ('The Incredibles', 'Brad Bird', 4.99);

-- Создание таблицы Users
CREATE TABLE Users
(
    id   INT PRIMARY KEY AUTO_INCREMENT,
    user VARCHAR(40)
);

INSERT INTO Users (user)
VALUES ('Matt Damon'),
       ('Edward Norton'),
       ('Nicolas Cage'),
       ('Ben Affleck'),
       ('John Travolta');

-- Создание таблицы Purchases
CREATE TABLE Purchases
(
    id          INT PRIMARY KEY AUTO_INCREMENT,
    film_id     INT,
    user_id     INT,
    FOREIGN KEY (film_id) REFERENCES Films(id),
    FOREIGN KEY (user_id) REFERENCES Users(id)
);

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
TRUNCATE Purchases;

--2
DELETE FROM Users
WHERE (SELECT COUNT(*) FROM Purchases WHERE Users.id = user_id) = 0;

--3
DELETE FROM Purchases
WHERE user_id = (SELECT id FROM Users WHERE user = 'Matt Damon')
ORDER BY id DESC
LIMIT 2;

--4
DELETE FROM Purchases
WHERE user_id = (SELECT id FROM Users WHERE user = 'Matt Damon');

DELETE FROM Users
WHERE user = 'Matt Damon';

--5
DELETE FROM Purchases
WHERE film_id IN (SELECT id FROM Films WHERE title LIKE 'Toy Story%');

DELETE FROM Films
WHERE title LIKE 'Toy Story%'; 


/*  
****    8.3    ****
*/

DROP TABLE IF EXISTS NewSongs;
DROP TABLE IF EXISTS Songs;

-- Создание таблицы Songs
CREATE TABLE Songs
(
    id        INT PRIMARY KEY,
    trackname VARCHAR(40),
    artist    VARCHAR(40)
);

INSERT INTO Songs (id, trackname, artist)
VALUES (1, 'Crazy on You', 'Heart'),
       (2, 'My Lover', 'The Sounds'),
       (3, 'Spent the Day in Bed', 'Morrissey'),
       (4, 'Bigmouth Strikes Again', 'The Smiths'),
       (5, 'Everyday is Like Sunday', 'Morrissey');

-- Создание таблицы NewSongs
CREATE TABLE NewSongs
(
    id        INT PRIMARY KEY,
    trackname VARCHAR(40),
    artist    VARCHAR(40)
);

INSERT INTO NewSongs (id, trackname, artist)
VALUES (1, 'Thrill', 'The Sounds'),
       (2, 'Painted By Numbers', 'The Sounds'),
       (3, 'Let Me Kiss You', 'Morrissey');

--1
INSERT INTO Songs (id, trackname, artist)
VALUES (6, 'Let Me Kiss You', 'Morrissey');

--2
INSERT INTO Songs (id, trackname, artist)
VALUES (6, 'Running up That Hill', 'Kate Bush'),
    (7, 'Thrill', 'The Sounds'),
    (8, 'Keep Yourself Alive', 'Queen');

--3
INSERT INTO NewSongs
SELECT * FROM Songs;

--4
INSERT INTO MorrisseySongs
SELECT * FROM Songs WHERE artist = 'Morrissey';

DELETE FROM Songs
WHERE artist = 'Morrissey';

--5
INSERT INTO NewSongs
SELECT * FROM Songs
LIMIT 1;

INSERT INTO NewSongs
SELECT * FROM Songs
ORDER BY id DESC
LIMIT 1;

--6
INSERT INTO NewSongs (id, trackname, artist)
SELECT (SELECT MAX(id) FROM NewSongs) + Songs.id,
    trackname, artist 
    FROM Songs;