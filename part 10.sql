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
WITH helper AS 
(
    SELECT Directors.*,
        DENSE_RANK() OVER (PARTITION BY country ORDER BY rating DESC) AS res
    FROM Directors
)
SELECT full_name, country, rating
FROM helper
WHERE res = 1
ORDER BY 2, 1;

--5
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

WITH helper AS 
(
    SELECT director, COUNT(*) number_of_films
    FROM Films
    GROUP BY director
)
SELECT 
    DENSE_RANK() OVER (ORDER BY number_of_films DESC) place,
    helper.*
FROM helper
ORDER BY 1, 2


SELECT DENSE_RANK() OVER (ORDER BY COUNT(*) DESC) AS place,
       director,
       COUNT(*) AS number_of_films
FROM Films
GROUP BY director
ORDER BY place, director;

--6
SET @size := (SELECT COUNT(*) DIV 3 FROM Directors);
WITH helper AS 
(
    SELECT NTILE(@size) OVER () group_number, rating
    FROM Directors
)
SELECT 
    group_number,
    AVG(rating) avg_rating
FROM helper
GROUP BY group_number
ORDER BY 1 DESC;

--7
SET @size := (SELECT COUNT(*) DIV 2 FROM Directors);
WITH gr AS
(
    SELECT full_name, country, id
        NTILE(@size) OVER () n
    FROM Directors
)
SELECT CONCAT(g1.full_name, ', ', g2.full_name) pair,
    IF(g1.country = g2.country, 'yes', 'no') from_same_country 
FROM gr g1 JOIN gr g2 ON g1.n = g2.n AND g1.id < g2.id;


SELECT COUNT(*) DIV 2 INTO @count_of_groups
FROM Directors;

WITH GroupDirectors AS (
    SELECT Directors.*,
           NTILE(@count_of_groups) OVER (ORDER BY id) AS group_director
    FROM Directors
)

SELECT GROUP_CONCAT(full_name SEPARATOR ', ') AS pair,
       IF(COUNT(DISTINCT country) = 1, 'yes', 'no') AS from_same_country
FROM GroupDirectors
GROUP BY group_director;


/*  
****    11.3    ****
*/

DROP TABLE IF EXISTS Films;
CREATE TABLE Films
(
    id           INT PRIMARY KEY AUTO_INCREMENT,
    title        VARCHAR(20),
    director     VARCHAR(20),
    release_year INT,
    rating INT
);

INSERT INTO Films (title, director, release_year, rating) 
VALUES ('Toy Story 2', 'John Lasseter', 1999, 99),
       ('WALL-E', 'Andrew Stanton', 2008, 100),
       ('Ratatouille', 'Brad Bird', 2007, 87),
       ('Up', 'Pete Docter', 2009, 100),
       ('Brave', 'Brenda Chapman', 2012, 50),
       ('Monsters University', 'Dan Scanlon', 2013, 65),
       ('Cars 2', 'John Lasseter', 2011, 90),
       ('Finding Nemo', 'Andrew Stanton', 2003, 50),
       ('Toy Story', 'John Lasseter', 1995, 78),
       ('The Incredibles', 'Brad Bird', 2004, 81);

--1
SELECT title, director, rating,
    AVG(rating) OVER (PARTITION BY director) avg_rating_by_director
FROM Films
ORDER BY 2, 3;

--2
SELECT title, director, 
    COUNT(*) OVER (PARTITION BY director) - 1 films_with_same_director
FROM Films;   

--3
SELECT title, director,
    IF(release_year IS NULL, 
       COUNT(release_year) OVER () - 1, 
       COUNT(release_year) OVER ()) other_films_without_release_year
FROM Films    

--4
SELECT title, rating,
        ROUND(
        (SUM(rating) OVER () - rating) / (COUNT(*) OVER () - 1)
        ) other_films_avg_rating
FROM Films;        

--5
SELECT title, rating,    
    CONCAT(ROUND(
        (rating / MIN(rating) OVER ()) * 100 - 100
        ), '%') better_than_low_rated_film
FROM Films
ORDER BY 2 DESC ;


/*  
****    11.4    ****
*/

DROP TABLE IF EXISTS Sales;
CREATE TABLE Sales
(
    month INT,
    quantity INT
);

INSERT INTO Sales (month, quantity)
VALUES (1, 180000),
       (2, 210000),
       (3, 195000),
       (4, 245000),
       (5, 200000),
       (6, 230000),
       (7, 275000),
       (8, 215000),
       (9, 250000),
       (10, 265000),
       (11, 220000),
       (12, 290000);

--1
SELECT month,
    AVG(quantity) OVER (ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) avg_quantity
FROM Sales;

--2
SELECT Sales.*,
    COALESCE(
        SUM(quantity) OVER (ROWS BETWEEN 1 PRECEDING AND 1 PRECEDING), 0
    ) prev_month_quantity
FROM Sales;   

--3
SELECT Sales.*,
    SUM(quantity) OVER (ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) total_quantity
FROM Sales; 

--4
SELECT Sales.*,
    AVG(quantity) OVER (ROWS BETWEEN 2 PRECEDING AND 1 PRECEDING) two_prev_months_avg_quantity
FROM Sales
LIMIT 10
OFFSET 2;

--5
WITH helper AS
(
    SELECT Sales.*,
        NTILE(4) OVER () quarter
    FROM Sales
)
SELECT month, quantity,
    SUM(quantity) OVER (PARTITION BY quarter 
                         ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
                         total_quantity_within_quarter
FROM helper;                         

--6
CREATE TABLE Orders
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    date DATE,
    amount INT
);

INSERT INTO Orders (date, amount)
VALUES  ('2024-01-01', 100),
        ('2024-01-02', 200),
        ('2024-01-02', 150),
        ('2024-01-03', 300),
        ('2024-01-04', 75),
        ('2024-01-05', 120),
        ('2024-01-05', 250),
        ('2024-01-05', 180),
        ('2024-01-06', 90),
        ('2024-01-07', 210);

SELECT Orders.*,
    AVG(amount) OVER (ORDER BY date RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) avg_amount
FROM Orders;    

--7
WITH helper as (SELECT Sales.*,
    SUM(quantity) OVER (ORDER BY day 
                        RANGE BETWEEN INTERVAL 1 DAY PRECEDING AND 
                        INTERVAL 1 DAY PRECEDING) diff
FROM Sales)
SELECT day, quantity, 
    CASE
        WHEN diff IS NULL THEN 'unknown'
        WHEN quantity > diff THEN 'yes'
        ELSE 'no'
    END sales_better_than_yesterday
FROM helper;    


/*  
****    11.5    ****
*/