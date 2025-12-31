CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    age INT,
    course VARCHAR(30)
);

INSERT INTO Students VALUES
(1, 'Amit', 20, 'BCA'),
(2, 'Neha', 21, 'BSc'),
(3, 'Rahul', 22, 'BCom');

SELECT * FROM Students;
ALTER TABLE Students ADD email VARCHAR(50);
SELECT * FROM Students;
ALTER TABLE Students MODIFY course VARCHAR(40);
ALTER TABLE Students DROP COLUMN email;
TRUNCATE TABLE Students;
DROP TABLE Students;


