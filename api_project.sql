CREATE TABLE students2 (
	student_id SERIAL PRIMARY KEY,
	student_name VARCHAR(50),
	course_id INT
);

INSERT INTO students2 ( student_name, course_id)
VALUES
	('Ram', 101),
	('Sita', 102),
	('Hari', 101),
	('Gita', NULL);

CREATE TABLE courses2 (
	course_id INT PRIMARY KEY,
	course_name VARCHAR(50)
);

INSERT INTO courses2 (course_id, course_name)
VALUES
	(101, 'computer_science'),
	(102, 'mathematics'),
	(103, 'physics');

SELECT * FROM students2;
SELECT * FROM courses2; 

--DISPLAY STUDENT NAME AND COURSES NAMR USING INNER JOIN 
SELECT s.student_name, c.course_name
FROM students2 s
INNER JOIN courses2 c
ON s.course_id=c.course_id; 

--DISPLAY ALL COURSES AND STUDENTS ENROLLED USING RIGHT JOIN 
SELECT s.student_name, c.course_name
FROM students2 s
RIGHT JOIN courses2 c
ON s.course_id=c.course_id; 

--FIND STUDENTS WHO ARE NOT ENROLLED IN ANY COURSE 
SELECT s.student_id, s.student_name
FROM students2 s
LEFT JOIN courses2 c
ON s.course_id=c.course_id
WHERE c.course_id IS NULL;

--COUNT THE NUMBER OF STUDENTS IN EACH COURSE
SELECT c.course_name, COUNT(s.student_id) AS total_students
FROM courses2 c
LEFT JOIN students2 s
ON c.course_id=s.course_id
GROUP BY c.course_name; 

--DISPLAY STUDENT NAMES AND COURSE NAMES SORTED ALPHABETICALLY BY STUDENT NAME 
SELECT s.student_name, c.course_name
FROM students2 s
LEFT JOIN courses2 c
ON s.course_id=c.course_id
ORDER BY s.student_name ASC;

--FIND COURSES THAT HAVE NO STUDENT ENROLLED
SELECT c.course_id, c.course_name
FROM courses2 c
LEFT JOIN students2 s
ON c.course_id = s.course_id
WHERE s.student_id IS NULL;

--SHOW STUDENT NAME WITH THEIR COURSE IDS USING JOIN 
SELECT s.student_name, c.course_id
FROM students2 s
JOIN courses2 c
ON s.course_id = c.course_id;

--Display student and course names using table aliases
SELECT s.student_name, c.course_name
FROM students2 s
JOIN courses2 c
ON s.course_id = c.course_id;

--FIND THE STUDENTS WHO ARE ENTOLLED IN 'COMPUTER SCIENCE' 
SELECT s.student_name
FROM students2 s
JOIN courses2 c
ON s.course_id = c.course_id
WHERE c.course_name = 'computer_science';

--SHOW COURSE NAMES WITH THE NUMBER OF STUDENTS IN EACH COURSE 
SELECT c.course_name, COUNT(s.student_id) AS number_of_students
FROM courses2 c
LEFT JOIN students2 s
ON c.course_id = s.course_id
GROUP BY c.course_name;

--Display all students even if they are not enrolled in a course.
SELECT s.student_name, c.course_name
FROM students2 s
LEFT JOIN courses2 c
ON s.course_id = c.course_id;

--LIST ALL COURSES EVEN IF NO STUDENT IS ENROLLED IN THEM  
SELECT c.course_name, s.student_name
FROM courses2 c
LEFT JOIN students2 s
ON c.course_id = s.course_id;

--SHOW STUDENTS AND COURSES SORTED BY COURSE NAME 
SELECT s.student_name, c.course_name
FROM students2 s
LEFT JOIN courses2 c
ON s.course_id = c.course_id
ORDER BY c.course_name ASC;

--FIND COURSES THAT HAVE MORE THEN ONE STUDENT ENROLLED 
SELECT c.course_name, COUNT(s.student_id) AS total_students
FROM courses2 c
JOIN students2 s
ON c.course_id = s.course_id
GROUP BY c.course_name

	