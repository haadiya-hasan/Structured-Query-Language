Create database Library;
use Library;

Create table Members(
Member_ID int AUTO_INCREMENT PRIMARY KEY,
Name varchar(50), 
Gender char(1),
Phone_number int,
email_id varchar(100),
address varchar(100),
joining_date date);

INSERT INTO Members (Name, Gender, Phone_number, email_id, address, joining_date) VALUES
('Aisha Khan', 'F', 36678977, 'aisha.khan@gmail.com', 'Noida, UP', '2023-02-15'),
('Ravi Sharma', 'M', 2343632, 'ravi.sharma@gmail.com', 'Delhi', '2023-03-10'),
('Sneha Patel', 'F', 3242424, 'sneha.patel@yahoo.com', 'Ahmedabad, Gujarat', '2023-06-21'),
('Arjun Mehta', 'M', 4893434, 'arjun.mehta@gmail.com', 'Lucknow, UP', '2023-05-12'),
('Zara Ali', 'F', 239283, 'zara.ali@gmail.com', 'Mumbai, Maharashtra', '2023-01-08'),
('Karan Verma', 'M', 849384, 'karan.verma@gmail.com', 'Pune, Maharashtra', '2024-04-01');

CREATE TABLE authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    nationality VARCHAR(50),
    birth_year YEAR
);

INSERT INTO authors (name, nationality, birth_year) VALUES
('Preeti Arora', 'Indian', 1978),
('Chetan Bhagat', 'Indian', 1974),
('J.K. Rowling', 'British', 1965),
('Dan Brown', 'American', 1964),
('R.K. Narayan', 'Indian', 1906),
('George Orwell', 'British', 1903);

CREATE TABLE publishers (
    publisher_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    address VARCHAR(250),
    contact_number int
);

INSERT INTO publishers (name, address, contact_number) VALUES
('Pearson Education', 'Noida, UP', 112233445),
('HarperCollins', 'Mumbai, India', 998877665),
('Penguin Random House', 'New York, USA', 556677889),
('Oxford University Press', 'London, UK', 334455667),
('Tata McGraw Hill', 'Delhi, India', 776655443);

CREATE TABLE categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100)
);

INSERT INTO categories (category_name) VALUES
('Fiction'),
('Science'),
('Computer Science'),
('Mystery'),
('Biography'),
('Self-Help');

CREATE TABLE books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(150),
    author_id INT,
    publisher_id INT,
    category_id INT,
    publication_year YEAR,
    total_copies INT,
    available_copies INT,
    FOREIGN KEY (author_id) REFERENCES authors(author_id),
    FOREIGN KEY (publisher_id) REFERENCES publishers(publisher_id),
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

INSERT INTO books (title, author_id, publisher_id, category_id, publication_year, total_copies, available_copies) VALUES
('Python Programming', 1, 1, 3, 2021, 10, 8),
('Half Girlfriend', 2, 2, 1, 2015, 5, 4),
('Harry Potter and the Sorcerer’s Stone', 3, 3, 1, 1997, 8, 7),
('The Da Vinci Code', 4, 3, 4, 2003, 6, 5),
('Malgudi Days', 5, 5, 1, 1943, 7, 6),
('1984', 6, 4, 1, 1949, 9, 8);

CREATE TABLE book_copies (
    copy_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT,
    status varchar(50) DEFAULT 'Available',
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);

INSERT INTO book_copies (book_id, status) VALUES
(1, 'Available'),
(1, 'Issued'),
(2, 'Available'),
(3, 'Available'),
(3, 'Issued'),
(4, 'Available'),
(5, 'Available'),
(6, 'Issued'),
(6, 'Available'),
(2, 'Damaged');

CREATE TABLE issue_records (
    issue_id INT AUTO_INCREMENT PRIMARY KEY,
    member_id INT,
    copy_id INT,
    issue_date DATE,
    due_date DATE,
    return_date DATE,
    fine_amount DECIMAL(6,2),
    FOREIGN KEY (member_id) REFERENCES members(member_id),
    FOREIGN KEY (copy_id) REFERENCES book_copies(copy_id)
);

INSERT INTO issue_records (member_id, copy_id, issue_date, due_date, return_date, fine_amount) VALUES
(1, 2, '2024-06-01', '2024-06-15', '2024-06-14', 0.00),
(2, 5, '2024-06-10', '2024-06-25', '2024-06-28', 50.00),
(3, 8, '2024-07-01', '2024-07-15', '2024-07-13', 0.00),
(4, 9, '2024-07-10', '2024-07-25', NULL, 0.00),
(5, 10, '2024-08-01', '2024-08-15', '2024-08-20', 25.00);

CREATE TABLE payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    member_id INT,
    amount DECIMAL(8,2),
    payment_date DATE,
    FOREIGN KEY (member_id) REFERENCES members(member_id)
);

INSERT INTO payments (member_id, amount, payment_date) VALUES
(1, 150.00, '2024-06-15'),
(2, 200.00, '2024-06-30'),
(3, 0.00, '2024-07-13'),
(4, 100.00, '2024-07-20'),
(5, 50.00, '2024-08-21'),
(6, 75.00, '2024-09-01');

CREATE TABLE staff (
    staff_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    Role varchar(50),
    phone VARCHAR(20),
    email VARCHAR(100),
    hire_date DATE
);

INSERT INTO staff (name, role, phone, email, hire_date) VALUES
('Rohit Singh', 'Librarian', '9898989898', 'rohit@library.com', '2022-05-10'),
('Meera Das', 'Assistant Librarian', '9876543210', 'meera@library.com', '2023-01-12'),
('Vikram Jain', 'Manager', '9123456789', 'vikram@library.com', '2021-09-05'),
('Tanya Kapoor', 'Data Entry Operator', '9345678901', 'tanya@library.com', '2023-02-14'),
('Ankit Yadav', 'Accountant', '9234567890', 'ankit@library.com', '2022-11-20');

CREATE TABLE login (
    login_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE,
    password VARCHAR(100),
    Role varchar(20),
    member_id INT NULL,
    staff_id INT NULL,
    FOREIGN KEY (member_id) REFERENCES members(member_id),
    FOREIGN KEY (staff_id) REFERENCES staff(staff_id)
);

INSERT INTO login (username, password, role, member_id, staff_id) VALUES
('aisha_k', 'aisha123', 'Member', 1, NULL),
('ravi_s', 'ravi123', 'Member', 2, NULL),
('sneha_p', 'sneha123', 'Member', 3, NULL),
('rohit_s', 'rohitlib', 'Staff', NULL, 1),
('meera_d', 'meera@lib', 'Staff', NULL, 2),
('vikram_j', 'vikram@123', 'Staff', NULL, 3);


DROP TABLE IF EXISTS old_members;
DROP DATABASE IF EXISTS LibraryBackup;
CREATE DATABASE IF NOT EXISTS LibraryBackup;

ALTER TABLE Members ADD COLUMN membership_type VARCHAR(20) DEFAULT 'Regular' NOT NULL;
ALTER TABLE Members ADD CONSTRAINT chk_phone CHECK (Phone_number > 100000);
ALTER TABLE Members DROP CHECK chk_phone;

ALTER TABLE books ADD COLUMN price DECIMAL(6,2) DEFAULT 499.99;
ALTER TABLE books DROP COLUMN price;

ALTER TABLE Members CHANGE COLUMN Name Full_Name VARCHAR(100);
ALTER TABLE Members MODIFY COLUMN Phone_number BIGINT;

ALTER TABLE categories RENAME TO book_categories;
ALTER TABLE Members ADD CONSTRAINT unique_email UNIQUE (email_id);

SELECT * FROM Members;
SELECT * FROM Members WHERE Gender = 'F';
SELECT * FROM Books ORDER BY publication_year DESC;
SELECT * FROM Books LIMIT 3;

SELECT author_id, COUNT(*) AS total_books
FROM Books
GROUP BY author_id
HAVING COUNT(*) >= 2;

SELECT * FROM Books WHERE total_copies > 5;
SELECT publisher_id, SUM(total_copies) AS total FROM Books GROUP BY publisher_id HAVING total > 10;

SELECT 
    COUNT(*) AS total_books,
    AVG(total_copies) AS avg_copies,
    MAX(publication_year) AS latest_year,
    MIN(publication_year) AS oldest_year,
    SUM(total_copies) AS total_inventory
FROM Books;

SELECT title, total_copies, available_copies, (total_copies - available_copies) 
AS issued_books FROM Books;

SELECT * FROM Books WHERE (total_copies > 5 AND publication_year > 2000) OR available_copies < 5;

SELECT 6 & 3 AS Bitwise_AND, 6 | 3 AS Bitwise_OR, 6 ^ 3 AS Bitwise_XOR;

SELECT m.Full_Name, b.title, i.issue_date, i.return_date
FROM issue_records i
JOIN Members m ON i.member_id = m.Member_ID
JOIN book_copies bc ON i.copy_id = bc.copy_id
JOIN Books b ON bc.book_id = b.book_id;

SELECT a.name AS Author, b.title
FROM Authors a
LEFT JOIN Books b ON a.author_id = b.author_id;

SELECT p.name AS Publisher, b.title
FROM Books b
RIGHT JOIN Publishers p ON b.publisher_id = p.publisher_id;

show tables;
