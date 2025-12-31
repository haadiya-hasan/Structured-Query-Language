SELECT * FROM Employees;
SELECT emp_name, salary FROM Employees ORDER BY salary DESC;
UPDATE Employees SET salary = salary * 1.10 WHERE dept_id = 2;
SELECT emp_name, salary FROM Employees WHERE dept_id = 2;
DELETE FROM Employees WHERE salary < 45000;
SELECT emp_name, salary FROM Employees;
SELECT emp_name, salary FROM Employees WHERE salary > (
    SELECT AVG(salary)
    FROM Employees
);
SELECT e.emp_name, d.dept_name FROM Employees e JOIN Departments d ON e.dept_id = d.dept_id;
SELECT e.emp_name FROM Employees e JOIN Departments d ON e.dept_id = d.dept_id WHERE d.dept_name = 'Sales';



