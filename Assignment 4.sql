create database if not exists assignments_1;
use assignments_1;

CREATE TABLE Departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    age INT,
    salary DECIMAL(10,2),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);

INSERT INTO Departments (dept_id, dept_name) VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Sales'),
(4, 'Finance'),
(5, 'Marketing');

INSERT INTO Employees (emp_id, emp_name, age, salary, dept_id) VALUES
(101, 'John', 30, 50000, 2),
(102, 'Alice', 28, 60000, 2),
(103, 'Bob', 35, 45000, 3),
(104, 'Carol', 40, 70000, 4),
(105, 'David', 25, 40000, 1),
(106, 'Eva', 38, 80000, 5);

SELECT emp_name, salary FROM Employees WHERE salary > (
    SELECT AVG(salary)
    FROM Employees
);

SELECT emp_name
FROM Employees
WHERE dept_id = (
    SELECT dept_id
    FROM Employees
    WHERE emp_name = 'John'
);

SELECT emp_name
FROM Employees
WHERE dept_id NOT IN (
    SELECT dept_id
    FROM Departments
);

SELECT MAX(salary) AS second_highest_salary
FROM Employees
WHERE salary < (
    SELECT MAX(salary)
    FROM Employees
);

SELECT emp_name, age
FROM Employees
WHERE age > ANY (
    SELECT age
    FROM Employees
    WHERE dept_id = (
        SELECT dept_id
        FROM Departments
        WHERE dept_name = 'Sales'
    )
);

