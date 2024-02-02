/*  
****    9.1    ****
*/

--1
CREATE TABLE Students
(
    id INT,
    name VARCHAR(20),
    surname VARCHAR(20),
    age INT
);

--2
CREATE TABLE Students
(
    id INT NOT NULL,
    name VARCHAR(20) NOT NULL,
    surname VARCHAR(20) NOT NULL,
    age INT
);

--3
CREATE TABLE Students
(
    id INT NOT NULL UNIQUE,
    name VARCHAR(20) NOT NULL,
    surname VARCHAR(20) NOT NULL,
    age INT
);

--4
CREATE TABLE Students
(
    id INT NOT NULL UNIQUE,
    name VARCHAR(20) NOT NULL,
    surname VARCHAR(20) NOT NULL,
    age INT DEFAULT 18
);

--5
CREATE TABLE Students
(
    id INT NOT NULL UNIQUE,
    name VARCHAR(20) NOT NULL,
    surname VARCHAR(20) NOT NULL,
    age INT DEFAULT 18,
    date_of_receipt DATE DEFAULT (curdate())
);

--6
CREATE TABLE Students
(
    id INT NOT NULL UNIQUE,
    name VARCHAR(20) NOT NULL CHECK (name != ''),
    surname VARCHAR(20) NOT NULL CHECK (surname != ''),
    age INT DEFAULT 18 CHECK (age >= 18),
    date_of_receipt DATE DEFAULT (curdate()) CHECK (date_of_receipt >= '2023-09-01')
);

--7
CREATE TABLE Students
(
    id INT NOT NULL UNIQUE,
    name VARCHAR(20) NOT NULL CHECK (name != ''),
    surname VARCHAR(20) NOT NULL CHECK (surname != ''),
    age INT DEFAULT 18 CHECK (age >= 18),
    date_of_receipt DATE DEFAULT (curdate()) CHECK (date_of_receipt >= '2023-09-01'),
    phone_number VARCHAR(20) CHECK (phone_number REGEXP '^7|8 \\([0-9]{3}\\) [0-9]{3}-[0-9]{2}-[0-9]{2}')
);


/*  
****    9.2    ****
*/

--1
CREATE TABLE Students
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(20),
    surname VARCHAR(20),
    CONSTRAINT empty_name CHECK (name != ''),
    CONSTRAINT empty_surname CHECK (surname != '')
);

--2
CREATE TABLE Students
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(20) CHECK (name != ''),
    surname VARCHAR(20) CHECK (surname != '')
);

CREATE TABLE Classes
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(20) CHECK (name != '')
);

--3
CREATE TABLE Students
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(20) CHECK (name != ''),
    surname VARCHAR(20) CHECK (surname != '')
);

CREATE TABLE Classes
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(20) CHECK (name != '')
);

CREATE TABLE Grades
(
    student_id INT,
    class_id INT,
    grade INT CHECK (grade BETWEEN 1 AND 5),
    FOREIGN KEY (student_id) REFERENCES Students (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (class_id) REFERENCES Classes (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    PRIMARY KEY (student_id, class_id)
);


/*  
****    9.3    ****
*/

--1
DROP TABLE IF EXISTS Students, Classes, Grades;

--2
RENAME TABLE Students TO Pupils;

--3
ALTER TABLE Students
RENAME COLUMN name TO firstname,
RENAME COLUMN surname TO lastname,
DROP COLUMN age;

--4
ALTER TABLE Students
ADD COLUMN hometown VARCHAR(20) NOT NULL DEFAULT 'New York City' AFTER surname;

--5
ALTER TABLE Students
ALTER COLUMN name SET DEFAULT '',
ALTER COLUMN surname SET DEFAULT '';

--6
ALTER TABLE Students
DROP COLUMN id,
ADD PRIMARY KEY (name, surname);

--7
ALTER TABLE Math
ADD FOREIGN KEY (student_id) REFERENCES Students (id);

--8
ALTER TABLE Students
ADD CHECK (name LIKE '__%'),
ADD CHECK (surname LIKE '__%'),
ADD CHECK (age > 0);

--9
ALTER TABLE Students
ADD COLUMN name VARCHAR(20), 
ADD COLUMN surname VARCHAR(20);

UPDATE Students
SET name = SUBSTRING_INDEX(fullname, ' ', 1),
    surname = SUBSTRING_INDEX(fullname, ' ', -1);

ALTER TABLE Students
DROP COLUMN fullname;


/*  
****    9.4    ****
*/

--1
DROP TABLE IF EXISTS Users;
CREATE TABLE Users
(
    id           INT AUTO_INCREMENT,
    name         VARCHAR(20),
    surname      VARCHAR(20),
    phone_number VARCHAR(20),
    PRIMARY KEY (id)
);

INSERT INTO Users (name, surname, phone_number)
VALUES ('Matt', 'Damon', '+79087333025'),
       ('Edward', 'Norton', '+79642218964'),
       ('Nicolas', 'Cage', '+79808814813'),
       ('Ben', 'Affleck', '+79042778299'),
       ('John', 'Travolta', '+79640950623');

CREATE TRIGGER upd
BEFORE UPDATE
ON Users
FOR EACH ROW
    SET NEW.phone_number = CONCAT('+7', SUBSTRING(REPLACE(NEW.phone_number, ' ', ''), 3));

CREATE TRIGGER ins
BEFORE INSERT
ON Users
FOR EACH ROW
    SET NEW.phone_number = CONCAT('+7', SUBSTRING(REPLACE(NEW.phone_number, ' ', ''), 3));

--2
DROP TABLE IF EXISTS UsersEmailHistory;
DROP TABLE IF EXISTS Users;

-- Создание таблицы Users
CREATE TABLE Users
(
    id      INT AUTO_INCREMENT,
    name    VARCHAR(20),
    surname VARCHAR(20),
    email   VARCHAR(40),
    PRIMARY KEY (id)
);

INSERT INTO Users (name, surname, email)
VALUES ('Matt', 'Damon', 'matt@gmail.com'),
       ('Edward', 'Norton', 'ENorton.@outlook.com'),
       ('Nicolas', 'Cage', 'ghostrider@outlook.com'),
       ('Ben', 'Affleck', 'thebestbat@gmail.com'),
       ('John', 'Travolta', 'WhereAmI@cloud.com');

-- Создание таблицы UsersEmailHistory
CREATE TABLE UsersEmailHistory
(
    log_id     INT AUTO_INCREMENT,
    user_id    INT,
    old_email  VARCHAR(40),
    new_email  VARCHAR(40),
    updated_on DATE,
    PRIMARY KEY (log_id)
);

INSERT INTO UsersEmailHistory (user_id, old_email, new_email, updated_on)
VALUES (3, 'cagecage2@gmail.com', 'ghostrider@outlook.com', '2023-08-19'),
       (1, 'mattie@cloud.com', 'matt@gmail.com', '2023-08-20');

CREATE TRIGGER ins
AFTER UPDATE
ON Users
FOR EACH ROW
    INSERT INTO UsersEmailHistory(user_id, old_email, new_email, updated_on)
    VALUES (OLD.id, OLD.email, NEW.email, CURDATE());

--3
DROP TABLE IF EXISTS Purchases;
DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS Films;

-- Создание таблицы Films
CREATE TABLE Films
(
    id       INT PRIMARY KEY AUTO_INCREMENT,
    title    VARCHAR(20),
    director VARCHAR(20),
    price    DECIMAL(5, 2)
);

INSERT INTO Films (title, director, price)
VALUES ('Toy Story 2', 'John Lasseter', 2.99),
       ('WALL-E', 'Andrew Stanton', 4.99),
       ('Ratatouille', 'Brad Bird', 4.99),
       ('Up', 'Pete Docter', 4.99),
       ('Brave', 'Brenda Chapman', 7.99),
       ('Monsters University', 'Dan Scanlon', 7.99),
       ('Cars 2', 'John Lasseter', 7.99),
       ('Finding Nemo', 'Andrew Stanton', 4.99),
       ('Toy Story', 'John Lasseter', 2.99),
       ('The Incredibles', 'Brad Bird', 4.99);

-- Создание таблицы Users
CREATE TABLE Users
(
    id             INT PRIMARY KEY AUTO_INCREMENT,
    name           VARCHAR(40),
    surname        VARCHAR(40),
    total_spending DECIMAL(5, 2)
);
INSERT INTO Users (name, surname, total_spending)
VALUES ('Matt', 'Damon', 23.96),
       ('Edward', 'Norton', 10.98),
       ('Nicolas', 'Cage', 10.98),
       ('Ben', 'Affleck', 7.98),
       ('John', 'Travolta', 0.0);

-- Создание таблицы Purchases
CREATE TABLE Purchases
(
    id      INT PRIMARY KEY AUTO_INCREMENT,
    film_id INT,
    user_id INT
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

CREATE TRIGGER ins
AFTER INSERT
ON Purchases
FOR EACH ROW
    UPDATE Users
    SET total_spending = total_spending + 
        (SELECT price FROM Films WHERE id = NEW.film_id)
    WHERE id = NEW.user_id;


/*  
****    9.5    ****
*/

--1
DROP TABLE IF EXISTS Users;
CREATE TABLE Users
(
    id      INT PRIMARY KEY AUTO_INCREMENT,
    name    VARCHAR(40),
    surname VARCHAR(40),
    email   VARCHAR(40)
);
INSERT INTO Users (name, surname, email)
VALUES ('Christopher', 'Nolan', NULL),
       ('Steven', 'Spielberg', NULL),
       ('Quentin', 'Tarantino', 'queen@gmail.com'),
       ('Martin', 'Scorsese', NULL),
       ('David', 'Fincher', 'dfincher@outlook.com'),
       ('Ridley', 'Scott', 'riddler@gmail.com'),
       ('Stanley', 'Kubrick', 'bigstan@icloud.com'),
       ('Clint', 'Eastwood', 'cowboy@yahoo.com'),
       ('James', 'Cameron', NULL),
       ('Tim', 'Burton', 'timmy@icloud.com');

CREATE VIEW UsersWithEmail AS
SELECT * FROM Users WHERE NOT ISNULL(email);

--2
DROP TABLE IF EXISTS Students;
CREATE TABLE Students
(
    id       INT PRIMARY KEY AUTO_INCREMENT,
    name     VARCHAR(60),
    group_id INT
);

INSERT INTO Students (name, group_id)
VALUES ('Alice', 101),
       ('Bob', 102),
       ('Charlie', 101),
       ('David', 103),
       ('Eva', 102),
       ('Frank', 104),
       ('Grace', 101),
       ('Hannah', 105),
       ('Ivy', 103),
       ('Jack', 102),
       ('Kate', 104),
       ('Liam', 105),
       ('Mia', 101),
       ('Noah', 103),
       ('Olivia', 102),
       ('Peter', 102),
       ('Quinn', 101),
       ('Riley', 104),
       ('Sophia', 103),
       ('Thomas', 102);

CREATE VIEW V AS
SELECT group_id, COUNT(*) AS count FROM Students
GROUP BY group_id;

SELECT group_id FROM V
WHERE count NOT IN ((SELECT MAX(count) FROM V), (SELECT MIN(count) FROM V));

--3
DROP TABLE IF EXISTS Relations;
CREATE TABLE Relations
(
    user_id     INT,
    follower_id INT
);

INSERT INTO Relations (user_id, follower_id)
VALUES (1, 3),
       (2, 3),
       (7, 3),
       (1, 4),
       (2, 4),
       (7, 4),
       (1, 5),
       (2, 6),
       (7, 5),
       (3, 1),
       (4, 1),
       (3, 2),
       (4, 2),
       (5, 1),
       (6, 2),
       (5, 7),
       (6, 7),
       (5, 4),
       (7, 6),
       (6, 5);

CREATE VIEW V AS
SELECT R1.user_id user1_id, R2.user_id user2_id, COUNT(*) count
FROM Relations R1 JOIN Relations R2 ON 
R1.follower_id = R2.follower_id AND
R1.user_id < R2.user_id
GROUP BY 1, 2;

SELECT user1_id, user2_id FROM V
WHERE count = (SELECT MAX(count) FROM V);

--4
DROP TABLE IF EXISTS Orders;
CREATE TABLE Orders
(
    id            INT PRIMARY KEY AUTO_INCREMENT,
    product_id    INT,
    quantity      INT,
    purchase_date DATE
);

INSERT INTO Orders (product_id, quantity, purchase_date)
VALUES (1, 7, '2020-03-16'),
       (1, 4, '2020-05-02'),
       (1, 7, '2020-07-10'),
       (1, 6, '2021-02-23'),
       (1, 5, '2021-05-21'),
       (1, 6, '2021-10-11'),
       (3, 5, '2019-08-08'),
       (8, 1, '2021-06-03'),
       (2, 5, '2023-12-25'),
       (7, 7, '2022-07-10'),
       (3, 5, '2019-09-24'),
       (8, 5, '2022-07-29'),
       (7, 5, '2023-01-16'),
       (3, 7, '2022-12-21'),
       (3, 3, '2021-06-16'),
       (3, 7, '2019-06-11'),
       (8, 3, '2021-06-13'),
       (8, 1, '2020-05-25'),
       (3, 3, '2023-06-14'),
       (8, 5, '2022-01-13'),
       (7, 9, '2023-07-19'),
       (5, 3, '2023-12-01'),
       (4, 8, '2022-02-15'),
       (3, 7, '2020-09-06'),
       (8, 3, '2020-11-23'),
       (4, 9, '2023-10-05'),
       (7, 2, '2023-10-12'),
       (8, 5, '2020-01-03'),
       (6, 6, '2022-06-21'),
       (8, 6, '2021-07-01'),
       (3, 4, '2018-12-26'),
       (3, 5, '2019-08-11'),
       (3, 7, '2022-02-21'),
       (3, 5, '2018-09-04'),
       (7, 3, '2022-03-07'),
       (6, 5, '2021-01-01'),
       (3, 4, '2022-03-18'),
       (5, 2, '2023-01-31'),
       (8, 7, '2022-07-19'),
       (7, 3, '2022-10-27'),
       (2, 6, '2023-10-16'),
       (8, 5, '2020-08-04'),
       (4, 7, '2022-08-28');

CREATE VIEW V AS
SELECT product_id, YEAR(purchase_date) AS year, COUNT(*) AS count
FROM Orders
GROUP BY product_id, year
HAVING count >= 3
ORDER BY 1, 2;

SELECT DISTINCT product_id FROM V
WHERE (SELECT MAX(year) - MIN(year) FROM V AS VV WHERE product_id = V.product_id) + 1 = 
    (SELECT COUNT(*) FROM V AS VV WHERE product_id = V.product_id);


/*  
****    9.6    ****
*/

--1
DROP TABLE IF EXISTS Math;
CREATE TABLE Math
(
    id      INT PRIMARY KEY AUTO_INCREMENT,
    name    VARCHAR(20),
    surname VARCHAR(20),
    grade   VARCHAR(20)
);

INSERT INTO Math (name, surname, grade)
VALUES ('Flash', 'Thompson', 'D'),
       ('Peter', 'Parker', 'A'),
       ('Mary', 'Jane', 'D'),
       ('Gwen', 'Stacy', 'B'),
       ('Harry', 'Osborn', 'A'),
       ('Ben', 'Reilly', 'E'),
       ('Miles', 'Morales', 'A'),
       ('John', 'Jameson', 'E'),
       ('Curtis', 'Connors', 'B'),
       ('Edward', 'Brock', 'C'),
       ('Yuriko', 'Watanabe', 'C'),
       ('Martin', 'Li', 'B'),
       ('Sergei', 'Kravinoff', 'A'),
       ('Felicia', 'Hardy', 'D'),
       ('Aaron', 'Davis', 'E'),
       ('Rio', 'Morales', 'B'),
       ('Robbie', 'Robertson', 'C'),
       ('Hailey', 'Cooper', 'A'),
       ('John', 'Howard', 'D'),
       ('Flint', 'Marco', 'C');

WITH g AS 
(
    SELECT 
        CASE 
            WHEN grade IN ('A', 'B') THEN 'Great'
            WHEN grade = 'C' THEN 'Well'
            ELSE 'Bad'
        END AS res
    FROM Math
)
SELECT res result, COUNT(*) students 
FROM g
GROUP BY 1;

--2
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Customers;

-- Создание таблицы Customers
CREATE TABLE Customers
(
    id   INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50)
);

INSERT INTO Customers (name)
VALUES ('Dipper'),
       ('Mabel'),
       ('Chris'),
       ('Mia'),
       ('Wendy');

-- Создание таблицы Orders
CREATE TABLE Orders
(
    id          INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    amount      INT
);

INSERT INTO Orders (customer_id, amount)
VALUES (5, 800),
       (2, 300),
       (3, 649),
       (2, 587),
       (1, 686),
       (3, 674),
       (2, 837),
       (2, 858),
       (4, 423),
       (2, 997),
       (3, 343),
       (5, 177),
       (4, 682),
       (1, 726),
       (5, 130),
       (3, 454),
       (4, 567),
       (4, 807),
       (5, 162),
       (2, 596);

WITH cte AS 
(
    SELECT name, AVG(amount) res 
    FROM Customers JOIN Orders ON Customers.id = customer_id
    GROUP BY name
) 
SELECT name customer FROM cte
WHERE res = (SELECT MAX(res) FROM cte);

--3
CREATE TABLE Orders
(
    id         INT PRIMARY KEY AUTO_INCREMENT,
    store      VARCHAR(40),
    order_date DATE,
    amount     INT
);

INSERT INTO Orders (store, order_date, amount)
VALUES ('Ozon', '2023-06-01', 101),
       ('PCUniverse', '2023-06-07', 799),
       ('PCUniverse', '2023-07-07', 99),
       ('DarkStore', '2023-06-21', 99),
       ('DarkStore', '2023-06-27', 1015),
       ('Ozon', '2023-07-02', 678),
       ('PCUniverse', '2023-07-02', 858),
       ('Ozon', '2023-07-13', 458),
       ('Ozon', '2023-06-14', 801),
       ('DarkStore', '2023-07-21', 325),
       ('Gloria Jeans', '2023-07-13', 811),
       ('Mvideo', '2023-07-24', 422),
       ('Mvideo', '2023-06-22', 667),
       ('Gloria Jeans', '2023-06-11', 83),
       ('Gloria Jeans', '2023-07-05', 1500),
       ('Ozon', '2023-07-31', 242),
       ('PCUniverse', '2023-06-01', 679),
       ('Gloria Jeans', '2023-06-30', 328),
       ('Ozon', '2023-07-01', 1),
       ('DarkStore', '2023-07-15', 42),
       ('PCUniverse', '2023-06-14', 189),
       ('Gloria Jeans', '2023-07-25', 317),
       ('DarkStore', '2023-07-21', 822),
       ('Mvideo', '2023-06-10', 10),
       ('Gloria Jeans', '2023-07-22', 400)

WITH SumMax AS
(
    SELECT store, MONTH(order_date) month, SUM(amount) res FROM Orders
    GROUP BY store, month
)
SELECT 
    (SELECT store FROM SumMax 
     WHERE res = (SELECT MAX(res) FROM SumMax WHERE month = 6)) best_in_june,
    (SELECT store FROM SumMax 
     WHERE res = (SELECT MAX(res) FROM SumMax WHERE month = 7)) best_in_july;

--4
CREATE TABLE Orders
(
    id     INT PRIMARY KEY AUTO_INCREMENT,
    store  VARCHAR(40),
    amount INT
);

INSERT INTO Orders (store, amount)
VALUES ('Ozon', 101),
       ('PCUniverse', 799),
       ('PCUniverse', 99),
       ('DarkStore', 99),
       ('DarkStore', 1015),
       ('Ozon', 678),
       ('PCUniverse', 858),
       ('Ozon', 458),
       ('Ozon', 801),
       ('DarkStore', 325),
       ('Gloria Jeans', 811),
       ('Mvideo', 422),
       ('Mvideo', 667),
       ('Gloria Jeans', 83),
       ('Gloria Jeans', 1500),
       ('Ozon', 242),
       ('PCUniverse', 679),
       ('Gloria Jeans', 328),
       ('Ozon', 1),
       ('DarkStore', 42),
       ('PCUniverse', 189),
       ('Gloria Jeans', 317),
       ('DarkStore', 822),
       ('Mvideo', 10),
       ('Gloria Jeans', 400)

WITH AvgTotal AS 
(
    SELECT store, ROUND(AVG(amount), 1) avg_for_store FROM Orders
    GROUP BY store
)
SELECT Orders.*, avg_for_store 
FROM Orders JOIN AvgTotal ON Orders.store = AvgTotal.store;

--5
DROP TABLE IF EXISTS Flights;
CREATE TABLE Flights
(
    departure_airport INT PRIMARY KEY AUTO_INCREMENT,
    arrival_airport   INT,
    flights_count     INT
);

INSERT INTO Flights (arrival_airport, flights_count)
VALUES  (8, 19),
        (8, 47),
        (11, 33),
        (18, 17),
        (2, 9),
        (18, 21),
        (12, 26),
        (19, 13),
        (13, 6),
        (2, 9),
        (3, 33),
        (5, 2),
        (1, 1),
        (17, 49),
        (2, 14),
        (7, 21),
        (15, 30),
        (6, 14),
        (9, 49),
        (18, 10);

WITH AllFlight AS
(
    SELECT departure_airport, flights_count FROM Flights
    UNION ALL
    SELECT arrival_airport, flights_count FROM Flights
),
TotalFlights AS 
(
    SELECT departure_airport air, SUM(flights_count) res 
    FROM AllFlight
    GROUP BY air
)
SELECT air airport_id FROM TotalFlights
WHERE res = (SELECT MAX(res) FROM TotalFlights);

--6
DROP TABLE IF EXISTS Salaries;
CREATE TABLE Salaries
(
    company_id    INT,
    employee_id   INT,
    employee_name VARCHAR(20),
    salary        INT
);

TRUNCATE Salaries;
INSERT INTO Salaries (company_id, employee_id, employee_name, salary)
VALUES (2, 19, 'Corey', 467),
       (2, 13, 'Kayla', 8005),
       (2, 3, 'Michael', 8009),
       (3, 2, 'Wayne', 11275),
       (3, 4, 'Scott', 5582),
       (4, 18, 'Tina', 902),
       (4, 15, 'Suzanne', 803),
       (7, 17, 'Kayla', 10000),
       (7, 5, 'Larry', 811),
       (7, 3, 'Hector', 8952),
       (9, 20, 'Gina', 555),
       (9, 14, 'Veronica', 949),
       (9, 7, 'Nathaniel', 757),
       (9, 9, 'Frank', 999),
       (9, 10, 'Stephen', 829),
       (10, 7, 'Jacqueline', 11831),
       (11, 15, 'Matthew', 9942),
       (11, 4, 'Derek', 11059),
       (13, 11, 'Alicia', 831),
       (13, 8, 'Michael', 2644),
       (13, 17, 'Kristie', 2207),
       (14, 12, 'Alyssa', 947),
       (14, 9, 'Alex', 2982),
       (16, 10, 'Mark', 1000),
       (16, 19, 'Kelly', 845),
       (17, 13, 'Dustin', 423),
       (17, 12, 'Cheyenne', 13965),
       (18, 10, 'Steven', 6226),
       (19, 16, 'Valerie', 8188),
       (20, 3, 'Phillip', 12080);

WITH Proc AS
(
    SELECT company_id, 
    CASE
        WHEN MAX(salary) < 1000 THEN 0
        WHEN MAX(salary) BETWEEN 1000 AND 10000 THEN 0.24
        ELSE 0.49
    END AS pr
    FROM Salaries
    GROUP BY company_id
),
NewTable AS 
(
    SELECT employee_id id,
        employee_name name,
        salary, pr
    FROM Salaries JOIN Proc ON Proc.company_id = Salaries.company_id 
)
SELECT id, name, ROUND(salary * (1 - pr)) salary FROM NewTable;

WITH Proc AS
(
    SELECT company_id, 
    CASE
        WHEN MAX(salary) < 1000 THEN 0
        WHEN MAX(salary) BETWEEN 1000 AND 10000 THEN 0.24
        ELSE 0.49
    END AS pr
    FROM Salaries
    GROUP BY company_id
)
SELECT employee_id AS id,
    employee_name AS name,
    ROUND(salary * (1 - pr)) AS salary
FROM Salaries JOIN Proc ON Proc.company_id = Salaries.company_id;

--7
DROP TABLE IF EXISTS Votes;
CREATE TABLE Votes
(
    voter     VARCHAR(50),
    candidate VARCHAR(50)
);

INSERT INTO Votes (voter, candidate)
VALUES ('Shaun', 'Eric'),
       ('Donna', 'Emily'),
       ('Donna', 'Moro'),
       ('Tina', 'Deborah'),
       ('Tina', 'Michael'),
       ('Laura', NULL),
       ('James', 'Michael'),
       ('James', 'Emily'),
       ('Wanda', 'Eric'),
       ('Dustin', NULL),
       ('William', 'Victoria'),
       ('Kylie', 'Emily'),
       ('Traci', 'Amber'),
       ('William', 'Stephen'),
       ('Tina', 'Christina'),
       ('Kylie', 'Vincent'),
       ('Shaun', 'Michael'),
       ('Samantha', 'Stephen'),
       ('James', 'Christina'),
       ('Shaun', 'Vincent'),
       ('Shaun', 'Deborah'),
       ('Melissa', 'Amber'),
       ('Samantha', 'Amber'),
       ('Shaun', 'Bryan'),
       ('Donna', 'Amber'),
       ('Melissa', 'Eric'),
       ('Robin', NULL),
       ('Wanda', 'Emily'),
       ('James', 'Stephen'),
       ('Tina', 'Amber'),
       ('Kevin', NULL),
       ('Shaun', 'Victoria'),
       ('Wanda', 'Bryan'),
       ('Michelle', NULL),
       ('Traci', 'Emily'),
       ('Shaun', 'Stephen'),
       ('William', 'Michael'),
       ('William', 'Emily'),
       ('John', NULL),
       ('Melissa', 'Michael');

WITH CostOfVote AS
(
    SELECT voter, IFNULL(1 / COUNT(candidate), 0) cost FROM Votes
    GROUP BY voter
), Total AS
(
    SELECT candidate, SUM(cost) res 
    FROM Votes JOIN CostOfVote ON CostOfVote.voter = Votes.voter
    GROUP BY candidate
)
SELECT candidate FROM Total WHERE res = (SELECT MAX(res) FROM Total);

--8
DROP TABLE IF EXISTS Passengers;
DROP TABLE IF EXISTS Buses;

-- Создание таблицы Buses
CREATE TABLE Buses
(
    id             INT PRIMARY KEY AUTO_INCREMENT,
    departure_time INT
);

INSERT INTO Buses (departure_time)
VALUES (2),
       (4),
       (7),
       (9),
       (11),
       (13),
       (15),
       (17),
       (19),
       (21),
       (1),
       (3),
       (5);
-- Создание таблицы Passengers
CREATE TABLE Passengers
(
    id           INT PRIMARY KEY,
    arrival_time INT
);

INSERT INTO Passengers (id, arrival_time)
VALUES (11, 1),
       (12, 5),
       (13, 6),
       (14, 7),
       (15, 2),
       (16, 10),
       (17, 14),
       (18, 7),
       (19, 9),
       (20, 20),
       (21, 3),
       (22, 8),
       (23, 11),
       (24, 18),
       (25, 4),
       (26, 12),
       (27, 19),
       (28, 16),
       (29, 6),
       (30, 14);

WITH AllCount AS 
(
    SELECT id,
        (SELECT id FROM Buses
            WHERE departure_time = 
             (SELECT MIN(departure_time) FROM Buses WHERE arrival_time <= departure_time)
        ) AS bus_id
    FROM Passengers
)
SELECT bus_id, COUNT(*) passenger_count FROM AllCount
GROUP BY 1
ORDER BY 1;


/*  
****    9.7    ****
*/

--1
WITH RECURSIVE q AS 
(
    SELECT 1 num, 1 number
    UNION ALL
    SELECT num + 1, (num + 1) * (num + 1) FROM q
    LIMIT 10
)
SELECT number FROM q;

--2
WITH RECURSIVE days AS
(
    SELECT DATE('2024-12-31') day
    UNION ALL
    SELECT SUBDATE(day, INTERVAL 1 DAY)
    FROM days
    LIMIT 31
)
SELECT * FROM days;

--3
WITH RECURSIVE letters AS
(
    SELECT 'A' letter
    UNION ALL
    SELECT CHAR(ORD(letter) + 1) 
    FROM letters
    LIMIT 26
)
SELECT * FROM letters;

--4
WITH RECURSIVE monthes AS
(
    SELECT MONTHNAME(DATE('2024-01-01')) month, DATE('2024-01-01') monthdate
    UNION ALL
    SELECT MONTHNAME(ADDDATE(monthdate, INTERVAL 1 MONTH)), ADDDATE(monthdate, INTERVAL 1 MONTH)
    FROM monthes
    LIMIT 12
)
SELECT month FROM monthes;

--5
WITH RECURSIVE factorials AS
(
    SELECT 1 number, 1 factorial
    UNION ALL
    SELECT number + 1, factorial * (number + 1)
    FROM factorials
    LIMIT 20
)
SELECT * FROM factorials;

--6
WITH RECURSIVE randoms AS
(
    SELECT FLOOR((RAND() * 41)) + 10 number
    UNION ALL
    SELECT FLOOR((RAND() * 41)) + 10
    FROM randoms
    LIMIT 20
)
SELECT * FROM randoms;

--7
CREATE TABLE Numbers
(
    num INT
);

TRUNCATE Numbers;
INSERT INTO Numbers
VALUES (1),
       (5),
       (3),
       (7),
       (2);

WITH RECURSIVE AllValues AS
(
    SELECT (SELECT MIN(num) FROM Numbers) AS num
    UNION ALL
    SELECT num + 1 FROM AllValues
    WHERE num < (SELECT MAX(num) FROM Numbers)
)
SELECT * FROM AllValues;

--8
DROP TABLE IF EXISTS Orders;
CREATE TABLE Orders
(
    id         INT PRIMARY KEY AUTO_INCREMENT,
    store      VARCHAR(40),
    order_date DATE
);

TRUNCATE Orders;
INSERT INTO Orders (store, order_date)
VALUES ('Ozon      ', '2023-12-29'),
       ('PCUniverse', '2023-12-31'),
       ('PCUniverse', '2023-12-29'),
       ('Mvideo', '2023-12-25'),
       ('DarkStore', '2023-12-26');

WITH RECURSIVE AllValues AS
(
    SELECT 
        (SELECT MIN(order_date) FROM Orders) order_date,
        (SELECT COUNT(*) FROM Orders WHERE order_date = 
            (SELECT MIN(order_date) FROM Orders)) orders_count
    UNION ALL
    SELECT 
        ADDDATE(order_date, INTERVAL 1 DAY),
        (SELECT COUNT(*) FROM Orders WHERE order_date = 
             ADDDATE(AllValues.order_date, INTERVAL 1 DAY)) 
    FROM AllValues
    WHERE order_date < (SELECT MAX(order_date) FROM Orders)
)
SELECT * FROM AllValues;


/*  
****    9.8    ****
*/

--1
DROP TABLE IF EXISTS Files;
CREATE TABLE Files
(
    id                  INT PRIMARY KEY AUTO_INCREMENT,
    name                VARCHAR(40),
    parent_directory_id INT
);

TRUNCATE Files;
INSERT INTO Files (name, parent_directory_id)
VALUES ('desktop', NULL),
       ('test', 1),
       ('Картинки', 2),
       ('1.jpg', 3),
       ('avatar.png', 3),
       ('certificate.png', 3),
       ('py.png', 3),
       ('World_Time_Zones_Map.png', 3),
       ('Снимок экрана.png', 3),
       ('Неравенства.djvu', 2),
       ('Программы', 2),
       ('image_util.py', 11),
       ('sort.py', 11),
       ('Разные файлы', 2),
       ('astros.json', 14);

WITH RECURSIVE folders AS
(
    SELECT id, CONVERT(name, CHAR(100)) path
    FROM Files
    WHERE parent_directory_id IS NULL
    UNION ALL
    SELECT Files.id, CONCAT(folders.path, '/', Files.name)
    FROM Files JOIN folders ON folders.id = Files.parent_directory_id
)
SELECT * FROM folders;

--2
DROP TABLE IF EXISTS Investment;
CREATE TABLE Investment
(
    id                INT PRIMARY KEY AUTO_INCREMENT,
    investment_amount DECIMAL(20, 2)
);

TRUNCATE Investment;
INSERT INTO Investment (investment_amount)
VALUES (9705321.00),
       (5612948.60),
       (5322146.00);

WITH RECURSIVE I AS 
(
    SELECT
        1 investors_number,
        investment_amount,
        investment_amount individual_amount 
    FROM Investment
    UNION ALL
    SELECT 
        I.investors_number + 1,
        I.investment_amount,
        Investment.individual_amount / (I.investors_number + 1)
    FROM I JOIN Investment ON I.investment_amount = Investment.investment_amount
    WHERE I.investors_number < 3
)
SELECT * FROM I;

--3
DROP TABLE IF EXISTS Routes;
CREATE TABLE Routes
(
    source_city      VARCHAR(40),
    destination_city VARCHAR(40),
    distance         INT
);

TRUNCATE Routes;
INSERT INTO Routes
VALUES ('New York', 'Boston', 215),
       ('New York', 'Philadelphia', 95),
       ('Philadelphia', 'Washington', 140),
       ('Boston', 'Chicago', 985),
       ('Washington', 'Atlanta', 640),
       ('Atlanta', 'Miami', 660);

WITH RECURSIVE Distances AS
(
    SELECT destination_city, distance
    FROM Routes
    WHERE source_city = 'New York'
    UNION ALL
    SELECT Routes.destination_city, Routes.distance + Distances.distance
    FROM Routes JOIN Distances ON Routes.source_city = Distances.destination_city
)
SELECT * FROM Distances;

--4
DROP TABLE IF EXISTS Tasks;
CREATE TABLE Tasks
(
    id                 INT PRIMARY KEY AUTO_INCREMENT,
    name               VARCHAR(40),
    depends_on_task_id INT,
    time_required      INT

);

TRUNCATE Tasks;
INSERT INTO Tasks (name, depends_on_task_id, time_required)
VALUES ('Development', NULL, 10),
       ('Testing', 1, 5),
       ('Deployment', 2, 2);

WITH RECURSIVE Times AS
(
    SELECT id, name, time_required total_time
    FROM Tasks
    WHERE depends_on_task_id IS NULL
    UNION ALL
    SELECT Tasks.id, Tasks.name, Times.total_time + Tasks.time_required
    FROM Tasks JOIN Times ON Times.id = Tasks.depends_on_task_id
)
SELECT name, total_time FROM Times;

--5
DROP TABLE IF EXISTS Routes;
CREATE TABLE Routes
(
    source_city      VARCHAR(40),
    destination_city VARCHAR(40)

);

TRUNCATE Routes;
INSERT INTO Routes
VALUES ('Groningen', 'Heerenveen'),
       ('Groningen', 'Harlingen'),
       ('Harlingen', 'Wieringerwerf'),
       ('Wieringerwerf', 'Hoorn'),
       ('Hoorn', 'Amsterdam'),
       ('Amsterdam', 'Haarlem'),
       ('Heerenveen', 'Lelystad'),
       ('Lelystad', 'Amsterdam');

WITH RECURSIVE Travels AS
(
    SELECT 
        destination_city,
        CONVERT(source_city, CHAR(100)) route
    FROM Routes
    WHERE source_city = 'Groningen'
    UNION
    SELECT 
        R.destination_city,
        CONCAT(T.route, ' -> ', T.destination_city)
    FROM Routes R JOIN Travels T ON T.destination_city = R.source_city 
)
SELECT CONCAT(route, ' -> Haarlem') route FROM Travels
WHERE 'Haarlem' = destination_city;

--6
DROP TABLE IF EXISTS Genealogy;
CREATE TABLE Genealogy
(
    id        INT PRIMARY KEY,
    name      VARCHAR(20),
    father_id INT,
    mother_id INT,
    FOREIGN KEY (father_id) REFERENCES Genealogy (id),
    FOREIGN KEY (mother_id) REFERENCES Genealogy (id)
);

TRUNCATE Genealogy;
INSERT INTO Genealogy
VALUES (1, 'Maria', NULL, NULL),
       (2, 'Tom', NULL, NULL),
       (3, 'Robert', NULL, NULL),
       (4, 'Claire', NULL, NULL),
       (5, 'Jennifer', 2, 1),
       (6, 'Sam', 3, 4),
       (7, 'James', 6, 5);

WITH RECURSIVE Family AS
(
    SELECT name, father_id, mother_id, 1 level, 'son' relationship 
    FROM Genealogy
    WHERE NAME = 'James'
    UNION ALL
    SELECT G.name, G.father_id, G.mother_id, F.level + 1,
        CASE
            WHEN level = 1 THEN
                CASE 
                    WHEN G.id = F.father_id THEN 'father'
                    WHEN G.id = F.mother_id THEN 'mother'
                END
            WHEN level = 2 THEN 
                CASE 
                    WHEN G.id = F.father_id THEN 'grandfather'
                    WHEN G.id = F.mother_id THEN 'grandmother'
                END 
        END 
    FROM Family F JOIN Genealogy G ON F.father_id = G.id OR F.mother_id = G.id
)
SELECT * FROM Family;