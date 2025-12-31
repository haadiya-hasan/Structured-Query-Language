Use assignments;

Create table Departments(
	Dept_ID INT PRIMARY KEY, 
	Dept_Name VARCHAR(50) NOT NULL
);

Create table Employees(
	Emp_ID INT PRIMARY KEY,
	Name VARCHAR(50) NOT NULL,
	Salary INT NOT NULL, 
	Experience INT,
    Dept_ID INT,
    FOREIGN KEY (Dept_ID) REFERENCES departments(dept_id)
    On UPDATE Cascade
	On DELETE Cascade
);

INSERT INTO Departments (Dept_ID, Dept_Name) VALUES (1, 'IT'), (2, 'HR'), (3, 'Finance'), (4, 'Sales');
INSERT INTO Employees (Emp_ID, Name, Salary, Experience, Dept_ID) VALUES
(1, 'Aarav', 75000, 6, 1), (2, 'Rohan', 45000, 3, 2), (3, 'Priya', 30000, 2, 3),
(4, 'Kavya', 85000, 8, 1), (5, 'Tanya', 65000, 5, 4);

-- Display employees from IT dept with salary > 60000
SELECT * FROM Employees WHERE Dept_ID = 1 AND Salary > 60000;

-- Insert “Ritika” into HR with salary 50,000 and 3 years experience
INSERT INTO Employees (Emp_ID, Name, Salary, Experience, Dept_ID)
VALUES (6, 'Ritika', 50000, 3, (SELECT Dept_ID FROM Departments WHERE Dept_Name = 'HR'));

-- Increase salary by 15% for employees with > 5 years experience
UPDATE Employees 
SET Salary = Salary * 1.15
WHERE Experience > 5;

-- Delete employees whose salary is less than 40,000
DELETE FROM Employees WHERE Salary < 40000;

-- Show departments whose average salary > 55,000
SELECT Dept_ID, AVG(Salary) AS AvgSalary FROM Employees GROUP BY Dept_ID HAVING AVG(Salary) > 55000;

-- Insert two new departments (Marketing & Operations)
INSERT INTO Departments (Dept_ID, Dept_Name) VALUES (5, 'Marketing'), (6, 'Operations');

-- Delete one department (cascades to its employees)
DELETE FROM Departments WHERE Dept_Name = 'Marketing';

-- Change a department's id (cascades to employees)
UPDATE Departments SET Dept_ID = 10 WHERE Dept_Name = 'HR';

-- Insert many employees in one query
INSERT INTO Employees (Emp_ID, Name, Salary, Experience, Dept_ID)
VALUES (201, 'Aarav', 65000, 4, 1), (202, 'Rohan', 72000, 6, 2), (203, 'Priya', 55000, 3, 3);

