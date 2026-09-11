-- Part 1
CREATE TABLE Employees (
    Id INT IDENTITY PRIMARY KEY,
    FirstName VARCHAR(20),
    LastName VARCHAR(20),
    Salary DECIMAL(10,2)
)

GO
CREATE PROCEDURE GetAllEmployees
AS
BEGIN
    SELECT *
    FROM Employees
END
EXEC GetAllEmployees

GO
CREATE PROCEDURE GetHighSalaryEmployees ( @MinSalary AS DECIMAL(10,2) )
AS
BEGIN
    SELECT *
    FROM Employees
    WHERE Salary > @MinSalary
END
EXEC GetHighSalaryEmployees 50000

GO
CREATE PROCEDURE ADDEmployee (@first_name AS VARCHAR(20) , @last_name AS VARCHAR(20) , @salary AS DECIMAL(10,2))
AS BEGIN
INSERT INTO Employees (FirstName , LastName , Salary) 
       VALUES (@first_name , @last_name , @salary)
END
EXEC ADDEmployee 'Ahmed' , 'Ghoniem' , '50000'



-- Part 2
CREATE TABLE employee_log(
id INT IDENTITY PRIMARY KEY,
employee_id INT,
[action] VARCHAR(20),
action_date DATETIME2
)

GO
CREATE TRIGGER trg_Employee_Insert
ON Employees
AFTER INSERT
AS
BEGIN
    INSERT INTO employee_log (employee_id, [action], action_date)
    SELECT Id, 'INSERT', GETDATE()
    FROM inserted;
END



