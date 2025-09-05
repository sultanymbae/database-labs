select * from best_students;
insert into students (name, email, faculty) values ('sultan', 'sultan@example.com', 'sfw-123')
insert into students (name, email, faculty) values ('yatoro', 'yatoro@example.com', 'las-123')
insert into students (name, email, faculty) values ('collapse', 'collaspse@example.com', 'ibl-124')
select name, email from  students;

ALTER TABlE students
ADD COLUMN date_of_birth DATE; 
ALTER TABLE students
RENAME COLUMN email TO email_address; 
ALTER TABLE students
RENAME TO best_students;
