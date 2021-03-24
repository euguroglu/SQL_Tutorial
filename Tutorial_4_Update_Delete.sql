SELECT * FROM student;

UPDATE student
SET major = 'Bio'
WHERE major = 'Biology';

UPDATE student
SET major = 'Comp Sci'
WHERE major = 'Computer Science';

UPDATE student
SET major = 'Comp Sci'
WHERE student_id = 3;

UPDATE student
SET major = 'Biophysic'
WHERE major = 'Physic' OR major = 'Bio';

UPDATE student
SET name = 'Tom', major = 'undecided'
WHERE student_id = 1;

DELETE FROM student; #That will delete all rows

DELETE FROM student
WHERE student_id = 10;