use assignment1;

-- Stage 1: create table
create table employees(
emp_id int primary key,
emp_name  varchar(100) NOT NULL,
email varchar(100) UNIQUE NOT NULL,
department varchar(50) NOT NULL,
job_role varchar(50) not null,
salary decimal(10,2) check(salary>0),
age int check(age>=18),
city varchar(50) DEFAULT 'Unknown'
);

-- Stage 2: insert valuues
INSERT INTO employees VALUES
(1, 'Sai', 'sai@company.com', 'IT', 'Software Engineer', 60000, 25, 'Hyderabad'),
(2, 'siri', 'siri@company.com', 'HR', 'HR Manager', 55000, 32, 'Bangalore'),
(3, 'Kishore', 'kishore@company.com', 'Finance', 'Accountant', 70000, 40, 'Delhi'),
(4, 'Somesh', 'somesh@company.com', 'Marketing', 'Marketing Executive', 45000, 28, 'Chennai'),
(5, 'Joshna', 'joshna@company.com', 'IT', 'System Analyst', 60000, 30, 'Hyderabad'),
(6, 'Hari', 'hari@company.com', 'HR', 'Recruiter', 48000, 26, 'Bangalore'),
(7, 'Shalini', 'shalini@company.com', 'Finance', 'Financial Analyst', 72000, 35, 'Delhi'),
(8, 'Neeharika', 'neeharika@company.com', 'Marketing', 'Content Strategist', 46000, 29, 'Chennai'),
(9, 'Sravya', 'sravya@company.com', 'IT', 'DevOps Engineer', 65000, 33, 'Hyderabad'),
(10, 'Hasini', 'hasini@company.com', 'HR', 'HR Assistant', 42000, 24, 'Bangalore'),
(11, 'Prasad', 'prasad@company.com', 'Finance', 'Auditor', 70000, 38, 'Delhi'),
(12, 'Loki', 'loki@company.com', 'Marketing', 'SEO Specialist', 47000, 27, 'Chennai'),
(13, 'Chandra', 'chandra@company.com', 'IT', 'Project Manager', 80000, 41, 'Hyderabad'),
(14, 'Siva', 'siva@company.com', 'HR', 'Training Coordinator', 50000, 29, 'Bangalore'),
(15, 'Lohitha', 'lohitha@company.com', 'Finance', 'Treasury Officer', 72000, 36, 'Delhi'),
(16, 'Harsha', 'harsha@company.com', 'Marketing', 'Brand Manager', 55000, 34, 'Chennai'),
(17, 'Nani', 'nani@company.com', 'IT', 'Database Admin', 60000, 31, 'Hyderabad'),
(18, 'Nandu', 'nandu@company.com', 'HR', 'Compensation Analyst', 48000, 28, 'Bangalore'),
(19, 'Devi', 'devi@company.com', 'Finance', 'Investment Advisor', 75000, 42, NULL), -- NULL city
(20, 'Priya', 'priya@company.com', 'Marketing', 'Social Media Manager', 46000, 27, 'Chennai');

-- Stage 3 Display all employee records. 
select * from employees;

-- Display specific columns such as: Employee name,Department,Salary, City 
SELECT emp_name, department, salary, city
FROM employees;

-- Retrieve employees based on specific conditions using SELECT.

SELECT emp_name, department, salary, city
FROM employees
WHERE department = 'IT';

SELECT emp_name, department, salary, city
FROM employees
WHERE salary > 60000;

-- Stage 4: WHERE and Comparison Operators
SELECT * FROM employees
WHERE salary = 60000;

SELECT * FROM employees
WHERE salary > 70000;

SELECT * FROM employees
WHERE age < 30;

SELECT * FROM employees
WHERE salary >= 72000;

SELECT * FROM employees
WHERE age <= 28;


SELECT * FROM employees
WHERE department != 'IT';

SELECT * FROM employees
WHERE department <> 'HR';

-- Stage 5: Logical Operators
SELECT * FROM employees
WHERE department = 'IT' AND salary > 60000;

SELECT * FROM employees
WHERE department = 'HR' OR department = 'Finance';

SELECT * FROM employees
WHERE department <> 'Marketing';

-- Stage 6: Special Operators
SELECT * FROM employees
WHERE salary BETWEEN 50000 AND 70000;

SELECT * FROM employees
WHERE city IN ('Hyderabad', 'Bangalore');

SELECT * FROM employees
WHERE department NOT IN ('Marketing', 'IT');

SELECT * FROM employees
WHERE emp_name LIKE 'n%';

SELECT * FROM employees
WHERE emp_name LIKE '%i';

SELECT * FROM employees
WHERE emp_name LIKE '%an%';

SELECT * FROM employees
WHERE city IS NULL;

SELECT * FROM employees
WHERE city IS NOT NULL;


-- Stage 7: ORDER BY

SELECT * FROM employees
ORDER BY salary ASC;

SELECT * FROM employees
ORDER BY salary DESC;

SELECT * FROM employees
ORDER BY age ASC;

SELECT * FROM employees
ORDER BY department ASC;

SELECT * FROM employees
ORDER BY department ASC, salary DESC;

-- Stage 8:Aggregation functions
SELECT COUNT(*) AS total_employees
FROM employees;

SELECT SUM(salary) AS total_salary
FROM employees;

SELECT AVG(salary) AS average_salary
FROM employees;

SELECT MIN(salary) AS lowest_salary
FROM employees;

SELECT  MAX(salary) AS highest_salary
FROM employees;

-- Stage 9 : Group by
SELECT department, COUNT(*) AS employee_count
FROM employees
GROUP BY department;


SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department;


SELECT department, MIN(salary) AS min_salary
FROM employees
GROUP BY department;

SELECT department, MAX(salary) AS max_salary
FROM employees
GROUP BY department;

SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department;

SELECT city, COUNT(*) AS employee_count
FROM employees
GROUP BY city;

SELECT city, AVG(salary) AS avg_salary
FROM employees
GROUP BY city;

SELECT city, MAX(salary) AS max_salary
FROM employees
GROUP BY city;

-- Stage 10: HAVING

SELECT department, COUNT(*) AS employee_count
FROM employees
GROUP BY department
HAVING COUNT(*) > 4;

SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department
HAVING AVG(salary) > 65000;

SELECT department, MAX(salary) AS max_salary
FROM employees
GROUP BY department
HAVING MAX(salary) > 75000;

-- stage 11: challenging Queries:
SELECT MAX(salary) AS second_highest_salary
FROM employees
WHERE salary < (SELECT MAX(salary) FROM employees);

SELECT *
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

SELECT *
FROM employees
WHERE salary = (SELECT MAX(salary) FROM employees);

SELECT *
FROM employees
WHERE salary = (SELECT MIN(salary) FROM employees);

SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department
ORDER BY avg_salary DESC
LIMIT 1;

SELECT department, COUNT(*) AS employee_count
FROM employees
GROUP BY department
ORDER BY employee_count DESC
LIMIT 1;

SELECT * FROM employees e
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
    WHERE department = e.department
);

SELECT department, MAX(salary) AS second_highest_salary
FROM employees e
WHERE salary < (
    SELECT MAX(salary)
    FROM employees
    WHERE department = e.department
)
GROUP BY department;

SELECT city, COUNT(*) AS employee_count
FROM employees
GROUP BY city
ORDER BY employee_count DESC
LIMIT 1;

SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department
HAVING SUM(salary) > 200000;

