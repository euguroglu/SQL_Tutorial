DROP TABLE student;
SELECT * FROM student;

# Not null and Unique constraints
CREATE TABLE student (
	student_id INT,
    name VARCHAR(20) NOT NULL,
    major VARCHAR(20) UNIQUE,
    PRIMARY KEY(student_id)
);

 #Default Constraints
CREATE TABLE student (
	student_id INT,
    name VARCHAR(20) NOT NULL,
    major VARCHAR(20) DEFAULT 'Undecided',
    PRIMARY KEY(student_id)
);

#Auto Primary Key Increment
CREATE TABLE student (
	student_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(20),
    major VARCHAR(20)
);

INSERT INTO student(name, major) VALUES('Alex','Physic');
INSERT INTO student(name, major) VALUES('Osman','Engineer');
INSERT INTO student(name, major) VALUES('Jennifer', 'Biology');
INSERT INTO student(name, major) VALUES('Fatih','Computer Science');
INSERT INTO student(name, major) VALUES('Mike','Biology');

SELECT * FROM student;