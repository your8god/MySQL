/*  
****    11.1    ****
*/

--1
DROP TABLE IF EXISTS Emails;
CREATE TABLE Emails
(
    id    INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(100)
);

TRUNCATE Emails;
INSERT INTO Emails (email)
VALUES ('ugibson@hotmail.com'),
       ('dbuchanan@yahoo.com'),
       ('mayerrachel@hotmail.com'),
       ('loganlee@gmail.com'),
       ('ugibson@hotmail.com'),
       ('loganlee@gmail.com'),
       ('alexandracardenas@gmail.com'),
       ('johnfigueroa@yahoo.com'),
       ('rachel40@hotmail.com'),
       ('loganlee@gmail.com'),
       ('ugibson@hotmail.com'),
       ('alexandracardenas@gmail.com'),
       ('hjordan@yahoo.com'),
       ('katherine22@yahoo.com'),
       ('ugibson@hotmail.com'),
       ('loganlee@gmail.com'),
       ('katherine22@yahoo.com'),
       ('alexandracardenas@gmail.com'),
       ('rodriguezsteven@yahoo.com'),
       ('jmorgan@yahoo.com');

SELECT DISTINCT email FROM Emails;

--2
DROP TABLE IF EXISTS Products;
CREATE TABLE Products
(
    id       INT PRIMARY KEY AUTO_INCREMENT,
    name     VARCHAR(50),
    category VARCHAR(40),
    price    INT
);

TRUNCATE Products;
INSERT INTO Products (name, category, price)
VALUES ('Apple iPhone 13 Pro', 'Electronics', 1099),
       ('Samsung Galaxy S21', 'Electronics', 999),
       ('Sony WH-1000XM4 Headphones', 'Electronics', 299),
       ('Nike Air Zoom Pegasus 38', 'Footwear', 120),
       ('Adidas Ultraboost 21', 'Footwear', 180),
       ('Lenovo ThinkPad X1 Carbon', 'Electronics', 1499),
       ('Dell XPS 13 Laptop', 'Electronics', 1199),
       ('Canon EOS R6 Camera', 'Electronics', 2499),
       ('Bose QuietComfort 35 II', 'Electronics', 299),
       ('Samsung 65-inch QLED TV', 'Electronics', 1499),
       ('LG OLED55CXPUA TV', 'Electronics', 1799),
       ('Apple AirPods Pro', 'Electronics', 249),
       ('Fitbit Versa 3', 'Electronics', 199),
       ('PlayStation 5', 'Electronics', 499),
       ('Xbox Series X', 'Electronics', 499),
       ('Amazon Echo Dot (4th Gen)', 'Electronics', 49),
       ('GoPro HERO9 Black', 'Electronics', 349),
       ('Samsung Galaxy Tab S7', 'Electronics', 649),
       ('Dyson V11 Animal Vacuum', 'Appliances', 599),
       ('Instant Pot Duo 7-in-1', 'Appliances', 89);

SELECT name FROM Products
WHERE category = 'Electronics' AND price < 1000;

--3
DROP TABLE IF EXISTS Patients;
CREATE TABLE Patients
(
    id         INT PRIMARY KEY AUTO_INCREMENT,
    name       VARCHAR(50),
    surname    VARCHAR(50),
    conditions VARCHAR(50) DEFAULT NULL
);

INSERT INTO Patients (name, surname, conditions)
VALUES 
    ('George', 'Clooney', 'YFEV COUGH'),
    ('Paul', 'Krugman', NULL),
    ('Wright', 'BrothersOrville', 'DIAB100 MYOP'),
    ('Ernest', 'Hemingway', 'ACNE DIAB100'),
    ('Roman', 'Abramovich', 'DIAB201'),
    ('Tom', 'Cruise', NULL),
    ('Lech', 'Walesa', 'DIAB100 MYOP'),
    ('Tim', 'Berners', 'ACNE DIAB100'),
    ('Aung', 'San', NULL),
    ('Lance', 'Armstrong', 'YFEV COUGH'),
    ('Shakira', 'Curie', 'DIAB100 MYOP'),
    ('Jon', 'Stewart', 'DIAB201'),
    ('Julie', 'Andrews', 'ACNE DIAB100'),
    ('Florence', 'Nightingale', 'YFEV COUGH'),
    ('Marie', 'Curie', 'DIAB201'),
    ('Stephen', 'Hawking', NULL),
    ('Jimmy', 'Wales', NULL),
    ('Rupert', 'Murdoch', NULL),
    ('Al', 'Gore', 'DIAB100 MYOP'),
    ('Sacha', 'Baron', 'YFEV COUGH');

SELECT name, surname, conditions 
FROM Patients
WHERE conditions LIKE '%DIAB1%';

--4
DROP TABLE IF EXISTS Users;
CREATE TABLE Users
(
    id           INT PRIMARY KEY AUTO_INCREMENT,
    name         VARCHAR(50),
    surname      VARCHAR(50),
    referee_id   INT
);

INSERT INTO Users (name, surname, referee_id)
VALUES ('Lech', 'Walesa', NULL),
       ('Julie', 'Andrews', NULL),
       ('Florence', 'Nightingale', NULL),
       ('Marie', 'Curie', 10),
       ('Stephen', 'Hawking', 3),
       ('Tim', 'Berners', 2),
       ('Aung', 'San', 5),
       ('Lance', 'Armstrong', NULL),
       ('Shakira', 'Curie', 14),
       ('Jon', 'Stewart', NULL),
       ('Wright', 'BrothersOrville', 2),
       ('Ernest', 'Hemingway', 20),
       ('Roman', 'Abramovich', 1),
       ('Tom', 'Cruise', 3),
       ('Rupert', 'Murdoch', 2),
       ('Al', 'Gore', NULL),
       ('Sacha', 'Baron', 2),
       ('George', 'Clooney', NULL),
       ('Paul', 'Krugman', 2),
       ('Jimmy', 'Wales', 2);

SELECT name, surname FROM Users
WHERE referee_id != 2 OR referee_id IS NULL;

--5
DROP TABLE IF EXISTS Countries;

CREATE TABLE Countries
(
    id         INTEGER PRIMARY KEY AUTO_INCREMENT,
    name       VARCHAR(50),
    continent  VARCHAR(50),
    area       INT,
    population INT
);

INSERT INTO Countries (name, continent, area, population)
VALUES ('Russia', 'Europe', 2259755, 20217194),
       ('Iceland', 'Europe', 2000000, 4899198),
       ('India', 'Asia', 977388, 15006874),
       ('Indonesia', 'Asia', 1978388, 29990280),
       ('Iran', 'Asia', 154116, 5159120),
       ('Iraq', 'Asia', 316347, 14528805),
       ('Ireland', 'Europe', 848972, 35421289),
       ('Israel', 'Asia', 1686278, 17751549),
       ('Italy', 'Europe', 829713, 6163666),
       ('Jamaica', 'Americas', 906750, 15000000),
       ('Japan', 'Asia', 1927404, 6591379),
       ('Jersey', 'Europe', 2117703, 35592399),
       ('Jordan', 'Asia', 2066759, 28566620),
       ('Kazakhstan', 'Asia', 2045815, 12355207),
       ('Kenya', 'Africa', 1405874, 20828713),
       ('Kiribati', 'Oceania', 1772875, 21869997),
       ('Kosovo', 'Europe', 280612, 9969562),
       ('Kuwait', 'Asia', 140155, 29354166),
       ('Kyrgyzstan', 'Asia', 291254, 33522371),
       ('Laos', 'Asia', 1489182, 11008866);

SELECT name, continent  FROM Countries
WHERE area > 2000000 OR population > 15000000;

--6
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
VALUES (1, 5, 1, '2023-08-01'),
       (1, 5, 6, '2023-08-02'),
       (1, 5, 3, '2023-08-03'),
       (1, 5, 2, '2023-08-04'),
       (2, 3, 1, '2023-08-04'),
       (2, 3, 6, '2023-08-04'),
       (2, 3, 7, '2023-08-07'),
       (3, 7, 8, '2023-08-08'),
       (4, 7, 1, '2023-08-09'),
       (5, 7, 10, '2023-08-10'),
       (6, 7, 2, '2023-08-10'),
       (7, 5, 4, '2023-08-10'),
       (7, 5, 2, '2023-08-10'),
       (8, 1, 10, '2023-08-14'),
       (8, 1, 3, '2023-08-15'),
       (8, 1, 1, '2023-08-16'),
       (9, 3, 3, '2023-08-17'),
       (9, 3, 10, '2023-08-18'),
       (10, 5, 2, '2023-08-19'),
       (10, 5, 4, '2023-08-20'),
       (10, 5, 10, '2023-08-21'),
       (10, 5, 5, '2023-08-22');

SELECT DISTINCT author_id FROM Views
WHERE author_id = viewer_id;

--7
DROP TABLE IF EXISTS Tweets;
CREATE TABLE Tweets
(
    id      INT PRIMARY KEY AUTO_INCREMENT,
    content VARCHAR(100)
);

TRUNCATE Tweets;
INSERT INTO Tweets (content)
VALUES ('Vote for Biden'),
       ('Let us make America great again!'),
       ('Happy New Year to all those AWS instances of ours!'),
       ('K. Will ligo then off to somewhere. Hahaha aws'),
       ('We are hiring: Technical Lead'),
       ('That’s one small step for man. One giant leap for mankind'),
       ('It is not the strongest species that survive, nor the most intelligent'),
       ('I have a dream!'),
       ('Let`s dance!'),
       ('Time is a waste of money'),
       ('Always forgive your enemies; nothing annoys them so much'),
       ('To live is the rarest thing in the world. Most people exist, that is all'),
       ('I am not young enough to know everything'),
       ('A little sincerity is a dangerous thing, and a great deal of it is absolutely fatal'),
       ('The work is not a wolf, only a wolf, a wolf!'),
       ('Coffee fuels my day.'),
       ('The memory warms you up inside, but it also breaks your soul apart'),
       ('When you start thinking a lot about your past, it becomes your present and you can’t'),
       ('Memories take us back, dreams take us forward'),
       ('Be careful with your thoughts. — they are the beginning of deeds'),
       ('Be careful what you wish for Parker');

SELECT id FROM Tweets
WHERE LENGTH(content) < 21;

--8
DROP TABLE IF EXISTS Products;
CREATE TABLE Products
(
    id   INT PRIMARY KEY,
    name VARCHAR(150)
);

INSERT INTO Products (id, name)
VALUES (21, 'Sony PlayStation 4'),
       (22, 'LG 55-inch OLED TV'),
       (23, 'Nike Air Max 270'),
       (24, 'Bose SoundSport Wireless Earbuds'),
       (25, 'Dell Inspiron 15 Laptop'),
       (26, 'Canon EOS Rebel T7 DSLR Camera'),
       (27, 'Apple iPad Air'),
       (28, 'Samsung 75-inch QLED TV'),
       (29, 'Fitbit Charge 4 Fitness Tracker'),
       (30, 'Sony 65-inch 4K OLED TV'),
       (31, 'Bose SoundLink Revolve+ Bluetooth Speaker'),
       (32, 'Amazon Kindle Paperwhite'),
       (33, 'Sony WH-1000XM3 Noise-Canceling Headphones'),
       (34, 'Microsoft Surface Laptop 4'),
       (35, 'Logitech G Pro X Gaming Headset'),
       (36, 'Apple Watch Series 6'),
       (37, 'Sony Xperia 1 III Smartphone'),
       (38, 'Xbox One X'),
       (39, 'Samsung Galaxy Watch 4'),
       (40, 'DJI Mavic Air 2 Drone');

SELECT id + IF(id MOD 2 = 0, -1, 1) id, name FROM Products
ORDER BY id;

--9
DROP TABLE IF EXISTS Employees;
CREATE TABLE Employees
(
    id      INT PRIMARY KEY AUTO_INCREMENT,
    name    VARCHAR(50),
    surname VARCHAR(50),
    salary  INT
);

INSERT INTO Employees (name, surname, salary)
VALUES ('Lech', 'Walesa', 8923),
       ('Julie', 'Andrews', 4580),
       ('Florence', 'Nightingale', 7546),
       ('Marie', 'Curie', 4839),
       ('Stephen', 'Hawking', 8195),
       ('Tim', 'Berners', 7037),
       ('Aung', 'San', 3162),
       ('Lance', 'Armstrong', 9886),
       ('Shakira', 'Curie', 8056),
       ('Jon', 'Stewart', 6718),
       ('Wright', 'BrothersOrville', 7253),
       ('Ernest', 'Hemingway', 7811),
       ('Roman', 'Abramovich', 8825),
       ('Tom', 'Cruise', 7381),
       ('Rupert', 'Murdoch', 3947),
       ('Al', 'Gore', 3059),
       ('Sacha', 'Baron', 3331),
       ('George', 'Clooney', 3373),
       ('Paul', 'Krugman', 7741),
       ('Jimmy', 'Wales', 3153);

SELECT name, surname,
    IF (LEFT(name, 1) = 'A' AND id MOD 2 = 0, salary, ROUND(salary / 2, 1)) bonus
FROM Employees;

--10
DROP TABLE IF EXISTS Films;
CREATE TABLE Films
(
    id          INT PRIMARY KEY,
    title       VARCHAR(50),
    description VARCHAR(100),
    rating      DECIMAL(3, 1)
);

TRUNCATE Films;
INSERT INTO Films (id, title, description, rating)
VALUES (6, 'The Matrix', 'boring', 8.7),
       (7, 'Inception', 'A mind-bending heist movie', 8.8),
       (8, 'Pulp Fiction', 'A crime masterpiece', 9.0),
       (9, 'The Shawshank', 'A tale of hope and friendship', 9.3),
       (10, 'The Godfather', 'boring', 9.2),
       (11, 'Interstellar', 'A journey through space and time', 8.6),
       (12, 'The Dark Knight', 'The iconic Batman sequel', 9.0),
       (13, 'Fight Club', 'boring', 8.8),
       (14, 'Avatar', 'boring', 7.8),
       (15, 'Gladiator', 'A Roman general seeks revenge', 8.5),
       (16, 'Forrest Gump', 'boring', 8.8),
       (17, 'The Silence', 'boring', 8.6),
       (18, 'The Green Mile', 'boring', 8.6),
       (19, 'The Lord of the Rings', 'Epic fantasy adventure', 8.9),
       (20, 'The Great Gatsby', 'A tale of excess and obsession', 7.2),
       (21, 'Casablanca', 'Classic wartime romance', 8.5),
       (22, 'Eternal Sunshine', 'boring', 8.3),
       (23, 'Shutter Island', 'A mystery thriller', 8.1),
       (24, 'The Grand Budapest Hotel', 'boring', 8.1),
       (25, 'Inglourious Basterds', 'World War II', 8.3);

SELECT title FROM Films
WHERE id MOD 2 = 1 AND description != 'boring'
ORDER BY id DESC;

--11
DROP TABLE IF EXISTS Students;
CREATE TABLE Students
(
    id      INT PRIMARY KEY AUTO_INCREMENT,
    name    VARCHAR(50),
    surname VARCHAR(50)
);

INSERT INTO Students (name, surname)
values ('Rupert', 'murdoch'),
       ('Al', 'Gore'),
       ('saCHa', 'BarON'),
       ('GEORGE', 'clooney'),
       ('paUl', 'KrugGan'),
       ('wright', 'brothersOrville'),
       ('Ernest', 'Hemingway'),
       ('roman', 'Abramovich'),
       ('TOM', 'cruise'),
       ('LecH', 'WAlESA'),
       ('TIM', 'BernERS'),
       ('aung', 'san'),
       ('lance', 'Armstrong'),
       ('ShaKIra', 'cuRie'),
       ('JoN', 'SteWArt'),
       ('juLIE', 'Andrews'),
       ('floRENce', 'NigHTIngale'),
       ('Marie', 'curie'),
       ('Stephen', 'Hawking'),
       ('JiMMy', 'WAlESA');

SELECT id, 
    CONCAT(UPPER(LEFT(name, 1)), LOWER(SUBSTRING(name, 2))) name,
    CONCAT(UPPER(LEFT(surname, 1)), LOWER(SUBSTRING(surname, 2))) surname
FROM Students
ORDER BY id;

--12
DROP TABLE IF EXISTS Triangles;
CREATE TABLE Triangles
(
    x INT,
    y INT,
    z INT
);

INSERT INTO Triangles (x, y, z)
VALUES (31, 12, 68),
       (3, 8, 31),
       (32, 65, 31),
       (57, 92, 90),
       (72, 89, 28),
       (72, 77, 69),
       (0, 0, 0),
       (15, 66, 84),
       (23, 62, 40),
       (14, 50, 7),
       (84, 97, 33),
       (73, 67, 14),
       (67, 96, 75),
       (90, 23, 44),
       (52, 28, 84),
       (33, 14, 71),
       (14, 54, 29),
       (80, 15, 35),
       (28, 34, 85),
       (27, 33, 86);

SELECT *, 
    IF(x + y <= z OR x + z <= y OR y + z <= x, 'no', 'yes') triangle
FROM Triangles;

--13
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Customers;

-- Создание таблицы Customers
CREATE TABLE IF NOT EXISTS Customers
(
    id           INT PRIMARY KEY AUTO_INCREMENT,
    name         VARCHAR(50),
    surname      VARCHAR(50)
);

INSERT INTO Customers (name, surname)
VALUES ('Lech', 'Walesa'),
       ('Julie', 'Andrews'),
       ('Florence', 'Nightingale'),
       ('Marie', 'Curie'),
       ('Stephen', 'Hawking'),
       ('Tim', 'Berners'),
       ('Aung', 'San'),
       ('Lance', 'Armstrong'),
       ('Shakira', 'Curie'),
       ('Jon', 'Stewart'),
       ('Wright', 'BrothersOrville'),
       ('Ernest', 'Hemingway'),
       ('Roman', 'Abramovich'),
       ('Tom', 'Cruise'),
       ('Rupert', 'Murdoch'),
       ('Al', 'Gore'),
       ('Sacha', 'Baron'),
       ('George', 'Clooney'),
       ('Paul', 'Krugman'),
       ('Jimmy', 'Wales');

-- Создание таблицы Orders
CREATE TABLE IF NOT EXISTS Orders
(
    id           INT PRIMARY KEY AUTO_INCREMENT,
    customer_id  INT,
    FOREIGN KEY (customer_id) 
    REFERENCES Customers(id)
);

TRUNCATE Orders;
INSERT INTO Orders (customer_id)
VALUES (16),
       (16),
       (7),
       (15),
       (16),
       (1),
       (3),
       (16),
       (17),
       (18),
       (14),
       (18),
       (7),
       (20),
       (19),
       (17),
       (19),
       (14),
       (10),
       (5);

SELECT name, surname FROM Customers
WHERE id NOT IN (SELECT customer_id FROM Orders);

--14
DROP TABLE IF EXISTS Prices;

CREATE TABLE Prices
(
    id         INT PRIMARY KEY AUTO_INCREMENT,
    product    VARCHAR(100),
    aliexpress DECIMAL(8, 2),
    amazon     DECIMAL(8, 2),
    ebay       DECIMAL(8, 2)
);

INSERT INTO Prices (product, aliexpress, amazon, ebay)
VALUES ('Sony PlayStation 4', 95.00, 100.00, 105.00),
       ('LG 55-inch OLED TV', 70.00, NULL, 80.00),
       ('Nike Air Max 270', 120.00, 115.50, 125.00),
       ('Bose SoundSport Wireless Earbuds', 45.50, 50.00, NULL),
       ('Dell Inspiron 15 Laptop', 60.00, NULL, 62.50),
       ('Canon EOS Rebel T7 DSLR Camera', NULL, 75.00, 78.00),
       ('Apple iPad Air', 88.50, 90.00, 92.00),
       ('Samsung 75-inch QLED TV', 105.00, NULL, 110.50),
       ('Fitbit Charge 4 Fitness Tracker', NULL, 40.00, 42.50),
       ('Sony 65-inch 4K OLED TV', 35.00, NULL, 38.00),
       ('Bose SoundLink Revolve+ Bluetooth Speak', 95.50, 100.50, 97.00),
       ('Amazon Kindle Paperwhite', 80.00, NULL, 85.00),
       ('Sony WH-1000XM3 Noise-Canceling Headpho', 112.00, 115.00, NULL),
       ('Microsoft Surface Laptop 4', 58.50, NULL, 60.00),
       ('Logitech G Pro X Gaming Headset', 72.00, 74.50, 75.50),
       ('Apple Watch Series 6', NULL, 90.00, 92.50),
       ('Sony Xperia 1 III Smartphone', 102.00, NULL, 105.00),
       ('Xbox One X', 38.50, 40.00, 42.00),
       ('Samsung Galaxy Watch 4', 28.00, NULL, 30.50),
       ('DJI Mavic Air 2 Drone', 67.00, 69.50, NULL);

SELECT product, 'aliexpress' store, aliexpress price
FROM Prices
WHERE aliexpress IS NOT NULL
UNION ALL
SELECT product, 'amazon' store, amazon price
FROM Prices
WHERE amazon IS NOT NULL
UNION ALL
SELECT product, 'ebay' store, ebay price
FROM Prices
WHERE ebay IS NOT NULL;


/*  
****    11.2    ****
*/

--1
DROP TABLE IF EXISTS Salary;
DROP TABLE IF EXISTS Employees;

-- Создание таблицы Employees
CREATE TABLE Employees
(
    id      INT PRIMARY KEY AUTO_INCREMENT,
    name    VARCHAR(50),
    surname VARCHAR(50)
);

INSERT INTO Employees (name, surname)
VALUES ('Lech', 'Walesa'),
       ('Julie', 'Andrews'),
       ('Florence', 'Nightingale'),
       ('Marie', 'Curie'),
       ('Stephen', 'Hawking'),
       ('Tim', 'Berners'),
       ('Aung', 'San'),
       ('Lance', 'Armstrong'),
       ('Shakira', 'Curie'),
       ('Jon', 'Stewart'),
       ('Wright', 'BrothersOrville'),
       ('Ernest', 'Hemingway'),
       ('Roman', 'Abramovich'),
       ('Tom', 'Cruise'),
       ('Rupert', 'Murdoch'),
       ('Al', 'Gore'),
       ('Sacha', 'Baron'),
       ('George', 'Clooney'),
       ('Paul', 'Krugman'),
       ('Jimmy', 'Wales');

-- Создание таблицы Salary
CREATE TABLE Salary
(
    employee_id INT,
    salary      INT,
    FOREIGN KEY (employee_id) REFERENCES Employees (id)
);

INSERT INTO Salary (employee_id, salary)
VALUES (3, 1500),
       (1, 1800),
       (8, 3200),
       (2, 1100),
       (5, 2400),
       (14, 3800),
       (11, 1200),
       (20, 5000),
       (6, 3000),
       (9, 1900),
       (17, 5400);

SELECT name, surname, salary 
FROM Employees LEFT JOIN Salary ON id = employee_id;

--2
DROP TABLE IF EXISTS Sales;
DROP TABLE IF EXISTS Visits;

-- Создание таблицы Visits
CREATE TABLE Visits
(
    id          INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT
);

INSERT INTO Visits (id, customer_id)
VALUES (1, 23),
       (2, 9),
       (4, 30),
       (5, 54),
       (6, 96),
       (7, 54),
       (8, 54),
       (9, 23),
       (10, 9),
       (11, 30),
       (12, 54),
       (13, 96),
       (14, 54),
       (15, 54),
       (16, 23),
       (17, 9),
       (18, 30),
       (19, 54),
       (20, 54);

-- Создание таблицы Sales
CREATE TABLE Sales
(
    id       INT PRIMARY KEY,
    visit_id INT,
    amount   INT,
    FOREIGN KEY (visit_id) REFERENCES Visits (id)
);

TRUNCATE Sales;
INSERT INTO Sales (id, visit_id, amount)
VALUES (3, 5, 300),
       (9, 5, 200),
       (13, 2, 970),
       (21, 5, 150),
       (23, 7, 350),
       (24, 8, 200),
       (25, 9, 310),
       (28, 12, 650),
       (30, 14, 590),
       (31, 15, 390),
       (32, 16, 270),
       (33, 17, 150),
       (34, 18, 420),
       (35, 19, 330);

SELECT customer_id, COUNT(*) count_no_trans
FROM Visits LEFT JOIN Sales ON Visits.id = visit_id
WHERE visit_id IS NULL
GROUP BY customer_id;

--3
DROP TABLE IF EXISTS Weather;
CREATE TABLE Weather
(
    record_date DATE,
    temperature INT
);

TRUNCATE Weather;
INSERT INTO Weather (record_date, temperature)
VALUES ('2023-08-31', 14),
       ('2023-08-16', 10),
       ('2023-08-17', 22),
       ('2023-09-04', 19),
       ('2023-08-21', 28),
       ('2023-09-08', 13),
       ('2023-08-20', 26),
       ('2023-08-30', 16),
       ('2023-08-23', 20),
       ('2023-08-26', 13),
       ('2023-09-10', 19),
       ('2023-09-07', 18),
       ('2023-08-12', 11),
       ('2023-09-05', 15),
       ('2023-08-13', 16),
       ('2023-08-19', 27),
       ('2023-09-03', 15),
       ('2023-09-09', 30),
       ('2023-08-18', 17),
       ('2023-09-06', 23),
       ('2023-08-25', 26),
       ('2023-08-29', 29),
       ('2023-08-14', 17),
       ('2023-08-24', 21),
       ('2023-09-02', 10),
       ('2023-08-15', 15),
       ('2023-08-22', 25),
       ('2023-09-01', 17),
       ('2023-08-28', 29),
       ('2023-08-27', 26);

SELECT W1.record_date
FROM Weather W1 JOIN Weather W2 ON W1.record_date = W2.record_date + INTERVAL 1 DAY
WHERE W1.temperature > W2.temperature;

--4
DROP TABLE IF EXISTS Salary;
DROP TABLE IF EXISTS Employees;

-- Создание таблицы Employees
CREATE TABLE Employees
(
    id      INT PRIMARY KEY AUTO_INCREMENT,
    name    VARCHAR(50),
    surname VARCHAR(50)
);

INSERT INTO Employees (name, surname)
VALUES ('Lech', 'Walesa'),
       ('Julie', 'Andrews'),
       ('Florence', 'Nightingale'),
       ('Marie', 'Curie'),
       ('Stephen', 'Hawking'),
       ('Tim', 'Berners'),
       ('Aung', 'San'),
       ('Lance', 'Armstrong'),
       ('Shakira', 'Curie'),
       ('Jon', 'Stewart'),
       ('Wright', 'BrothersOrville'),
       ('Ernest', 'Hemingway'),
       ('Roman', 'Abramovich'),
       ('Tom', 'Cruise'),
       ('Rupert', 'Murdoch'),
       ('Al', 'Gore'),
       ('Sacha', 'Baron'),
       ('George', 'Clooney'),
       ('Paul', 'Krugman'),
       ('Jimmy', 'Wales');

-- Создание таблицы Salary
CREATE TABLE Salary
(
    employee_id INT,
    salary      INT,
    FOREIGN KEY (employee_id) REFERENCES Employees (id)
);

INSERT INTO Salary (employee_id, salary)
VALUES (3, 1500),
       (1, 1800),
       (8, 3200),
       (2, 1100),
       (5, 2400),
       (14, 3800),
       (11, 1200),
       (20, 5000),
       (6, 2000),
       (9, 1900),
       (17, 5400);

SELECT name, surname, salary
FROM Employees LEFT JOIN Salary ON id = employee_id
WHERE salary IS NULL OR salary < 2000;

--5
DROP TABLE IF EXISTS TVProgram;
DROP TABLE IF EXISTS Content;

-- Создание таблицы Content
CREATE TABLE Content
(
    id           INT PRIMARY KEY AUTO_INCREMENT,
    title        VARCHAR(50),
    kids_content VARCHAR(20),
    content_type VARCHAR(20)
);

INSERT INTO Content (title, kids_content, content_type)
VALUES ('Hells Kitchen', 'no', 'tv-show'),
       ('The last Hero', 'no', 'tv-show'),
       ('Brave', 'yes', 'movie'),
       ('Toy Story 2', 'yes', 'movie'),
       ('News', 'no', 'news'),
       ('The Simpsons', 'yes', 'series'),
       ('Irish', 'no', 'movie'),
       ('The Incredibles', 'yes', 'movie'),
       ('Buzz Lightyear', 'yes', 'movie');

-- Создание таблицы TVProgram
CREATE TABLE TVProgram
(
    program_date DATETIME,
    content_id   INT,
    channel      VARCHAR(40),
    FOREIGN KEY (content_id) REFERENCES Content (id)
);

TRUNCATE TVProgram;
INSERT INTO TVProgram
VALUES ('2023-08-01 08:00', 6, 'NTV'),
       ('2022-09-23 23:00', 2, 'Disney'),
       ('2023-09-18 12:00', 1, 'NTV'),
       ('2023-09-03 16:00', 2, 'Disney'),
       ('2023-08-01 00:00', 9, 'Disney'),
       ('2023-08-17 19:00', 7, 'NTV'),
       ('2022-10-27 08:00', 5, 'NTV'),
       ('2022-08-14 00:00', 4, 'Disney'),
       ('2023-10-04 13:00', 6, 'Disney'),
       ('2023-09-19 10:00', 2, 'NTV'),
       ('2023-08-30 03:00', 6, 'NTV'),
       ('2023-12-13 04:00', 1, 'Disney'),
       ('2023-09-01 00:00', 8, 'Disney'),
       ('2023-10-26 19:00', 6, 'NTV'),
       ('2022-10-02 14:00', 2, 'Disney'),
       ('2023-08-31 16:00', 3, 'NTV'),
       ('2022-10-21 20:00', 2, 'Disney'),
       ('2023-09-28 13:00', 1, 'NTV'),
       ('2022-08-17 08:00', 4, 'NTV'),
       ('2023-08-04 09:00', 5, 'Disney'),
       ('2022-09-26 07:00', 4, 'NTV'),
       ('2023-08-17 01:00', 7, 'Disney');

SELECT DISTINCT title FROM Content
JOIN TVProgram ON id = content_id
WHERE kids_content = 'yes' 
    AND content_type = 'movie'
    AND MONTH(program_date) = 8
    AND YEAR(program_date) = 2023;

--6
DROP TABLE IF EXISTS Addresses;
DROP TABLE IF EXISTS Persons;

-- Создание таблицы Persons
CREATE TABLE Persons
(
    id      INT PRIMARY KEY AUTO_INCREMENT,
    name    VARCHAR(20),
    surname VARCHAR(20)
);

INSERT INTO Persons (name, surname)
VALUES ('Steven', 'Randall'),
       ('Veronica', 'Lee'),
       ('Mark', 'Smith'),
       ('Monica', 'Clark'),
       ('Michelle', 'Barnett'),
       ('Jessica', 'Garcia'),
       ('Raymond', 'Andrews'),
       ('Patrick', 'Garcia'),
       ('Nancy', 'Harris'),
       ('Kristina', 'Mcneil'),
       ('Norma', 'Hansen'),
       ('Eduardo', 'Garcia'),
       ('Jonathan', 'Kemp'),
       ('James', 'Garcia'),
       ('Sherry', 'Chase'),
       ('Christopher', 'Davis'),
       ('Earl', 'Collins'),
       ('Eric', 'Mclaughlin'),
       ('Rhonda', 'Sanchez'),
       ('Alexandria', 'Brown');

-- Создание таблицы Addresses
CREATE TABLE Addresses
(
    person_id INT,
    city      VARCHAR(20),
    state     VARCHAR(20),
    FOREIGN KEY (person_id) REFERENCES Persons (id)
);

INSERT INTO Addresses (person_id, city, state)
VALUES (1, 'New York city', 'New York'),
       (3, 'London', 'Greater London'),
       (4, 'North Ericland', 'Texas'),
       (5, 'Tokyo', 'Tokyo'),
       (8, 'Paris', 'Ile-de-France'),
       (16, 'Sydney', 'New South Wales'),
       (17, 'Rome', 'Lazio'),
       (18, 'Moscow', 'Moscow region'),
       (19, 'Dubai', 'Dubai Emirate'),
       (20, 'Rio de Janeiro', 'Rio de Janeiro');

SELECT name, surname, city, state 
FROM Persons LEFT JOIN Addresses ON person_id = id;

--7
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Sellers;
DROP TABLE IF EXISTS Customers;

-- Создание таблицы Customers
CREATE TABLE Customers
(
    id   INT PRIMARY KEY,
    name VARCHAR(20)
);

INSERT INTO Customers (id, name)
VALUES (101, 'Steven'),
       (102, 'Laura'),
       (103, 'Jordan'),
       (104, 'Thomas'),
       (105, 'Anne'),
       (106, 'Robin'),
       (107, 'Sean'),
       (108, 'Michael'),
       (109, 'Raymond'),
       (110, 'Chad');

-- Создание таблицы Sellers
CREATE TABLE Sellers

(
    id   INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(20)
);

INSERT INTO Sellers (name)
VALUES ('Deanna'),
       ('Danielle'),
       ('Jennifer'),
       ('Matthew'),
       ('Bonnie'),
       ('John');

-- Создание таблицы Orders
CREATE TABLE Orders
(
    id          INT PRIMARY KEY AUTO_INCREMENT,
    sale_date   DATE,
    order_cost  DECIMAL,
    customer_id INT,
    seller_id   INT,
    FOREIGN KEY (customer_id) REFERENCES Customers (id),
    FOREIGN KEY (seller_id) REFERENCES Sellers (id)
);

TRUNCATE Orders;
INSERT INTO Orders (sale_date, order_cost, customer_id, seller_id)
VALUES ('2023-01-15', 100, 101, 1),
       ('2023-02-20', 75, 102, 2),
       ('2023-03-10', 200, 103, 1),
       ('2022-04-05', 50, 104, 3),
       ('2023-05-12', 300, 105, 4),
       ('2022-06-25', 120, 106, 5),
       ('2023-07-08', 80, 107, 2),
       ('2022-08-15', 150, 108, 3),
       ('2022-09-20', 90, 109, 4),
       ('2022-10-10', 70, 110, 1),
       ('2022-11-30', 180, 101, 2),
       ('2022-12-15', 40, 102, 3),
       ('2023-01-25', 250, 103, 4),
       ('2022-02-10', 110, 104, 5),
       ('2023-03-08', 65, 105, 1),
       ('2023-04-14', 95, 106, 2),
       ('2022-05-02', 140, 107, 3),
       ('2023-06-19', 75, 108, 4),
       ('2022-07-27', 220, 109, 5),
       ('2023-08-05', 180, 110, 1);

SELECT DISTINCT name FROM Sellers S
WHERE 2023 NOT IN 
    (SELECT IFNULL(YEAR(sale_date), 0) FROM Sellers
    LEFT JOIN Orders ON Sellers.id = seller_id 
    WHERE S.name = Sellers.name)
ORDER BY name;

--8
DROP TABLE IF EXISTS Rides;
DROP TABLE IF EXISTS Users;

-- Создание таблицы Users
CREATE TABLE Users
(
    id       INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(20)
);

INSERT INTO Users (username)
VALUES ('wwalker'),
       ('william56'),
       ('johnsonmichael'),
       ('matthew86'),
       ('phillipstimothy'),
       ('mtrujillo'),
       ('amanda32'),
       ('sampsonkimberly'),
       ('tammy53'),
       ('cartervictoria');

-- Создание таблицы Rides
CREATE TABLE Rides
(
    id       INT PRIMARY KEY AUTO_INCREMENT,
    user_id  INT,
    distance INT
);

INSERT INTO Rides (user_id, distance)
VALUES (4, 4544),
       (1, 3330),
       (5, 1149),
       (9, 3480),
       (4, 1830),
       (8, 4239),
       (1, 1773),
       (8, 4063),
       (2, 1361),
       (4, 4503),
       (5, 2420),
       (2, 3006),
       (1, 3724),
       (4, 1554),
       (8, 3917),
       (6, 1377),
       (5, 4593),
       (1, 4511),
       (1, 3640),
       (6, 2556),
       (6, 2285),
       (1, 2977),
       (8, 2007),
       (9, 2629);

SELECT username, IFNULL(SUM(distance), 0) travelled_distance
FROM Users LEFT JOIN Rides ON user_id = Users.id
GROUP BY username
ORDER BY 2 DESC, 1;

--9
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Sellers;
DROP TABLE IF EXISTS Customers;

-- Создание таблицы Customers
CREATE TABLE Customers
(
    id   INT PRIMARY KEY,
    name VARCHAR(20)
);

INSERT INTO Customers (id, name)
VALUES (101, 'Steven'),
       (102, 'Laura'),
       (103, 'Jordan'),
       (104, 'Thomas'),
       (105, 'Anne'),
       (106, 'Robin'),
       (107, 'Sean'),
       (108, 'Michael'),
       (109, 'Raymond'),
       (110, 'Chad');

-- Создание таблицы Sellers
CREATE TABLE Sellers
(
    id   INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(20)
);

INSERT INTO Sellers (name)
VALUES ('Deanna'),
       ('Danielle'),
       ('Bonnie'),
       ('Matthew'),
       ('Jennifer'),
       ('John');

-- Создание таблицы Orders
CREATE TABLE Orders
(
    id          INT PRIMARY KEY AUTO_INCREMENT,
    order_cost  DECIMAL,
    customer_id INT,
    seller_id   INT,
    FOREIGN KEY (customer_id) REFERENCES Customers (id),
    FOREIGN KEY (seller_id) REFERENCES Sellers (id)
);

TRUNCATE Orders;
INSERT INTO Orders (order_cost, customer_id, seller_id)
VALUES (100, 101, 1),
       (75, 102, 2),
       (200, 103, 1),
       (50, 104, 3),
       (300, 105, 4),
       (120, 106, 5),
       (80, 107, 2),
       (150, 108, 3),
       (90, 109, 4),
       (70, 110, 1),
       (180, 101, 2),
       (40, 102, 3),
       (250, 103, 4),
       (110, 104, 5),
       (65, 105, 1),
       (95, 106, 2),
       (140, 107, 3),
       (75, 108, 4),
       (220, 109, 5),
       (180, 110, 1);

SELECT DISTINCT name FROM Customers
WHERE 'Bonnie' NOT IN 
    (SELECT S.name FROM Customers C
    LEFT JOIN Orders O ON customer_id = C.id
    LEFT JOIN Sellers S ON S.id = seller_id
    WHERE customer_id = Customers.id);

--10
DROP TABLE IF EXISTS Confirmations;
DROP TABLE IF EXISTS Customers;

-- Создание таблицы Customers
CREATE TABLE Customers
(
    id   INT PRIMARY KEY,
    name VARCHAR(20)
);

INSERT INTO Customers (id, name)
VALUES (101, 'Steven'),
       (102, 'Laura'),
       (103, 'Jordan'),
       (104, 'Thomas'),
       (105, 'Anne'),
       (106, 'Robin'),
       (107, 'Sean'),
       (108, 'Michael'),
       (109, 'Raymond'),
       (110, 'Chad');

-- Создание таблицы Confirmations
CREATE TABLE Confirmations
(
    customer_id INT,
    order_id    INT,
    status      ENUM ('confirmed', 'declined')
);

TRUNCATE Confirmations;
INSERT INTO Confirmations (customer_id, order_id, status)
VALUES (102, 3, 'confirmed'),
       (107, 8, 'confirmed'),
       (102, 1, 'confirmed'),
       (106, 6, 'declined'),
       (103, 7, 'confirmed'),
       (102, 9, 'confirmed'),
       (109, 1, 'confirmed'),
       (105, 4, 'declined'),
       (106, 1, 'confirmed'),
       (109, 10, 'confirmed'),
       (104, 4, 'confirmed'),
       (106, 2, 'declined'),
       (104, 5, 'declined'),
       (105, 4, 'confirmed'),
       (110, 8, 'confirmed'),
       (104, 3, 'declined'),
       (105, 5, 'confirmed'),
       (109, 7, 'confirmed'),
       (109, 3, 'declined'),
       (110, 2, 'declined'),
       (104, 6, 'confirmed'),
       (107, 9, 'confirmed'),
       (110, 9, 'confirmed'),
       (110, 5, 'declined'),
       (103, 5, 'declined'),
       (109, 4, 'confirmed'),
       (103, 4, 'confirmed'),
       (110, 4, 'declined'),
       (103, 4, 'declined'),
       (105, 7, 'confirmed');

WITH info AS 
(
    SELECT Customers.*, Confirmations.* 
    FROM Customers LEFT JOIN Confirmations
    ON id = customer_id
)
SELECT id, 
    ROUND(IFNULL(
    (SELECT COUNT(*) FROM info WHERE Customers.id = id AND status = 'confirmed') /
    (SELECT COUNT(*) FROM info WHERE Customers.id = id), 0), 2) 
    confirmation_rate
FROM Customers

--=========
SELECT Customers.id,
       IFNULL(ROUND(SUM(status='confirmed') / COUNT(status), 2), 0) AS confirmation_rate
FROM Customers
LEFT JOIN Confirmations ON customer_id = Customers.id
GROUP BY Customers.id
--========

--11
DROP TABLE IF EXISTS Activity;
CREATE TABLE Activity
(
    machine_id    INT,
    process_id    INT,
    activity_type ENUM ('start','end'),
    timestamp     FLOAT
);

TRUNCATE Activity;
INSERT INTO Activity (machine_id, process_id, activity_type, timestamp)
VALUES (1, 2, 'start', 0.712),
       (1, 2, 'end', 1.520),
       (1, 3, 'start', 3.140),
       (1, 3, 'end', 4.120),
       (2, 4, 'start', 0.550),
       (2, 4, 'end', 1.550),
       (2, 5, 'start', 0.430),
       (2, 5, 'end', 1.420),
       (3, 6, 'start', 4.100),
       (3, 6, 'end', 4.512),
       (4, 7, 'start', 2.500),
       (4, 7, 'end', 5.000),
       (4, 8, 'start', 1.200),
       (4, 8, 'end', 3.800),
       (4, 9, 'start', 0.900),
       (4, 9, 'end', 2.300),
       (5, 10, 'start', 0.750),
       (5, 10, 'end', 3.750),
       (6, 11, 'start', 2.300),
       (6, 11, 'end', 4.900);

SELECT A1.machine_id, 
    ROUND(SUM(A2.timestamp - A1.timestamp) / COUNT(*), 3) processing_time 
FROM Activity A1 JOIN Activity A2
ON A1.process_id = A2.process_id AND A1.activity_type = 'start' AND A2.activity_type = 'end'
GROUP BY A1.machine_id;

SELECT A1.machine_id, 
    ROUND(AVG(A2.timestamp - A1.timestamp), 3) processing_time 
FROM Activity A1 JOIN Activity A2
ON A1.process_id = A2.process_id AND A1.activity_type = 'start' AND A2.activity_type = 'end'
GROUP BY A1.machine_id;

--12
DROP TABLE IF EXISTS Expressions;
DROP TABLE IF EXISTS Variables;

-- Создание таблицы Variables
CREATE TABLE Variables
(
    name  CHAR(1),
    value INT
);

INSERT INTO Variables (name, value)
VALUES ('a', 1348),
       ('b', 842);


-- Создание таблицы Expressions
CREATE TABLE Expressions
(
    left_operand  CHAR(1),
    operator      CHAR(1),
    right_operand CHAR(1)
);

INSERT INTO Expressions (left_operand, operator, right_operand)
VALUES ('a', '<', 'b'),
       ('a', '>', 'b'),
       ('a', '=', 'b'),
       ('b', '>', 'a'),
       ('b', '=', 'a'),
       ('b', '<', 'a'),
       ('a', '=', 'a'),
       ('b', '=', 'b'),
       ('b', '>', 'b'),
       ('a', '<', 'a');

SELECT left_operand, operator, right_operand,
    IF(
        CASE 
            WHEN operator = '<' THEN (L.value < R.value)
            WHEN operator = '>' THEN (L.value > R.value)
            ELSE (L.value = R.value)
        END = 1, 'true', 'false') AS value
FROM Variables L
JOIN Expressions ON name = left_operand
JOIN Variables R ON name = right_operand;

--13
DROP TABLE IF EXISTS Matches;
DROP TABLE IF EXISTS Teams;

-- Создание таблицы Teams
CREATE TABLE Teams
(
    id   INT PRIMARY KEY,
    name VARCHAR(30)
);

INSERT INTO Teams (id, name)
VALUES (10, 'Manchester United'),
       (20, 'Liverpool FC'),
       (30, 'Chelsea FC'),
       (40, 'Arsenal FC'),
       (50, 'Manchester City'),
       (60, 'Tottenham Hotspur'),
       (70, 'Everton FC'),
       (80, 'Leicester City'),
       (90, 'West Ham United'),
       (100,'Aston Villa FC');

-- Создание таблицы Matches
CREATE TABLE Matches
(
    id          INT PRIMARY KEY,
    host_team   INT,
    guest_team  INT,
    host_goals  INT,
    guest_goals INT
);

TRUNCATE Matches;
INSERT INTO Matches (id, host_team, guest_team, host_goals, guest_goals)
VALUES (11, 10, 20, 2, 4),
       (5, 10, 30, 4, 4),
       (19, 20, 80, 2, 1),
       (21, 20, 40, 3, 4),
       (22, 20, 10, 1, 4),
       (1, 30, 60, 0, 2),
       (14, 30, 80, 4, 2),
       (4, 40, 50, 4, 3),
       (12, 40, 60, 2, 3),
       (7, 50, 60, 2, 0),
       (10, 50, 30, 4, 0),
       (3, 50, 20, 4, 1),
       (13, 60, 80, 0, 3),
       (16, 60, 70, 2, 1),
       (17, 60, 90, 2, 0),
       (24, 70, 10, 0, 2),
       (2, 70, 30, 0, 4),
       (9, 70, 90, 3, 4),
       (18, 80, 10, 0, 2),
       (15, 80, 30, 0, 1),
       (8, 80, 60, 2, 2),
       (23, 80, 70, 4, 0),
       (20, 90, 60, 3, 3),
       (6, 100, 80, 3, 2),
       (25, 100, 40, 3, 2);

WITH AllGames(team, result) AS
(
    SELECT host_team,  
        CASE 
            WHEN host_goals < guest_goals THEN 0
            WHEN host_goals > guest_goals THEN 3
            ELSE 1
        END
    FROM Matches
    UNION ALL
        SELECT guest_team,  
        CASE 
            WHEN host_goals > guest_goals THEN 0
            WHEN host_goals < guest_goals THEN 3
            ELSE 1
        END
    FROM Matches
)
SELECT name, SUM(result) num_points
FROM AllGames JOIN Teams ON id = team
GROUP BY name
ORDER BY 2 DESC, 1;


/*  
****    11.3    ****
*/

--1
DROP TABLE IF EXISTS Tree;
CREATE TABLE Tree
(
    id   INT PRIMARY KEY,
    p_id INT
);

TRUNCATE Tree;
INSERT INTO Tree (id, p_id)
VALUES (8, NULL),
       (3, 8),
       (10, 8),
       (1, 3),
       (6, 3),
       (14, 10),
       (4, 6),
       (7, 6),
       (13, 14);

SELECT id, 
    CASE 
        WHEN p_id IS NULL THEN 'Root'
        WHEN id IN (SELECT p_id FROM Tree) THEN 'Inner'
        ELSE 'Leaf'
    END AS type
FROM Tree;

--2
DROP TABLE IF EXISTS Students;
DROP TABLE IF EXISTS Departments;

-- Создание таблицы Departments
CREATE TABLE Departments
(
    id   INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL
);

INSERT INTO Departments (name)
VALUES ('Electrical Engineering'),
       ('Computer Engineering'),
       ('Business Administration'),
       ('Physics'),
       ('Mathematics'),
       ('Chemistry'),
       ('Biology'),
       ('History'),
       ('Psychology'),
       ('Sociology'),
       ('Economics'),
       ('Political Science'),
       ('Literature'),
       ('Fine Arts'),
       ('Music'),
       ('Physical Education'),
       ('Philosophy'),
       ('Languages'),
       ('Geography'),
       ('Environmental Science');

-- Создание таблицы Students
CREATE TABLE Students
(
    id            INT PRIMARY KEY AUTO_INCREMENT,
    name          VARCHAR(50) NOT NULL,
    surname       VARCHAR(50) NOT NULL,
    department_id INT
);

TRUNCATE Students;
INSERT INTO Students (name, surname, department_id)
VALUES ('Alice', 'Johnson', 1),
       ('Bob', 'Smith', 2),
       ('Carol', 'Williams', 1),
       ('David', 'Brown', 4),
       ('Eve', 'Jones', 2),
       ('Frank', 'Davis', 6),
       ('Grace', 'Miller', 3),
       ('Henry', 'Wilson', 8),
       ('Irene', 'Lee', 2),
       ('Jack', 'Hall', 10),
       ('Kate', 'Harris', 1),
       ('Leo', 'White', 2),
       ('Mary', 'Clark', 1),
       ('Nathan', 'Turner', 3),
       ('Olivia', 'King', 2),
       ('Peter', 'Scott', 1),
       ('Rachel', 'Green', 3),
       ('Sam', 'Taylor', 1332),
       ('Tom', 'Wood', 2),
       ('Vanessa', 'Baker', 777);

SELECT S.name, surname FROM Students S
LEFT JOIN Departments D ON D.id = department_id
WHERE D.id IS NULL;

--3
DROP TABLE IF EXISTS Salaries;
CREATE TABLE Salaries
(
    id     INT PRIMARY KEY AUTO_INCREMENT,
    salary INT
);

TRUNCATE Salaries;
INSERT INTO Salaries (salary)
VALUES (100),
       (200),
       (300),
       (150),
       (250),
       (350),
       (120),
       (220),
       (320),
       (180),
       (280),
       (380),
       (130),
       (390),
       (330),
       (190),
       (290),
       (390),
       (110),
       (210);

SELECT DISTINCT salary second_highest_salary FROM Salaries
ORDER BY 1 DESC
LIMIT 1
OFFSET 1;

--4
DROP TABLE IF EXISTS Sales;
CREATE TABLE Sales
(
    product_id INT,
    year       YEAR,
    quantity   VARCHAR(40),
    price      INT
);

TRUNCATE Sales;
INSERT INTO Sales
VALUES (1, 2018, 11, 9880),
       (1, 2023, 30, 3050),
       (3, 2023, 28, 3330),
       (4, 2023, 47, 3373),
       (1, 2022, 23, 7741),
       (6, 2021, 48, 8825),
       (5, 2018, 18, 7381),
       (5, 2017, 16, 8923),
       (6, 2018, 27, 4580),
       (6, 2016, 45, 7546),
       (6, 2019, 10, 4839),
       (3, 2016, 40, 8195),
       (3, 2021, 35, 7037),
       (3, 2019, 25, 3162),
       (2, 2016, 11, 3947),
       (2, 2019, 18, 8056),
       (5, 2016, 40, 6718),
       (4, 2021, 49, 7253),
       (4, 2018, 46, 7811),
       (3, 2018, 11, 3153);

SELECT product_id, 
    year first_year, 
    quantity,
    price
FROM Sales
WHERE year = (
    SELECT MIN(year) FROM Sales S 
    WHERE Sales.product_id = product_id);

--5
DROP TABLE IF EXISTS Employees;
CREATE TABLE Employees
(
    id         INT PRIMARY KEY,
    name       VARCHAR(50),
    surname    VARCHAR(50),
    manager_id INT,
    salary     INT
);

TRUNCATE Employees;
INSERT INTO Employees (id, name, surname, manager_id, salary)
VALUES (1, 'John', 'Doe', NULL, 50000.00),
       (2, 'Jane', 'Smith', 12, 21000.00),
       (3, 'Michael', 'Johnson', 1, 48000.00),
       (4, 'Emily', 'Brown', NULL, 15000.00),
       (6, 'Sophia', 'Davis', NULL, 49000.00),
       (7, 'Oliver', 'Miller', 4, 23000.00),
       (8, 'Emma', 'Anderson', NULL, 15000.00),
       (9, 'Liam', 'Martinez', NULL, 30000.00),
       (10, 'Ava', 'Garcia', 5, 11000.00),
       (11, 'Lucas', 'Lopez', 6, 45000.00),
       (13, 'Ethan', 'Clark', 8, 46000.00),
       (14, 'Isabella', 'Lewis', 9, 49000.00),
       (15, 'Noah', 'Young', 12, 48000.00),
       (16, 'Sophia', 'Allen', NULL, 15000.00),
       (18, 'Olivia', 'Wright', 16, 44000.00),
       (19, 'Aiden', 'Green', 17, 25000.00),
       (20, 'Chloe', 'Turner', 17, 20000.00);

SELECT name, surname FROM Employees
WHERE salary < 25000 AND manager_id NOT IN (
    SELECT id FROM Employees
);

--6
DROP TABLE IF EXISTS Employees;
CREATE TABLE Employees
(
    id      INT PRIMARY KEY AUTO_INCREMENT,
    team_id INT
);

TRUNCATE Employees;
INSERT INTO Employees (team_id)
VALUES (8),
       (6),
       (8),
       (7),
       (9),
       (6),
       (7),
       (7),
       (3),
       (9),
       (3),
       (8),
       (3),
       (7),
       (9),
       (9),
       (7),
       (8),
       (8),
       (7);

SELECT E1.id employee_id, COUNT(*) team_size
FROM Employees E1 JOIN Employees E2 USING(team_id)
GROUP BY 1;

--7
DROP TABLE IF EXISTS Activity;
CREATE TABLE Activity
(
    player_id    INT,
    device_id    INT,
    event_date   DATE,
    games_played INT
);

TRUNCATE Activity;
INSERT INTO Activity (player_id, device_id, event_date, games_played)
VALUES (1, 2, '2022-01-15', 4),
       (1, 2, '2022-01-16', 5),
       (2, 3, '2022-02-22', 3),
       (2, 4, '2022-02-20', 2),
       (3, 1, '2022-03-10', 1),
       (3, 2, '2022-03-12', 0),
       (4, 3, '2022-04-15', 6),
       (4, 4, '2022-04-07', 7),
       (5, 1, '2022-05-01', 2),
       (5, 2, '2022-05-03', 3),
       (6, 3, '2022-06-12', 1),
       (6, 4, '2022-06-15', 0),
       (7, 1, '2022-07-24', 5),
       (7, 2, '2022-07-07', 4),
       (8, 3, '2022-08-22', 3),
       (8, 4, '2022-08-25', 4),
       (9, 1, '2022-09-19', 2),
       (9, 2, '2022-09-12', 3),
       (10, 3, '2022-10-05', 6),
       (10, 4, '2022-10-08', 7);

SELECT player_id, device_id first_device_id
FROM Activity
WHERE event_date = (
    SELECT MIN(event_date) FROM Activity a
    WHERE player_id = Activity.player_id
);

--8
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Customers;

-- Создание таблицы Customers
CREATE TABLE Customers
(
    id      INT AUTO_INCREMENT,
    name    VARCHAR(50),
    surname VARCHAR(50),
    PRIMARY KEY (id)
);

INSERT INTO Customers (name, surname)
VALUES ('Rupert', 'Murdoch'),
       ('Al', 'Gore'),
       ('Sacha', 'Baron'),
       ('George', 'Clooney'),
       ('Paul', 'Krugman'),
       ('Wright', 'BrothersOrville'),
       ('Ernest', 'Hemingway'),
       ('Roman', 'Abramovich'),
       ('Tom', 'Cruise'),
       ('Lech', 'Walesa'),
       ('Tim', 'Berners'),
       ('Aung', 'San'),
       ('Lance', 'Armstrong'),
       ('Shakira', 'Curie'),
       ('Jon', 'Stewart'),
       ('Julie', 'Andrews'),
       ('Florence', 'Nightingale'),
       ('Marie', 'Curie'),
       ('Stephen', 'Hawking'),
       ('Jimmy', 'Wales');

-- Создание таблицы Products
CREATE TABLE Products
(
    id    INT AUTO_INCREMENT,
    name  VARCHAR(50),
    price INT,
    PRIMARY KEY (id)
);

INSERT INTO Products
VALUES (10, 'Instant Pot Duo 7-in-1', 9880),
       (20, 'Dyson V11 Animal Vacuum', 8923),
       (30, 'GoPro HERO9 Black', 8825),
       (40, 'Amazon Echo Dot (4th Gen)', 8195),
       (50, 'Xbox Series X', 8056),
       (60, 'PlayStation 5', 7811),
       (70, 'Fitbit Versa 3', 7741),
       (80, 'Apple AirPods Pro', 7546),
       (90, 'LG OLED55CXPUA TV', 7381),
       (100, 'Samsung 65-inch QLED TV', 7253);

-- Создание таблицы Orders
CREATE TABLE Orders
(
    id          INT AUTO_INCREMENT,
    customer_id INT,
    product_id  INT,
    order_date  DATE,
    quantity    INT,
    PRIMARY KEY (id),
    FOREIGN KEY (customer_id)
        REFERENCES Customers (id),
    FOREIGN KEY (product_id)
        REFERENCES Products (id)
);

TRUNCATE Orders;
INSERT INTO Orders (customer_id, product_id, order_date, quantity)
VALUES (15, 90, '2023-10-24', 1),
       (7, 10, '2023-09-11', 8),
       (6, 10, '2023-06-07', 10),
       (11, 20, '2023-08-17', 8),
       (14, 20, '2023-08-15', 6),
       (4, 10, '2023-07-24', 6),
       (19, 30, '2023-05-19', 3),
       (4, 30, '2023-05-11', 1),
       (18, 40, '2023-06-18', 10),
       (6, 20, '2023-06-14', 8),
       (2, 90, '2023-08-13', 10),
       (13, 70, '2023-06-05', 9),
       (14, 100, '2023-10-19', 2),
       (17, 100, '2023-05-18', 1),
       (16, 100, '2023-07-19', 2),
       (8, 20, '2023-05-01', 6),
       (7, 10, '2023-10-17', 1),
       (7, 10, '2023-08-23', 2),
       (17, 50, '2023-07-16', 8),
       (18, 40, '2023-09-12', 6);

SELECT name product_name, MAX(order_date) last_purchase_date
FROM Products JOIN Orders ON Products.id = product_id
GROUP BY 1
ORDER BY 1;

--9
DROP TABLE IF EXISTS Transactions;
CREATE TABLE Transactions
(
    id     INT PRIMARY KEY AUTO_INCREMENT,
    day    TIMESTAMP,
    amount DECIMAL(10, 2)
);

TRUNCATE Transactions;
INSERT INTO Transactions (day, amount)
VALUES ('2023-09-14 09:00:00', 100.50),
       ('2023-09-11 10:15:30', 75.25),
       ('2023-09-12 14:30:45', 150.00),
       ('2023-09-12 16:45:15', 25.75),
       ('2023-09-13 08:20:10', 300.20),
       ('2023-10-03 12:00:00', 50.00),
       ('2023-10-03 15:30:20', 45.60),
       ('2023-10-07 17:10:55', 90.75),
       ('2023-10-07 11:45:30', 200.00),
       ('2023-10-10 14:55:40', 120.40),
       ('2023-10-11 09:30:15', 75.60),
       ('2023-11-01 10:45:00', 30.25),
       ('2023-11-02 13:20:30', 60.75),
       ('2023-11-02 15:10:10', 180.90),
       ('2023-11-02 08:15:25', 25.00),
       ('2023-12-03 12:30:45', 90.20),
       ('2023-12-03 14:40:00', 150.50),
       ('2023-12-06 16:55:30', 45.75),
       ('2023-12-23 09:10:15', 110.30),
       ('2023-12-03 11:25:50', 70.75);

SELECT id FROM Transactions
WHERE amount = (SELECT MAX(amount) FROM Transactions t
    WHERE DATE(day) = DATE(Transactions.day)    
)
ORDER BY 1 DESC;

--10
DROP TABLE IF EXISTS Sales;
CREATE TABLE Sales
(
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    income     INT
);

TRUNCATE Sales;
INSERT INTO Sales (income)
VALUES (15000),
       (28000),
       (3500),
       (60000),
       (42000),
       (95000),
       (18000),
       (7500),
       (3000),
       (12000),
       (55000),
       (49000),
       (8000),
       (4200),
       (36000),
       (48000),
       (11000),
       (62000),
       (52000),
       (25000);

WITH Res AS
(
    SELECT 
        CASE
            WHEN income < 20000 THEN 'Low Sales'
            WHEN income > 50000 THEN 'High Sales'
            ELSE 'Average Sales'
        END AS category 
    FROM Sales
),
NewTable AS 
(
    SELECT 
        CASE
            WHEN product_id MOD 3 = 0 THEN 'Low Sales'
            WHEN product_id MOD 3 = 1 THEN 'High Sales'
            ELSE 'Average Sales'
        END AS cheat
    FROM Sales
    GROUP BY cheat 
)
SELECT 
   category, COUNT(*) products_count 
FROM Sales RIGHT JOIN NewTable ON cheat = category
GROUP BY 1;

SELECT "Low Sales" AS category, (SELECT COUNT(*)
                                 FROM Sales
                                 WHERE income < 20000) AS products_count
UNION ALL
SELECT "Average Sales" , (SELECT COUNT(*)
                          FROM Sales
                          WHERE income >= 20000 AND income <= 50000)
UNION ALL 
SELECT "High Sales", (SELECT COUNT(*)
                      FROM Sales
                      WHERE income > 50000)

--11
DROP TABLE IF EXISTS RequestsAccepted;
CREATE TABLE RequestsAccepted
(
    requester_id INT,
    accepter_id  INT,
    accept_date  DATE
);

TRUNCATE RequestsAccepted;
INSERT INTO RequestsAccepted (requester_id, accepter_id, accept_date)
VALUES (1, 2, '2022-01-10'),
       (1, 3, '2022-02-15'),
       (2, 3, '2022-02-20'),
       (3, 4, '2022-03-05'),
       (4, 1, '2022-03-10'),
       (2, 4, '2022-04-12'),
       (5, 6, '2022-04-20'),
       (6, 7, '2022-05-03'),
       (7, 8, '2022-05-15'),
       (8, 9, '2022-05-20'),
       (10, 11, '2022-06-02'),
       (11, 12, '2022-06-10'),
       (12, 13, '2022-07-05'),
       (14, 15, '2022-07-10'),
       (15, 16, '2022-07-15'),
       (17, 18, '2022-08-03'),
       (18, 19, '2022-08-15'),
       (19, 20, '2022-09-05'),
       (20, 1, '2022-09-12'),
       (9, 10, '2022-09-20');

SELECT requester_id id, COUNT(*) friends
FROM (
        SELECT requester_id FROM RequestsAccepted
        UNION ALL
        SELECT accepter_id FROM RequestsAccepted
    ) AS AllUsers
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;

--12
DROP TABLE IF EXISTS Queue;
CREATE TABLE Queue
(
    person_id   INT PRIMARY KEY AUTO_INCREMENT,
    person_name VARCHAR(255),
    weight      INT,
    turn        INT
);

TRUNCATE Queue;
INSERT INTO Queue (person_name, weight, turn)
VALUES ('Eva', 300, 1),
       ('Michael', 180, 2),
       ('Sophia', 400, 3),
       ('Liam', 220, 4),
       ('Olivia', 350, 5),
       ('James', 500, 6),
       ('Emma', 280, 7),
       ('Noah', 380, 8),
       ('Ava', 450, 9),
       ('William', 280, 10),
       ('Mia', 300, 11),
       ('Benjamin', 220, 12),
       ('Isabella', 180, 13),
       ('Daniel', 420, 14),
       ('Sophia', 270, 15),
       ('Elijah', 370, 16),
       ('Charlotte', 320, 17),
       ('Henry', 240, 18),
       ('Amelia', 290, 19),
       ('Alexander', 260, 20);

SELECT person_name FROM Queue Q
WHERE 1000 >= (
    SELECT SUM(weight) FROM Queue
    WHERE Q.turn >= turn)
ORDER BY turn DESC
LIMIT 1;

--13
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Customers;

-- Создание таблицы Customers
CREATE TABLE Customers
(
    id   INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255)
);

INSERT INTO Customers (name)
VALUES ('Alice'),
       ('Bob'),
       ('Charlie'),
       ('David'),
       ('Eve'),
       ('Frank'),
       ('Grace'),
       ('Henry'),
       ('Ivy'),
       ('Jack'),
       ('Kate'),
       ('Leo'),
       ('Mia'),
       ('Nina'),
       ('Oliver'),
       ('Paul'),
       ('Quinn'),
       ('Rose'),
       ('Sam'),
       ('Tom');

-- Создание таблицы Orders
CREATE TABLE Orders
(
    id          INT PRIMARY KEY AUTO_INCREMENT,
    order_date  DATE,
    customer_id INT,
    cost        DECIMAL(10, 2)
);

TRUNCATE Orders;
INSERT INTO Orders (order_date, customer_id, cost)
VALUES ('2023-01-15', 1, 25.99),
       ('2023-01-18', 3, 55.50),
       ('2023-02-02', 2, 38.75),
       ('2023-02-05', 1, 42.00),
       ('2023-02-10', 4, 75.20),
       ('2023-02-20', 3, 29.99),
       ('2023-03-05', 2, 16.50),
       ('2023-03-12', 1, 49.99),
       ('2023-03-18', 4, 62.30),
       ('2023-03-25', 3, 33.75),
       ('2023-04-01', 2, 45.00),
       ('2023-04-08', 1, 19.99),
       ('2023-04-15', 5, 82.50),
       ('2023-04-22', 3, 27.75),
       ('2023-04-29', 2, 69.90),
       ('2023-05-06', 1, 12.99),
       ('2023-05-13', 4, 18.25),
       ('2023-05-20', 2, 50.00),
       ('2023-05-27', 1, 22.50),
       ('2023-06-03', 3, 39.99);

SELECT name, O.id order_id, order_date 
FROM Orders O JOIN Customers ON Customers.id = customer_id
WHERE 3 >= (
    SELECT COUNT(customer_id) FROM Orders
    WHERE O.customer_id = customer_id AND
        O.order_date <= order_date)
ORDER BY 1, 2 DESC;

--14
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Departments;

-- Создание таблицы Departments
CREATE TABLE Departments
(
    id   INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL
);

INSERT INTO Departments (name)
VALUES
    ('Engineering'),
    ('Sales'),
    ('Marketing'),
    ('Human Resources'),
    ('Finance');

-- Создание таблицы Employees
CREATE TABLE Employees
(
    id            INT PRIMARY KEY AUTO_INCREMENT,
    name          VARCHAR(50) NOT NULL,
    surname       VARCHAR(50) NOT NULL,
    salary        INT,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Departments(id)
);

TRUNCATE Employees;
INSERT INTO Employees (name, surname, salary, department_id)
VALUES
    ('Alice', 'Johnson', 90000, 1),
    ('Bob', 'Smith', 80000, 2),
    ('Carol', 'Williams', 75000, 2),
    ('David', 'Brown', 95000, 1),
    ('Eve', 'Jones', 70000, 1),
    ('Frank', 'Davis', 85000, 1),
    ('Grace', 'Miller', 72000, 1),
    ('Harry', 'Wilson', 93000, 2),
    ('Irene', 'Lee', 72000, 2),
    ('Jack', 'Hall', 98000, 1),
    ('Kelly', 'Harris', 71000, 1),
    ('Larry', 'White', 81000, 2),
    ('Mary', 'Clark', 85000, 1),
    ('Nancy', 'Turner', 70000, 2),
    ('Oscar', 'King', 92000, 1),
    ('Peter', 'Scott', 76000, 2),
    ('Queen', 'Green', 99000, 1),
    ('Rachel', 'Adams', 73000, 1),
    ('Steve', 'Martin', 80000, 2),
    ('Tom', 'Wood', 91000, 1);

SELECT 
    D.name department,
    E.name,
    surname,
    salary
FROM Employees E JOIN Departments D ON department_id = D.id
WHERE salary = (
    SELECT MAX(salary) FROM Employees 
    WHERE department_id = E.department_id);

--15
SELECT 
    D.name department,
    E.name,
    surname,
    salary
FROM Employees E JOIN Departments D ON department_id = D.id
WHERE 3 >= (
    SELECT COUNT(DISTINCT salary) FROM Employees 
    WHERE department_id = E.department_id
    AND E.salary <= salary
    );

--16
DROP TABLE IF EXISTS Visits;
CREATE TABLE Visits
(
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name        VARCHAR(50),
    visited_on  DATE,
    amount      DECIMAL(10, 2)
);

TRUNCATE Visits;
INSERT INTO Visits (name, visited_on, amount)
VALUES ('Alice', '2023-01-11', 90.00),
       ('Bob', '2023-01-12', 120.00),
       ('Eva', '2023-01-13', 100.00),
       ('Chris', '2023-01-14', 110.00),
       ('Sophia', '2023-01-15', 130.00),
       ('David', '2023-01-16', 140.00),
       ('Olivia', '2023-01-17', 120.00),
       ('Michael', '2023-01-18', 110.00),
       ('Emma', '2023-01-19', 90.00),
       ('Liam', '2023-01-20', 80.00),
       ('Bob', '2023-01-20', 150.00),
       ('Ava', '2023-01-21', 150.00),
       ('William', '2023-01-22', 130.00),
       ('Mia', '2023-01-23', 110.00),
       ('James', '2023-01-24', 120.00),
       ('Charlotte', '2023-01-25', 140.00),
       ('Benjamin', '2023-01-26', 110.00),
       ('Amelia', '2023-01-27', 90.00),
       ('Lucas', '2023-01-28', 80.00),
       ('Harper', '2023-01-29', 150.00),
       ('Henry', '2023-01-29', 130.00);

SELECT DISTINCT
    V2.visited_on period,
    (SELECT ROUND(SUM(amount), 2) FROM Visits
    WHERE visited_on BETWEEN V1.visited_on AND V2.visited_on
    ) amount,
    (SELECT ROUND(SUM(amount) / 7, 2) FROM Visits
    WHERE visited_on BETWEEN V1.visited_on AND V2.visited_on
    ) average_amount
FROM Visits V1 JOIN Visits V2 ON V1.visited_on + INTERVAL 6 DAY = V2.visited_on
WHERE V2.visited_on IS NOT NULL;


/*  
****    11.4    ****
*/

--1
DROP TABLE IF EXISTS Teachers;
CREATE TABLE Teachers
(
    id         INT,
    subject_id INT,
    dept_id    INT
);

TRUNCATE Teachers;
INSERT INTO Teachers (id, subject_id, dept_id)
VALUES (3, 1, 1),
       (1, 1, 5),
       (5, 1, 2),
       (4, 1, 1),
       (2, 2, 1),
       (1, 2, 1),
       (5, 1, 5),
       (3, 2, 1),
       (5, 2, 3),
       (1, 3, 1),
       (4, 2, 1),
       (4, 3, 4),
       (1, 4, 3),
       (4, 4, 5),
       (5, 3, 3),
       (3, 1, 4),
       (2, 3, 1),
       (3, 4, 1),
       (2, 4, 5),
       (5, 4, 4);

SELECT 
    id teacher_id, 
    COUNT(DISTINCT subject_id) subjects_num
FROM Teachers
GROUP BY id;

--2
DROP TABLE IF EXISTS Activity;
CREATE TABLE Activity
(
    user_id       INT,
    session_id    INT,
    activity_date DATE,
    activity_type VARCHAR(50)
);

TRUNCATE Activity;
INSERT INTO Activity (user_id, session_id, activity_date, activity_type)
VALUES (2, 4, '2023-09-01', 'open_session'),
       (1, 2, '2023-09-01', 'open_session'),
       (5, 1, '2023-09-01', 'open_session'),
       (3, 5, '2023-09-02', 'open_session'),
       (5, 3, '2023-09-02', 'scroll_down'),
       (1, 5, '2023-09-02', 'send_message'),
       (4, 1, '2023-09-02', 'open_session'),
       (4, 4, '2023-09-02', 'end_session'),
       (3, 4, '2023-09-02', 'end_session'),
       (1, 1, '2023-09-02', 'scroll_down'),
       (2, 2, '2023-09-02', 'scroll_down'),
       (4, 4, '2023-09-03', 'open_session'),
       (1, 1, '2023-09-03', 'end_session'),
       (4, 4, '2023-09-03', 'end_session'),
       (5, 5, '2023-09-03', 'scroll_down'),
       (3, 5, '2023-09-04', 'open_session'),
       (2, 3, '2023-09-04', 'send_message'),
       (3, 5, '2023-09-04', 'end_session'),
       (2, 1, '2023-09-04', 'end_session'),
       (5, 4, '2023-09-04', 'end_session');

SELECT activity_date, COUNT(DISTINCT user_id) active_users
FROM Activity
GROUP BY 1;

--3
DROP TABLE IF EXISTS Classes;
CREATE TABLE Classes
(
    student_id INT AUTO_INCREMENT,
    class      VARCHAR(50),
    PRIMARY KEY (student_id)
);

TRUNCATE Classes;
INSERT INTO Classes (class)
VALUES ('Math'),
       ('English'),
       ('Computer'),
       ('Math'),
       ('English'),
       ('Computer'),
       ('Computer'),
       ('Math'),
       ('Math'),
       ('Biology'),
       ('Computer'),
       ('Computer'),
       ('Math'),
       ('Math'),
       ('English'),
       ('Math'),
       ('Math'),
       ('Computer'),
       ('Biology'),
       ('Computer');

SELECT class FROM Classes
GROUP BY 1
HAVING COUNT(*) >= 3;

--4
DROP TABLE IF EXISTS Followers;
CREATE TABLE Followers
(
    user_id     INT,
    follower_id INT
);

TRUNCATE Followers;
INSERT INTO Followers
VALUES (1, 1),
       (1, 2),
       (1, 3),
       (1, 4),
       (2, 1),
       (2, 2),
       (2, 5),
       (2, 6),
       (3, 2),
       (3, 1),
       (3, 7),
       (3, 10),
       (4, 4),
       (4, 5),
       (4, 2),
       (4, 8),
       (5, 6),
       (5, 7),
       (5, 8),
       (6, 1),
       (7, 1),
       (8, 2),
       (9, 3),
       (10, 4);

SELECT user_id, COUNT(*) followers_num
FROM Followers
GROUP BY 1
ORDER BY 2, 1;

--5
DROP TABLE IF EXISTS Numbers;
CREATE TABLE Numbers
(
    num INT
);

TRUNCATE Numbers;
INSERT INTO Numbers
VALUES (2),
       (4),
       (8),
       (8),
       (3),
       (9),
       (7),
       (1),
       (9),
       (3),
       (6),
       (8),
       (8),
       (9),
       (8),
       (8),
       (3),
       (2),
       (4),
       (4),
       (5),
       (8),
       (8),
       (8),
       (5),
       (5),
       (4);

SELECT num FROM Numbers
GROUP BY num
HAVING COUNT(*) = 1
ORDER BY 1 DESC
LIMIT 1;

--6
DROP TABLE IF EXISTS Sales;
DROP TABLE IF EXISTS Products;

-- Создание таблицы Products
CREATE TABLE Products
(
    id   INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100)
);

INSERT INTO Products (name)
VALUES ('Apple iPhone 13 Pro'),
       ('Samsung Galaxy S21'),
       ('Sony WH-1000XM4 Headphones'),
       ('Nike Air Zoom Pegasus 38'),
       ('Adidas Ultraboost 21'),
       ('Lenovo ThinkPad X1 Carbon'),
       ('Dell XPS 13 Laptop'),
       ('Canon EOS R6 Camera'),
       ('Bose QuietComfort 35 II');

-- Создание таблицы Sales
CREATE TABLE Sales
(
    customer_id INT,
    product_id  INT
);

TRUNCATE Sales;
INSERT INTO Sales (customer_id, product_id)
VALUES (1, 1),
       (2, 7),
       (3, 2),
       (4, 3),
       (2, 3),
       (1, 4),
       (5, 9),
       (4, 2),
       (4, 5),
       (4, 9),
       (5, 4),
       (3, 6),
       (2, 4),
       (1, 2),
       (4, 8),
       (5, 4),
       (6, 4),
       (5, 2),
       (5, 2),
       (6, 4),
       (4, 4),
       (1, 3),
       (1, 5),
       (1, 6),
       (4, 6),
       (1, 9),
       (1, 7),
       (4, 7),
       (1, 8),
       (2, 7),
       (2, 7),
       (2, 3),
       (4, 1),
       (2, 4),
       (2, 3),
       (2, 4);

SELECT customer_id FROM Sales
GROUP BY 1
HAVING COUNT(DISTINCT product_id) = (
    SELECT id FROM Products
    ORDER BY 1 DESC
    LIMIT 1);

--7
DROP TABLE IF EXISTS Transactions;
DROP TABLE IF EXISTS Users;

-- Создание таблицы Users
CREATE TABLE Users
(
    account INT AUTO_INCREMENT,
    name    VARCHAR(50),
    surname VARCHAR(50),
    PRIMARY KEY (account)
);

INSERT INTO Users (account, name, surname)
VALUES (60001, 'Rupert', 'Murdoch'),
       (60002, 'Al', 'Gore'),
       (60003, 'Sacha', 'Baron'),
       (60004, 'George', 'Clooney'),
       (60005, 'Paul', 'Krugman'),
       (60006, 'Wright', 'BrothersOrville'),
       (60007, 'Ernest', 'Hemingway'),
       (60008, 'Roman', 'Abramovich'),
       (60009, 'Tom', 'Cruise'),
       (60010, 'Lech', 'Walesa'),
       (60011, 'Tim', 'Berners'),
       (60012, 'Aung', 'San'),
       (60013, 'Lance', 'Armstrong'),
       (60014, 'Shakira', 'Curie'),
       (60015, 'Jon', 'Stewart'),
       (60016, 'Julie', 'Andrews'),
       (60017, 'Florence', 'Nightingale'),
       (60018, 'Marie', 'Curie'),
       (60019, 'Stephen', 'Hawking'),
       (60020, 'Jimmy', 'Wales');

-- Создание таблицы Transactions
CREATE TABLE Transactions
(
    id            INT PRIMARY KEY AUTO_INCREMENT,
    account       INT,
    amount        INT,
    transacted_on DATE,
    FOREIGN KEY (account) REFERENCES Users (account)
);

TRUNCATE Transactions;
INSERT INTO Transactions (account, amount, transacted_on)
VALUES (60014, 8561, '2023-09-01'),
       (60017, 6533, '2023-09-02'),
       (60016, 1067, '2023-09-03'),
       (60015, 3184, '2023-09-04'),
       (60010, 5072, '2023-09-07'),
       (60008, 9085, '2023-09-08'),
       (60013, 1253, '2023-09-10'),
       (60007, 6061, '2023-09-11'),
       (60015, -6058, '2023-09-15'),
       (60011, 205, '2023-09-20'),
       (60001, 178, '2023-10-01'),
       (60014, 4908, '2023-10-02'),
       (60014, 2812, '2023-10-10'),
       (60002, 458, '2023-10-14'),
       (60019, 4047, '2023-11-02'),
       (60015, -8595, '2023-11-06'),
       (60017, 2057, '2023-11-17'),
       (60008, 8442, '2023-11-22'),
       (60008, -1905, '2023-11-22'),
       (60010, -72, '2023-09-07'),
       (60011, -338, '2023-12-03');

SELECT name, surname, SUM(amount) balance
FROM Users JOIN Transactions USING(account)
GROUP BY 1, 2
HAVING balance > 5000;

--8
DROP TABLE IF EXISTS ActorsDirectors;
CREATE TABLE ActorsDirectors
(
    film_id     INT,
    actor_id    INT,
    director_id INT
);

TRUNCATE ActorsDirectors;
INSERT INTO ActorsDirectors (film_id, actor_id, director_id)
VALUES (4, 1, 5),
       (5, 3, 1),
       (2, 2, 5),
       (6, 4, 1),
       (2, 6, 5),
       (8, 5, 4),
       (2, 9, 5),
       (7, 5, 4),
       (8, 4, 1),
       (5, 8, 1),
       (2, 10, 5),
       (8, 6, 4),
       (3, 5, 3),
       (3, 4, 1),
       (1, 5, 4),
       (3, 3, 3),
       (3, 2, 3),
       (1, 8, 4),
       (8, 4, 1),
       (3, 6, 3),
       (4, 8, 5),
       (4, 7, 5),
       (6, 5, 1),
       (6, 4, 1),
       (7, 2, 4),
       (7, 8, 4),
       (9, 5, 4),
       (9, 8, 4);

SELECT actor_id, director_id 
FROM ActorsDirectors
GROUP BY 1, 2
HAVING COUNT(DISTINCT film_id) > 2;

--9
DROP TABLE IF EXISTS Employees;
CREATE TABLE Employees
(
    id         INT PRIMARY KEY AUTO_INCREMENT,
    name       VARCHAR(50),
    surname    VARCHAR(50),
    manager_id INT
);

TRUNCATE Employees;
INSERT INTO Employees (name, surname, manager_id)
VALUES ('John', 'Anderson', NULL),
       ('Alice', 'Smith', 1),
       ('Bob', 'Johnson', 1),
       ('Eva', 'Williams', 1),
       ('Michael', 'Brown', 1),
       ('Olivia', 'Davis', 1),
       ('William', 'Wilson', 2),
       ('Sophia', 'Lee', 2),
       ('James', 'Anderson', 2),
       ('Emily', 'Martinez', 2),
       ('Daniel', 'Taylor', 2),
       ('Emma', 'Garcia', 3),
       ('Benjamin', 'Harris', 3),
       ('Mia', 'Lopez', 3),
       ('Aiden', 'Jackson', 3),
       ('Sophia', 'Moore', 4),
       ('Liam', 'Clark', 4),
       ('Ava', 'Young', 4),
       ('Henry', 'Walker', 4),
       ('Isabella', 'Lewis', 4),
       ('Ethan', 'Hall', 4),
       ('Olivia', 'Green', 5),
       ('Amelia', 'Turner', 5),
       ('Lucas', 'Hernandez', 5),
       ('Mia', 'Adams', 6),
       ('Noah', 'Carter', 6),
       ('Harper', 'White', 7),
       ('Liam', 'Perez', 7),
       ('Ella', 'Smith', 8),
       ('Oliver', 'Johnson', 8),
       ('Charlotte', 'Clark', 8);

SELECT E1.name, E1.surname
FROM Employees E1 JOIN Employees E2 
    ON E1.id = E2.manager_id
GROUP BY 1, 2
HAVING COUNT(*) > 4;

--10
DROP TABLE IF EXISTS FilmRatings;
DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS Films;

-- Создание таблицы Films
CREATE TABLE Films
(
    id    INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(150)
);

INSERT INTO Films (title)
VALUES ('The Matrix'),
       ('Inception'),
       ('Interstellar'),
       ('Pulp Fiction'),
       ('The Shawshank Redemption'),
       ('Fight Club'),
       ('Forrest Gump'),
       ('The Dark Knight'),
       ('Gladiator'),
       ('The Godfather'),
       ('The Lord of the Rings'),
       ('The Avengers'),
       ('Titanic'),
       ('Jurassic Park'),
       ('Avatar'),
       ('The Silence of the Lambs'),
       ('Braveheart'),
       ('The Departed'),
       ('Schindler''s List'),
       ('The Shawshank Redemption');

-- Создание таблицы Users
CREATE TABLE Users
(
    id       INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(100)
);

INSERT INTO Users (username)
VALUES ('JohnDoe'),
       ('JaneSmith'),
       ('MichaelJohnson'),
       ('EmilyBrown'),
       ('DavidWilson'),
       ('SophiaDavis'),
       ('OliverMiller'),
       ('EmmaAnderson'),
       ('LiamMartinez'),
       ('AvaGarcia'),
       ('LucasLopez'),
       ('MilaHarris'),
       ('EthanClark'),
       ('IsabellaLewis'),
       ('NoahYoung'),
       ('SophiaAllen'),
       ('LoganHall'),
       ('OliviaWright'),
       ('AidenGreen'),
       ('ChloeTurner');

-- Создание таблицы FilmRatings
CREATE TABLE FilmRatings
(
    film_id    INT,
    user_id    INT,
    rating     INT,
    created_at DATE,
    PRIMARY KEY (film_id, user_id),
    FOREIGN KEY (film_id) REFERENCES Films(id),
    FOREIGN KEY (user_id) REFERENCES Users(id)
);

TRUNCATE FilmRatings;
INSERT INTO FilmRatings (film_id, user_id, rating, created_at)
VALUES (1, 1, 4, '2023-01-12'),
       (1, 2, 5, '2023-02-11'),
       (1, 3, 3, '2023-02-12'),
       (1, 4, 4, '2023-01-01'),
       (2, 1, 5, '2023-02-17'),
       (2, 2, 4, '2023-02-01'),
       (2, 3, 5, '2023-03-01'),
       (3, 1, 4, '2023-02-22'),
       (3, 2, 5, '2023-02-25'),
       (3, 3, 4, '2023-02-20'),
       (4, 4, 3, '2023-01-15'),
       (4, 1, 4, '2023-01-16'),
       (4, 2, 4, '2023-01-18'),
       (4, 3, 5, '2023-01-20'),
       (5, 4, 5, '2023-01-25'),
       (5, 1, 4, '2023-01-26'),
       (5, 2, 4, '2023-01-28'),
       (5, 3, 5, '2023-01-30'),
       (6, 1, 5, '2023-02-05'),
       (6, 2, 4, '2023-02-10');

SELECT username FROM Users U
JOIN FilmRatings ON U.id = user_id
GROUP BY username
ORDER BY COUNT(*) DESC, 1
LIMIT 1;

--11
DROP TABLE IF EXISTS FilmRatings;
DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS Films;

-- Создание таблицы Films
CREATE TABLE Films
(
    id    INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(150)
);

INSERT INTO Films (title)
VALUES ('The Matrix'),
       ('Inception'),
       ('Interstellar'),
       ('Pulp Fiction'),
       ('The Shawshank Redemption'),
       ('Fight Club'),
       ('Forrest Gump'),
       ('The Dark Knight'),
       ('Gladiator'),
       ('The Godfather'),
       ('The Lord of the Rings'),
       ('The Avengers'),
       ('Titanic'),
       ('Jurassic Park'),
       ('Avatar'),
       ('The Silence of the Lambs'),
       ('Braveheart'),
       ('The Departed'),
       ('Schindler''s List'),
       ('The Shawshank Redemption');

-- Создание таблицы Users
CREATE TABLE Users
(
    id       INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(100)
);

INSERT INTO Users (username)
VALUES ('JohnDoe'),
       ('JaneSmith'),
       ('MichaelJohnson'),
       ('EmilyBrown'),
       ('DavidWilson'),
       ('SophiaDavis'),
       ('OliverMiller'),
       ('EmmaAnderson'),
       ('LiamMartinez'),
       ('AvaGarcia'),
       ('LucasLopez'),
       ('MilaHarris'),
       ('EthanClark'),
       ('IsabellaLewis'),
       ('NoahYoung'),
       ('SophiaAllen'),
       ('LoganHall'),
       ('OliviaWright'),
       ('AidenGreen'),
       ('ChloeTurner');

-- Создание таблицы FilmRatings
CREATE TABLE FilmRatings
(
    film_id    INT,
    user_id    INT,
    rating     INT,
    created_at DATE
);

TRUNCATE FilmRatings;
INSERT INTO FilmRatings (film_id, user_id, rating, created_at)
VALUES (1, 1, 8, '2023-01-12'),
       (1, 2, 5, '2023-02-11'),
       (1, 3, 7, '2023-09-12'),
       (1, 4, 7, '2023-09-02'),
       (2, 1, 8, '2023-09-01'),
       (2, 2, 8, '2023-06-01'),
       (2, 3, 3, '2023-07-03'),
       (2, 7, 5, '2023-09-03'),
       (2, 5, 8, '2023-09-30'),
       (3, 1, 4, '2023-08-22'),
       (3, 2, 3, '2023-09-25'),
       (3, 3, 5, '2023-10-20'),
       (4, 4, 3, '2023-11-15'),
       (4, 1, 3, '2023-12-16'),
       (4, 2, 4, '2024-01-18'),
       (4, 3, 3, '2024-02-20'),
       (5, 4, 5, '2024-03-25'),
       (5, 1, 3, '2024-04-26'),
       (5, 2, 4, '2024-05-28'),
       (5, 3, 3, '2024-06-30'),
       (6, 1, 5, '2024-09-05'),
       (6, 2, 1, '2024-08-10');

SELECT title FROM Films
JOIN FilmRatings ON id = film_id
WHERE MONTH(created_at) = 9
GROUP BY 1
ORDER BY AVG(rating) DESC, 1
LIMIT 1;

--12
DROP TABLE IF EXISTS Calls;
DROP TABLE IF EXISTS Countries;
DROP TABLE IF EXISTS Persons;

-- Создание таблицы Persons
CREATE TABLE Persons
(
    id           INT PRIMARY KEY AUTO_INCREMENT,
    name         VARCHAR(50),
    surname      VARCHAR(50),
    phone_number VARCHAR(20)
);

INSERT INTO Persons (name, surname, phone_number)
VALUES ('Rupert', 'Murdoch', '7-1234567'),
       ('Al', 'Gore', '7-7654321'),
       ('Sacha', 'Baron', '4-1234567'),
       ('George', 'Clooney', '4-6523651'),
       ('Paul', 'Krugman', '660-1234567'),
       ('Wright', 'BrothersOrville', '784-0011100'),
       ('Ernest', 'Hemingway', '660-464-4851'),
       ('Roman', 'Abramovich', '28-464-4852'),
       ('Tom', 'Cruise', '28-464-4853'),
       ('Lech', 'Walesa', '28-464-4854'),
       ('Tim', 'Berners', '8-464-4855'),
       ('Aung', 'San', '8-578-3000'),
       ('Lance', 'Armstrong', '8-207-2222'),
       ('Shakira', 'Curie', '28-427-4791'),
       ('Jon', 'Stewart', '51-426-9404'),
       ('Julie', 'Andrews', '51-881-3100'),
       ('Florence', 'Nightingale', '51-782-4177'),
       ('Marie', 'Curie', '24-567-3611'),
       ('Stephen', 'Hawking', '24-687-8992'),
       ('Jimmy', 'Wales', '24-446-3501');

-- Создание таблицы Countries
CREATE TABLE Countries
(
    name         VARCHAR(50),
    country_code INT
);

INSERT INTO Countries
VALUES ('Russia', 7),
       ('United Arab Emirates', 784),
       ('Afghanistan', 4),
       ('Antigua and Barbuda', 28),
       ('Anguilla', 660),
       ('Albania', 8),
       ('Armenia', 51),
       ('Angola', 24);

-- Создание таблицы Calls
CREATE TABLE Calls
(
    caller_id INT,
    callee_id INT,
    duration  INT
);

TRUNCATE Calls;
INSERT INTO Calls
VALUES (17, 6, 21),
       (10, 17, 23),
       (7, 8, 452),
       (5, 2, 356),
       (8, 10, 99),
       (17, 8, 186),
       (20, 14, 277),
       (12, 14, 113),
       (7, 19, 72),
       (5, 8, 59),
       (12, 6, 62),
       (20, 19, 131),
       (14, 11, 488),
       (5, 12, 232),
       (18, 16, 334),
       (17, 4, 425),
       (8, 2, 127),
       (2, 10, 338),
       (12, 3, 183),
       (8, 13, 31);

SELECT C.name FROM Countries C
JOIN Persons P ON 
    country_code = SUBSTRING_INDEX(phone_number, '-', 1)
JOIN (
    SELECT caller_id, duration FROM Calls
    UNION ALL
    SELECT callee_id, duration FROM Calls
) cls ON caller_id = P.id
GROUP BY 1
HAVING AVG(duration) > (
    SELECT AVG(duration) FROM Calls
);

--13
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Customers;

-- Создание таблицы Customers
CREATE TABLE Customers
(
    id      INT PRIMARY KEY AUTO_INCREMENT,
    name    VARCHAR(50),
    surname VARCHAR(50)
);

INSERT INTO Customers (name, surname)
VALUES ('Rupert', 'Murdoch'),
       ('Al', 'Gore'),
       ('Sacha', 'Baron'),
       ('George', 'Clooney'),
       ('Paul', 'Krugman'),
       ('Wright', 'BrothersOrville'),
       ('Ernest', 'Hemingway'),
       ('Roman', 'Abramovich'),
       ('Tom', 'Cruise'),
       ('Lech', 'Walesa'),
       ('Tim', 'Berners'),
       ('Aung', 'San'),
       ('Lance', 'Armstrong'),
       ('Shakira', 'Curie'),
       ('Jon', 'Stewart'),
       ('Julie', 'Andrews'),
       ('Florence', 'Nightingale'),
       ('Marie', 'Curie'),
       ('Stephen', 'Hawking'),
       ('Jimmy', 'Wales');

-- Создание таблицы Products
CREATE TABLE Products
(
    id    INT PRIMARY KEY AUTO_INCREMENT,
    name  VARCHAR(50),
    price INT
);

INSERT INTO Products
VALUES (10, 'Instant Pot Duo 7-in-1', 150),
       (20, 'Dyson V11 Animal Vacuum', 500),
       (30, 'GoPro HERO9 Black', 400),
       (40, 'Amazon Echo Dot (4th Gen)', 50),
       (50, 'Xbox Series X', 500),
       (60, 'PlayStation 5', 600),
       (70, 'Fitbit Versa 3', 200),
       (80, 'Apple AirPods Pro', 250),
       (90, 'LG OLED55CXPUA TV', 1200),
       (100, 'Samsung 65-inch QLED TV', 1000);

-- Создание таблицы Orders
CREATE TABLE Orders
(
    id          INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    product_id  INT,
    order_date  DATE,
    quantity    INT,
    FOREIGN KEY (customer_id) REFERENCES Customers (id),
    FOREIGN KEY (product_id) REFERENCES Products (id)
);

TRUNCATE Orders;
INSERT INTO Orders (customer_id, product_id, order_date, quantity)
VALUES (15, 90, '2023-10-24', 1),
       (7, 10, '2023-09-11', 8),
       (6, 10, '2023-06-07', 10),
       (9, 80, '2023-08-31', 3),
       (11, 20, '2023-08-17', 8),
       (14, 20, '2023-08-15', 6),
       (5, 50, '2023-09-13', 2),
       (4, 10, '2023-07-24', 6),
       (19, 30, '2023-05-19', 3),
       (18, 10, '2023-08-17', 1),
       (4, 30, '2023-05-11', 1),
       (18, 40, '2023-06-18', 10),
       (6, 20, '2023-06-14', 8),
       (2, 90, '2023-08-13', 10),
       (13, 70, '2023-06-05', 9),
       (14, 100, '2023-10-19', 2),
       (9, 40, '2023-09-15', 1),
       (17, 100, '2023-05-18', 1),
       (16, 100, '2023-07-19', 2),
       (5, 40, '2023-08-01', 2),
       (11, 10, '2023-09-07', 1),
       (8, 20, '2023-05-01', 6),
       (7, 10, '2023-10-17', 1),
       (7, 10, '2023-08-23', 2),
       (17, 50, '2023-07-16', 8),
       (18, 40, '2023-09-12', 6);

WITH ResTable(cname, csurname) AS 
(
    SELECT C.name, C.surname FROM Customers
    JOIN Orders ON C.id = customer_id
    JOIN Products P ON P.id = process_id
)
SELECT name, surname FROM Customers
WHERE (name, surname) IN (
    SELECT cname, csurname FROM ResTable
    WHERE MONTH(order_date) = 8 AND YEAR(order_date) = 2023
    GROUP BY 1, 2
    HAVING SUM(quantity * price) > 150
) AND (name, surname) IN (
    SELECT cname, csurname FROM ResTable
    WHERE MONTH(order_date) = 9 AND YEAR(order_date) = 2023
    GROUP BY 1, 2
    HAVING SUM(quantity * price) > 150
);


/*  
****    11.5    ****
*/

--1
DROP TABLE IF EXISTS Teams;
DROP TABLE IF EXISTS Employees;

-- Создание таблицы Employees
CREATE TABLE Employees
(
    id               INT PRIMARY KEY AUTO_INCREMENT,
    name             VARCHAR(50),
    surname          VARCHAR(50),
    experience_years INT
);

INSERT INTO Employees (name, surname, experience_years)
VALUES ('George', 'Clooney', 1),
       ('Paul', 'Krugman', 1),
       ('Wright', 'BrothersOrville', 1),
       ('Ernest', 'Hemingway', 2),
       ('Roman', 'Abramovich', 5),
       ('Tom', 'Cruise', 4),
       ('Lech', 'Walesa', 3),
       ('Tim', 'Berners', 5),
       ('Aung', 'San', 4),
       ('Lance', 'Armstrong', 2),
       ('Shakira', 'Curie', 5),
       ('Jon', 'Stewart', 2),
       ('Julie', 'Andrews', 5),
       ('Florence', 'Nightingale', 2),
       ('Marie', 'Curie', 4),
       ('Stephen', 'Hawking', 1),
       ('Jimmy', 'Wales', 2),
       ('Rupert', 'Murdoch', 5),
       ('Al', 'Gore', 4),
       ('Sacha', 'Baron', 3);

-- Создание таблицы Teams
CREATE TABLE Teams
(
    project_id  INT,
    employee_id INT,
    FOREIGN KEY (employee_id) REFERENCES Employees (id)
);

TRUNCATE Teams;
INSERT INTO Teams (project_id, employee_id)
VALUES (1, 20),
       (1, 4),
       (1, 15),
       (1, 9),
       (1, 14),
       (2, 17),
       (2, 16),
       (2, 11),
       (2, 7),
       (2, 6),
       (2, 5),
       (2, 8),
       (3, 1),
       (3, 3),
       (3, 2),
       (3, 10),
       (3, 12),
       (4, 13),
       (4, 18),
       (4, 19);

SELECT project_id, ROUND(AVG(experience_years), 2) average_years
FROM Teams JOIN Employees ON id = employee_id
GROUP BY 1;

--2
DROP TABLE IF EXISTS Activity;
CREATE TABLE Activity
(
    player_id    INT,
    event_date   DATE,
    games_played INT
);

TRUNCATE Activity;
INSERT INTO Activity
VALUES (4, '2023-01-05', 3),
       (4, '2023-04-10', 2),
       (6, '2023-06-15', 7),
       (6, '2023-02-20', 1),
       (7, '2023-03-25', 4),
       (7, '2023-05-02', 0),
       (10, '2023-08-15', 6),
       (10, '2023-01-10', 8),
       (11, '2023-11-22', 2),
       (10, '2023-07-03', 5),
       (10, '2023-02-28', 3),
       (11, '2023-07-15', 1),
       (10, '2023-12-12', 0),
       (11, '2023-05-20', 9),
       (11, '2023-09-08', 4),
       (12, '2023-11-01', 7),
       (22, '2023-06-30', 2),
       (22, '2023-12-18', 6),
       (22, '2023-10-05', 3),
       (23, '2023-07-08', 5);

SELECT player_id, MIN(event_date) first_login
FROM Activity
GROUP BY 1;

--3
DROP TABLE IF EXISTS Logins;
CREATE TABLE Logins
(
    user_id    INT,
    time_stamp DATETIME
);

TRUNCATE Logins;
INSERT INTO Logins
VALUES (7, '2022-11-12 18:30:45'),
       (7, '2021-08-03 09:15:20'),
       (7, '2020-06-22 22:48:12'),
       (2, '2022-12-15 05:34:28'),
       (2, '2023-03-05 15:20:10'),
       (12, '2021-05-20 14:00:00'),
       (4, '2023-04-09 12:30:45'),
       (12, '2020-09-10 07:15:30'),
       (12, '2022-02-08 18:10:05'),
       (2, '2021-10-15 16:45:20'),
       (17, '2021-04-18 21:40:00'),
       (17, '2022-01-02 03:30:15'),
       (12, '2020-07-01 10:25:30'),
       (22, '2023-06-05 19:55:12'),
       (2, '2023-11-30 14:00:00'),
       (22, '2020-09-22 08:12:45'),
       (24, '2023-03-12 20:30:10'),
       (24, '2022-12-18 13:45:20'),
       (24, '2023-08-05 17:10:30'),
       (17, '2021-06-10 22:20:15');

SELECT user_id, MAX(time_stamp) last_stamp
FROM Logins
WHERE YEAR(time_stamp) = 2023
GROUP BY 1;

--4
DROP TABLE IF EXISTS Orders;
CREATE TABLE Orders
(
    id          INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT
);

TRUNCATE Orders;
INSERT INTO Orders (customer_id)
VALUES (10),
       (7),
       (7),
       (1),
       (19),
       (7),
       (13),
       (10),
       (7),
       (2),
       (11),
       (10),
       (11),
       (12),
       (10),
       (9),
       (10),
       (9),
       (10),
       (3);

SELECT customer_id FROM Orders
GROUP BY 1
ORDER BY COUNT(*) DESC
LIMIT 1;

--5
DROP TABLE IF EXISTS Employees;
CREATE TABLE Employees
(
    emp_id    INT,
    event_day DATE,
    in_time   INT,
    out_time  INT
);

TRUNCATE Employees;
INSERT INTO Employees (emp_id, event_day, in_time, out_time)
VALUES (1, '2023-01-05', 18, 300),
       (1, '2023-01-05', 500, 1300),
       (1, '2023-01-06', 120, 1440),
       (2, '2023-01-05', 60, 1250),
       (2, '2023-01-06', 30, 1250),
       (2, '2023-01-07', 60, 850),
       (3, '2023-01-05', 43, 1302),
       (3, '2023-01-06', 25, 1303),
       (3, '2023-01-07', 42, 1301),
       (4, '2023-01-05', 42, 850),
       (4, '2023-01-06', 120, 1250),
       (4, '2023-01-07', 25, 1308),
       (5, '2023-01-05', 42, 439),
       (5, '2023-01-05', 600, 850),
       (5, '2023-01-06', 43, 1250),
       (6, '2023-01-05', 25, 279),
       (6, '2023-01-05', 320, 600),
       (6, '2023-01-05', 801, 1440),
       (6, '2023-01-06', 124, 850),
       (7, '2023-01-05', 27, 1250),
       (7, '2023-01-06', 125, 1300);

SELECT emp_id, event_day, SUM(out_time - in_time) total_time
FROM Employees
GROUP BY 1, 2;

--6
DROP TABLE IF EXISTS Queries;
CREATE TABLE Queries
(
    query_name VARCHAR(50),
    result     VARCHAR(50),
    position   INT,
    rating     INT
);

TRUNCATE Queries;
INSERT INTO Queries
VALUES ('Elephant', 'African Elephant', 1, 4),
       ('Elephant', 'Indian Elephant', 2, 4),
       ('Elephant', 'Mammoth', 10, 5),
       ('Elephant', 'Woolly Mammoth', 15, 5),
       ('Elephant', 'Elephant Seal', 25, 1),
       ('Lion', 'African Lion', 1, 5),
       ('Lion', 'Asiatic Lion', 3, 4),
       ('Lion', 'Mountain Lion', 6, 3),
       ('Lion', 'Sea Lion', 12, 2),
       ('Lion', 'Lionfish', 18, 1),
       ('Bear', 'Grizzly Bear', 1, 5),
       ('Bear', 'Polar Bear', 2, 2),
       ('Bear', 'Brown Bear', 4, 2),
       ('Bear', 'Panda Bear', 8, 2),
       ('Bear', 'Koala Bear', 15, 1),
       ('Tiger', 'Bengal Tiger', 1, 5),
       ('Tiger', 'Siberian Tiger', 2, 5),
       ('Tiger', 'White Tiger', 5, 3),
       ('Tiger', 'Tiger Shark', 10, 1),
       ('Tiger', 'Tiger Lily', 20, 1);

SELECT 
    query_name, 
    ROUND(AVG(rating / position), 2) quality,
    ROUND(SUM(rating < 3) / COUNT(*)  * 100, 2) poor_query_percentage
FROM Queries
GROUP BY 1;

--7
DROP TABLE IF EXISTS Employees;
CREATE TABLE Employees
(
    id            INT,
    department_id INT,
    primary_flag  VARCHAR(3)
);

TRUNCATE Employees;
INSERT INTO Employees (id, department_id, primary_flag)
VALUES (1, 1, 'no'),
       (2, 1, 'yes'),
       (2, 2, 'no'),
       (3, 3, 'no'),
       (4, 2, 'no'),
       (4, 3, 'yes'),
       (4, 4, 'no'),
       (5, 1, 'no'),
       (6, 2, 'no'),
       (7, 3, 'no'),
       (8, 4, 'no'),
       (9, 1, 'no'),
       (10, 2, 'no'),
       (11, 3, 'no'),
       (11, 4, 'yes'),
       (12, 1, 'no'),
       (12, 2, 'yes'),
       (12, 3, 'no'),
       (13, 4, 'yes'),
       (13, 1, 'no');

SELECT 
    id employee_id,
    department_id primary_department_id
FROM Employees E
WHERE primary_flag = 'yes' OR 
    (SELECT COUNT(*) FROM Employees 
    WHERE E.id = id) = 1;

--8
DROP TABLE IF EXISTS Sales;
CREATE TABLE Sales
(
    sale_date DATE,
    fruit     VARCHAR(10),
    sold_num  INT
);

TRUNCATE Sales;
INSERT INTO Sales
VALUES ('2023-01-01', 'apple', 12),
       ('2023-01-01', 'orange', 10),
       ('2023-01-02', 'apple', 15),
       ('2023-01-02', 'orange', 18),
       ('2023-01-03', 'apple', 20),
       ('2023-01-03', 'orange', 5),
       ('2023-01-04', 'apple', 14),
       ('2023-01-04', 'orange', 16),
       ('2023-01-05', 'apple', 18),
       ('2023-01-05', 'orange', 20),
       ('2023-01-06', 'apple', 10),
       ('2023-01-06', 'orange', 12),
       ('2023-01-07', 'apple', 16),
       ('2023-01-07', 'orange', 8),
       ('2023-01-08', 'apple', 12),
       ('2023-01-08', 'orange', 10),
       ('2023-01-09', 'apple', 14),
       ('2023-01-09', 'orange', 6),
       ('2023-01-10', 'apple', 20),
       ('2023-01-10', 'orange', 22);

SELECT DISTINCT sale_date,
    ABS(
        (SELECT IFNULL(SUM(sold_num), 0) FROM Sales WHERE fruit = 'apple' AND S.sale_date = sale_date) -
        (SELECT IFNULL(SUM(sold_num), 0) FROM Sales WHERE fruit = 'orange' AND S.sale_date = sale_date)
    ) diff
FROM Sales S;

SELECT sale_date,
       ABS(SUM(IF(fruit = 'orange', sold_num, -sold_num))) AS diff
FROM Sales
GROUP BY sale_date;

--9
DROP TABLE IF EXISTS Warehouse;
DROP TABLE IF EXISTS Products;

-- Создание таблицы Products
CREATE TABLE Products
(
    id      INT PRIMARY KEY AUTO_INCREMENT,
    product VARCHAR(255),
    width   DECIMAL(5, 2),
    length  DECIMAL(5, 2),
    height  DECIMAL(5, 2)
);

INSERT INTO Products (product, width, length, height)
VALUES ('Laptop', 15, 10, 1),
       ('Smartphone', 3, 6, 0.5),
       ('Headphones', 6, 3, 2),
       ('T-shirt', 18, 12, 1),
       ('Sunglasses', 6, 2.5, 1.5),
       ('Watch', 2, 2, 0.5),
       ('Backpack', 12, 18, 6),
       ('Mouse', 3, 4, 1),
       ('Keyboard', 12, 6, 1),
       ('Jacket', 20, 15, 2),
       ('Umbrella', 5, 5, 12),
       ('Sunglasses', 5.5, 2.2, 1.8),
       ('Hat', 7, 7, 3),
       ('Wallet', 4, 3.5, 0.8),
       ('Shoes', 12, 5, 4),
       ('Tablet', 10, 8, 0.5),
       ('Charger', 2.5, 1.5, 1),
       ('Gloves', 3, 8, 0.5),
       ('Scarf', 10, 5, 0.2),
       ('Belt', 4, 2, 0.1);

-- Создание таблицы Warehouse
CREATE TABLE Warehouse
(
    name       VARCHAR(255),
    product_id INT,
    units      INT
);

TRUNCATE Warehouse;
INSERT INTO Warehouse
VALUES ('Somerset Fulfillment Center', 1, 3),
       ('Somerset Fulfillment Center', 2, 8),
       ('Somerset Fulfillment Center', 3, 6),
       ('Bowling Green Warehouse', 2, 5),
       ('Bowling Green Warehouse', 4, 2),
       ('Lansing Fulfillment Center', 1, 2),
       ('Lansing Fulfillment Center', 3, 4),
       ('Gatlinburg Warehouse', 4, 3),
       ('Gatlinburg Warehouse', 5, 5),
       ('Lansing Storage Warehouse', 1, 7),
       ('Lansing Storage Warehouse', 2, 10),
       ('Knoxville Fulfillment Center', 5, 3),
       ('Knoxville Fulfillment Center', 6, 1),
       ('Memphis Fulfillment Center', 1, 5),
       ('Memphis Fulfillment Center', 4, 6),
       ('Ann Arbor Fulfillment Center', 3, 7),
       ('Ann Arbor Fulfillment Center', 6, 3),
       ('Frankfort Fulfillment Center', 5, 2),
       ('Frankfort Fulfillment Center', 6, 4),
       ('Clarsvill Warehouse', 7, 2);

SELECT name warehouse_name,
    ROUND(SUM(units * width * length * height), 2) volume
FROM Warehouse JOIN Products ON id = product_id
GROUP BY 1;

--10
DROP TABLE IF EXISTS Sales;
DROP TABLE IF EXISTS Prices;

-- Создание таблицы Prices
CREATE TABLE Prices
(
    product_id INT,
    product    VARCHAR(100),
    start_date DATE,
    end_date   DATE,
    price      DECIMAL(10, 2)
);

INSERT INTO Prices
VALUES (3, 'Sony WH-1000XM4 Headphones', '2023-10-24', '2023-11-03', 10),
       (4, 'Nike Air Zoom Pegasus 38', '2023-09-11', '2023-09-21', 20),
       (2, 'Canon EOS R6 Camera', '2023-06-07', '2023-06-17', 40),
       (4, 'Nike Air Zoom Pegasus 38', '2023-08-17', '2023-08-27', 10),
       (1, 'Dyson V11 Animal Vacuum', '2023-08-15', '2023-08-25', 50),
       (3, 'Sony WH-1000XM4 Headphones', '2023-07-24', '2023-08-03', 10),
       (3, 'Sony WH-1000XM4 Headphones', '2023-05-19', '2023-05-29', 80),
       (5, 'Fitbit Versa 3', '2023-05-11', '2023-05-21', 10),
       (3, 'Sony WH-1000XM4 Headphones', '2023-06-18', '2023-06-28', 50),
       (1, 'Dyson V11 Animal Vacuum', '2023-06-14', '2023-06-24', 30),
       (5, 'Fitbit Versa 3', '2023-08-13', '2023-08-23', 100),
       (4, 'Nike Air Zoom Pegasus 38', '2023-06-05', '2023-06-15', 60),
       (1, 'Dyson V11 Animal Vacuum', '2023-10-19', '2023-10-29', 60),
       (2, 'Canon EOS R6 Camera', '2023-05-18', '2023-05-28', 10),
       (3, 'Sony WH-1000XM4 Headphones', '2023-07-10', '2023-07-20', 300),
       (5, 'Samsung 65-inch QLED TV', '2023-06-01', '2023-06-11', 70),
       (1, 'Dyson V11 Animal Vacuum', '2023-10-30', '2023-11-03', 50),
       (5, 'Fitbit Versa 3', '2023-08-24', '2023-09-02', 40),
       (5, 'Fitbit Versa 3', '2023-07-16', '2023-07-26', 80),
       (4, 'Nike Air Zoom Pegasus 38', '2023-10-12', '2023-10-22', 10);

-- Создание таблицы Sales
CREATE TABLE Sales
(
    product_id INT,
    sale_date  DATE,
    amount     INT
);

TRUNCATE Sales;
INSERT INTO Sales
VALUES (1, '2023-10-24', 4),
       (1, '2023-11-01', 5),
       (1, '2023-10-29', 2),
       (2, '2023-06-08', 6),
       (2, '2023-05-21', 1),
       (2, '2023-06-16', 3),
       (3, '2023-10-25', 4),
       (3, '2023-07-11', 10),
       (3, '2023-11-01', 2),
       (4, '2023-10-12', 12),
       (4, '2023-06-10', 8),
       (4, '2023-08-18', 6),
       (5, '2023-05-15', 4),
       (5, '2023-06-10', 3),
       (5, '2023-07-18', 17);

SELECT product, 
    ROUND(IFNULL(SUM(price * amount) / SUM(amount), 0), 2) average_selling_price
FROM Sales RIGHT JOIN Prices ON Sales.product_id = Prices.product_id
    AND sale_date BETWEEN start_date AND end_date
GROUP BY 1;

--11
DROP TABLE IF EXISTS Registers;
DROP TABLE IF EXISTS Users;

-- Создание таблицы Users
CREATE TABLE Users
(
    id       INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(60)
);

INSERT INTO Users (username)
VALUES ('John'),
       ('Emma'),
       ('Michael'),
       ('Olivia'),
       ('William'),
       ('Sophia'),
       ('Liam'),
       ('Ava'),
       ('James'),
       ('Charlotte'),
       ('Benjamin'),
       ('Mia'),
       ('Henry'),
       ('Ella'),
       ('Alexander'),
       ('Grace'),
       ('Daniel'),
       ('Scarlett'),
       ('Joseph'),
       ('Lily');

-- Создание таблицы Registers
CREATE TABLE Registers
(
    course_id INT,
    user_id   INT
);

TRUNCATE Registers;
INSERT INTO Registers
VALUES (101, 1),
       (102, 2),
       (101, 3),
       (102, 4),
       (101, 5),
       (103, 6),
       (102, 7),
       (104, 8),
       (101, 9),
       (102, 10),
       (103, 11),
       (101, 12),
       (103, 13),
       (101, 14),
       (102, 15),
       (101, 16),
       (103, 17),
       (101, 18),
       (102, 19),
       (101, 20);

SELECT course_id, 
    ROUND(COUNT(*) / (SELECT COUNT(*) FROM Users) * 100, 2) percentage
FROM Registers
GROUP BY 1;

--12
DROP TABLE IF EXISTS Calls;
CREATE TABLE Calls
(
    from_id  INT,
    to_id    INT,
    duration INT
);

TRUNCATE Calls;
INSERT INTO Calls
VALUES (2, 1, 45),
       (1, 3, 30),
       (3, 2, 15),
       (4, 1, 60),
       (2, 4, 75),
       (4, 3, 90),
       (1, 2, 120),
       (3, 1, 30),
       (4, 2, 25),
       (1, 4, 50),
       (2, 3, 40),
       (4, 2, 55),
       (3, 1, 65),
       (2, 4, 70),
       (1, 3, 80),
       (3, 2, 95),
       (4, 1, 110),
       (2, 1, 125),
       (1, 2, 140),
       (3, 4, 155);

SELECT 
    from_id person1,
    to_id person2,
    COUNT(*) call_count,
    SUM(duration) total_duration 
FROM (
    SELECT * FROM Calls
    UNION ALL 
    SELECT to_id, from_id, duration FROM Calls
) AS AllCalls
WHERE from_id < to_id
GROUP BY 1, 2;

--13
DROP TABLE IF EXISTS Activity;
CREATE TABLE Activity
(
    player_id    INT,
    event_date   DATE,
    games_played INT
);

TRUNCATE Activity;
INSERT INTO Activity
VALUES (4, '2023-01-05', 3),
       (5, '2023-01-06', 2),
       (5, '2023-01-07', 7),
       (5, '2023-01-08', 1),
       (8, '2023-01-09', 4),
       (9, '2023-01-10', 0),
       (10, '2023-01-11', 6),
       (10, '2023-01-12', 8),
       (12, '2023-01-13', 2),
       (13, '2023-01-14', 5),
       (14, '2023-01-15', 3),
       (15, '2023-01-16', 1),
       (16, '2023-01-17', 0),
       (11, '2023-01-19', 4),
       (10, '2023-01-20', 7),
       (12, '2023-01-21', 2),
       (12, '2023-01-22', 6),
       (13, '2023-01-23', 3),
       (13, '2023-01-24', 5),
       (14, '2023-01-25', 4),
       (14, '2023-01-25', 5),
       (15, '2023-01-26', 2),
       (15, '2023-01-26', 3),
       (10, '2023-01-27', 1),
       (16, '2023-01-27', 0);

SELECT ROUND(COUNT(DISTINCT A1.player_id) / 
    (SELECT COUNT(DISTINCT player_id) FROM Activity) * 100, 2) players
FROM Activity A1
JOIN Activity A2 ON A1.player_id = A2.player_id 
    AND A1.event_date = A2.event_date + INTERVAL 1 DAY;

--14
DROP TABLE IF EXISTS Orders;
CREATE TABLE Orders
(
    id                          INT PRIMARY KEY,
    customer_id                 INT,
    order_date                  DATE,
    customer_pref_delivery_date DATE
);

TRUNCATE Orders;
INSERT INTO Orders
VALUES (8, 5, '2023-01-15', '2023-01-15'),
       (9, 6, '2023-01-20', '2023-01-20'),
       (10, 5, '2023-02-02', '2023-02-03'),
       (11, 7, '2023-02-10', '2023-02-12'),
       (12, 8, '2023-02-20', '2023-02-20'),
       (13, 6, '2023-03-05', '2023-03-07'),
       (14, 9, '2023-03-12', '2023-03-12'),
       (15, 10, '2023-03-18', '2023-03-20'),
       (16, 7, '2023-04-01', '2023-04-01'),
       (17, 10, '2023-04-05', '2023-04-05'),
       (18, 8, '2023-04-10', '2023-04-11'),
       (19, 11, '2023-05-02', '2023-05-02'),
       (20, 11, '2023-05-10', '2023-05-10'),
       (21, 9, '2023-05-15', '2023-05-15'),
       (22, 12, '2023-06-01', '2023-06-03'),
       (23, 13, '2023-06-08', '2023-06-09'),
       (24, 12, '2023-06-15', '2023-06-16'),
       (25, 14, '2023-06-20', '2023-06-20'),
       (26, 15, '2023-07-05', '2023-07-05'),
       (27, 13, '2023-07-10', '2023-07-12');

WITH FirstOrders(id, order_date, delivery_date) AS
(
    SELECT customer_id, MIN(order_date), MIN(customer_pref_delivery_date)
    FROM Orders
    GROUP BY 1
)
SELECT 
    ROUND((
        SELECT COUNT(*) FROM FirstOrders
        WHERE order_date = delivery_date
    ) /
    (
        SELECT COUNT(*) FROM FirstOrders
    ) * 100, 2) immediate_percentage; 


/*  
****    11.6    ****
*/

--1
DROP TABLE IF EXISTS Numbers;
CREATE TABLE Numbers
(
    id  INT AUTO_INCREMENT PRIMARY KEY,
    num INT
);

TRUNCATE Numbers;
INSERT INTO Numbers (num)
VALUES (1),
       (3),
       (2),
       (2),
       (1),
       (4),
       (4),
       (3),
       (2),
       (5),
       (5),
       (5),
       (5),
       (1),
       (1),
       (1),
       (2),
       (8),
       (2),
       (2);

SELECT DISTINCT N1.num FROM Numbers N1
JOIN Numbers N2 ON N1.num = N2.num AND N1.id = N2.id + 1
JOIN Numbers N3 ON N2.num = N3.num AND N2.id = N3.id + 1;

--2
DROP TABLE IF EXISTS Cinema;
CREATE TABLE Cinema
(
    seat_id INT PRIMARY KEY AUTO_INCREMENT,
    free    INT
);

TRUNCATE Cinema;
INSERT INTO Cinema (free)
VALUES
    (0),
    (0),
    (1),
    (0),
    (1),
    (1),
    (0),
    (1),
    (0),
    (0),
    (0),
    (1),
    (1),
    (1),
    (0),
    (0),
    (0),
    (0),
    (1),
    (1);

SELECT DISTINCT C1.seat_id FROM Cinema C1
JOIN Cinema C2 ON C1.free = 0 AND C2.free = 0 
    AND ABS(C1.seat_id - C2.seat_id) = 1
ORDER BY 1;

--3
DROP TABLE IF EXISTS Points;
CREATE TABLE Points
(
    x INT
);

TRUNCATE Points;
INSERT INTO Points (x)
VALUES (-1),
       (0),
       (2),
       (4),
       (7),
       (9),
       (-3),
       (6),
       (1),
       (5),
       (3),
       (8),
       (-2),
       (10),
       (-5),
       (11),
       (-4),
       (12),
       (13),
       (-6);

SELECT MIN(ABS(P1.x - P2.x)) shortest
FROM Points P1 CROSS JOIN Points P2
WHERE P1.x != P2.x;

--4
DROP TABLE IF EXISTS LogInfo;
CREATE TABLE LogInfo
(
    account_id INT,
    ip_address INT,
    login      DATETIME,
    logout     DATETIME
);

TRUNCATE LogInfo;
INSERT INTO LogInfo (account_id, ip_address, login, logout)
VALUES (1, 1, '2023-09-13 08:00:00', '2023-09-13 10:00:00'),
       (1, 2, '2023-09-13 09:30:00', '2023-09-13 10:30:00'),
       (2, 3, '2023-09-13 08:15:00', '2023-09-13 09:45:00'),
       (2, 4, '2023-09-13 10:00:00', '2023-09-13 11:00:00'),
       (3, 5, '2023-09-13 08:30:00', '2023-09-13 10:30:00'),
       (3, 6, '2023-09-14 10:15:00', '2023-09-14 11:45:00'),
       (4, 7, '2023-09-14 10:45:00', '2023-09-14 11:00:00'),
       (4, 8, '2023-09-14 10:20:00', '2023-09-14 11:30:00'),
       (5, 9, '2023-09-15 08:10:00', '2023-09-15 09:20:00'),
       (5, 10, '2023-09-15 10:45:00', '2023-09-15 11:15:00'),
       (6, 11, '2023-09-15 08:25:00', '2023-09-15 09:35:00'),
       (6, 12, '2023-09-16 09:20:00', '2023-09-16 11:25:00'),
       (7, 13, '2023-09-16 08:40:00', '2023-09-16 09:10:00'),
       (7, 14, '2023-09-16 09:05:00', '2023-09-16 09:10:00'),
       (8, 15, '2023-09-16 08:05:00', '2023-09-16 09:05:00'),
       (8, 16, '2023-09-16 10:10:00', '2023-09-16 11:35:00'),
       (9, 17, '2023-09-17 08:20:00', '2023-09-17 09:30:00'),
       (9, 18, '2023-09-17 10:40:00', '2023-09-17 11:20:00'),
       (10, 19, '2023-09-18 08:35:00', '2023-09-18 09:50:00'),
       (10, 20, '2023-09-18 08:35:00', '2023-09-18 11:25:00'),
       (11, 21, '2023-09-18 08:50:00', '2023-09-18 10:15:00'),
       (11, 22, '2023-09-19 10:30:00', '2023-09-19 11:40:00'),
       (12, 23, '2023-09-20 08:15:00', '2023-09-20 09:30:00'),
       (12, 24, '2023-09-20 10:45:00', '2023-09-20 11:05:00'),
       (13, 25, '2023-09-20 08:30:00', '2023-09-20 09:45:00');

SELECT DISTINCT L1.account_id FROM LogInfo L1
JOIN LogInfo L2 ON L1.account_id = L2.account_id
    AND L1.ip_address != L2.ip_address
    AND L1.login <= L2.login
WHERE L2.login BETWEEN L1.login AND L1.logout;

--5
DROP TABLE IF EXISTS Employees;
CREATE TABLE Employees
(
    id         INT PRIMARY KEY AUTO_INCREMENT,
    name       VARCHAR(255),
    surname    VARCHAR(255),
    age        INT,
    manager_id INT
);

INSERT INTO Employees (name, surname, age, manager_id)
VALUES ('John', 'Doe', 35, NULL),
       ('Jane', 'Smith', 28, NULL),
       ('Michael', 'Johnson', 40, NULL),
       ('Emily', 'Williams', 32, 1),
       ('David', 'Brown', 45, 1),
       ('Linda', 'Jones', 38, 1),
       ('Robert', 'Miller', 33, 1),
       ('Sarah', 'Davis', 29, 3),
       ('James', 'Wilson', 41, 3),
       ('Susan', 'Taylor', 34, 4),
       ('William', 'Anderson', 39, 4),
       ('Karen', 'Martinez', 30, 2),
       ('Joseph', 'Hernandez', 36, 5),
       ('Nancy', 'Garcia', 31, 2),
       ('Daniel', 'Rodriguez', 37, 6),
       ('Lisa', 'Lopez', 42, 2),
       ('Charles', 'Perez', 27, 5),
       ('Jessica', 'Moore', 43, 2),
       ('Matthew', 'Jackson', 26, 8),
       ('Patricia', 'White', 44, 9);

SELECT E1.name, E1.surname, 
    COUNT(*) subordinates, ROUND(AVG(E2.age)) average_age
FROM Employees E1
JOIN Employees E2 ON E1.id = E2.manager_id
GROUP BY 1, 2;

--6
DROP TABLE IF EXISTS Salaries;
DROP TABLE IF EXISTS Employees;

-- Создание таблицы Employees
CREATE TABLE Employees
(
    id      INT,
    name    VARCHAR(50),
    surname VARCHAR(50)
);

INSERT INTO Employees (id, name, surname)
VALUES (2, 'Alice', 'Smith'),
       (3, 'Bob', 'Johnson'),
       (4, 'Eva', 'Williams'),
       (5, 'Daniel', 'Brown'),
       (6, 'Sophia', 'Jones'),
       (7, 'Michael', 'Davis'),
       (9, 'William', 'Lee'),
       (10, 'Ava', 'Hall'),
       (11, 'James', 'Miller'),
       (13, 'Benjamin', 'Taylor'),
       (14, 'Mia', 'Anderson'),
       (15, 'Walter', 'White'),
       (16, 'David', 'Dou'),
       (17, 'JoJo', 'Referens'),
       (18, 'Ethan', 'Harris'),
       (19, 'Emma', 'Martin');

-- Создание таблицы Salaries
CREATE TABLE Salaries
(
    employee_id INT,
    salary      DECIMAL(10, 2)
);

TRUNCATE Salaries;
INSERT INTO Salaries (employee_id, salary)
VALUES (1, 22517.00),
       (2, 30500.50),
       (5, 76071.00),
       (8, 62000.00),
       (9, 48000.50),
       (10, 69000.75),
       (11, 58000.00),
       (12, 71000.25),
       (13, 63000.50),
       (14, 54000.75),
       (18, 61000.25),
       (20, 75000.75);

SELECT DISTINCT id employee_id FROM Employees
LEFT JOIN Salaries ON id = employee_id
WHERE salary IS NULL
UNION
SELECT DISTINCT employee_id FROM Employees
RIGHT JOIN Salaries ON id = employee_id
WHERE name IS NULL
ORDER BY 1;

--7
--8
--9
--10