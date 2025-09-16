CREATE TABLE courses (
	courses_id SERIAL PRIMARY KEY,
	course_name VARCHAR(50) NOT NULL,
	student_id INT REFERENCES students(student_id) ON DELETE CASCADE
);

INSERT INTO courses (course_name) VALUES ('Database'), ('Operating Systems'), ('Data Structures'), ('Machine Learning')


SELECT * FROM courses;
select * from students;

create table student_courses (
	student_id INT references students(student_id) ON DELETE CASCADE, 
	course_id INT references courses(courses_id) ON DELETE CASCADE,
	PRIMARY KEY (student_id, course_id)
);

INSERT INTO student_courses (student_id, course_id) 
VALUES (1,2), (2,2), (3,1), (4,4), (5,3)

SELECT 
    c.courses_id,
    c.course_name,
    array_agg(sc.student_id) AS student_ids
FROM 
    courses c
LEFT JOIN 
    student_courses sc
ON 
    c.courses_id = sc.course_id
GROUP BY 
    c.courses_id, c.course_name;