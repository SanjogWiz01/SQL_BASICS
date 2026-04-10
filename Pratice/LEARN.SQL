-- Students table
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    major VARCHAR(50),
    year INT
);

-- Courses table
CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    credits INT,
    department VARCHAR(50)
);

-- Enrollment table (relationship between students and courses)
CREATE TABLE Enrollment (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    grade CHAR(2),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

--insert samples

INSERT INTO Students VALUES
(1, 'Aarav Sharma', 'Computer Science', 2),
(2, 'Sita Rai', 'Economics', 3),
(3, 'Ramesh Koirala', 'Physics', 1);

INSERT INTO Courses VALUES
(101, 'Database Systems', 3, 'Computer Science'),
(102, 'Microeconomics', 4, 'Economics'),
(103, 'Quantum Mechanics', 3, 'Physics');

INSERT INTO Enrollment VALUES
(1001, 1, 101, 'A'),
(1002, 2, 102, 'B'),
(1003, 3, 103, 'A'),
(1004, 1, 103, 'C');

--create views
CREATE VIEW v_StudentGrades AS
SELECT 
    s.name AS student_name,
    c.course_name,
    e.grade
FROM Enrollment e
JOIN Students s ON e.student_id = s.student_id
JOIN Courses c ON e.course_id = c.course_id;  ALTER
