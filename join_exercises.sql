USE employees;
DESCRIBE employees;
SHOW TABLES;

-- Using the example in the Associative Table Joins section as a guide, write a query that shows each department along with the name of the current manager for that department.

-- First line you are selecting and declaring what you want on your table.
SELECT departments.dept_name AS "Department Name", CONCAT(employees.first_name, ' ', employees.last_name) AS "Department Manager"
FROM departments
    JOIN dept_manager
        ON departments.dept_no = dept_manager.dept_no
    JOIN employees
        ON dept_manager.emp_no = employees.emp_no
WHERE dept_manager.to_date = '9999-01-01'
ORDER BY departments.dept_name
;

-- Find the name of all departments currently managed by women.
SELECT departments.dept_name AS "Department Name", CONCAT(employees.first_name, employees.last_name) AS "Department Manager"
FROM departments
    JOIN dept_manager
        ON departments.dept_no = dept_manager.dept_no
    JOIN employees
        ON dept_manager.emp_no = employees.emp_no
WHERE dept_manager.to_date = '9999-01-01'
AND employees.gender = 'F'
;

-- Find the current titles of employees currently working in the Customer Service department.
SELECT titles.title AS Title, COUNT(*) AS Total
FROM titles
    JOIN employees
        ON titles.emp_no = employees.emp_no
    JOIN dept_emp
        ON employees.emp_no = dept_emp.emp_no
    JOIN departments
        ON dept_emp.dept_no = departments.dept_no
WHERE dept_emp.dept_no = 'd009'
AND titles.to_date = '9999-01-01'
AND dept_emp.to_date = '9999-01-01'
GROUP BY titles.title
;





