USE employees;

-- Modify your first query to order by first name. The first result should be Irena Flexer and the last result should be Vidya Awdeh
SELECT CONCAT(first_name, ' ', last_name)
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name;

-- Update the query to order by first name and then last name. The first result should now be Irena Acton and the last should be Vidya Zweizig.
SELECT first_name, last_name
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY last_name;



-- Update your queries for employees whose names start and end with 'E'. Use concat() to combine their first and last name together as a single column in your results.
SELECT CONCAT(first_name, ' ', last_name) FROM employees
WHERE last_name LIKE 'E%'
ORDER BY emp_no;


-- Now reverse the sort order for both queries and compare results.
SELECT * FROM employees
WHERE last_name LIKE 'E%'
ORDER BY emp_no DESC;


-- Find all employees born on Christmas — 842 rows.
SHOW TABLES;
DESCRIBE employees;

SELECT *
FROM employees
WHERE MONTH(birth_date) = 12 AND DAY(birth_date) = 25;

-- Find all employees hired in the 90s and born on Christmas — 362 rows.
SELECT *
FROM employees
WHERE MONTH(birth_date) = 12 AND DAY(birth_date) = 25 AND YEAR(hire_date) = 1990;

-- Change the query for employees hired in the 90s and born on Christmas such that the first result is the oldest employee who was hired last. It should be Khun Bernini.
SELECT *
FROM employees
WHERE MONTH(birth_date) = 12 AND DAY(birth_date) = 25 AND YEAR(hire_date) LIKE '199%'
ORDER BY hire_date DESC, birth_date ASC;


-- For your query of employees born on Christmas and hired in the 90s, use datediff() to find how many days they have been working at the company (Hint: You might also need to use now() or curdate()).

SELECT
    DATEDIFF(CURDATE(), hire_date)
FROM employees
WHERE MONTH(birth_date) = 12 AND DAY(birth_date) = 25 AND YEAR(hire_date) = 1990;


