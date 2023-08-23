USE employees;

-- Find all the employees with the same hire date as employee 101010 using a subquery. 69 rows

SELECT *
FROM employees
WHERE employees.hire_date IN (
    SELECT employees.hire_date
    FROM employees
    WHERE employees.emp_no = '101010'
    )
;

-- Find all the titles held by all employees with the first name Aamod. 314 total titles, 6 unique titles

SELECT titles.title
FROM titles
WHERE titles.emp_no IN (
    SELECT emp_no
    FROM employees
    WHERE employees.first_name = 'Aamod'
    )
;

-- Find all the current department managers that are female.
SELECT first_name, last_name
FROM employees
WHERE employees.emp_no IN (
    SELECT emp_no
    FROM dept_manager
    WHERE employees.gender = 'F'
    AND dept_manager.to_date = '9999-01-01'
    )
;

-- BONUS
-- Find all the department names that currently have female managers.
SELECT dept_name
FROM departments
WHERE departments.dept_no IN (
    SELECT dept_no
    FROM dept_manager
    WHERE to_date = '9999-01-01'
    AND dept_manager.emp_no IN (
        SELECT emp_no
        FROM employees
        WHERE employees.gender = 'F'
        )
    )
ORDER BY dept_name
;

-- Find the first and last name of the employee with the highest salary.
SELECT first_name, last_name
FROM employees
WHERE employees.emp_no IN (
    SELECT emp_no
    FROM salaries
    WHERE to_date = '9999-01-01'
    AND salaries.emp_no IN (
        SELECT emp_no
        FROM salaries
        WHERE salary = (SELECT MAX(salary))
        )
    )
;