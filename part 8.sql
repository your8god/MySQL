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
DELIMITER //
CREATE FUNCTION SAME_DIGITS(number INT)
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN REPEAT(LEFT(number, 1), LENGTH(number)) = number;
END //
DELIMITER; 

--3
DELIMITER //
CREATE FUNCTION CALCULATE(a FLOAT, b FLOAT, operation TEXT)
RETURNS FLOAT
DETERMINISTIC
BEGIN
    RETURN CASE
        WHEN operation = '+' THEN a + b
        WHEN operation = '-' THEN a - b
        WHEN operation = '*' THEN a * b
        ELSE a / b
        END
    ;
END //
DELIMITER; 

--4
DELIMITER //
CREATE FUNCTION MIDDLE_POINT(x1 INT, y1 INT, x2 INT, y2 INT)
RETURNS TEXT
DETERMINISTIC
BEGIN
    DECLARE total_x FLOAT;
    DECLARE total_y FLOAT;
    SET total_x := (x1 + x2) / 2;
    SET total_y := (y1 + y2) / 2;
    RETURN CONCAT('(', total_x, '; ', total_y, ')');
END //
DELIMITER ;

--5
DELIMITER //
CREATE FUNCTION LAST_SECOND_DIGIT(number INT)
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN IF(
        LENGTH(number) = 1,
        NULL,
        LEFT(RIGHT(number, 2), 1)
    );
END //
DELIMITER; 

--6
DELIMITER //
CREATE FUNCTION SOLVE(a FLOAT, b FLOAT, c FLOAT)
RETURNS FLOAT
DETERMINISTIC
BEGIN
    DECLARE D FLOAT;
    SET D := b*b - 4*a*c;
    RETURN CASE 
        WHEN D < 0 THEN NULL
        WHEN D = 0 THEN -b / (2*a)
        ELSE    
            LEAST((-b + SQRT(D)) / (2*a), (-b - SQRT(D)) / (2*a))
        END;
END //

--7
DELIMITER //
CREATE FUNCTION TOTAL(store_name TEXT)
RETURNS INT
NOT DETERMINISTIC
READS SQL DATA
BEGIN
    RETURN (SELECT SUM(amount) FROM Orders WHERE store = store_name);
END //
DELIMITER ;


/*  
****    10.3    ****
*/

--1
DELIMITER //
CREATE FUNCTION POSITIVE_SUM(a INT, b INT, c INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE res INT DEFAULT 0;
    IF a > 0 THEN SET res := res + a; END IF;
    IF b > 0 THEN SET res := res + b; END IF;
    IF c > 0 THEN SET res := res + c; END IF;
    RETURN res;
END //
DELIMITER ;

--2
DELIMITER //
CREATE FUNCTION IS_DIGIT(string TEXT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i <= LENGTH(string) DO
        IF NOT SUBSTRING(string, i, 1) BETWEEN '0' AND '9'
        THEN RETURN 0;
        END IF;
        SET i := i + 1;
    END WHILE;
    RETURN 1;
END //
DELIMITER ;

--3
DELIMITER //
CREATE FUNCTION SUM_OF_FIRST_DIGITS(string TEXT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE res INT DEFAULT 0;
    WHILE 
        i <= LENGTH(string) AND 
        SUBSTRING(string, i, 1) BETWEEN '0' AND '9' 
    DO
        SET res := res + SUBSTRING(string, i, 1); 
        SET i := i + 1;
    END WHILE;
    RETURN res;
END //
DELIMITER ;

--4
DELIMITER //
CREATE FUNCTION SWAPCASE(string TEXT)
RETURNS TEXT
DETERMINISTIC
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE s CHAR(1);
    DECLARE res TEXT DEFAULT '';
    WHILE i <= LENGTH(string) DO
        SET s := SUBSTRING(string, i, 1);
        IF BINARY s = LOWER(s) THEN SET res := CONCAT(res, UPPER(s));
        ELSE SET res := CONCAT(res, LOWER(s));
        END IF;
        SET i := i + 1;
    END WHILE;
    RETURN res;
END //
DELIMITER ;

--5
DELIMITER //
CREATE FUNCTION MIN_DIGIT(number INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE res INT DEFAULT 10;
    WHILE number > 0 DO
        SET res := LEAST(res, number MOD 10);
        SET number := number DIV 10;
    END WHILE;
    RETURN res;
END ;
DELIMITER //

--6
DELIMITER //
CREATE FUNCTION FACTORIAL(n INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE res INT DEFAULT 1;
    DECLARE i INT DEFAULT 1;
    WHILE i <= n DO
        SET res := res * i;
        SET i := i + 1;
    END WHILE;
    RETURN res;
END //
DELIMITER ;

--7
DELIMITER //
CREATE FUNCTION SUM_OF_MID_DIGITS(number INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE res INT DEFAULT 0;
    DECLARE i INT DEFAULT 2;
    IF number > 99 THEN
        WHILE i < LENGTH(number) DO
            SET res := RES + SUBSTRING(number, i, 1);
            SET i := i + 1;
        END WHILE;
    END IF;
    RETURN res;
END //
DELIMITER ; 

--8
DELIMITER //
CREATE FUNCTION COMPARE_TWO_NUMBERS(a INT, b INT)
RETURNS TEXT
DETERMINISTIC
BEGIN
    IF a > b THEN RETURN CONCAT(a, ' > ', b);
    ELSEIF a < b THEN RETURN CONCAT(a, ' < ', b);
    ELSE RETURN CONCAT(a, ' = ', b);
    END IF;
END //
DELIMITER ;

--9
DELIMITER //
CREATE FUNCTION DIGITAL_ROOT(number INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE sum INT DEFAULT 0;
    WHILE number > 9 DO
        WHILE number > 0 DO
            SET sum := sum + (number MOD 10);
            SET number := number DIV 10;
        END WHILE;
        SET number := sum;
        SET sum := 0;
    END WHILE;
    RETURN number;
END //
DELIMITER ;

--10
DELIMITER //
CREATE FUNCTION REPEAT_AFTER_ME(delimiter TEXT, n INT)
RETURNS TEXT
DETERMINISTIC
BEGIN
    DECLARE res TEXT DEFAULT '0';
    DECLARE i INT DEFAULT 1;
    WHILE i <= n DO
        SET res := CONCAT(res, ' ', delimiter, ' ', i);
        SET i := i + 1;
    END WHILE;
    RETURN res;
END //
DELIMITER ;


/*  
****    10.4    ****
*/

DROP TABLE IF EXISTS Orders;
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
       ('Gloria Jeans', 400);

--1
DELIMITER //
CREATE PROCEDURE SHOW_TOP_SELLERS()
BEGIN
    SELECT store FROM Orders
    GROUP BY store
    ORDER BY SUM(amount) DESC
    LIMIT 3;
END //
DELIMITER ;

--2
DELIMITER //
CREATE PROCEDURE DELETE_UNKNOWN_ORDERS()
BEGIN
    DELETE FROM Orders
    WHERE store IS NULL OR amount IS NULL;
END //
DELIMITER ;

--3
DELIMITER //
CREATE PROCEDURE ORDERS_STATISTICS()
BEGIN
    SELECT 
        COUNT(*) orders_count,
        AVG(amount) avg_order_amount 
    FROM Orders;
END //
DELIMITER ;

--4
DROP TABLE IF EXISTS Orders;
CREATE TABLE Orders
(
    id         INT PRIMARY KEY AUTO_INCREMENT,
    store      VARCHAR(40),
    order_date DATE,
    amount     INT
);

INSERT INTO Orders (store, order_date, amount)
VALUES ('Ozon', '2023-11-05', 101),
       ('PCUniverse', '2023-06-08', 799),
       ('PCUniverse', '2023-08-21', 99),
       ('DarkStore', '2023-11-17', 99),
       ('DarkStore', '2023-06-25', 1015),
       ('Ozon', '2023-10-10', 678),
       ('PCUniverse', '2023-06-06', 858),
       ('Ozon', '2023-10-26', 458),
       ('Ozon', '2023-10-23', 801),
       ('DarkStore', '2023-08-02', 325),
       ('Gloria Jeans', '2023-07-03', 811),
       ('Mvideo', '2023-10-06', 422),
       ('Mvideo', '2023-04-20', 667),
       ('Gloria Jeans', '2023-03-18', 83),
       ('Gloria Jeans', '2023-02-24', 1500),
       ('Ozon', '2023-02-12', 242),
       ('PCUniverse', '2023-02-19', 679),
       ('Gloria Jeans', '2023-04-30', 328),
       ('Ozon', '2023-03-26', 1),
       ('DarkStore', '2023-03-04', 42),
       ('PCUniverse', '2023-02-28', 189),
       ('Gloria Jeans', '2023-04-17', 317),
       ('DarkStore', '2023-12-23', 822),
       ('Mvideo', '2023-01-03', 10),
       ('Gloria Jeans', '2023-02-08', 400);

DELIMITER //
CREATE PROCEDURE ORDERS_FROM_TO(start_date DATE, end_date DATE)
BEGIN
    SELECT * FROM Orders
    WHERE order_date BETWEEN start_date AND end_date;
END //
DELIMITER ;

--5
DROP TABLE IF EXISTS Orders;
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
       ('Gloria Jeans', 400);

DELIMITER //
CREATE PROCEDURE STORE_STATISTICS(
    store_name TEXT, 
    OUT avg_order_amount FLOAT, 
    OUT min_order_amount FLOAT,
    OUT max_order_amount FLOAT
    )
BEGIN
    SET avg_order_amount := (SELECT AVG(amount) FROM Orders WHERE store = store_name);
    SET min_order_amount := (SELECT MIN(amount) FROM Orders WHERE store = store_name);
    SET max_order_amount := (SELECT MAX(amount) FROM Orders WHERE store = store_name);
END //
DELIMITER ;

--6
DROP TABLE IF EXISTS Orders;
CREATE TABLE Orders
(
    id     INT PRIMARY KEY AUTO_INCREMENT,
    store  VARCHAR(40),
    amount INT,
    status VARCHAR(40)
);

INSERT INTO Orders (store, amount, status)
VALUES ('Ozon', 101, 'Created'),
       ('PCUniverse', 799, 'Shipped'),
       ('PCUniverse', 99, 'Delivered'),
       ('DarkStore', 99, 'Created'),
       ('DarkStore', 1015, 'Shipped'),
       ('Ozon', 678, 'Delivered'),
       ('PCUniverse', 858, 'Delivered'),
       ('Ozon', 458, 'Created'),
       ('Ozon', 801, 'Shipped'),
       ('DarkStore', 325, 'Delivered'),
       ('Gloria Jeans', 811, 'Delivered'),
       ('Mvideo', 422, 'Created'),
       ('Mvideo', 667, 'Shipped'),
       ('Gloria Jeans', 83, 'Delivered'),
       ('Gloria Jeans', 1500, 'Shipped'),
       ('Ozon', 242, 'Delivered'),
       ('PCUniverse', 679, 'Created'),
       ('Gloria Jeans', 328, 'Delivered'),
       ('Ozon', 1, 'Delivered'),
       ('DarkStore', 42, 'Shipped'),
       ('PCUniverse', 189, 'Delivered'),
       ('Gloria Jeans', 317, 'Shipped'),
       ('DarkStore', 822, 'Delivered'),
       ('Mvideo', 10, 'Created'),
       ('Gloria Jeans', 400, 'Delivered');

DELIMITER //
CREATE PROCEDURE UPDATE_ORDER_STATUS(order_id INT, OUT updated_status TEXT)
BEGIN
    UPDATE Orders
    SET status = CASE
        WHEN status = 'Created' THEN 'Shipped'
        WHEN status = 'Shipped' THEN 'Delivered'
        WHEN status = 'Delivered' THEN 'Completed'
        END
    WHERE id = order_id;
    SET updated_status := (SELECT status FROM Orders WHERE id = order_id); 
END //
DELIMITER ;

--7
DROP TABLE IF EXISTS Orders;
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
       ('Gloria Jeans', 400);

DELIMITER //
CREATE PROCEDURE ORDERS_COUNT(store_name TEXT)
BEGIN
    IF store_name IS NULL
    THEN (SELECT store, COUNT(*) orders_count FROM Orders GROUP BY store);
    ELSE (SELECT COUNT(*) orders_count FROM Orders WHERE store = store_name);
    END IF;
END //
DELIMITER ;

--8
DROP TABLE IF EXISTS Orders;
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
       ('Gloria Jeans', 400);

DELIMITER //
CREATE PROCEDURE ADD_ORDER(store_name TEXT, order_amount INT)
BEGIN
    IF store_name IS NULL OR order_amount IS NULL THEN
        SELECT 'Недостаточно данных о заказе' Error;
    ELSEIF order_amount <= 0 THEN
        SELECT 'Некорректная сумма заказа' Error;
    ELSE
        INSERT INTO Orders(store, amount)
        VALUES (store_name, order_amount);
        SELECT 'Заказ успешно добавлен' Success;
    END IF;
END //
DELIMITER ;