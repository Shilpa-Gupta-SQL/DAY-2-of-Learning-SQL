-- 1. Write a SQL statement to create a database named SchoolDB.
CREATE DATABASE SchoolDB;

USE schooldb;

# Create a table Students with the following fields: o student_id INT (Primary Key) o name VARCHAR(50) o age INT o class VARCHAR(10)
CREATE TABLE Students (
student_id INT PRIMARY KEY,
name VARCHAR (50),
age INT,
class VARCHAR (10)
);

-- 3. Create a table Courses with fields: - course_id INT (Primary Key) - course_name VARCHAR(50) - credits INT
CREATE TABLE Courses (
course_id INT PRIMARY KEY,
course_name VARCHAR (50) ,
credits int
);

# 4. Add a new column email (VARCHAR(100)) to the Students table.
ALTER TABLE students
ADD email VARCHAR (100);

# 5. Modify the age column to TINYINT.
ALTER TABLE students
MODIFY age TINYINT;

# 6. Rename the column class to grade_level.
ALTER TABLE students
CHANGE class grade_level VARCHAR (10);

# 7. Rename table Students to StudentInfo.
RENAME TABLE Students to StudentInfo;

# 8. Create a table Enrollments with fields: o enroll_id INT PRIMARY KEY o student_id INT NOT NULL o course_id INT NOT NULL ,Add a foreign key from student_id → Students.student_id.
CREATE TABLE Enrollments (
enroll_id INT PRIMARY KEY,
student_id INT NOT NULL,
course_id INT NOT NULL,
FOREIGN KEY (student_id ) REFERENCES studentinfo (student_id)
);

# 9. Add a UNIQUE constraint on email in StudentInfo table.
ALTER TABLE StudentInfo
MODIFY email VARCHAR (100) UNIQUE;

# 10. Add a CHECK constraint to ensure credits > 0 in the Courses table.
ALTER TABLE Courses
MODIFY credits INT CHECK (credits > 0);

# 11. Write a query to truncate the Enrollments table.
TRUNCATE TABLE Enrollments;
SHOW TABLES;

# 12. Drop the Courses table.
DROP TABLE Courses;

# 13. Drop the database SchoolDB.
DROP DATABASE SchoolDB;

# 14. Insert 5 records into the StudentInfo table.
INSERT INTO Students -- Because StudentInfo dosen't exist
VALUES ( 73, 'SHILPA' , 40 , 2 ),
(88, 'DEVDAS', 67, 9),
(98, 'PARO', 97, 3),
(58, 'SATYA', 1047, 4),
(48, 'SURYA', 2025, 44);

SELECT * FROM Students;

# 15. Insert 3 records into the Courses table.
INSERT INTO Courses
VALUES (303, 'SQL' , 5 ),
(304, 'SQL' , 6 ),
(305, 'SQL' , 6 );

SELECT * FROM Courses;

# 16. Insert sample enrollment records into Enrollments table
------------- First step because table does not exist-----------------------------
CREATE TABLE Enrollments (
enroll_id INT PRIMARY KEY,
student_id INT NOT NULL,
course_id INT NOT NULL
);

------------------- Now Actual Query -------------------------------
INSERT INTO Enrollments 
VALUES (256789, 1, 706),
(233789, 1, 706),
(234789, 1, 706),
(223789, 1, 706),
(123789, 1, 706),
(321789, 1, 706);

SELECT * FROM Enrollments;

# 17. Update the age of a specific student using student_id.
UPDATE students SET age = 56 WHERE student_id > 50;  -- 4 rows were affected whose students ids were 58,73,88,98

# 18. Update the email of any 3 students.
------------- First step because column does not exist-----------------------------

ALTER TABLE Students
ADD email VARCHAR (100);

------------------- Now Actual Query -------------------------------
UPDATE Students 
SET email = ('satya@yahoo.com')
WHERE Student_id = 58 ;

UPDATE Students 
SET email = ('devdas@yahoo.com')
WHERE Student_id = 73 ;

UPDATE Students 
SET email = ('paro@yahoo.com')
WHERE Student_id = 88 ;

SELECT * FROM Students;
SELECT * FROM courses;

# 19. Increase the credits of all courses by 1.
UPDATE courses 
SET credits = +1; -- Query Correct but wrong solution to the problem.

UPDATE courses 
SET credits = credits + 1; --  Correct one

SET SQL_SAFE_UPDATES = 0;

# 20. Delete a student from StudentInfo using student_id.
DELETE FROM Students
WHERE student_id = 73;

# 21. Delete all enrollments related to a specific course_id.
DELETE FROM Enrollments
WHERE course_id = 304;

SELECT * FROM Enrollments;

# 22. Delete all students where age < 10.
DELETE FROM Students
WHERE age < 10;

# 23. Select all students from the StudentInfo table.
SELECT * FROM students;

# 24. Select only name and email of all students.
SELECT name, email FROM Students;

# 25. Select all courses with credits more than 3.
SELECT course_name 
FROM courses 
WHERE credits > 3;

#26. Select all enrollments with student and course IDs.
SELECT student_id, course_id FROM Enrollments;

# 27. Select students sorted by age.
SELECT student_id, name, Age from Students
ORDER BY Age ASC ;

# 28. Count number of students in each grade_level.
SELECT grade_level, COUNT(*) AS total_number
FROM Students
GROUP BY grade_level;

# 29. Insert all students older than 15 into a new table SeniorStudents.
-------------------- To do this, first creating a new table called SeniorStudents---------------------------
CREATE TABLE SeniorStudents (
student_id INT PRIMARY KEY,
student_name VARCHAR (70),
student_age INT,
student_class INT,
student_email VARCHAR (200)
);
SELECT * FROM SeniorStudents;

-------------------------- NOW ACTUAL QUERY ---------------------
INSERT INTO SeniorStudents
SELECT * FROM students WHERE Age > 15; 

SELECT * FROM SeniorStudents;

# 30. Increase credits of courses whose course_name contains 'Data'
UPDATE Courses
SET Credits = Credits + 5 
WHERE course_name LIKE '%Data%';























































