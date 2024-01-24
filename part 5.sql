/*  
****    7.2    ****
*/

DROP TABLE IF EXISTS Sales;
DROP TABLE IF EXISTS Products;

-- Создание таблицы Products
CREATE TABLE Products
(
    id    INT PRIMARY KEY AUTO_INCREMENT,
    name  VARCHAR(50),
    price INT
);

INSERT INTO Products (name, price)
VALUES ('Apple iPhone 13 Pro', 900),
       ('Samsung Galaxy S21', 600),
       ('Lenovo ThinkPad X1 Carbon', 1400),
       ('Dell XPS 13', 600),
       ('Canon EOS R6', 1900);

-- Создание таблицы Sales
CREATE TABLE Sales
(
    id         INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    sale_date  DATE
);

TRUNCATE Sales;
INSERT INTO Sales (product_id, sale_date)
VALUES (1, '2023-09-11'),
       (2, '2023-09-11'),
       (1, '2023-09-11'),
       (3, '2023-09-12'),
       (4, '2023-09-12'),
       (1, '2023-09-12'),
       (4, '2023-09-12'),
       (4, '2023-09-13'),
       (3, '2023-09-13'),
       (1, '2023-09-14');

--1
SELECT DISTINCT name AS product FROM Products
JOIN Sales ON Products.id = product_id;

--2
SELECT DISTINCT name AS product FROM Products
JOIN Sales ON Products.id = product_id AND sale_date = '2023-09-12';

--3
SELECT name AS product, CONCAT(SUM(price), '€') AS amount 
FROM Products
JOIN Sales ON Products.id = product_id
GROUP BY product;

--4
SELECT name AS bestseller FROM Products
JOIN Sales ON Products.id = product_id AND sale_date = '2023-09-12'
GROUP BY bestseller
ORDER BY COUNT(*) DESC
LIMIT 1;

--5
SELECT name AS product FROM Products
JOIN Sales ON Products.id = product_id AND sale_date = '2023-09-12'
GROUP BY product
HAVING COUNT(*) = 1
ORDER BY product;

--6
DROP TABLE IF EXISTS Sales;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Categories;

-- Создание таблицы Categories
CREATE TABLE Categories
(
    id   INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50)
);

INSERT INTO Categories (name)
VALUES ('Laptops'),
       ('Smartphones'),
       ('Cameras');

-- Создание таблицы Products
CREATE TABLE Products
(
    id          INT PRIMARY KEY AUTO_INCREMENT,
    category_id INT,
    name        VARCHAR(50),
    price       INT
);

INSERT INTO Products (name, category_id, price)
VALUES ('Apple iPhone 13 Pro', 2, 900),
       ('Samsung Galaxy S21', 2, 600),
       ('Lenovo ThinkPad X1 Carbon', 1, 1400),
       ('Dell XPS 13', 1, 600),
       ('Canon EOS R6', 3, 1900);

-- Создание таблицы Sales
CREATE TABLE Sales
(
    id         INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    sale_date  DATE
);

TRUNCATE Sales;
INSERT INTO Sales (product_id, sale_date)
VALUES (1, '2023-09-11'),
       (2, '2023-09-11'),
       (1, '2023-09-11'),
       (3, '2023-09-12'),
       (4, '2023-09-12'),
       (1, '2023-09-12'),
       (4, '2023-09-12'),
       (4, '2023-09-13'),
       (3, '2023-09-13'),
       (1, '2023-09-14');

SELECT 
    S.id sale_id,
    S.sale_date,
    P.name product,
    C.name category
FROM Sales S 
JOIN Products P ON P.id = S.product_id
JOIN Categories C ON P.category_id = C.id;

--7
SELECT C.name category
FROM Sales S 
JOIN Products P ON P.id = S.product_id
JOIN Categories C ON P.category_id = C.id
GROUP BY C.name
ORDER BY SUM(P.price) DESC
LIMIT 1;

--8
DROP TABLE IF EXISTS Employees;
CREATE TABLE Employees
(
    id         INT PRIMARY KEY AUTO_INCREMENT,
    name       VARCHAR(50),
    salary     DECIMAL(10, 2),
    manager_id INT
);

TRUNCATE Employees;
INSERT INTO Employees (name, salary, manager_id)
VALUES ('John', 50000.00, null),
       ('Jane', 21000.00, 1),
       ('Michael', 48000.00, 1),
       ('Emily', 15000.00, null),
       ('Sophia', 49000.00, null),
       ('Oliver', 48000.00, 4),
       ('Emma', 15000.00, null),
       ('Liam', 30000.00, null),
       ('Ava', 11000.00, 5),
       ('Lucas', 45000.00, 6),
       ('Mila', 47000.00, null),
       ('Ethan', 46000.00, 8),
       ('Isabella', 49000.00, 9),
       ('Noah', 48000.00, 12),
       ('Sophia', 15000.00, null),
       ('Logan', 30000.00, null),
       ('Olivia', 44000.00, 16),
       ('Aiden', 45000.00, 17),
       ('Chloe', 46000.00, 5);

SELECT E1.name FROM Employees E1
JOIN Employees E2 ON E1.manager_id = E2.id AND E1.salary > E2.salary;


/*  
****    7.3    ****
*/

DROP TABLE IF EXISTS Sales;
DROP TABLE IF EXISTS Products;

-- Создание таблицы Products
CREATE TABLE Products
(
    id    INT PRIMARY KEY AUTO_INCREMENT,
    name  VARCHAR(50),
    price INT
);

INSERT INTO Products (name, price)
VALUES ('Apple iPhone 13 Pro', 900),
       ('Samsung Galaxy S21', 600),
       ('Lenovo ThinkPad X1 Carbon', 1400),
       ('Dell XPS 13', 600),
       ('Canon EOS R6', 1900);

-- Создание таблицы Sales
CREATE TABLE Sales
(
    id         INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    sale_date  DATE
);

TRUNCATE Sales;
INSERT INTO Sales (product_id, sale_date)
VALUES (1, '2023-09-11'),
       (2, '2023-09-11'),
       (1, '2023-09-11'),
       (2, '2023-09-12'),
       (4, '2023-09-12'),
       (1, '2023-09-12'),
       (4, '2023-09-12'),
       (4, '2023-09-13'),
       (4, '2023-09-13'),
       (1, '2023-09-14');

--1
SELECT name AS product FROM Products
LEFT JOIN Sales ON Products.id = product_id
WHERE ISNULL(Sales.id);

--2
SELECT 
    name product, 
    IFNULL(MIN(sale_date), 'Not sold') first_sale 
FROM Products
LEFT JOIN Sales ON Products.id = product_id
GROUP BY product;

--3
SELECT 
    name product,
    CONCAT(SUM(price) * (COUNT(product_id) != 0), '€') amount
FROM Products
LEFT JOIN Sales ON Products.id = product_id
GROUP BY product;

--4
DROP TABLE IF EXISTS Sales;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Categories;

-- Создание таблицы Categories
CREATE TABLE Categories
(
    id   INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50)
);

INSERT INTO Categories (name)
VALUES ('Laptops'),
       ('Smartphones'),
       ('Cameras');

-- Создание таблицы Products
CREATE TABLE Products
(
    id          INT PRIMARY KEY AUTO_INCREMENT,
    category_id INT,
    name        VARCHAR(50),
    price       INT
);

INSERT INTO Products (name, category_id, price)
VALUES ('Apple iPhone 13 Pro', 2, 900),
       ('Samsung Galaxy S21', 2, 600),
       ('Lenovo ThinkPad X1 Carbon', 1, 1400),
       ('Dell XPS 13', 1, 600),
       ('Canon EOS R6', 3, 1900);

-- Создание таблицы Sales
CREATE TABLE Sales
(
    id         INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    sale_date  DATE
);

TRUNCATE Sales;
INSERT INTO Sales (product_id, sale_date)
VALUES (1, '2023-09-11'),
       (2, '2023-09-11'),
       (1, '2023-09-11'),
       (2, '2023-09-12'),
       (4, '2023-09-12'),
       (1, '2023-09-12'),
       (4, '2023-09-12'),
       (4, '2023-09-13'),
       (4, '2023-09-13'),
       (1, '2023-09-14');

SELECT 
    Categories.name AS category, 
    CONCAT(ROUND(IFNULL(AVG(price), 0)), '€') AS avg_amount 
FROM Products
RIGHT JOIN Sales ON Products.id = product_id 
RIGHT JOIN Categories ON Categories.id = category_id
GROUP BY Categories.name

--5
DROP TABLE IF EXISTS FemaleStaff;
DROP TABLE IF EXISTS MaleStaff;

-- Создание таблицы MaleStaff
CREATE TABLE MaleStaff
(
  id      INT PRIMARY KEY AUTO_INCREMENT,
  staffer VARCHAR(50),
  age     INT
);

INSERT INTO MaleStaff (staffer, age) VALUES
  ('Larry Page', 48),
  ('Sundar Pichai', 49),
  ('Eric Schmidt', 66),
  ('Jeff Dean', 49),
  ('Hiroshi Lockheimer', 43);

-- Создание таблицы FemaleStaff
CREATE TABLE FemaleStaff
(
  id      INT PRIMARY KEY AUTO_INCREMENT,
  staffer VARCHAR(50),
  age     INT
);

INSERT INTO FemaleStaff (staffer, age) VALUES
  ('Susan Wojcicki', 53),
  ('Ruth Porat', 63),
  ('Aparna Chennapragada', 48);

SELECT M.staffer male_staffer, F.staffer female_staffer 
FROM MaleStaff M CROSS JOIN FemaleStaff F
WHERE ABS(M.age - F.age) < 5
ORDER BY male_staffer, female_staffer;

--6
DROP TABLE IF EXISTS Drinks;
DROP TABLE IF EXISTS Meals;

-- Создание таблицы Meals
CREATE TABLE Meals
(
  id    INT PRIMARY KEY AUTO_INCREMENT,
  name  VARCHAR(50),
  price INT
);

INSERT INTO Meals (name, price)
VALUES ('Omlet', 2),
       ('Waffles', 4),
       ('Pizza', 10),
       ('Cheeseburger', 5);

-- Создание таблицы Drinks
CREATE TABLE Drinks
(
  id    INT PRIMARY KEY AUTO_INCREMENT,
  name  VARCHAR(50),
  price INT
);

INSERT INTO Drinks (name, price)
VALUES ('Orange Juice', 3),
       ('Green Tea', 2),
       ('Coffee', 2),
       ('Water', 0);
       
SELECT 
    CONCAT(M.name, ', ', D.name) AS combo,
    CONCAT(M.price + D.price, '€') AS price
FROM Meals M CROSS JOIN Drinks D
ORDER BY M.price + D.price, combo;

--7
DROP TABLE IF EXISTS Ranks;
DROP TABLE IF EXISTS Suits;

-- Создание таблицы Suits
CREATE TABLE Suits
(
  suit VARCHAR(10)
);

INSERT INTO Suits (suit)
VALUES ('Hearts'),
       ('Diamonds'),
       ('Clubs'),
       ('Spades');

-- Создание таблицы Ranks
CREATE TABLE Ranks
(
  rankvalue VARCHAR(10)
);

INSERT INTO Ranks (rankvalue)
VALUES ('2'),
       ('3'),
       ('4'),
       ('5'),
       ('6'),
       ('7'),
       ('8'),
       ('9'),
       ('10'),
       ('Jack'),
       ('Queen'),
       ('King'),
       ('Ace');

SELECT suit, rankvalue FROM Ranks CROSS JOIN Suits
ORDER BY 
    CASE suit
        WHEN 'Spades' THEN 0
        WHEN 'Clubs' THEN 1
        WHEN 'Diamonds' THEN 2
        ELSE 3
    END,
    CASE 
        WHEN CAST(rankvalue AS UNSIGNED) BETWEEN 2 AND 10 THEN CAST(rankvalue AS UNSIGNED)
        WHEN rankvalue = 'Jack' THEN 11
        WHEN rankvalue = 'Queen' THEN 12
        WHEN rankvalue = 'King' THEN 13
        ELSE 14
    END; 

--8
DROP TABLE IF EXISTS Points;
CREATE TABLE Points
(
    id INT AUTO_INCREMENT PRIMARY KEY,
    x  INT,
    y  INT
);

INSERT INTO Points (x, y)
VALUES (2, 7),
       (4, 8),
       (2, 10),
       (1, 1),
       (3, 2),
       (1, 4),
       (5, 3),
       (6, 6),
       (9, 5);

SELECT 
    CONCAT('(', P1.x, '; ', P1.y, ')') AS p1,
    CONCAT('(', P2.x, '; ', P2.y, ')') AS p2,
    ROUND(SQRT(POW(P1.x - P2.x, 2) + POW(P1.y - P2.y, 2)), 1) AS distance
FROM Points P1 CROSS JOIN Points P2
WHERE P1.x != P2.y AND P1.y != P2.x
HAVING distance > 5;


/*  
****    7.4    ****
*/

--1
DROP TABLE IF EXISTS Programmers;
DROP TABLE IF EXISTS Physicists;
DROP TABLE IF EXISTS Mathematicians;

-- Создание таблицы Mathematicians
CREATE TABLE Mathematicians
(
    id      INT PRIMARY KEY AUTO_INCREMENT,
    name    VARCHAR(30),
    surname VARCHAR(30)
);

TRUNCATE Mathematicians;
INSERT INTO Mathematicians (name, surname)
VALUES
    ('Leonhard', 'Euler'),
    ('Carl', 'Gauss'),
    ('Isaac', 'Newton'),
    ('Euclid', 'Alexandria'),
    ('Albert', 'Einstein'),
    ('John', 'Milnor'),
    ('Blaise', 'Pascal'),
    ('Rene', 'Descartes'),
    ('Andrew', 'Wiles'),
    ('Srinivasa', 'Ramanujan'),
    ('John', 'Nash'),
    ('Kurt', 'Godel');

-- Создание таблицы Physicists
CREATE TABLE Physicists
(
    id      INT PRIMARY KEY AUTO_INCREMENT,
    name    VARCHAR(30),
    surname VARCHAR(30)
);

TRUNCATE Physicists;
INSERT INTO Physicists (name, surname)
VALUES
    ('Richard', 'Muller'),
    ('Isaac', 'Newton'),
    ('Galileo', 'Galilei'),
    ('Niels', 'Bohr'),
    ('Richard', 'Feynman');

-- Создание таблицы Programmers
CREATE TABLE Programmers
(
    id      INT PRIMARY KEY AUTO_INCREMENT,
    name    VARCHAR(30),
    surname VARCHAR(30)
);

TRUNCATE Programmers;
INSERT INTO Programmers (name, surname)
VALUES
    ('Alan', 'Turing'),
    ('Grace', 'Hopper'),
    ('Linus', 'Torvalds'),
    ('Tim', 'Berners'),
    ('Ada', 'Lovelace'),
    ('John', 'Neumann'),
    ('Dennis', 'Ritchie'),
    ('Tim', 'Peters'),
    ('Donald', 'Knuth'),
    ( 'Larry', 'Page');

SELECT profession, COUNT(*) AS total 
FROM (
    SELECT 'Mathematician' AS profession FROM Mathematicians
    UNION
    SELECT 'Physicist' AS profession FROM Physicists
    UNION
    SELECT 'Programmer' AS profession FROM Programmers
)
GROUP BY profession;

SELECT 'Mathematician' AS profession, COUNT(*) AS total
FROM Mathematicians
UNION 
SELECT 'Physicist', COUNT(*)
FROM Physicists
UNION 
SELECT 'Programmer', COUNT(*)
FROM Programmers

--2
DROP TABLE IF EXISTS Sessions;
CREATE TABLE Sessions
(
    id         INT AUTO_INCREMENT PRIMARY KEY,
    duration   INT
);

TRUNCATE Sessions;
INSERT INTO Sessions(duration)
VALUES (264),
       (2968),
       (600),
       (1328),
       (499),
       (1511),
       (57),
       (1754),
       (2596),
       (1716),
       (794),
       (1822),
       (727),
       (1170),
       (668),
       (300),
       (138),
       (1204),
       (2607),
       (421),
       (283),
       (153),
       (599),
       (2111),
       (899),
       (2736),
       (2239),
       (299),
       (2200),
       (900);

SELECT 
    '[0-5)' AS session_duration,
    COUNT(*) AS total
FROM Sessions
WHERE duration / 60 < 5
UNION
SELECT 
    '[5-10)' AS session_duration,
    COUNT(*) AS total
FROM Sessions
WHERE duration / 60 BETWEEN 5 AND 9.999
UNION
SELECT 
    '[10-15)' AS session_duration,
    COUNT(*) AS total
FROM Sessions
WHERE duration / 60 BETWEEN 10 AND 14.999
UNION
SELECT 
    '15 or more' AS session_duration,
    COUNT(*) AS total
FROM Sessions
WHERE duration / 60 >= 15;

--3
DROP TABLE IF EXISTS Files;
CREATE TABLE Files
(
    file_name VARCHAR(30),
    content   TEXT
);

TRUNCATE Files;
INSERT INTO Files (file_name, content)
VALUES ('file312.txt', 'Geeks know how to put into practice the acquired knowledge'),
       ('file52.txt', 'The first images of bee are in the rock paintings of ancient people'),
       ('file132.txt', 'If talk to this geek for 30 minutes, it begins to seem that he has the hearing of a bat'),
       ('file1.txt', 'All worker bees are females'),
       ('file5.txt', 'The bee has two huge beautiful eyes on the sides of its head'),
       ('file18.txt', 'Otaku: geek of anime'),
       ('file289.txt', 'A bee has six legs'),
       ('file192.txt', 'They know something that many people don’t know. Geeks constantly study'),
       ('file107.txt', 'Whovian: Doctor Who Maniac Fan'),
       ('file10.txt', 'Large amounts of smoke can anger a bee'),
       ('file130.txt', 'bee'),
       ('file59.txt', 'A person is not stung by a swarming bees'),
       ('file33.txt', 'Bee were highly revered in ancient Egypt'),
       ('file66.txt', 'Bees can dance'),
       ('file67.txt', 'Geek are a specific layer of society’s culture'),
       ('file45.txt', 'Queen bee are almost 2 times larger than workers'),
       ('file141.txt', 'developed by the BEEGEEK team'),
       ('file230.txt', 'Yes, sometimes listening to an hour-long speech by a geek'),
       ('file180.txt', 'Geek'),
       ('file162.txt', 'A geek who knows Vulcan greetings'),
       ('file114.txt', 'Gamer: a type of geek with amazing coordination of movements'),
       ('file115.txt', 'Roleplayer: chameleon and actor of the world of the geeks'),
       ('file7.txt', 'Bee distinguishes colors');

SELECT 
    'bee' AS word, 
    COUNT(*) AS count 
FROM Files
WHERE content LIKE ' bee ' OR content LIKE 'bee ' OR content LIKE ' bee'
UNION
SELECT 
    'geek' AS word, 
    COUNT(*) AS count 
FROM Files
WHERE content LIKE ' geek ' OR content LIKE 'geek ' OR content LIKE ' geek';

--4
DROP TABLE IF EXISTS Programmers;
DROP TABLE IF EXISTS Physicists;
DROP TABLE IF EXISTS Mathematicians;

-- Создание таблицы Mathematicians
CREATE TABLE Mathematicians
(
    id      INT PRIMARY KEY AUTO_INCREMENT,
    name    VARCHAR(30),
    surname VARCHAR(30)
);

TRUNCATE Mathematicians;
INSERT INTO Mathematicians (name, surname)
VALUES ('Leonhard', 'Euler'),
       ('Carl', 'Gauss'),
       ('Isaac', 'Newton'),
       ('Euclid', 'Alexandria'),
       ('Albert', 'Einstein'),
       ('John', 'Milnor'),
       ('Blaise', 'Pascal'),
       ('Rene', 'Descartes'),
       ('Andrew', 'Wiles'),
       ('Srinivasa', 'Ramanujan'),
       ('John', 'Nash'),
       ('Kurt', 'Godel');

-- Создание таблицы Physicists
CREATE TABLE Physicists
(
    id      INT PRIMARY KEY AUTO_INCREMENT,
    name    VARCHAR(30),
    surname VARCHAR(30)
);

TRUNCATE Physicists;
INSERT INTO Physicists (name, surname)
VALUES ('Richard', 'Muller'),
       ('Isaac', 'Newton'),
       ('Galileo', 'Galilei'),
       ('Niels', 'Bohr'),
       ('Richard', 'Feynman');

-- Создание таблицы Programmers
CREATE TABLE Programmers
(
    id      INT PRIMARY KEY AUTO_INCREMENT,
    name    VARCHAR(30),
    surname VARCHAR(30)
);

TRUNCATE Programmers;
INSERT INTO Programmers (name, surname)
VALUES ('Alan', 'Turing'),
       ('Grace', 'Hopper'),
       ('Linus', 'Torvalds'),
       ('Tim', 'Berners'),
       ('Ada', 'Lovelace'),
       ('John', 'Neumann'),
       ('Dennis', 'Ritchie'),
       ('Tim', 'Peters'),
       ('Donald', 'Knuth'),
       ('Larry', 'Page');

SELECT name, surname FROM
(
    SELECT *, 0 AS S FROM Mathematicians
    UNION
    SELECT *, 1 FROM Physicists
    UNION
    SELECT *, 2 FROM Programmers
) AS T
ORDER BY S, name DESC, surname DESC;


/*  
****    7.5    ****
*/

--1
DROP TABLE IF EXISTS Teams;
CREATE TABLE Teams
(
    name VARCHAR(50)
);

INSERT INTO Teams (name)
VALUES ('Manchester United'),
       ('Liverpool FC'),
       ('Chelsea FC'),
       ('Arsenal FC'),
       ('Manchester City'),
       ('Tottenham Hotspur'),
       ('Everton FC'),
       ('Leicester City'),
       ('West Ham United'),
       ('Aston Villa FC');

SELECT T1.name home_team, T2.name away_team 
FROM Teams T1 CROSS JOIN Teams T2 
WHERE T1.name != T2.name; 

--2
DROP TABLE IF EXISTS Elements;
CREATE TABLE Elements
(
    symbol VARCHAR(2),
    type   VARCHAR(10)
);

INSERT INTO Elements (symbol, type)
VALUES ('H', 'nonmetal'),
       ('Li', 'metal'),
       ('Be', 'metal'),
       ('C', 'nonmetal'),
       ('Ne', 'noble'),
       ('F', 'nonmetal'),
       ('Na', 'metal'),
       ('Mg', 'metal'),
       ('O', 'nonmetal'),
       ('N', 'nonmetal'),
       ('Al', 'metal'),
       ('P', 'nonmetal'),
       ('Ar', 'noble'),
       ('K', 'metal'),
       ('S', 'nonmetal'),
       ('Ca', 'metal'),
       ('Cl', 'nonmetal'),
       ('Kr', 'noble'),
       ('Rb', 'metal'),
       ('Br', 'nonmetal');

SELECT E1.symbol metal, E2.symbol nonmetal
FROM Elements E1, Elements E2 
WHERE E1.type = 'metal' AND E2.type = 'nonmetal';

--3
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Products;

-- Создание таблицы Products
CREATE TABLE Products
(
    id    INT PRIMARY KEY AUTO_INCREMENT,
    price DECIMAL(10, 2)
);

INSERT INTO Products (price)
VALUES (10.00),
       (25.50),
       (15.75),
       (30.25),
       (12.99),
       (5.99),
       (40.00),
       (18.50),
       (8.75),
       (22.00),
       (14.50),
       (9.99),
       (35.75),
       (20.00),
       (7.25),
       (13.75),
       (27.50),
       (11.99),
       (32.00),
       (17.25);

-- Создание таблицы Orders
CREATE TABLE Orders
(
    id         INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    user_id    INT,
    quantity   INT
);

TRUNCATE Orders;
INSERT INTO Orders (product_id, user_id, quantity)
VALUES (1, 101, 10),
       (2, 101, 2),
       (3, 102, 5),
       (4, 102, 3),
       (5, 103, 4),
       (6, 104, 7),
       (7, 104, 1),
       (8, 105, 3),
       (9, 105, 6),
       (10, 106, 2),
       (11, 106, 2),
       (12, 107, 9),
       (13, 107, 4),
       (14, 108, 8),
       (15, 108, 2),
       (16, 109, 5),
       (17, 109, 3),
       (18, 110, 6),
       (19, 110, 4),
       (20, 111, 2);

SELECT user_id, SUM(quantity * price) spending
FROM Orders JOIN Products ON Products.id = product_id
GROUP BY 1
ORDER BY 2 DESC;

--4
DROP TABLE IF EXISTS Invoices;
DROP TABLE IF EXISTS Products;

-- Создание таблицы Products
CREATE TABLE Products
(
    id   INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50)
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
       ('Bose QuietComfort 35 II'),
       ('Samsung 65-inch QLED TV'),
       ('LG OLED55CXPUA TV'),
       ('Apple AirPods Pro'),
       ('Fitbit Versa 3'),
       ('PlayStation 5'),
       ('Xbox Series X'),
       ('Amazon Echo Dot (4th Gen)'),
       ('GoPro HERO9 Black'),
       ('Samsung Galaxy Tab S7'),
       ('Dyson V11 Animal Vacuum'),
       ('Instant Pot Duo 7-in-1');

-- Создание таблицы Invoices
CREATE TABLE Invoices
(
    id         INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    rest       INT,
    paid       INT,
    cancelled  INT,
    refunded   INT
);

INSERT INTO Invoices (id, product_id, rest, paid, cancelled, refunded)
VALUES (1, 13, 211, 130, 16, 692),
       (2, 6, 428, 284, 138, 839),
       (3, 4, 973, 273, 449, 427),
       (4, 19, 690, 619, 26, 274),
       (5, 4, 730, 192, 771, 278),
       (6, 9, 176, 553, 235, 520),
       (7, 3, 520, 265, 764, 28),
       (8, 1, 116, 486, 85, 966),
       (9, 9, 103, 225, 819, 418),
       (10, 15, 457, 180, 532, 119),
       (11, 1, 147, 616, 638, 345),
       (12, 9, 121, 274, 7, 212),
       (13, 6, 306, 690, 532, 591),
       (14, 11, 468, 794, 565, 446),
       (15, 10, 361, 321, 525, 660),
       (16, 17, 95, 944, 435, 346),
       (17, 12, 742, 989, 719, 630),
       (18, 16, 749, 411, 810, 818),
       (19, 13, 949, 893, 619, 414),
       (20, 12, 826, 351, 275, 325),
       (21, 20, 734, 743, 515, 346),
       (22, 3, 402, 679, 190, 914),
       (23, 20, 668, 441, 204, 696),
       (24, 7, 347, 830, 107, 48),
       (25, 17, 849, 822, 565, 360),
       (26, 10, 210, 608, 412, 235),
       (27, 15, 529, 405, 441, 990),
       (28, 14, 99, 512, 265, 790),
       (29, 5, 928, 957, 0, 131),
       (30, 12, 712, 802, 873, 962);

SELECT 
    name product, 
    IFNULL(SUM(rest), 0) rest, 
    IFNULL(SUM(paid), 0) paid, 
    IFNULL(SUM(cancelled), 0) cancelled, 
    IFNULL(SUM(refunded), 0) refunded
FROM Products LEFT JOIN Invoices
ON Products.id = product_id
GROUP BY product
ORDER BY product;

--5
DROP TABLE IF EXISTS Confirmations;
CREATE TABLE Confirmations
(
    user_id    INT,
    time_stamp DATETIME,
    action     VARCHAR(10)
);

TRUNCATE Confirmations;
INSERT INTO Confirmations (user_id, time_stamp, action)
VALUES (1, '2023-09-25 08:50:39', 'timeout'),
       (1, '2023-09-26 09:02:20', 'timeout'),
       (1, '2023-09-25 09:20:11', 'confirmed'),
       (2, '2023-08-03 11:04:16', 'confirmed'),
       (3, '2023-09-16 12:00:11', 'timeout'),
       (3, '2023-09-17 12:00:11', 'timeout'),
       (4, '2023-08-05 14:02:39', 'confirmed'),
       (4, '2023-09-25 15:00:20', 'timeout'),
       (5, '2023-05-25 16:00:11', 'timeout'),
       (5, '2023-07-25 17:02:00', 'confirmed'),
       (6, '2023-07-05 18:00:39', 'confirmed'),
       (6, '2023-09-25 19:50:20', 'timeout'),
       (6, '2023-07-05 18:00:16', 'confirmed'),
       (7, '2023-05-25 20:04:00', 'timeout'),
       (7, '2023-04-05 21:02:39', 'timeout'),
       (7, '2023-04-05 21:00:20', 'timeout'),
       (8, '2023-03-25 22:00:11', 'timeout'),
       (8, '2023-10-25 23:04:00', 'confirmed'),
       (8, '2023-03-25 22:50:20', 'timeout'),
       (9, '2023-09-06 00:00:39', 'confirmed'),
       (9, '2023-09-06 00:02:20', 'confirmed'),
       (9, '2023-09-06 00:00:11', 'confirmed'),
       (10, '2023-07-26 02:04:39', 'confirmed'),
       (10, '2023-07-26 02:04:40', 'confirmed'),
       (11, '2023-09-06 03:00:20', 'timeout'),
       (12, '2023-09-16 03:00:20', 'timeout'),
       (12, '2023-09-17 03:00:21', 'timeout');

SELECT DISTINCT C1.user_id 
FROM Confirmations C1 JOIN Confirmations C2 
ON C1.user_id = C2.user_id AND 
ABS(TIMESTAMPDIFF(SECOND, C1.time_stamp, C2.time_stamp)) BETWEEN 1 AND 60 * 60 * 24;

--6
DROP TABLE IF EXISTS Weather;
DROP TABLE IF EXISTS Countries;

-- Создание таблицы Countries
CREATE TABLE Countries
(
    id   INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(20)
);

INSERT INTO Countries (name)
VALUES ('Russia'),
       ('Kazakhstan'),
       ('China'),
       ('Ukraine'),
       ('Belarus');

-- Создание таблицы Weather
CREATE TABLE Weather
(
    country_id    INT,
    weather_state INT,
    day           DATE
);

TRUNCATE Weather;
INSERT INTO Weather (country_id, weather_state, day)
VALUES (4, -20, '2023-01-12'),
       (1, 13, '2023-03-19'),
       (3, -7, '2022-10-22'),
       (1, -7, '2022-11-14'),
       (5, 30, '2023-01-06'),
       (5, 12, '2023-04-27'),
       (5, 6, '2022-11-20'),
       (3, 20, '2023-09-30'),
       (2, 22, '2023-07-06'),
       (1, 13, '2023-06-01'),
       (3, 30, '2023-09-17'),
       (4, 23, '2023-09-09'),
       (5, 7, '2023-03-01'),
       (2, 32, '2023-08-25'),
       (3, 23, '2022-09-27'),
       (2, -29, '2023-01-05'),
       (3, 17, '2023-03-15'),
       (1, 1, '2023-07-20'),
       (1, 0, '2022-10-08'),
       (4, 15, '2023-09-27'),
       (3, 15, '2023-07-07'),
       (1, -12, '2022-11-12'),
       (2, -5, '2023-04-08'),
       (2, 15, '2023-09-18'),
       (5, 13, '2022-09-28'),
       (3, 8, '2023-03-01'),
       (4, -10, '2023-03-12'),
       (5, 20, '2023-09-01'),
       (5, 25, '2023-09-04'),
       (3, 10, '2023-08-28');

SELECT name country,
    CASE 
        WHEN AVG(weather_state) <= 15 THEN 'Cold'
        WHEN AVG(weather_state) >= 25 THEN 'Hot'
        ELSE 'Warm'
    END AS weather_type
FROM Countries JOIN Weather 
ON Countries.id = country_id AND (MONTH(day), YEAR(day)) = (9, 2023)
GROUP BY country;

--7
DROP TABLE IF EXISTS SchoolC;
DROP TABLE IF EXISTS SchoolB;
DROP TABLE IF EXISTS SchoolA;

-- Создание таблицы SchoolA
CREATE TABLE SchoolA
(
    student_id   INT,
    student_name VARCHAR(20)
);

INSERT INTO SchoolA (student_id, student_name)
VALUES (1, 'Anita'),
       (2, 'Blake'),
       (3, 'Jose'),
       (4, 'Jennifer'),
       (5, 'Alexis');

-- Создание таблицы SchoolB
CREATE TABLE SchoolB
(
    student_id   INT,
    student_name VARCHAR(20)
);

INSERT INTO SchoolB (student_id, student_name)
VALUES (6, 'James'),
       (7, 'Rebecca');

-- Создание таблицы SchoolC
CREATE TABLE SchoolC
(
    student_id   INT,
    student_name VARCHAR(20)
);

INSERT INTO SchoolC (student_id, student_name)
VALUES (9, 'Anita'),
       (3, 'Jose'),
       (2, 'Katherine'),
       (4, 'Christine');

WITH ab AS (
    SELECT 
        a.student_name student_A, 
        b.student_name student_B, 
        b.student_id b_id, 
        a.student_id a_id 
    FROM SchoolA a, SchoolB b 
    WHERE a.student_id != b.student_id AND 
        a.student_name != b.student_name
)
SELECT 
    student_A,  
    student_B, 
    student_name student_C
FROM ab, SchoolC
WHERE a_id != student_id AND 
    b_id != student_id AND 
    student_A != student_name 
    AND student_B != student_name;

--8
DROP TABLE IF EXISTS Students;
DROP TABLE IF EXISTS Departments;

-- Создание таблицы Departments
CREATE TABLE Departments
(
    id   INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255)
);

INSERT INTO Departments (name)
VALUES ('Computer Science'),
       ('Medicine'),
       ('Trademark and Licensing'),
       ('Art History and Archaeology'),
       ('Italian');

-- Создание таблицы Students
CREATE TABLE Students
(
    id      INT PRIMARY KEY AUTO_INCREMENT,
    name    VARCHAR(50),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Departments(id)
);

TRUNCATE Students;
INSERT INTO Students (name, dept_id)
VALUES ('Alice', 3),
       ('Bob', 1),
       ('Carol', 2),
       ('David', 2),
       ('Emma', 1),
       ('Frank', 3),
       ('Grace', 4),
       ('Helen', 4),
       ('Ivan', 2),
       ('Jack', 3),
       ('Kate', 3),
       ('Liam', 4),
       ('Mary', 2),
       ('Nathan', 1),
       ('Olivia', 1),
       ('Peter', 4),
       ('Quinn', 2),
       ('Rose', 1),
       ('Samuel', 2),
       ('Thomas', 3);

SELECT Departments.name department, COUNT(dept_id) students_count
FROM Departments LEFT JOIN Students ON dept_id = Departments.id
GROUP BY department
ORDER BY 2 DESC, 1;

--9
DROP TABLE IF EXISTS Votes;
DROP TABLE IF EXISTS Candidates;

-- Создание таблицы Candidates
CREATE TABLE Candidates
(
    id      INT PRIMARY KEY AUTO_INCREMENT,
    name    VARCHAR(50),
    surname VARCHAR(50)
);

INSERT INTO Candidates (name, surname)
VALUES ('Barry', 'Wheeler'),
       ('Sarah', 'Breaker'),
       ('Cynthia', 'Weaver'),
       ('Thomas', 'Zane'),
       ('Robert', 'Nightingale'),
       ('Emill', 'Hartman');

-- Создание таблицы Votes
CREATE TABLE Votes
(
    id           INT PRIMARY KEY AUTO_INCREMENT,
    candidate_id INT,
    FOREIGN KEY (candidate_id) REFERENCES Candidates(id)
);

TRUNCATE Votes;
INSERT INTO Votes (candidate_id)
VALUES (2),
       (4),
       (3),
       (2),
       (5),
       (1),
       (2),
       (4),
       (5),
       (2),
       (3),
       (5),
       (1),
       (4),
       (3),
       (2),
       (5),
       (1),
       (4),
       (3),
       (2),
       (4),
       (3),
       (2),
       (5),
       (1),
       (2),
       (4),
       (5),
       (2),
       (3),
       (5),
       (1),
       (4),
       (3),
       (2),
       (5),
       (1),
       (4),
       (3);

SELECT name, surname, COUNT(*) votes_count 
FROM Candidates JOIN Votes ON candidate_id = Candidates.id
GROUP BY name, surname
ORDER BY 3 DESC 
LIMIT 1;

--10
DROP TABLE IF EXISTS Ads;
DROP TABLE IF EXISTS Playback;

-- Создание таблицы Playback
CREATE TABLE Playback
(
    id         INT PRIMARY KEY AUTO_INCREMENT,
    user_id    INT,
    start_time INT,
    end_time   INT
);

INSERT INTO Playback (user_id, start_time, end_time)
VALUES (4, 179, 369),
       (3, 52, 477),
       (1, 5, 258),
       (3, 490, 535),
       (7, 197, 269),
       (8, 104, 110),
       (2, 158, 438),
       (1, 345, 559),
       (10, 152, 670),
       (6, 132, 539),
       (6, 580, 626),
       (1, 580, 686),
       (4, 380, 424),
       (9, 29, 302),
       (6, 700, 900),
       (3, 570, 647),
       (4, 500, 670),
       (8, 121, 602),
       (4, 680, 687),
       (4, 719, 780);

-- Создание таблицы Ads
CREATE TABLE Ads
(
    id         INT PRIMARY KEY AUTO_INCREMENT,
    user_id    INT,
    time_stamp INT
);

TRUNCATE Ads;
INSERT INTO Ads (user_id, time_stamp)
VALUES (8, 121),
       (1, 479),
       (8, 1186),
       (10, 1319),
       (10, 807),
       (9, 1427),
       (7, 670),
       (5, 396),
       (6, 926),
       (1, 241),
       (8, 1188),
       (9, 302),
       (7, 522),
       (3, 162),
       (4, 753),
       (8, 437),
       (8, 1067),
       (4, 1122),
       (6, 804),
       (10, 966);

SELECT p.id session_id 
FROM Playback p LEFT JOIN Ads a ON p.user_id = a.user_id
GROUP BY session_id
HAVING IFNULL(SUM(a.time_stamp BETWEEN p.start_time AND p.end_time), 0) = 0
ORDER BY 1;

--11
DROP TABLE IF EXISTS Submissions;
CREATE TABLE Submissions
(
    sub_id    INT,
    parent_id INT
);

TRUNCATE Submissions;
INSERT INTO Submissions (sub_id, parent_id)
VALUES (6, NULL),
       (9, NULL),
       (15, 9),
       (14, 5),
       (2, 8),
       (8, NULL),
       (7, 1),
       (3, 5),
       (11, 1),
       (1, NULL),
       (10, 9),
       (12, 6),
       (13, NULL),
       (4, 6);

SELECT 
    s1.sub_id post_id,
    COUNT(*) number_of_comments
FROM Submissions s1
LEFT JOIN Submissions s2 ON s1.sub_id = s2.parent_id
WHERE s1.parent_id IS NULL
GROUP BY 1;

--12
DROP TABLE IF EXISTS Sales;
DROP TABLE IF EXISTS Products;

-- Создание таблицы Products
CREATE TABLE Products
(
    id    INT PRIMARY KEY AUTO_INCREMENT,
    name  VARCHAR(50),
    price INT
);

INSERT INTO Products (name, price)
VALUES ('Apple iPhone 13 Pro', 779),
       ('Samsung Galaxy S21', 629),
       ('Sony WH-1000XM4 Headphones', 105),
       ('Nike Air Zoom Pegasus 38', 415),
       ('Adidas Ultraboost 21', 480),
       ('Lenovo ThinkPad X1 Carbon', 99),
       ('Dell XPS 13 Laptop', 1475),
       ('Canon EOS R6 Camera', 1309),
       ('Bose QuietComfort 35 II', 435),
       ('Samsung 65-inch QLED TV', 345),
       ('LG OLED55CXPUA TV', 740),
       ('Apple AirPods Pro', 439),
       ('Fitbit Versa 3', 139),
       ('PlayStation 5', 320),
       ('Xbox Series X', 144),
       ('Amazon Echo Dot (4th Gen)', 210),
       ('GoPro HERO9 Black', 70),
       ('Samsung Galaxy Tab S7', 389),
       ('Dyson V11 Animal Vacuum', 132),
       ('Instant Pot Duo 7-in-1', 283);

-- Создание таблицы Sales
CREATE TABLE Sales
(
    seller_id  INT,
    product_id INT,
    buyer_id   INT,
    sale_date  DATE,
    quantity   INT
);

TRUNCATE Sales;
INSERT INTO Sales (seller_id, product_id, buyer_id, sale_date, quantity)
VALUES (9, 13, 6, '2023-07-19', 3),
       (4, 20, 8, '2023-07-13', 5),
       (6, 8, 2, '2023-06-03', 3),
       (2, 16, 6, '2023-03-14', 2),
       (8, 8, 6, '2023-05-23', 9),
       (1, 14, 3, '2023-01-10', 7),
       (10, 3, 6, '2023-03-28', 6),
       (3, 13, 4, '2023-01-17', 3),
       (1, 10, 4, '2023-01-26', 7),
       (10, 17, 3, '2023-06-02', 1),
       (10, 13, 4, '2023-05-13', 4),
       (8, 19, 2, '2023-02-15', 6),
       (1, 15, 4, '2023-06-03', 7),
       (1, 5, 1, '2023-05-21', 3),
       (1, 13, 9, '2023-04-07', 9),
       (7, 12, 2, '2023-06-12', 7),
       (1, 6, 3, '2023-02-01', 2),
       (5, 11, 4, '2023-03-09', 6),
       (8, 19, 6, '2023-06-02', 3),
       (1, 12, 6, '2023-02-06', 2),
       (7, 9, 10, '2023-05-10', 4),
       (2, 16, 5, '2023-05-31', 5),
       (2, 18, 8, '2023-03-09', 4),
       (10, 12, 2, '2023-02-07', 4),
       (9, 2, 9, '2023-06-23', 10),
       (2, 14, 10, '2023-04-29', 2),
       (4, 11, 8, '2023-07-04', 5),
       (3, 6, 6, '2023-01-31', 10),
       (4, 17, 2, '2023-07-16', 6),
       (10, 13, 4, '2023-07-01', 5),
       (2, 12, 5, '2023-04-08', 2),
       (4, 10, 4, '2023-04-05', 3),
       (8, 18, 1, '2023-05-22', 3),
       (5, 2, 1, '2023-02-14', 9),
       (8, 10, 2, '2023-04-08', 10),
       (8, 18, 10, '2023-02-15', 3),
       (6, 13, 4, '2023-02-06', 8),
       (1, 7, 4, '2023-05-08', 3),
       (4, 9, 3, '2023-07-13', 1),
       (1, 20, 8, '2023-01-15', 10),
       (6, 9, 6, '2023-03-09', 2),
       (6, 8, 4, '2023-05-02', 10),
       (10, 14, 4, '2023-07-13', 7),
       (7, 4, 9, '2023-06-29', 9),
       (1, 6, 3, '2023-01-23', 10),
       (10, 10, 6, '2023-02-07', 4),
       (2, 12, 5, '2023-05-10', 8),
       (3, 1, 4, '2023-04-10', 6),
       (8, 17, 7, '2023-05-18', 6);

SELECT DISTINCT buyer_id FROM Sales S
WHERE 
    'Canon EOS R6 Camera' IN
    (SELECT name
    FROM Sales JOIN Products ON product_id = Products.id AND buyer_id = S.buyer_id)
    AND 'Lenovo ThinkPad X1 Carbon' NOT IN 
    (SELECT name
    FROM Sales JOIN Products ON product_id = Products.id AND buyer_id = S.buyer_id);


/*  
****    7.6    ****
*/

--1
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Users;

-- Создание таблицы Users
CREATE TABLE Users
(
    id        INT PRIMARY KEY AUTO_INCREMENT,
    join_date DATE
);

INSERT INTO Users (join_date)
VALUES ('2020-01-05'),
       ('2022-02-12'),
       ('2023-03-20'),
       ('2021-04-15'),
       ('2023-05-18'),
       ('2023-06-02'),
       ('2020-07-09'),
       ('2023-08-11'),
       ('2022-09-23'),
       ('2023-10-14'),
       ('2022-11-07'),
       ('2023-12-19');

-- Создание таблицы Orders
CREATE TABLE Orders
(
    id         INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE,
    item_id    INT,
    buyer_id   INT,
    seller_id  INT
);

TRUNCATE Orders;
INSERT INTO Orders (order_date, item_id, buyer_id, seller_id)
VALUES ('2023-02-05', 4, 1, 2),
       ('2022-03-12', 2, 1, 3),
       ('2023-04-20', 3, 2, 3),
       ('2023-05-15', 1, 4, 2),
       ('2023-06-18', 1, 3, 4),
       ('2023-07-02', 2, 2, 4),
       ('2021-08-09', 4, 4, 1),
       ('2023-09-11', 3, 1, 4),
       ('2023-10-23', 1, 2, 1),
       ('2023-11-14', 2, 3, 2),
       ('2023-12-07', 4, 4, 3),
       ('2023-01-19', 3, 1, 2),
       ('2022-02-01', 1, 4, 3),
       ('2023-03-08', 2, 2, 1),
       ('2023-04-25', 4, 3, 4),
       ('2020-05-29', 1, 4, 2),
       ('2023-06-10', 3, 1, 4),
       ('2023-07-21', 2, 2, 3),
       ('2023-08-28', 4, 6, 1),
       ('2023-09-03', 1, 7, 3),
       ('2023-04-20', 4, 2, 1),
       ('2022-04-25', 2, 6, 4),
       ('2023-04-30', 3, 4, 2),
       ('2023-05-05', 1, 8, 2),
       ('2023-05-10', 2, 2, 3),
       ('2020-05-15', 4, 6, 4),
       ('2023-05-20', 3, 6, 1),
       ('2020-05-25', 1, 7, 3),
       ('2023-05-30', 2, 2, 1),
       ('2023-06-05', 4, 7, 2),
       ('2023-06-10', 1, 6, 3),
       ('2023-06-15', 2, 5, 4),
       ('2022-06-20', 3, 4, 2),
       ('2022-06-25', 4, 6, 2),
       ('2021-06-30', 1, 1, 3),
       ('2021-07-05', 3, 5, 1),
       ('2023-07-10', 4, 2, 3),
       ('2020-07-15', 1, 5, 2),
       ('2020-07-20', 2, 6, 4);

SELECT Users.id, COUNT(item_id) purchases_in_2023 FROM Users
LEFT JOIN Orders ON Users.id = buyer_id AND YEAR(order_date) = 2023
GROUP BY Users.id;

--2
DROP TABLE IF EXISTS BigBoxes;
DROP TABLE IF EXISTS SmallBoxes;

-- Создание таблицы SmallBoxes
CREATE TABLE SmallBoxes
(
    id           INT AUTO_INCREMENT PRIMARY KEY,
    apple_count  INT,
    orange_count INT
);

INSERT INTO SmallBoxes (apple_count, orange_count)
VALUES (5, 6),
       (20, 10),
       (8, 8),
       (19, 4),
       (19, 19),
       (10, 5),
       (12, 7),
       (15, 9),
       (25, 30),
       (8, 15),
       (10, 12),
       (6, 3),
       (14, 6),
       (13, 12),
       (9, 9),
       (7, 15),
       (11, 11),
       (16, 8),
       (22, 10),
       (18, 16);

-- Создание таблицы BigBoxes
CREATE TABLE BigBoxes
(
    id           INT AUTO_INCREMENT PRIMARY KEY,
    small_box_id INT,
    apple_count  INT,
    orange_count INT
);

TRUNCATE BigBoxes;
INSERT INTO BigBoxes (small_box_id, apple_count, orange_count)
VALUES (null, 6, 15),
       (14, 4, 15),
       (3, 8, 4),
       (2, 19, 20),
       (6, 12, 9),
       (6, 9, 9),
       (14, 16, 7),
       (NULL, 7, 15),
       (12, 8, 8),
       (20, 9, 6),
       (8, 10, 12),
       (NULL, 5, 7),
       (3, 10, 5),
       (2, 15, 8),
       (NULL, 10, 9),
       (18, 20, 15),
       (3, 10, 8),
       (12, 12, 12),
       (NULL, 8, 7),
       (20, 7, 6);

SELECT SUM(apl) apple_count, SUM(org) orange_count FROM
(SELECT SUM(B1.apple_count) apl, SUM(B1.orange_count) org FROM SmallBoxes B1
    JOIN BigBoxes B2 ON B2.small_box_id = B1.id
UNION
SELECT SUM(apple_count), SUM(orange_count) FROM BigBoxes) AS T;

--3
DROP TABLE IF EXISTS Points;
CREATE TABLE Points
(
    id INT AUTO_INCREMENT PRIMARY KEY,
    x  INT,
    y  INT
);

TRUNCATE Points;
INSERT INTO Points (x, y)
VALUES (2, 7),
       (4, 8),
       (2, 10),
       (1, 1),
       (3, 2),
       (1, 4),
       (5, 3),
       (6, 6),
       (9, 5);

SELECT P1.id p1, P2.id p2,
    ABS(P1.x - P2.x) * ABS(P1.y - P2.y) area 
FROM Points P1, Points P2 WHERE P1.id < P2.id
HAVING area != 0
ORDER BY 3 DESC, 1, 2;

--4
DROP TABLE IF EXISTS Streams;
DROP TABLE IF EXISTS Subscriptions;

-- Создание таблицы Subscriptions
CREATE TABLE Subscriptions
(
    user_id    INT AUTO_INCREMENT PRIMARY KEY,
    start_date DATE,
    end_date   DATE
);

INSERT INTO Subscriptions (start_date, end_date)
VALUES ('2022-02-18', '2023-10-30'),
       ('2023-09-21', '2023-11-13'),
       ('2021-02-28', '2022-08-18'),
       ('2023-04-20', '2023-09-22'),
       ('2020-10-26', '2021-05-08'),
       ('2023-09-11', '2024-01-17'),
       ('2023-03-05', '2024-03-30'),
       ('2022-08-10', '2023-02-15'),
       ('2023-05-15', '2024-05-30'),
       ('2021-01-10', '2022-07-15'),
       ('2022-06-14', '2023-12-31'),
       ('2023-07-20', '2024-01-05'),
       ('2022-03-21', '2024-03-31'),
       ('2023-01-28', '2023-07-28'),
       ('2023-06-02', '2023-12-02'),
       ('2023-08-08', '2024-02-08'),
       ('2022-04-25', '2022-10-25'),
       ('2023-02-10', '2023-08-10'),
       ('2021-05-28', '2023-11-28'),
       ('2020-01-15', '2023-07-15');

-- Создание таблицы Streams
CREATE TABLE Streams
(
    session_id  INT AUTO_INCREMENT PRIMARY KEY,
    user_id     INT,
    stream_date DATE
);

TRUNCATE Streams;
INSERT INTO Streams (user_id, stream_date)
VALUES (9, '2023-05-16'),
       (3, '2023-10-27'),
       (7, '2022-04-29'),
       (13, '2022-08-08'),
       (4, '2023-12-31'),
       (5, '2023-01-05'),
       (6, '2023-02-15'),
       (7, '2022-03-30'),
       (8, '2022-05-25'),
       (9, '2022-07-10'),
       (10, '2023-08-15'),
       (10, '2023-09-20'),
       (12, '2023-10-25'),
       (13, '2022-11-30'),
       (14, '2023-01-05'),
       (18, '2023-02-10'),
       (14, '2023-03-15'),
       (17, '2022-04-20'),
       (14, '2023-05-25'),
       (19, '2023-06-30');

SELECT COUNT(DISTINCT S.user_id) as users_count FROM Subscriptions S
LEFT JOIN Streams st ON st.user_id = S.user_id
WHERE YEAR(S.start_date) <= 2023 AND YEAR(S.end_date) >= 2023
    AND 2023 NOT IN (
        SELECT YEAR(stream_date) FROM Streams WHERE user_id = st.user_id    
    )

--5
DROP TABLE IF EXISTS Orders;
CREATE TABLE Orders
(
    id          INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date  DATE
);

TRUNCATE Orders;
INSERT INTO Orders (customer_id, order_date)
VALUES (1, '2023-09-05'),
       (2, '2023-08-11'),
       (8, '2023-07-09'),
       (10, '2023-07-18'),
       (10, '2023-07-14'),
       (8, '2023-07-27'),
       (8, '2023-07-21'),
       (4, '2023-07-08'),
       (8, '2023-07-18'),
       (10, '2023-07-09'),
       (4, '2023-07-19'),
       (1, '2023-09-17'),
       (9, '2023-09-17'),
       (2, '2023-07-31'),
       (9, '2023-09-18'),
       (3, '2023-09-02'),
       (2, '2023-07-31'),
       (5, '2023-08-22'),
       (1, '2023-08-24'),
       (3, '2023-09-02'),
       (6, '2023-10-12'),
       (4, '2023-08-05'),
       (5, '2023-09-22'),
       (10, '2023-08-09'),
       (1, '2023-08-18'),
       (9, '2023-09-10'),
       (9, '2023-08-27'),
       (8, '2023-07-17'),
       (1, '2023-08-16'),
       (8, '2023-08-06'),
       (1, '2023-08-29'),
       (9, '2023-09-24'),
       (4, '2023-07-12'),
       (7, '2023-09-18'),
       (9, '2023-08-14'),
       (8, '2023-07-20'),
       (5, '2023-08-16'),
       (6, '2023-11-07'),
       (2, '2023-07-24'),
       (4, '2023-07-17'),
       (8, '2023-08-12'),
       (5, '2023-08-14');

SELECT DISTINCT O1.customer_id
FROM Orders O1 CROSS JOIN Orders O2 
ON O1.customer_id = O2.customer_id AND O1.id < O2.id
WHERE ABS(DATEDIFF(O1.order_date, O2.order_date)) <= 7
ORDER BY 1;

--6
DROP TABLE IF EXISTS Rides;
CREATE TABLE Rides
(
    id           INT PRIMARY KEY AUTO_INCREMENT,
    driver_id    INT,
    passenger_id INT
);

TRUNCATE Rides;
INSERT INTO Rides (id, driver_id, passenger_id)
VALUES (1, 16, 19),
       (2, 11, 22),
       (3, 11, 22),
       (4, 7, 1),
       (5, 15, 9),
       (6, 4, 15),
       (7, 10, 17),
       (8, 11, 22),
       (9, 23, 19),
       (10, 6, 27),
       (11, 16, 15),
       (12, 18, 25),
       (13, 18, 23),
       (14, 3, 7),
       (15, 12, 23),
       (16, 22, 12),
       (17, 6, 23),
       (18, 30, 22),
       (19, 3, 10),
       (20, 1, 27),
       (21, 21, 9),
       (22, 9, 8),
       (23, 13, 17),
       (24, 19, 29),
       (25, 20, 3),
       (26, 28, 14),
       (27, 9, 10),
       (28, 23, 19),
       (29, 10, 13),
       (30, 1, 27);

SELECT D1.driver_id, COUNT(DISTINCT D2.id) count FROM Rides D1
LEFT JOIN Rides D2 ON D1.driver_id = D2.passenger_id
GROUP BY 1
ORDER BY D1.driver_id;

--7
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS Salespersons;

-- Создание таблицы Salespersons
CREATE TABLE Salespersons
(
    id   INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(20)
);

INSERT INTO Salespersons (name)
VALUES ('Stephanie'),
       ('Rebecca'),
       ('Deborah'),
       ('Jordan'),
       ('Veronica'),
       ('Marisa'),
       ('Deanna'),
       ('Emma'),
       ('Julie'),
       ('Maria');

-- Создание таблицы Customers
CREATE TABLE Customers
(
    id             INT PRIMARY KEY AUTO_INCREMENT,
    salesperson_id INT
);

INSERT INTO Customers (salesperson_id)
VALUES (5),
       (4),
       (8),
       (10),
       (3),
       (1),
       (6),
       (2),
       (1),
       (4),
       (4),
       (5),
       (8),
       (8),
       (10),
       (5),
       (3),
       (1),
       (6),
       (3);

-- Создание таблицы Orders
CREATE TABLE Orders
(
    id          INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    price       INT
);

TRUNCATE Orders;
INSERT INTO Orders (customer_id, price)
VALUES (8, 2480),
       (6, 654),
       (13, 2938),
       (4, 2071),
       (4, 2412),
       (1, 236),
       (17, 2514),
       (18, 849),
       (7, 925),
       (10, 93),
       (14, 449),
       (15, 923),
       (14, 160),
       (1, 1978),
       (14, 2903),
       (13, 2093),
       (14, 2429),
       (12, 1058),
       (18, 2342),
       (19, 484),
       (4, 1040),
       (14, 2346),
       (19, 239),
       (14, 2253),
       (20, 510),
       (12, 497),
       (6, 1638),
       (9, 1088),
       (6, 1766),
       (2, 1548);

SELECT SC.s_id id, IFNULL(SUM(price), 0) total FROM (
    SELECT S.id s_id, C.id c_id FROM Salespersons S 
    LEFT JOIN Customers C ON C.salesperson_id = S.id
    ) AS SC
LEFT JOIN Orders O ON SC.c_id = O.customer_id
GROUP BY 1;

SELECT S.id, IFNULL(SUM(price), 0) total FROM 
Salespersons S LEFT JOIN Customers C ON C.salesperson_id = S.id
              LEFT JOIN Orders ON customer_id = C.id
GROUP BY 1;      

--8
DROP TABLE IF EXISTS Purchases;
DROP TABLE IF EXISTS Visits;
DROP TABLE IF EXISTS Members;

-- Создание таблицы Members
CREATE TABLE Members
(
    id   INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50)
);

INSERT INTO Members (name)
VALUES ('John'),
       ('Sarah'),
       ('Michael'),
       ('Emily'),
       ('David'),
       ('Sophia'),
       ('Liam'),
       ('Olivia'),
       ('Daniel'),
       ('Ava'),
       ('Ethan'),
       ('Mia');

-- Создание таблицы Visits
CREATE TABLE Visits
(
    id         INT PRIMARY KEY,
    member_id  INT,
    visit_date DATE
);

INSERT INTO Visits (id, member_id, visit_date)
VALUES (101, 2, '2023-10-28'),
       (102, 4, '2022-01-12'),
       (103, 1, '2023-12-10'),
       (104, 5, '2022-10-19'),
       (105, 6, '2021-03-01'),
       (106, 9, '2023-05-07'),
       (107, 11, '2023-05-12'),
       (108, 3, '2023-06-18'),
       (109, 7, '2023-09-30'),
       (110, 12, '2023-08-15'),
       (111, 5, '2023-10-25'),
       (112, 5, '2022-02-11'),
       (113, 1, '2023-12-01'),
       (114, 6, '2022-09-09'),
       (115, 6, '2021-05-01'),
       (116, 6, '2023-03-07'),
       (117, 11, '2023-07-19'),
       (118, 12, '2022-04-18'),
       (119, 11, '2021-08-30'),
       (120, 6, '2023-08-05');

-- Создание таблицы Purchases
CREATE TABLE Purchases
(
    visit_id       INT,
    charged_amount INT
);

TRUNCATE Purchases;
INSERT INTO Purchases (visit_id, charged_amount)
VALUES (102, 2000),
       (103, 9000),
       (106, 7000),
       (108, 500),
       (105, 1500),
       (101, 200),
       (109, 3000),
       (119, 400),
       (110, 7000),
       (120, 5000),
       (116, 12000),
       (111, 7000),
       (115, 350),
       (118, 10500),
       (117, 100);

SELECT M.id, M.name, 
    CASE 
        WHEN (100 * COUNT(charged_amount)) / COUNT(*) >= 80 THEN 'Diamond'
        WHEN (100 * COUNT(charged_amount)) / COUNT(*) = 0 AND COUNT(V.visit_date) = 0 THEN 'Bronze'
        WHEN (100 * COUNT(charged_amount)) / COUNT(*) < 50 THEN 'Silver'
        ELSE 'Gold'
    END AS status
FROM Members M LEFT JOIN Visits V ON V.member_id = M.id
            LEFT JOIN Purchases P ON P.visit_id = V.id
GROUP BY M.id, M.name; 

--9
DROP TABLE IF EXISTS Trips;
DROP TABLE IF EXISTS Users;

-- Создание таблицы Users
CREATE TABLE Users
(
    id       INT AUTO_INCREMENT PRIMARY KEY,
    banned   VARCHAR(50),
    role     ENUM ('client', 'driver')
);

INSERT INTO Users(banned, role)
VALUES ('yes', 'client'),
       ('yes', 'client'),
       ('no', 'client'),
       ('no', 'client'),
       ('no', 'client'),
       ('no', 'driver'),
       ('no', 'driver'),
       ('no', 'driver'),
       ('no', 'driver'),
       ('yes', 'driver'),
       ('no', 'driver');

-- Создание таблицы Trips
CREATE TABLE Trips
(
    id         INT PRIMARY KEY AUTO_INCREMENT,
    client_id  INT,
    driver_id  INT,
    status     ENUM ('completed', 'cancelled_by_driver', 'cancelled_by_client'),
    request_at VARCHAR(50)
);

TRUNCATE Trips;
INSERT INTO Trips(client_id, driver_id, status, request_at)
VALUES (3, 6, 'completed', '2023-10-01'),
       (4, 8, 'completed', '2023-10-01'),
       (2, 9, 'completed', '2023-10-01'),
       (1, 8, 'cancelled_by_client', '2023-10-01'),
       (5, 11, 'completed', '2023-10-02'),
       (5, 11, 'cancelled_by_driver', '2023-10-02'),
       (2, 10, 'completed', '2023-10-02'),
       (2, 8, 'completed', '2023-10-02'),
       (3, 11, 'completed', '2023-10-02'),
       (3, 7, 'cancelled_by_driver', '2023-10-03'),
       (2, 6, 'cancelled_by_driver', '2023-10-03'),
       (4, 8, 'completed', '2023-10-03'),
       (2, 11, 'completed', '2023-10-03'),
       (3, 10, 'completed', '2023-10-04'),
       (1, 10, 'completed', '2023-10-05'),
       (4, 8, 'completed', '2023-10-05'),
       (2, 8, 'cancelled_by_driver', '2023-10-05'),
       (5, 9, 'completed', '2023-10-05'),
       (2, 6, 'completed', '2023-10-05'),
       (5, 8, 'completed', '2023-10-06'),
       (3, 9, 'completed', '2023-10-06'),
       (2, 10, 'completed', '2023-10-07'),
       (2, 6, 'completed', '2023-10-07'),
       (3, 6, 'completed', '2023-10-08'),
       (3, 7, 'completed', '2023-10-08'),
       (5, 8, 'completed', '2023-10-09'),
       (2, 8, 'completed', '2023-10-09'),
       (2, 11, 'completed', '2023-10-09'),
       (4, 10, 'completed', '2023-10-09'),
       (3, 11, 'completed', '2023-10-10');

SELECT request_at day, 
    ROUND(SUM(status LIKE 'can%') / COUNT(*), 2) cancellation_rate FROM Trips
JOIN Users U ON U.id = client_id AND U.banned = 'NO'
JOIN Users UU ON UU.id = driver_id AND UU.banned = 'NO'
GROUP BY 1
HAVING day BETWEEN '2023-10-01' AND '2023-10-03';