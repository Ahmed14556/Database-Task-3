-- 1. Select all columns from the "employees" table.
SELECT *
FROM sales.employees

-- 2. Retrieve only the "first_name" and "last_name" columns from the "employees" table.
SELECT first_name , last_name
FROM sales.employees

-- 3. Retrieve "full name" as a one column from "first_name" and "last_name" columns from the "employees" table.
SELECT first_name + ' ' + last_name 'Full Name'
FROM sales.employees

-- 4. Show the average salary of all employees. (Use AVG() function)
SELECT AVG(salary) 'Average salary'
FROM sales.employees

-- 5. Select employees whose salary is greater than 50000.
SELECT *
FROM sales.employees
WHERE salary > 50000

-- 6. Retrieve employees hired in the year 2020.
SELECT *
FROM sales.employees
WHERE hire_date like '2020%'

SELECT *
FROM sales.employees
WHERE YEAR(hire_date) = 2020

-- 7. List employees whose last names start with 'S'.
SELECT *
FROM sales.employees
WHERE last_name like 's%'

-- 8. Display the top 10 highest-paid employees.
SELECT TOP(10) *
FROM sales.employees
ORDER BY salary DESC

-- 9. Find employees with salaries between 40000 and 60000.
SELECT *
FROM sales.employees
WHERE salary BETWEEN 40000 AND 60000
ORDER BY salary

-- 10. Show employees with names containing the substring 'man'.
SELECT *
FROM sales.employees
WHERE first_name + ' ' + last_name like '%man%'

-- 11. Display employees with a NULL value in the "hire_date" column.
SELECT *
FROM sales.employees
WHERE hire_date IS NULL

-- 12. Select employees with a salary in the set (40000, 45000, 50000).
SELECT *
FROM sales.employees
WHERE salary IN (40000 , 45000 , 50000)

-- 13. Retrieve employees hired between '2020-01-01' and '2021-01-01'.
SELECT *
FROM sales.employees
WHERE hire_date BETWEEN '2020-01-01' AND '2021-01-01'
ORDER BY hire_date

-- 14. List employees with salaries in descending order.
SELECT *
FROM sales.employees
ORDER BY salary DESC

-- 15. Show the first 5 employees ordered by "last_name" in ascending order.
SELECT TOP(5) *
FROM sales.employees
ORDER BY last_name

-- 16. Display employees with a salary greater than 55000 and hired in 2020.
SELECT *
FROM sales.employees
WHERE salary > 55000 AND YEAR(hire_date) = 2020

-- 17. Select employees whose first name is 'John' or 'Jane'.
SELECT *
FROM sales.employees
WHERE first_name = 'John' OR first_name = 'Jane'

-- 18. List employees with a salary ≤ 55000 and a hire date after '2022-01-01'.
SELECT *
FROM sales.employees
WHERE salary <= 55000 AND hire_date > '2022-01-01'

--19. Retrieve employees with a salary greater than the average salary.
SELECT *
FROM sales.employees
WHERE salary > (SELECT AVG(salary)
               FROM sales.employees)

-- 20. Display the 3rd to 7th highest-paid employees. (Use OFFSET and FETCH)
SELECT *
FROM sales.employees
ORDER BY salary DESC
OFFSET 2 ROWS
FETCH NEXT 5 ROWS ONLY

-- 21. List employees hired after '2021-01-01' in alphabetical order.
SELECT *
FROM sales.employees
WHERE hire_date > '2021-01-01'
ORDER BY first_name , last_name 

-- 22. Retrieve employees with a salary > 50000 and last name not starting with 'A'.
SELECT *
FROM sales.employees
WHERE salary > 50000 AND last_name LIKE '[B-Z]%' 
ORDER BY last_name

SELECT *
FROM sales.employees
WHERE salary > 50000 AND last_name NOT LIKE 'A%' 
ORDER BY last_name

-- 23. Display employees with a salary that is not NULL.
SELECT *
FROM sales.employees
WHERE salary IS NOT NULL

-- 24. Show employees with names containing 'e' or 'i' and a salary > 45000.
SELECT *
FROM sales.employees
WHERE salary > 45000 AND (first_name + ' ' + last_name LIKE '%e%' OR first_name + ' ' + last_name LIKE '%i%')

-- 25. Create a new table named "departments"
ALTER TABLE sales.employees
ALTER COLUMN employee_id INT NOT NULL

ALTER TABLE sales.employees
ADD PRIMARY KEY (employee_id)
CREATE TABLE sales.departments(
departments_id INT PRIMARY KEY,
departments_name VARCHAR(30),
manager_id INT REFERENCES sales.employees (employee_id)
)

-- Assign each employee to a department by creating a "department_id" column in "employees" and making it a foreign key referencing "departments".department_id.
ALTER TABLE sales.employees
ADD department_id INT REFERENCES sales.departments (departments_id)

-- 27. Retrieve all employees with their department names (Use INNER JOIN).
SELECT e.* , d.departments_name
FROM sales.employees e 
INNER JOIN sales.departments d
ON e.department_id = d.departments_id

-- 28. Retrieve employees who don’t belong to any department (Use LEFT JOIN and check for NULL).
SELECT e.*
FROM sales.employees e 
LEFT JOIN sales.departments d
ON e.department_id = d.departments_id
WHERE d.departments_id IS NULL

-- 29. Show all departments and their employee count (Use JOIN and GROUP BY).
SELECT d.departments_name, COUNT(e.employee_id) AS employee_count
FROM sales.departments d
LEFT JOIN sales.employees e
ON d.departments_id = e.department_id
GROUP BY d.departments_name;

-- 30. Retrieve the highest-paid employee in each department (Use JOIN and MAX(salary)).
SELECT d.departments_name, MAX(salary) AS highest_salary
FROM sales.departments d
INNER JOIN sales.employees e
ON d.departments_id = e.department_id
GROUP BY d.departments_name;







