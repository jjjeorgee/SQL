CREATE TABLE student (
 student_id INT PRIMARY KEY AUTO_INCREMENT,
 name VARCHAR(20) NOT NULL,
 major VARCHAR(20)UNIQUE,
 email VARCHAR(20)DEFAULT 'NA'
 );
 
DROP TABLE student;
DESCRIBE student;

ALTER TABLE student 
ADD gpa DECIMAL(3, 2);
INSERT INTO student 
VALUES (1, 'Paul', 'Mathematics', 3.0);
SELECT * 
FROM student;

ALTER TABLE student
DROP COLUMN gpa;

ALTER TABLE student 
ADD gpa DECIMAL(3, 2);

INSERT INTO student (student_id, name, major) VALUES (5, 'Petyr', 'Law');
INSERT INTO student (name, major, email) VALUES ('silva', 'Mathematics', 'trapgmail');


UPDATE student
SET email = 'NBA'
WHERE email is NULL;