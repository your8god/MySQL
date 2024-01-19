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