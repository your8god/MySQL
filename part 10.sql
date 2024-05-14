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
       (7, 295000),
       (8, 215000),
       (9, 250000),
       (10, 265000),
       (11, 220000),
       (12, 290000);

--1
SELECT Sales.*,
    FIRST_VALUE(month) OVER (ORDER BY quantity DESC)  highest_sales_month
FROM Sales
ORDER BY month;

--2
DROP TABLE IF EXISTS Orders;
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
    ABS(date - FIRST_VALUE(date) OVER (ORDER BY amount)) days_between_cheapest_order
FROM Orders
ORDER BY id;

--3
WITH helper AS (
    SELECT Sales.*,
        NTILE(4) OVER () quarter
    FROM Sales
)    
SELECT month, quantity,
    FIRST_VALUE(month) OVER (PARTITION BY quarter ORDER BY quantity DESC) 
        highest_sales_month_within_quarter,
    MAX(quantity) OVER (PARTITION BY quarter) 
        highest_sales_quantity_within_quarter
FROM helper
ORDER BY 1;

--4
WITH helper AS (
    SELECT Sales.*,
        NTILE(4) OVER () quarter
    FROM Sales
)    
SELECT DISTINCT quarter,
    FIRST_VALUE(month) OVER (PARTITION BY quarter ORDER BY quantity) lowest_sales_month,
    MIN(quantity) OVER (PARTITION BY quarter) lowest_sales_quantity
FROM helper
ORDER BY 1;

--5
WITH helper AS
(
    SELECT DISTINCT date,
        ABS(NTH_VALUE(amount, 1) OVER wnd - NTH_VALUE(amount, 2) OVER wnd) two_first_orders_amount_diff
    FROM Orders
    WINDOW wnd AS (PARTITION BY date ORDER BY date ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
)
SELECT * FROM helper
WHERE two_first_orders_amount_diff IS NOT NULL;

--6
SELECT Sales.*,
    LAG(quantity, 1, 0) OVER (ORDER BY month) prev_month_sales,
    LAG(quantity, 2, 0) OVER (ORDER BY month) second_prev_month_sales
FROM Sales;

--7
SELECT Sales.*,
    LAG(quantity, 3, 0) OVER (ORDER BY month) prev_quarter_month_sales
FROM Sales;    

--8
WITH helper AS 
(
    SELECT Sales.*,
        LAG(quantity, 1, 0) OVER () h
    FROM Sales
)
SELECT month, quantity 
FROM helper
WHERE quantity > h;

--9
SELECT Sales.*,
    ABS(LEAD(quantity) OVER () - quantity) next_month_sales_diff
FROM Sales
LIMIT 11;

--10
WITH helper AS
(
    SELECT Sales.*,
        NTILE(4) OVER () quarter
    FROM Sales
), res_with_null AS
(
    SELECT quarter, 
        (ABS(quantity - LEAD(quantity, 1) OVER sol) +
        ABS(LEAD(quantity, 1) OVER sol - LEAD(quantity, 2) OVER sol)) / 2 sales_avg_diff
    FROM helper
    WINDOW sol AS (PARTITION BY quarter)
)
SELECT * FROM res_with_null
WHERE sales_avg_diff IS NOT NULL;


/*  
****    11.6    ****
*/

--1
DROP TABLE IF EXISTS Rides;
CREATE TABLE Rides
(
    passenger_id INT,
    amount INT,
    requested_on DATETIME
);

INSERT INTO Rides (passenger_id, amount, requested_on)
VALUES (1, 30, '2024-01-01 15:45:00'),
       (2, 25, '2024-02-12 07:00:00'),
       (3, 15, '2024-01-13 10:30:00'),
       (1, 15, '2024-02-08 18:15:00'),
       (1, 35, '2024-02-05 12:15:00'),
       (4, 70, '2024-01-20 11:55:00'),
       (4, 110, '2024-01-01 12:40:00'),
       (4, 25, '2024-02-01 21:30:00'),
       (3, 80, '2024-01-10 23:00:00'),
       (1, 10, '2024-01-02 18:10:00');

WITH helper AS 
(
    SELECT Rides.*,
        ROW_NUMBER() OVER (PARTITION BY passenger_id) n
    FROM Rides
)
SELECT passenger_id, amount, requested_on
FROM helper
WHERE n = 3;

--2
DROP TABLE IF EXISTS Posts;
CREATE TABLE Posts
(
    user_id INT,
    day DATE,
    quantity INT
);

INSERT INTO Posts (user_id, day, quantity)
VALUES (1, '2023-01-01', 5),
       (2, '2023-01-01', 8),
       (3, '2023-01-01', 3),
       (4, '2023-01-01', 12),
       (1, '2023-01-02', 6),
       (3, '2023-01-02', 9),
       (4, '2023-01-02', 4),
       (1, '2023-01-03', 7),
       (4, '2023-01-03', 10),
       (1, '2023-01-04', 2),
       (1, '2023-01-05', 1),
       (4, '2023-01-07', 11),
       (1, '2023-01-07', 8);

SELECT Posts.*,
    AVG(quantity) OVER (
        PARTITION BY user_id ORDER BY day RANGE BETWEEN INTERVAL 2 DAY PRECEDING AND CURRENT ROW
    ) three_day_moving_avg_quantity
FROM Posts;    

--3
DROP TABLE IF EXISTS BoxOffice;
CREATE TABLE BoxOffice
(
    month INT,
    movie VARCHAR(40),
    amount INT
);

INSERT INTO BoxOffice (month, movie, amount)
VALUES (1, 'Scott Pilgrim Vs. The World', 1500),
       (2, 'Scott Pilgrim Vs. The World', 1400),
       (2, 'Logan', 1100),
       (3, 'Scott Pilgrim Vs. The World', 1700),
       (3, 'Logan', 1200),
       (4, 'Scott Pilgrim Vs. The World', 1600),
       (4, 'Spider-Man: Into The Spider-Verse', 2000),
       (4, 'La La Land', 1300),
       (5, 'Spider-Man: Into The Spider-Verse', 2100),
       (6, 'Spider-Man: Into The Spider-Verse', 1800);

WITH helper AS
(
    SELECT movie, amount first_month_box_office,
        ROW_NUMBER() OVER (PARTITION BY movie ORDER BY month) n
    FROM BoxOffice
)
SELECT movie, first_month_box_office
FROM helper
WHERE n = 1;

--4
DROP TABLE IF EXISTS Orders;
CREATE TABLE Orders
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    amount INT,
    purchased_on DATETIME
);

INSERT INTO Orders (customer_id, amount, purchased_on)
VALUES (2, 10, '2024-01-01 08:40:00'),
       (2, 90, '2024-01-01 10:10:00'),
       (1, 500, '2024-01-07 12:00:00'),
       (1, 100, '2024-01-07 18:45:00'),
       (1, 350, '2024-01-07 20:00:00'),
       (3, 110, '2024-02-05 09:00:00'),
       (3, 100, '2024-02-12 08:00:00'),
       (2, 900, '2024-02-12 10:00:00'),
       (3, 1600, '2024-02-12 12:10:00'),
       (3, 75, '2024-02-12 12:20:00');

WITH helper AS (
    SELECT 
        customer_id,    
        DATE(purchased_on) last_order_day,
        COUNT(*) orders_count
    FROM Orders
    GROUP BY 1, 2
    ORDER BY 1
)
SELECT * FROM helper h
WHERE last_order_day = (SELECT MAX(last_order_day) FROM helper 
                        WHERE h.customer_id = customer_id)

--5
DROP TABLE IF EXISTS Payments;
CREATE TABLE Payments
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    card_id INT,
    amount INT,
    completed_on DATETIME
);

INSERT INTO Payments (user_id, card_id, amount, completed_on)
VALUES (1, 1, 100, '2024-01-01 12:00:00'),
       (1, 1, 100, '2024-01-01 12:06:00'),
       (2, 2, 250, '2024-01-02 18:00:00'),
       (3, 1, 50, '2024-01-02 18:05:00'),
       (2, 2, 250, '2024-01-02 18:08:00'),
       (3, 1, 10, '2024-01-03 10:00:00'),
       (3, 1, 10, '2024-01-03 10:10:00'),
       (1, 2, 80, '2024-01-03 10:00:00'),
       (1, 2, 80, '2024-01-03 10:10:01'),
       (4, 1, 200, '2024-01-03 13:00:00');

WITH helper as (
    SELECT
        LAST_VALUE(id) OVER (
            PARTITION BY user_id, card_id, amount ORDER BY completed_on
            RANGE BETWEEN CURRENT ROW AND INTERVAL 10 MINUTE FOLLOWING) repeat_payment_id
    FROM Payments
)
SELECT * FROM helper
GROUP BY 1
HAVING COUNT(*) > 1
ORDER BY 1;

--6
DROP TABLE IF EXISTS Measurements;
CREATE TABLE Measurements
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    result INT,
    received_on DATETIME
);

INSERT INTO Measurements (result, received_on)
VALUES (1100, '2024-01-01 12:00:00'),
       (1000, '2024-01-01 13:00:00'),
       (1300, '2024-01-01 14:00:00'),
       (1200, '2024-01-01 15:00:00'),
       (1100, '2024-01-01 07:00:00'),
       (450, '2024-01-31 08:00:00'),
       (600, '2024-01-31 09:00:00'),
       (650, '2024-01-31 10:00:00'),
       (700, '2024-02-01 07:00:00'),
       (600, '2024-02-01 18:00:00');

WITH helper AS
(
    SELECT result, 
        DATE(received_on) measurement_day,
        ROW_NUMBER() OVER (PARTITION BY DATE(received_on) ORDER BY received_on) nday
    FROM Measurements
)
SELECT 
    measurement_day,
    SUM(IF(nday % 2 != 0, result, 0)) odd_measurements_results_sum,
    SUM(IF(nday % 2 = 0, result, 0)) even_measurements_results_sum
FROM helper
GROUP BY 1;

--7
DROP TABLE IF EXISTS Songs;
CREATE TABLE Songs
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    artist VARCHAR(50),
    title VARCHAR(50)
);

INSERT INTO Songs (artist, title)
VALUES ('Cemeteries', 'Empty Camps'),
       ('Cemeteries', 'Can You Hear Them Sing?'),
       ('CHVRCHES', 'Never Say Die'),
       ('CHVRCHES', 'My Enemy'),
       ('Daughter', 'Home'),
       ('Daughter', 'No Care'),
       ('Wintersleep', 'Metropolis'),
       ('Wintersleep', 'Wind'),
       ('Lana Del Rey', 'Diet Mountain Dew'),
       ('Lana Del Rey', 'Young And Beautiful');
       
DROP TABLE IF EXISTS SongCharts;
CREATE TABLE SongCharts
(
    day DATE,
    place INT,
    song_id INT
);

INSERT INTO SongCharts (day, place, song_id)
VALUES ('2024-01-01', 1, 9),
       ('2024-01-01', 2, 7),
       ('2024-01-01', 3, 8),
       ('2024-01-02', 1, 9),
       ('2024-01-02', 2, 3),
       ('2024-01-02', 3, 8),
       ('2024-01-03', 1, 1),
       ('2024-01-03', 2, 10),
       ('2024-01-03', 3, 6),
       ('2024-01-04', 1, 6),
       ('2024-01-04', 2, 1),
       ('2024-01-04', 3, 9),
       ('2024-01-05', 1, 2),
       ('2024-01-05', 2, 7),
       ('2024-01-05', 3, 5);

WITH helper AS (
    SELECT DISTINCT artist,
        COUNT(*) OVER (PARTITION BY artist) cnt
    FROM Songs JOIN SongCharts ON song_id = id AND place != 3   
)
SELECT artist FROM helper
WHERE cnt = (SELECT MAX(cnt) FROM helper);

--8
DROP TABLE IF EXISTS Orders;
CREATE TABLE Orders
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    category VARCHAR(50),
    product VARCHAR(50),
    amount INT
);

INSERT INTO Orders (category, product, amount)
VALUES ('Electronics', 'iPhone 15', 1000),
       ('Clothing', 'Jeans', 80),
       ('Electronics', 'iPhone 15', 1010),
       ('Electronics', 'iPad Air', 350),
       ('Clothing', 'Sweater', 55),
       ('Electronics', 'iPhone 15', 1050),
       ('Electronics', 'MacBook Pro 14', 1300),
       ('Clothing', 'Sweater', 60),
       ('Electronics', 'iPad Air', 300),
       ('Electronics', 'iPad Air', 300);

WITH helper AS
(
    SELECT category, product, SUM(amount) total_amount,
        ROW_NUMBER() OVER (PARTITION BY category ORDER BY SUM(amount) DESC) n
    FROM Orders
    GROUP BY 1, 2
)
SELECT category, product, total_amount FROM helper
WHERE n < 3;

--9
DROP TABLE IF EXISTS ServerUtilization;
CREATE TABLE ServerUtilization
(
    server_id INT,
    session_status VARCHAR(5),
    status_time DATETIME
);

INSERT INTO ServerUtilization (server_id, session_status, status_time)
VALUES (1, 'start', '2024-01-01 08:00:00'),
       (2, 'start', '2024-01-01 08:00:00'),
       (3, 'start', '2024-01-01 08:00:00'),
       (3, 'stop', '2024-01-02 01:00:00'),
       (1, 'stop', '2024-01-05 07:00:00'),
       (2, 'stop', '2024-01-10 09:00:00'),
       (1, 'start', '2024-01-11 10:00:00'),
       (3, 'start', '2024-01-11 10:00:00'),
       (3, 'stop', '2024-01-11 17:00:00'),
       (1, 'stop', '2024-01-15 10:00:00');

WITH helper AS
(
    SELECT ServerUtilization.*,
        LEAD(status_time) OVER (wnd) next_val,
        ROW_NUMBER() OVER(wnd) n
    FROM ServerUtilization
    WINDOW wnd AS (PARTITION BY server_id ORDER BY status_time)
)

SELECT 
    server_id,
    SUM(TIMESTAMPDIFF(SECOND, status_time, next_val)) DIV (24 * 60 * 60) total_uptime_days 
FROM helper
WHERE n % 2 <> 0

--10
WITH helper AS
(
    SELECT 
        MONTHNAME(purchased_on) month,
        MONTH(purchased_on) n,
        product,
        SUM(amount) total_amount
    FROM Orders
    GROUP BY 1, 2, 3
)
SELECT month, product, total_amount,
    LAG(total_amount) OVER (PARTITION BY product ORDER BY n) nearest_prev_month_total_amount
FROM helper;