CREATE DATABASE dangkykhoahoc;
USE dangkykhoahoc;

-- Bảng Student
CREATE TABLE Student (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(100) NOT NULL,
    student_email VARCHAR(100) NOT NULL UNIQUE,
    student_phone VARCHAR(11) NOT NULL
);

-- Bảng Course (sửa tên Courge → Course)
CREATE TABLE Course (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(100) NOT NULL,
    credit_hours INT CHECK (credit_hours BETWEEN 1 AND 10)
);

-- Bảng Enrollment
CREATE TABLE Enrollment (
    student_id INT,
    course_id INT,
    grade DECIMAL(4,2) DEFAULT 0 CHECK (grade BETWEEN 0 AND 10),
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
);

-- Insert Student
INSERT INTO Student (student_name, student_email, student_phone)
VALUES
('quydz1','quydz1@gmail.com','0123456789'),
('quydz2','quydz2@gmail.com','0123456789'),
('quydz3','quydz3@gmail.com','0123456789'),
('quydz4','quydz4@gmail.com','0123456789'),
('quydz5','quydz5@gmail.com','0123456789');

-- Insert Course
INSERT INTO Course (course_name, credit_hours)
VALUES
('IT01',5),
('IT02',3),
('IT03',4),
('IT04',6),
('IT05',7);

-- Insert Enrollment (sửa course_id cho đúng)
INSERT INTO Enrollment (student_id, course_id, grade)
VALUES
(1, 1, 7.5),
(2, 2, 8.0),
(2, 3, 6.5),
(3, 1, 9.0),
(4, 4, 7.0);

-- Update điểm
UPDATE Enrollment
SET grade = 9
WHERE student_id = 2 AND course_id = 3;

-- Select Student
SELECT student_name, student_email, student_phone
FROM Student;

-- Delete Course (id hợp lệ)
DELETE FROM Course
WHERE course_id = 101;
-- Ko bị lỗi nên xóa được
