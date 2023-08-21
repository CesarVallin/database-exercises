USE employees;

-- Part One
-- Create a file named where_exercises.sql. Make sure to use the employees database before you begin.
-- Find all employees with first names 'Irena', 'Vidya', or 'Maya' — 709 rows (Hint: Use IN).
SELECT first_name
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya');

-- Find all employees whose last name starts with 'E' — 7,330 rows.
SELECT * FROM employees
WHERE last_name LIKE 'E%';

-- Find all employees with a 'q' in their last name — 1,873 rows.
SELECT * FROM employees
WHERE last_name LIKE '%q%';

-- Part Two
-- Update your query for 'Irena', 'Vidya', or 'Maya' to use OR instead of IN — 709 rows.
-- Add a condition to the previous query to find everybody with those names who is also male — 441 rows.
SELECT first_name, gender
FROM employees
WHERE (first_name = 'Irena' OR first_name = 'Vidya' OR first_name)
AND gender = 'M';

-- Find all employees whose last name starts or ends with 'E' — 30,723 rows.
SELECT last_name
FROM employees
WHERE last_name LIKE '%E';

-- Duplicate the previous query and update it to find all employees whose last name starts and ends with 'E' — 899 rows.
SELECT last_name
FROM employees
WHERE last_name LIKE '%E'
AND last_name LIKE 'E%';

-- Find all employees with a 'q' in their last name but not 'qu' — 547 rows.
SELECT last_name
FROM employees
WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%';
