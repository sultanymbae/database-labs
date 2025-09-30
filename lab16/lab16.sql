select * from workers;
select * from departments;
select * from positions; 


BEGIN;

INSERT INTO workers (first_name, last_name, birth_date, hire_date, department_id, position_id)
VALUES ('Ivan', 'Kuznetsov', '1992-07-15', '2025-09-30', 1, 1);

INSERT INTO workers (first_namee, last_name) VALUES ('Error', 'Case');

ROLLBACK;


SELECT * FROM workers WHERE last_name = 'Kuznetsov';

