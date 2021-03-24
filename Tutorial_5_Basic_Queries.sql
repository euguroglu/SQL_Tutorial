SELECT * FROM student;

SELECT name FROM student;
SELECT name, major FROM student;
SELECT student.name FROM student;

SELECT name FROM student
ORDER BY name;

SELECT name FROM student
ORDER BY name DESC;

SELECT name FROM student
ORDER BY student_id DESC;

SELECT name FROM student
ORDER BY student_id ASC;

SELECT * FROM student
ORDER BY major, student_id ASC; #if major is same it will order further by student_id

SELECT * FROM student
LIMIT 2; #Limits result

SELECT * FROM student
ORDER BY student_id DESC
LIMIT 2;

SELECT * FROM student
WHERE major = 'Computer Science';

SELECT name FROM student
WHERE major = 'Computer Science';

SELECT name, major FROM student
WHERE major = 'Biology' OR name = 'Alex';

SELECT name, major FROM student
WHERE major <> 'Physic';

SELECT * FROM student
WHERE student_id <= 8 AND name <> 'Osman';

SELECT * FROM student
WHERE name IN ('Alex','Jennifer');
