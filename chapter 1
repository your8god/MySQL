/*  
****    3.2    ****
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
VALUES ('The Incredibles', 'Brad Bird', 2004),
       ('WALL-E', 'Andrew Stanton', 2008),
       ('Finding Nemo', 'Andrew Stanton', 2003),
       ('Up', 'Pete Docter', 2009),
       ('Ratatouille', 'Brad Bird', 2007);

--1
SELECT title FROM Films;

--2
SELECT release_year, title FROM Films;

--3
SELECT * FROM Films;

--4
SELECT title AS Movie, director AS 'Directed by' FROM Films;

--5
SELECT DISTINCT director FROM Films;

--6
SELECT * FROM Films LIMIT 3;

--7
SELECT * FROM Films LIMIT 1 OFFSET 4;

--8
SELECT * FROM Films LIMIT 1;

--9
SELECT * FROM Films LIMIT 10 OFFSET 1;


/*  
****    3.3    ****
*/

DROP TABLE IF EXISTS Films;
CREATE TABLE Films
(
    id           INT PRIMARY KEY AUTO_INCREMENT,
    title        VARCHAR(20),
    director     VARCHAR(20),
    release_date DATE,
    duration     TIME
);

INSERT INTO Films (title, director, release_date, duration)
VALUES ('The Incredibles', 'Brad Bird', '2004-12-25', '1:45'),
       ('WALL-E', 'Andrew Stanton', '2008-07-03', '1:39'),
       ('Inside Out', 'Pete Docter', '2015-06-19', '1:35'),
       ('The Good Dinosaur', 'Peter Sohn', '2015-11-25', '1:35'),
       ('Ratatouille', 'Brad Bird', '2007-06-28', '1:41');

--1
SELECT title, director, duration 
FROM Films 
ORDER BY duration;

--2
SELECT title 
FROM Films 
ORDER BY 1 DESC;

--3
SELECT title, director, duration 
FROM Films 
ORDER BY 3 DESC;

--4
SELECT title, director, duration
FROM Films
ORDER BY 2, 3 DESC;

--5
SELECT DISTINCT director
FROM Films
ORDER BY 1;

--6
SELECT title, director, duration
FROM Films
ORDER BY 3 DESC
LIMIT 2;

--7
SELECT title, director, release_date
FROM Films
ORDER BY release_date
LIMIT 3;


/*  
****    3.4    ****
*/

DROP TABLE IF EXISTS Films;
CREATE TABLE Films
(
    id           INT PRIMARY KEY AUTO_INCREMENT,
    title        VARCHAR(20),
    director     VARCHAR(20),
    release_year INT,
    running_time INT
);

INSERT INTO Films (title, director, release_year, running_time) 
VALUES ('Toy Story 2', 'John Lasseter', 1999, 93),
       ('WALL-E', 'Andrew Stanton', 2008, 104),
       ('Ratatouille', 'Brad Bird', 2007, 115),
       ('Up', 'Pete Docter', 2009, 101),
       ('Brave', 'Brenda Chapman', 2012, 102),
       ('Monsters University', 'Dan Scanlon', 2013, 110),
       ('Cars 2', 'John Lasseter', 2011, 120),
       ('Finding Nemo', 'Andrew Stanton', 2003, 107),
       ('Toy Story', 'John Lasseter', 1995, 81),
       ('The Incredibles', 'Brad Bird', 2004, 116);

--1
SELECT * 
FROM Films
WHERE title = 'Cars 2';

--2
SELECT title
FROM Films
WHERE director = 'John Lasseter';

--3
SELECT title
FROM Films
WHERE release_year <= 2004
ORDER BY release_year;

--4
SELECT title, release_year
FROM Films
WHERE release_year > 2009
ORDER BY 2 DESC;

--5
SELECT title, running_time
FROM Films
WHERE running_time < 110
ORDER BY running_time;

--6
SELECT title, director
FROM Films
WHERE director != 'Brad Bird'
ORDER BY 2, 1

--7
SELECT title, director, release_year
FROM Films
WHERE release_year BETWEEN 2000 AND 2011
ORDER BY release_year;

--8
SELECT running_time, title
FROM Films
WHERE running_time BETWEEN 90 AND 110
ORDER BY running_time DESC;

--9
SELECT title AS Movie, director AS 'Directed by'
FROM Films
WHERE director IS NOT NULL
ORDER BY 2, 1;


/*  
****    3.5    ****
*/

DROP TABLE IF EXISTS Films;
CREATE TABLE Films
(
    id           INT PRIMARY KEY AUTO_INCREMENT,
    title        VARCHAR(20),
    director     VARCHAR(20),
    release_year INT,
    running_time INT
);

INSERT INTO Films (title, director, release_year, running_time) 
VALUES ('Toy Story 2', 'John Lasseter', 1999, 93),
       ('WALL-E', 'Andrew Stanton', 2008, 104),
       ('Ratatouille', 'Brad Bird', 2007, 115),
       ('Up', 'Pete Docter', 2009, 101),
       ('Brave', 'Brenda Chapman', 2012, 102),
       ('Monsters University', 'Dan Scanlon', 2013, 110),
       ('Cars 2', 'John Lasseter', 2011, 120),
       ('Finding Nemo', 'Andrew Stanton', 2003, 107),
       ('Toy Story', 'John Lasseter', 1995, 81),
       ('The Incredibles', 'Brad Bird', 2004, 116);

--1
SELECT *
FROM Films
WHERE id <= 5 AND running_time > 100;

--2
SELECT title, director, release_year
FROM Films
WHERE director = 'John Lasseter' AND release_year < 2000
ORDER BY release_year;

--3
SELECT title, release_year
FROM Films
WHERE release_year = 1999 OR release_year = 2009
ORDER BY release_year DESC;

--4
SELECT title, running_time
FROM Films
WHERE running_time < 100 OR running_time > 110
ORDER BY 2 DESC;

--5
SELECT title, director, running_time
FROM Films
WHERE director IN ('John Lasseter', 'Andrew Stanton') AND running_time > 100
ORDER BY 2, 1;

--6
SELECT *
FROM Films
WHERE title IN ('WALL-E', 'Up', 'Brave', 'Toy Story')
ORDER BY release_year;

--7
SELECT title, director, release_year
FROM Films
WHERE release_year NOT IN (2004, 2008, 2012)
ORDER BY director, release_year DESC;


/*  
****    3.6    ****
*/

DROP TABLE IF EXISTS Films;
CREATE TABLE Films
(
    id           INT PRIMARY KEY AUTO_INCREMENT,
    title        VARCHAR(40),
    director     VARCHAR(40)
);

INSERT INTO Films (title, director)
VALUES ('Toy Story 3', 'Lee Unkrich'),
       ('Monsters University', 'Dan Scanlon'),
       ('Toy Story 2', 'John Lasseter'),
       ('WALL-E', 'Andrew Stanton'),
       ('Ratatouille', 'Brad Bird'),
       ('Up', 'Pete Docter'),
       ('Brave', 'Brenda Chapman'),
       ('Finding Nemo', 'Andrew Stanton'),
       ('Toy Story', 'John Lasseter'),
       ('The Incredibles', 'Brad Bird');

--1
SELECT title, director
FROM Films
WHERE title LIKE 'Toy Story%'
ORDER BY 1;

--2
SELECT DISTINCT director
FROM Films
WHERE director LIKE 'B%'
ORDER BY director;

--3
SELECT DISTINCT director
FROM Films
WHERE director LIKE '%er'
ORDER BY 1;

--4
SELECT DISTINCT director
FROM Films
WHERE director LIKE '% S%n'
ORDER BY director;

--5
SELECT DISTINCT director
FROM Films
WHERE director LIKE '____ %'
ORDER BY director;

--6
SELECT DISTINCT director
FROM Films
WHERE director LIKE '% _______%'
ORDER BY 1;

--7
SELECT title, director
FROM Films
WHERE NOT title LIKE BINARY '%t%'
ORDER BY title;

--8
SELECT title, director
FROM Films
WHERE title LIKE '_% _%'
ORDER BY title;

--9
SELECT title, director 
FROM Films
WHERE NOT title LIKE '% %'
ORDER BY title;


/*  
****    3.7    ****
*/

DROP TABLE IF EXISTS Films;
CREATE TABLE Films
(
    id        INT PRIMARY KEY AUTO_INCREMENT,
    title     VARCHAR(20),
    director  VARCHAR(20),
    composer  VARCHAR(20),
    rating    DECIMAL(2, 1),
    price     DECIMAL(3, 2),
    purchases INT
);

INSERT INTO Films (title, director, composer, rating, price, purchases)
VALUES ('Venom', 'Ruben Fleischer', 'Ludwig Goransson', 6.9, 4.99, 2143535),
       ('Aladdin', 'Guy Ritchie', 'Alan Menken', 7.3, 3.99, 3253263),
       ('Encanto', 'Jared Bush', 'Germaine Franco', 7.5, 2.99, 451245),
       ('The Witches', 'Robert Zemeckis', 'Alan Silvestri', 5.7, 1.99, 67441),
       ('Blade Runner 2049', 'Denis Villeneuve', 'Benjamin Wallfisch', 7.8, 5.99, 2164214),
       ('Equilibrium', 'Kurt Wimmer', 'Klaus Badelt', 7.9, 5.99, 54124561),
       ('Ready or Not', 'Matthew Bettinelli', 'Brian Tyler', 6.9, 4.99, 541234),
       ('Fast X', 'Louis Leterrier', 'Brian Tyler', 6.1, 3.99, 454113),
       ('John Wick', 'Chad Stahelski', 'Tyler Bates', 7.0, 4.99, 1247322),
       ('Fight Club', 'David Fincher', 'Dust Brothers', 8.7, 5.99, 17641285);

--1
SELECT CONCAT_WS('. ', id, title) AS movie
FROM Films;

--2
SELECT CONCAT_WS('. ', id, title) AS movie, CONCAT('€', price) AS price
FROM Films;

--3
SELECT CONCAT(title, ': ', director, ', ', composer) AS movie_info
FROM Films;

--4
SELECT title, price * purchases AS profit
FROM Films
ORDER BY profit DESC
LIMIT 3;

--5
SELECT title, price * 0.7 AS discount_price
FROM Films
WHERE price * 0.7 < 4
ORDER BY discount_price;

--6
SELECT CONCAT(id, '. ', title) AS movie, 
    CONCAT('€', price * 1.1) AS price_in_eur, 
    CONCAT(rating * 10, '%') AS score
FROM Films
WHERE rating > 7
ORDER BY rating DESC;