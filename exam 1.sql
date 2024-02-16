DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Job;
DROP TABLE IF EXISTS Departments;

-- Создание таблицы Departments
CREATE TABLE Departments
(
    id   INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50)
);

INSERT INTO Departments (name)
VALUES ('Engineering'),
       ('Marketing'),
       ('Sales'),
       ('Finance'),
       ('HR'),
       ('IT'),
       ('Operations'),
       ('Customer Service'),
       ('Research and Development'),
       ('Product Management');

-- Создание таблицы Job
CREATE TABLE Job
(
    id    INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(50)
);

INSERT INTO Job (title)
VALUES ('Software Engineer'),
       ('Managing director'),
       ('Marketing Manager'),
       ('Sales Manager'),
       ('Finance Analyst'),
       ('Risk Management Analyst'),
       ('HR Manager'),
       ('IT Specialist'),
       ('Salesman'),
       ('Operations Manager'),
       ('Customer Service Representative'),
       ('Maintenance man'),
       ('Research Scientist'),
       ('Product Manager'),
       ('Quality Assurance Analyst'),
       ('Design Lead');

-- Создание таблицы Employees
CREATE TABLE Employees
(
    id            INT PRIMARY KEY AUTO_INCREMENT,
    full_name     VARCHAR(50),
    department_id INT,
    job_id        INT,
    manager_id    INT,
    salary        DECIMAL(10, 2),
    FOREIGN KEY (department_id) REFERENCES Departments (id),
    FOREIGN KEY (job_id) REFERENCES Job (id),
    FOREIGN KEY (manager_id) REFERENCES Employees (id)
);

INSERT INTO Employees (full_name, department_id, job_id, manager_id, salary)
VALUES ('Sergey Brin', 1, 1, NULL, 10000.00),
       ('Larry Page', 1, 1, 1, 9000.00),
       ('Susan Wojcicki', 1, 1, 1, 8500.00),
       ('John Smith', 1, 6, 2, 7500.00),
       ('Alice Johnson', 1, 6, 2, 7000.00),
       ('Eric Schmidt', 2, 2, NULL, 9500.00),
       ('Marissa Mayer', 2, 2, 5, 9000.00),
       ('Sheryl Sandberg', 2, 2, 5, 8500.00),
       ('Jane Williams', 2, 6, 6, 7000.00),
       ('John Doerr', 3, 6, NULL, 11000.00),
       ('Sundar Pichai', 3, 2, 9, 10500.00),
       ('Alana Davis', 3, 12, 9, 11000.00),
       ('Bob Thompson', 3, 6, 10, 9500.00),
       ('Ruth Porat', 4, 4, NULL, 11000.00),
       ('Patrick Pichette', 4, 4, 13, 10500.00),
       ('Alex Turner', 4, 4, 13, 6000.00),
       ('Laszlo Bock', 5, 5, NULL, 12000.00),
       ('Eileen Naughton', 5, 5, 16, 11500.00),
       ('Michael Brown', 5, 5, 16, 8000.00),
       ('Vint Cerf', 6, 6, NULL, 13000.00),
       ('Urs Holzle', 6, 6, 19, 12500.00),
       ('Emily White', 6, 6, 19, 7500.00),
       ('Jonathan Rosenberg', 7, 12, NULL, 13500.00),
       ('David Clark', 7, 6, 22, 9000.00),
       ('Craig Silverstein', 8, 8, NULL, 14000.00),
       ('Megan Smith', 8, 8, 24, 13500.00),
       ('Emma Johnson', 8, 8, 24, 8500.00),
       ('Alan Eustace', 9, 9, NULL, 15000.00),
       ('Jeff Dean', 9, 9, 27, 14500.00),
       ('Olivia White', 9, 9, 27, 9500.00),
       ('Amit Singhal', 10, 10, NULL, 16000.00),
       ('Hiroshi Lockheimer', 10, 10, 30, 16000.00),
       ('Matthew Taylor', 10, 10, 30, 10000.00);

--1
SELECT full_name, salary FROM Employees
JOIN Job ON job_id = Job.id
WHERE salary > 10000 AND title LIKE '%manager'
ORDER BY 2 DESC, 1;

--2
SELECT name department_name FROM Departments
JOIN Employees ON Departments.id = department_id
GROUP BY 1
HAVING COUNT(*) < 4;

--3
SELECT full_name FROM Employees
WHERE id NOT IN (SELECT manager_id FROM Employees WHERE manager_id IS NOT NULL)
ORDER BY 1;

--4
SELECT DISTINCT e1.full_name FROM Employees e1
JOIN Employees e2 ON e1.id = e2.manager_id
WHERE e1.salary < e2.salary
ORDER BY 1;

--5
SELECT DISTINCT e2.* FROM Employees e1
JOIN Employees e2 ON e1.id = e2.manager_id
WHERE e1.department_id != e2.department_id;

--6
SELECT department_id, full_name, salary FROM Employees E
WHERE salary = (
    SELECT MAX(salary) FROM Employees 
    WHERE E.department_id = department_id
)
ORDER BY 1, 2;

--7
WITH TotalTable AS 
(
    SELECT name department_name, SUM(salary) total_salary
    FROM Departments d
    JOIN Employees ON d.id = department_id
    GROUP BY 1
)
SELECT department_name FROM TotalTable 
WHERE total_salary = (SELECT MAX(total_salary) FROM TotalTable);
