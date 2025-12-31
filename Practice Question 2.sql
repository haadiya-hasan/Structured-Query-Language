create database assignment3;
use assignment3;
create table employees(emp_id INT PRIMARY KEY AUTO_INCREMENT, 
name_1 VARCHAR(50), 
department VARCHAR(30), 
experience INT, 
salary INT, 
joining_date DATE,
bonus int 
);
INSERT INTO employees (emp_id,name_1, department, experience, salary, joining_date,bonus) VALUES (01,'Amit','IT', 6, 60000, '2018-07-10',1000), 
(02,'Priya', 'HR', 3, 40000, '2021-05-14',3000),
(03,'Ravi', 'Sales', 8, 75000,'2016-11-23',4000), 
(04,'Sneha', 'IT', 2, 35000, '2023-02-18',54000), 
(05,'Karan', 'Finance', 10, 90000, '2014-04-05',2000),
(06,'Tina', 'Sales', 5, 55000, '2019-09-12',5600);
select*from employees where department="IT";
set sql_safe_updates=0;
UPDATE employees SET bonus = bonus * 1.20 WHERE salary > 70000; 
SELECT emp_id, name_1, department, salary,
    CASE 
        WHEN salary >= 80000 THEN 'High'
        WHEN salary BETWEEN 50000 AND 79999 THEN 'Medium'
        ELSE 'Low'
    END AS salary_level
FROM employees;
SELECT department, AVG(bonus) AS avg_bonus FROM employees  GROUP BY department;
SELECT department, AVG(bonus) AS avg_bonus FROM employees GROUP BY department HAVING AVG(bonus) > 4000;
SELECT department, SUM(salary + bonus) AS total_salary_bonus FROM employees GROUP BY department;
UPDATE employees  SET salary = salary * 1.10  WHERE department = 'Finance';
SELECT MAX(salary) AS max_salary, MIN(salary) AS min_salary FROM employees;
SELECT * FROM employees order by bonus desc;
SELECT department, COUNT(*) as employee_count FROM employees GROUP BY department HAVING COUNT(*)>1;
select*from employees;

#------------------------x-----------------------------------#

create table Students(student_id INT PRIMARY KEY AUTO_INCREMENT,
Name VARCHAR(50), 
Course VARCHAR(30), 
Marks INT, 
Attendance INT, 
Grade CHAR(1) );

INSERT INTO students(Name, course, marks, attendance, grade) VALUES 
('Aarav', 'Maths', 85, 90, 'A'), 
('Riya', 'Science', 72, 88, 'B'), 
('Kabir', 'English', 60, 70, 'C'), 
('Neha', 'Maths', 95, 92, 'A'), 
('Rahul', 'Science', 50, 65, 'D');

SELECT * FROM students;
UPDATE students SET marks = LEAST(marks + 5, 100) WHERE attendance > 85;
SELECT student_id, name, course, marks, CASE
    WHEN marks >= 90 THEN 'Excellent'
    WHEN marks >= 75 THEN 'Good'
    WHEN marks >= 50 THEN 'Average'
    ELSE 'Poor'
  END AS performance FROM students;
SELECT course, AVG(marks) AS avg_marks FROM students GROUP BY course;
SELECT course, AVG(marks) AS avg_marks FROM students GROUP BY course HAVING AVG(marks) > 75;
SELECT course,
		SUM(marks) AS total_marks,
       AVG(attendance) AS avg_attendance
FROM students GROUP BY course;
UPDATE students SET marks = LEAST(CEIL(marks * 1.10), 100) WHERE course = 'Maths';
SELECT MAX(marks) AS max_marks, MIN(marks) AS min_marks FROM students;
SELECT * FROM students ORDER BY attendance DESC;
SELECT course, COUNT(*) AS student_count FROM students GROUP BY course HAVING COUNT(*) > 1;

