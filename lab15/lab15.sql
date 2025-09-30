select * from workers;
select * from departments;
select * from positions; 


SELECT w.first_name, w.last_name, p.position_name, p.salary
FROM workers w
JOIN positions p ON w.position_id = p.position_id;

SELECT AVG(p.salary) AS avg_salary
FROM workers w
JOIN positions p ON w.position_id = p.position_id;

SELECT MAX(p.salary) AS max_salary, MIN(p.salary) AS min_salary
FROM positions p;


CREATE TABLE departments (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL
);

CREATE TABLE positions (
    position_id SERIAL PRIMARY KEY,
    position_name VARCHAR(100) NOT NULL,
    salary NUMERIC(10,2) NOT NULL
);


CREATE TABLE workers (
    worker_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    birth_date DATE NOT NULL,
    hire_date DATE NOT NULL,
    department_id INT REFERENCES departments(department_id),
    position_id INT REFERENCES positions(position_id)
);


INSERT INTO departments (department_name) VALUES
('IT'),
('HR'),
('Finance'),
('Marketing');


INSERT INTO positions (position_name, salary) VALUES
('Software Engineer', 1200.00),
('HR Manager', 1000.00),
('Accountant', 950.00),
('Marketing Specialist', 1100.00);


INSERT INTO workers (first_name, last_name, birth_date, hire_date, department_id, position_id) VALUES
('Alex', 'Petrov', '1995-04-12', '2022-01-15', 1, 1),
('Maria', 'Ivanova', '1990-09-23', '2021-06-01', 2, 2),
('Dmitry', 'Sokolov', '1988-11-05', '2020-03-20', 3, 3),
('Elena', 'Smirnova', '1998-02-17', '2023-07-10', 4, 4),
('Sultan', 'Nurbekov', '2005-05-14', '2024-02-01', 1, 1);
