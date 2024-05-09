/*  
****    11.1    ****
*/

DROP TABLE IF EXISTS Films;
CREATE TABLE Films
(
    id           INT PRIMARY KEY AUTO_INCREMENT,
    title        VARCHAR(20),
    director     VARCHAR(20),
    release_year INT
);

INSERT INTO Films (title, director, release_year) 
VALUES ('Toy Story 2', 'John Lasseter', 1999),
       ('WALL-E', 'Andrew Stanton', 2008),
       ('Ratatouille', 'Brad Bird', 2007),
       ('Up', 'Pete Docter', 2009),
       ('Brave', 'Brenda Chapman', 2012),
       ('Monsters University', 'Dan Scanlon', 2013),
       ('Cars 2', 'John Lasseter', 2011),
       ('Finding Nemo', 'Andrew Stanton', 2003),
       ('Toy Story', 'John Lasseter', 1995),
       ('The Incredibles', 'Brad Bird', 2004);

--1
 SELECT 
    ROW_NUMBER() OVER (ORDER BY release_year) AS num, 
    title, director, release_year 
FROM Films
ORDER BY num DESC;

--2
SELECT
    (ROW_NUMBER() OVER (ORDER BY release_year DESC) - 1) * 5 AS num,
    title,
    director,
    release_year
FROM Films
ORDER BY num DESC;

--3
SELECT
    ROW_NUMBER() OVER 
        (PARTITION BY director ORDER BY release_year) AS num,
    title, director, release_year
FROM Films
ORDER BY director, num DESC;

--4
DROP TABLE IF EXISTS PrimeNumbers;
CREATE TABLE PrimeNumbers
(
    num INT
);

TRUNCATE PrimeNumbers;
INSERT INTO PrimeNumbers (num)
VALUES (19),
       (7),
       (2),
       (5),
       (23),
       (13),
       (3),
       (17),
       (29),
       (11);

SELECT 
    CONVERT(CHAR(ROW_NUMBER() OVER (ORDER BY num) + 64), CHAR) AS letter, num
FROM PrimeNumbers
ORDER BY num DESC;

--5
SELECT director, title
FROM Films
WHERE release_year = (SELECT MIN(release_year) FROM Films F WHERE Films.director = director);


SELECT director, title FROM
    (SELECT ROW_NUMBER() OVER (PARTITION BY director ORDER BY release_year) AS num,
           title, director
    FROM Films) AS tbl
WHERE num = 1;

--6
SELECT
    ROW_NUMBER() OVER (ORDER BY release_year) AS num, F.*
FROM (SELECT DISTINCT title, director, release_year FROM Films) AS F
ORDER BY num DESC;

--7
DROP TABLE IF EXISTS Numbers;
CREATE TABLE Numbers
(
    num INT
);

INSERT INTO Numbers (num) 
VALUES (1),
       (2),
       (3),
       (5),
       (10),
       (11),
       (15),
       (16),
       (17),
       (18),
       (20);

WITH cur_table AS
(
    SELECT num, ROW_NUMBER() OVER () AS r 
    FROM Numbers
)
SELECT MIN(num) AS start, MAX(num) AS end
FROM cur_table
GROUP BY (num - r);


/*  
****    11.2    ****
*/

DROP TABLE IF EXISTS Directors;
CREATE TABLE Directors
(
    id        INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(40),
    country   VARCHAR(40),
    rating    INT
);

INSERT INTO Directors (full_name, country, rating)
VALUES ('Christopher Nolan', 'England', 90),
       ('Steven Spielberg', 'USA', 79),
       ('Quentin Tarantino', 'USA', 100),
       ('Martin Scorsese', 'USA', 41),
       ('David Fincher', 'USA', 100),
       ('Ridley Scott', 'England', 54),
       ('Stanley Kubrick', 'USA', 79),
       ('Clint Eastwood', 'USA', 74),
       ('James Cameron', 'Canada', 8),
       ('Tim Burton', 'USA', 100);

--1
SELECT 
    DENSE_RANK() OVER (PARTITION BY country ORDER BY rating DESC) AS rank_in_country,
    full_name, country, rating
FROM Directors
ORDER BY country, rank_in_country DESC, id DESC;

--2
WITH rate AS
(
    SELECT full_name, rating,
        DENSE_RANK() OVER (ORDER BY rating DESC) r
    FROM Directors
)
SELECT full_name, rating
FROM rate
WHERE r = 2
ORDER BY full_name;

--3
SELECT * FROM Directors
ORDER BY NTILE(2) OVER () DESC, rating DESC;

--4
--5
--6
--7