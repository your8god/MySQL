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
