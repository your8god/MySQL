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