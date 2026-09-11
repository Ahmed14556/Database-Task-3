-- 1. Create a new database named "CompanyDB."
CREATE DATABASE CompanyDB
USE CompanyDB

-- 2. Create a schema named "Sales" within the "CompanyDB" database.
GO
CREATE SCHEMA sales
GO

CREATE SEQUENCE sales.employee_seq
AS INT 
START WITH 1
INCREMENT BY 1

-- 3. Create a table named "employees"
CREATE TABLE sales.employees(
employee_id INT DEFAULT (NEXT VALUE FOR sales.employee_seq),
first_name VARCHAR(20),
last_name VARCHAR(20),
salary DECIMAL(7,2)
)

-- 4. Alter the "employees" table to add a new column named "hire_date" with the data type DATE.
ALTER TABLE sales.employees
ADD hire_date DATE

-- 5. Add mock data to this table using Mockaroo.
-- Done 👍





