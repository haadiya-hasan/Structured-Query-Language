create database Assignments;
use Assignments;


create table Company(Emp_ID INT Auto_INCREMENT Primary Key, 
Emp_Name varchar(50) not null, 
Department varchar(20), 
Salary int DEFAULT 20000 check (Salary>=20000)
); 
INSERT INTO Company (Emp_Name, Department, Salary) VALUES ('Haadiya Hasan', 'IT', 55000), ("Himanshu Neeraj", "Finance", 45000);
INSERT INTO Company(Emp_Name, Department, Salary) VALUES ('Himanshi Chaudhary', 'IT', 43000), ("Nidhi Sharma", "HR", 78000), ('Aditya Dubey', 'Finance', 32000), ('Aman Pal', 'Finance', 45020);
INSERT INTO Company (emp_name, department) VALUES ("Mayank Raj", "IT");
SELECT * FROM Company where salary > 50000;
SELECT * FROM Company where department = 'HR' OR salary < 30000;
SELECT DISTINCT department FROM Company;
SELECT * FROM Company ORDER BY salary DESC LIMIT 2;
SELECT * FROM Company WHERE salary BETWEEN 25000 AND 60000 ORDER BY salary;
SELECT department, COUNT(*) AS total_employees FROM Company GROUP BY department;
SELECT emp_name, salary, department FROM Company WHERE salary = (SELECT MAX(salary) FROM Company);
DROP TABLE IF EXISTS Company;


CREATE TABLE Course (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100) UNIQUE,
    duration INT NOT NULL,
    fees INT DEFAULT 50000 CHECK (fees <= 100000)
);

INSERT INTO Course (course_name, duration, fees) VALUES ('Data Science', 12, 90000),  ('Animation', 6, 45000), ('Fashion Design', 4, 25400);
INSERT INTO Course (course_name, duration) VALUES ("BTech.", 10);
SELECT * FROM Course WHERE duration > 6;
SELECT * FROM Course WHERE fees < 50000 OR duration > 12;
SELECT DISTINCT duration FROM Course;
SELECT * FROM Course ORDER BY fees DESC LIMIT 1;
SELECT * FROM Course WHERE duration BETWEEN 6 AND 12 ORDER BY fees;
SELECT duration, COUNT(*) AS total_courses FROM Course GROUP BY duration;
SELECT * FROM Course WHERE fees = (SELECT MIN(fees) FROM Course);
DROP TABLE IF EXISTS Course;


CREATE TABLE Hospital (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_name VARCHAR(100) NOT NULL,
    disease VARCHAR(30),
    bill_amount INT DEFAULT 10000 CHECK (bill_amount <= 200000)
);
INSERT INTO Hospital (patient_name, disease, bill_amount)
VALUES ('Yukti', 'Flu', 15000), ('Aditya Dubey', 'Cancer', 120000), ('Aman Pal', 'Alzehmier', 23000), ("Haadiya Hasan", "Bone Fracture", 24000);

INSERT INTO Hospital (patient_name, disease)
VALUES ('Karan Mehta', 'Diabetes');

SELECT * FROM Hospital WHERE bill_amount > 50000;
SELECT * FROM Hospital WHERE disease = 'Flu' OR bill_amount < 10000;
SELECT DISTINCT disease FROM Hospital;
SELECT * FROM Hospital ORDER BY Bill_amount DESC LIMIT 2;
SELECT * FROM Hospital WHERE bill_amount BETWEEN 20000 AND 80000 ORDER BY bill_amount ASC;
SELECT disease, COUNT(*) AS total_patients FROM Hospital GROUP BY disease;
SELECT * FROM Hospital WHERE bill_amount = (SELECT MIN(bill_amount) FROM Hospital);
DROP TABLE IF EXISTS Hospital;


CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    product VARCHAR(40),
    amount INT DEFAULT 5000 CHECK (amount <= 50000)
);
INSERT INTO Orders (customer_name, product, amount) VALUES ('Himanshi', 'Laptop', 40900), ("Haadiya", "Mobile", 50000), ("Yogesh", "Watch", 23000), ("Angel", "Camera", 10000), ("Aditya", "Laptop", 12000);
INSERT INTO Orders (customer_name, product) VALUES ('Himanshu', 'Headphones');
SELECT * FROM Orders WHERE amount > 10000;
SELECT * FROM Orders WHERE product = 'Laptop' OR amount < 5000;
SELECT DISTINCT product FROM Orders;
SELECT * FROM Orders ORDER BY amount DESC LIMIT 2;
SELECT * FROM Orders WHERE amount BETWEEN 8000 AND 30000 ORDER BY amount ASC;
SELECT product, COUNT(*) AS total_orders FROM Orders GROUP BY product;
SELECT *  FROM Orders WHERE amount = (SELECT MAX(amount) FROM Orders);
DROP TABLE IF EXISTS Orders;


CREATE TABLE Library2 (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) UNIQUE NOT NULL,
    author VARCHAR(50),
    price INT DEFAULT 500 CHECK (price <= 1500)
);

INSERT INTO Library2 (title, author, price) VALUES ('Malgudi Days', 'R.K. Narayan', 1200), ('The Guide', 'R.K. Narayan', 800), ('Wings of Fire', 'A.P.J. Abdul Kalam', 1500);
INSERT INTO Library2 (title, author) VALUES ('The Discovery of India', 'Jawaharlal Nehru');
SELECT * FROM Library2 WHERE price > 1000;
SELECT *  FROM Library2 WHERE author = 'R.K. Narayan' OR price < 500;
SELECT DISTINCT author FROM Library2;
SELECT * FROM Library2 ORDER BY price DESC LIMIT 2;
SELECT * FROM Library2 WHERE price BETWEEN 400 AND 1000 ORDER BY price ASC;
SELECT author, COUNT(*) AS total_books FROM Library2 GROUP BY author;
SELECT *  FROM Library2 WHERE price = (SELECT MIN(price) FROM Library2);
DROP TABLE IF EXISTS Library2;


Create Table Teacher
(teacher_id int AUTO_Increment Primary Key,
teacher_name varchar(50) NOT NULL,
subject varchar(30),
salary INT CHECK (salary <= 80000)
);

INSERT INTO Teacher (teacher_name, subject, salary) VALUES 
('Dheeraj', 'SQL', 75000),
('Nitish', 'PYTHON', 45000),
('Abhishek', 'COMPUTATIONAL TECHNIQUES', 67000),
('Gaurav', 'VISUALISATION TOOLS', 80000);

INSERT INTO Teacher(teacher_name, subject) VALUES ('Khem', 'INTRODUCTION TO AI');
SELECT * FROM Teacher WHERE salary > 50000;
SELECT * FROM Teacher WHERE subject = 'Maths' OR salary < 30000;
SELECT DISTINCT subject FROM Teacher;
SELECT * FROM Teacher ORDER BY salary DESC LIMIT 1;
SELECT * FROM Teacher WHERE salary BETWEEN 20000 AND 70000 ORDER BY salary ASC;
SELECT subject, COUNT(*) AS total_teachers FROM Teacher GROUP BY subject;
SELECT * FROM Teacher WHERE salary = (SELECT MIN(salary) FROM Teacher);
DROP TABLE IF EXISTS Teacher;


CREATE TABLE Cinema (
    movie_id INT AUTO_INCREMENT PRIMARY KEY,
    movie_name VARCHAR(100) UNIQUE NOT NULL,
    language VARCHAR(20),
    rating INT CHECK (rating <= 10)
);

INSERT INTO Cinema (movie_name, language, rating)
VALUES ('3 Idiots', 'Hindi', 7), ('Spirited Away', 'Japanese', 10),
('Interstellar','English', 9), ("English Vinglish","Hindi",5), ("Conjuring Last Rites", "English", 3),
("Paraste","Korean",8);
INSERT INTO Cinema (movie_name, language)
VALUES ('Midnight', 'Korean'); 

SELECT * FROM Cinema WHERE rating > 7;
SELECT * FROM Cinema WHERE language = 'Hindi' OR rating < 5;
SELECT DISTINCT language FROM Cinema;
SELECT * FROM Cinema ORDER BY rating DESC LIMIT 2;
SELECT * FROM Cinema WHERE rating BETWEEN 5 AND 9 ORDER BY rating ASC;
SELECT language, COUNT(*) AS total_movies FROM Cinema GROUP BY language;
SELECT * FROM Cinema WHERE rating = (SELECT MAX(rating) FROM Cinema);
DROP TABLE IF EXISTS Cinema;


CREATE TABLE BankAccount (
    acc_id INT AUTO_INCREMENT PRIMARY KEY,
    holder_name VARCHAR(100) NOT NULL,
    branch VARCHAR(30),
    balance INT DEFAULT 1000 CHECK (balance >= 1000)
);
-- Insert with balance
INSERT INTO BankAccount (holder_name, branch, balance)
VALUES ("Suresh Menon", "Mumbai", 55000), ("Neha Reddy", "Bangalore", 18000),
("Rajesh Verma", "Delhi", 1000), ("Anjali Pande", "Delhi", 32000);
INSERT INTO BankAccount (holder_name, branch) VALUE ("Aditya Dubey", "Banglore");
SELECT * FROM BankAccount WHERE balance > 20000;
SELECT * FROM BankAccount WHERE branch = 'Delhi' OR balance < 5000;
SELECT DISTINCT branch FROM BankAccount;
SELECT * FROM BankAccount ORDER BY balance DESC LIMIT 2;
SELECT * FROM BankAccount WHERE balance BETWEEN 10000 AND 30000 ORDER BY balance ASC;
SELECT branch, COUNT(*) AS total_accounts FROM BankAccount GROUP BY branch;
SELECT * FROM BankAccount WHERE balance = (SELECT MIN(balance) FROM BankAccount);
DROP TABLE IF EXISTS BankAccount;


CREATE TABLE Shop (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    item_name VARCHAR(100) UNIQUE NOT NULL,
    supplier VARCHAR(40),
    price INT DEFAULT 5000 CHECK (price <= 20000)
);
INSERT INTO Shop (item_name, supplier, price) VALUES ('Laptop', 'XYZ Ltd', 5000), ('Mobile', 'ABC Ltd', 2000), ("Headphones", "HIJ Ltd", 800), ("CPU", "LMO Ltd", 20000), ("Controller", "QWR Ltd", 2000);
INSERT INTO Shop (item_name, supplier) VALUES ('Microphone', 'LMN Ltd');
SELECT * FROM Shop WHERE price > 15000;
SELECT * FROM Shop WHERE supplier = 'ABC Ltd' OR price < 5000;
SELECT DISTINCT supplier FROM Shop;
SELECT * FROM Shop ORDER BY price DESC LIMIT 1;
SELECT * FROM Shop WHERE price BETWEEN 7000 AND 16000 ORDER BY price ASC;
SELECT supplier, COUNT(*) AS total_items FROM Shop GROUP BY supplier;
SELECT * FROM Shop WHERE price = (SELECT MIN(price) FROM Shop);
DROP TABLE IF EXISTS Shop;


CREATE TABLE Flights (
    flight_id INT AUTO_INCREMENT PRIMARY KEY,
    airline VARCHAR(50) NOT NULL,
    source VARCHAR(30),
    destination VARCHAR(30),
    fare INT CHECK (fare <= 20000)
);

INSERT INTO Flights (airline, source, destination, fare)
VALUES ('IndiGo', 'Delhi', 'Mumbai', 12000), ('Air India', 'Bangalore', 'Delhi', 15000), 
("AirAsia",	"Kolkata", "Chennai", 7000),
("Jet Airways",	"Delhi", "London", 20000),
("Air India", "Hyderabad", "Bangalore", 11000),
("IndiGo", "Mumbai", "Delhi", 14000),
("Vistara", "Bangalore", "Mumbai", 13000);

INSERT INTO Flights (airline, source, destination)
VALUES ('SpiceJet', 'Chennai', 'Kolkata');

SELECT * FROM Flights WHERE fare > 10000;
SELECT * FROM Flights WHERE source = 'Delhi' OR fare < 5000;
SELECT DISTINCT airline FROM Flights;
SELECT * FROM Flights ORDER BY fare DESC LIMIT 2;
SELECT * FROM Flights WHERE fare BETWEEN 8000 AND 15000 ORDER BY fare ASC;
SELECT source, COUNT(*) AS total_flights FROM Flights GROUP BY source;
SELECT * FROM Flights WHERE fare = (SELECT MAX(fare) FROM Flights);
DROP TABLE IF EXISTS Flights;


































