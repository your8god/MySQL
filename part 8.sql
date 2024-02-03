/*  
****    10.1    ****
*/

--1
SET @variable = 'Hello, World!';

--2
SET @number = CONV(2361822, 10, 2);

--3
SET
    @name = 'Corey',
    @birthdate = '1999-12-08',
    @pets = 0;

--4
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

SET @avg_usa_rating = ROUND((SELECT AVG(rating) FROM Directors WHERE country = 'USA'), 2);

--5
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
       ('Quentin', 'Tarantino', 'USA', NULL),
       ('Martin', 'Scorsese', 'USA', 68),
       ('David', 'Fincher', 'USA', 100),
       ('Ridley', 'Scott', 'England', 54),
       ('Stanley', 'Kubrick', 'USA', 9),
       ('Clint', 'Eastwood', 'USA', 74),
       ('James', 'Cameron', 'Canada', NULL),
       ('Tim', 'Burton', 'USA', NULL);

SET @num_of_rated_directors = (SELECT COUNT(rating) FROM Directors);

--6
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

SELECT MIN(rating) INTO @min_usa_rating
FROM Directors
WHERE country = 'USA';
SELECT @min_usa_rating min_usa_rating;

SELECT @min_usa_rating := MIN(rating) min_usa_rating
FROM Directors
WHERE country = 'USA';

--7
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

SELECT name, surname, rating INTO @name, @surname, @rating
FROM Directors
WHERE rating = 
    (SELECT MIN(rating) 
     FROM Directors 
     WHERE country = 'USA')
     AND country = 'USA';


/*  
****    10.2    ****
*/

--1
DELIMITER //
CREATE FUNCTION NON_SPACE_CHARACTERS(string TEXT)
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN LENGTH(REPLACE(string, ' ', ''));
END //
DELIMITER ;

--2