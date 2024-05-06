-- Select all users
SELECT * FROM Users;

-- Select all departments
SELECT * FROM Department;

-- Select all grades
SELECT * FROM Grade;

-- Select all employees
SELECT * FROM Employee;

-- Select all salaries
SELECT * FROM Salary;

-- Select users with role 'Admin'
SELECT * FROM Users WHERE Role = 'Admin';

-- Select employees hired after a specific date
SELECT * FROM Employee WHERE Hire_Date > TO_DATE('2023-01-01', 'YYYY-MM-DD');

-- Select employees with a specific grade
SELECT * FROM Employee WHERE Grade_Id = 1;

-- Select employees in a specific department
SELECT * FROM Employee WHERE Dept_Id = 2;

-- Select employees with a salary greater than a specific amount
SELECT * FROM Employee e JOIN Salary s ON e.Employee_Id = s.Employee_Id WHERE s.Salary > 4000;

-- Update the role of a user
UPDATE Users SET Role = 'Manager' WHERE User_Id = 1;

-- Delete a user
DELETE FROM Users WHERE User_Id = 4;

-- Delete all employees in a specific department
DELETE FROM Employee WHERE Dept_Id = 3;


-- Inner Join
SELECT *
FROM Employee e
JOIN Users u ON e.User_Id = u.User_Id;

-- Left Join
SELECT *
FROM Employee e
LEFT JOIN Users u ON e.User_Id = u.User_Id;

-- Right Join
SELECT *
FROM Employee e
RIGHT JOIN Users u ON e.User_Id = u.User_Id;

-- Full Outer Join
SELECT *
FROM Employee e
FULL OUTER JOIN Users u ON e.User_Id = u.User_Id;

-- Cross Join
SELECT *
FROM Employee e
CROSS JOIN Users u;

-- Self Join
SELECT *
FROM Employee e1
JOIN Employee e2 ON e1.Employee_Id = e2.Employee_Id;

-- Multiple Join
SELECT *
FROM Employee e
JOIN Users u ON e.User_Id = u.User_Id
JOIN Department d ON e.Dept_Id = d.Dept_Id
JOIN Grade g ON e.Grade_Id = g.Grade_Id;



Question: Show the user name and email of all users in the system.
Answer:
SELECT User_Name, E_mail FROM Users;



Question: Show the department names.
Answer:
SELECT Dept_Name FROM Department;



Question: Display the names of all employees along with their hire dates.
Answer:
SELECT u.User_Name, e.Hire_Date
FROM Users u, Employee e
WHERE u.User_Id = e.User_Id;



Question: Retrieve the basic salary and grade bonus of all grades.
Answer:
SELECT Grade_Name, Basic_Salary, Grade_Bonus FROM Grade;



Question: Show the role of all users.
Answer:
SELECT Role FROM Users;



Question: Display the user name and email of users in the Finance department.
Answer:
SELECT u.User_Name, u.E_mail FROM Users u, Employee e, Department d WHERE u.User_Id = e.User_Id AND e.Dept_Id = d.Dept_Id AND d.Dept_Name = 'Finance';




Question: Retrieve the hire date of employees in the IT department.
Answer:
SELECT e.Hire_Date
FROM Employee e, Department d
WHERE e.Dept_Id = d.Dept_Id
AND d.Dept_Name = 'IT';


Question: Show the salary of all employees.
Answer:
SELECT s.Salary FROM Salary s, Employee e WHERE s.Employee_Id = e.Employee_Id;


Question: Display the department name of each employee.
Answer:
SELECT d.Dept_Name, FROM Department d, Employee e WHERE d.Dept_Id = e.Dept_Id;


Question: Retrieve the grade name of each employee.
Answer:
SELECT g.Grade_Name
FROM Grade g, Employee e
WHERE g.Grade_Id = e.Grade_Id;


Question: Retrieve the names of users who are both in the "IT" department and the "HR" department.
Answer:
(SELECT User_Name FROM Users u, Employee e, Department d WHERE u.User_Id = e.User_Id AND e.Dept_Id = d.Dept_Id AND d.Dept_Name = 'IT')
INTERSECT
(SELECT User_Name FROM Users u, Employee e, Department d WHERE u.User_Id = e.User_Id AND e.Dept_Id = d.Dept_Id AND d.Dept_Name = 'HR');


Question: Retrieve the user names of users whose email addresses end with '@gmail.com'.
Answer:
SELECT User_Name FROM Users WHERE E_mail LIKE '%@gmail.com';


Question: Use a WITH clause to select the names of users and their departments.
Answer:
WITH User_Department AS (
    SELECT u.User_Name, d.Dept_Name,g.Grade_Name
    FROM Users u, Employee e, Department d,Grade g
    WHERE u.User_Id = e.User_Id AND e.Dept_Id = d.Dept_Id AND e.Grade_Id = g.Grade_Id
)
SELECT * FROM User_Department;

WITH User_Department AS (
    SELECT u.User_Name, d.Dept_Name, s.Salary
    FROM Users u, Employee e, Department d,Salary s
    WHERE u.User_Id = e.User_Id AND e.Dept_Id = d.Dept_Id AND s.Employee_Id = e.Employee_Id
)
SELECT * FROM User_Department;



Question: What is the total number of employees in each department?
Answer:
SELECT d.Dept_Name, COUNT(e.Employee_Id) AS Total_Employees
FROM Department d, Employee e
WHERE d.Dept_Id = e.Dept_Id
GROUP BY d.Dept_Name;


Question: What is the highest salary among all employees?
Answer:
SELECT MAX(Salary) AS Highest_Salary FROM Salary;


Question: What is the average basic salary across all grades?
Answer:
SELECT AVG(Basic_Salary) AS Average_Basic_Salary FROM Grade;


Question: How many users have passwords longer than 8 characters?
Answer:
SELECT COUNT(*) AS Users_With_Long_Passwords
FROM Users
WHERE LENGTH(Password) > 8;


Question: What is the lowest grade bonus offered among all grades?
Answer:
SELECT MIN(Grade_Bonus) AS Lowest_Grade_Bonus FROM Grade


Question 1: Declare a variable named "emp_name" of type VARCHAR2(50) and assign it the value 'John Doe'. Then print the value of the variable.
Answer:


DECLARE
    emp_name VARCHAR2(50) := 'John Doe';
BEGIN
    DBMS_OUTPUT.PUT_LINE('Employee Name: ' || emp_name);
END;
Question 2: Insert a new record into the "Users" table with default values for all columns except "User_Name" which should be 'New User'.
Answer:


DECLARE
    new_user_id NUMBER;
BEGIN
    INSERT INTO Users(User_Name) VALUES ('New User') RETURNING User_Id INTO new_user_id;
    DBMS_OUTPUT.PUT_LINE('New User Id: ' || new_user_id);
END;
Question 3: Create a row type "emp_record" to represent an employee with fields for "Employee_Id", "User_Id", "Dept_Id", and "Grade_Id".
Answer:


DECLARE
    TYPE emp_record IS RECORD (
        Employee_Id Employee.Employee_Id%TYPE,
        User_Id Employee.User_Id%TYPE,
        Dept_Id Employee.Dept_Id%TYPE,
        Grade_Id Employee.Grade_Id%TYPE
    );
BEGIN
    emp_record emp_rec;
BEGIN
    emp_rec.Employee_Id := 1;
    emp_rec.User_Id := 1;
    emp_rec.Dept_Id := 1;
    emp_rec.Grade_Id := 1;

END;


Question 4: Create a cursor named "emp_cursor" to fetch all employees from the "Employee" table and count the number of rows fetched.
Answer:

DECLARE
    CURSOR emp_cursor IS SELECT * FROM Employee;
    emp_rec emp_cursor%ROWTYPE;
    emp_count NUMBER := 0;
BEGIN
    OPEN emp_cursor;
    LOOP
        FETCH emp_cursor INTO emp_rec;
        EXIT WHEN emp_cursor%NOTFOUND;
        emp_count := emp_count + 1;
    END LOOP;
    CLOSE emp_cursor;
    DBMS_OUTPUT.PUT_LINE('Total Employees: ' || emp_count);
END;


Question 5: Use a FOR LOOP to print the names of all users from the "Users" table.
Answer:
DECLARE
    user_name Users.User_Name%TYPE;
BEGIN
    FOR user_rec IN (SELECT User_Name FROM Users) LOOP
        DBMS_OUTPUT.PUT_LINE('User Name: ' || user_rec.User_Name);
    END LOOP;
END;


Question 6: Declare an array named "emp_ids" to store the employee IDs without using the extend() function.
Answer:
DECLARE
    TYPE emp_id_array IS TABLE OF Employee.Employee_Id%TYPE INDEX BY PLS_INTEGER;
    emp_ids emp_id_array;
BEGIN
    -- You need to manually assign values to the array elements.
END;


Question 7: Use an IF statement to check if a user with User_Id=3 exists in the "Users" table and print a message accordingly.
Answer:
DECLARE
    user_exists BOOLEAN;
BEGIN
    SELECT COUNT(*) INTO user_exists FROM Users WHERE User_Id = 3;
    IF user_exists THEN
        DBMS_OUTPUT.PUT_LINE('User with User_Id=3 exists.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('User with User_Id=3 does not exist.');
    END IF;
END;


Question 8: Create a procedure named "get_user_info" to fetch and display the details of a user given the User_Id.
Answer:
CREATE OR REPLACE PROCEDURE get_user_info (
    p_user_id IN Users.User_Id%TYPE
)
IS
    user_rec Users%ROWTYPE;
BEGIN
    SELECT * INTO user_rec FROM Users WHERE User_Id = p_user_id;
    DBMS_OUTPUT.PUT_LINE('User Name: ' || user_rec.User_Name);
    -- Print other details as needed.
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('User with User_Id=' || p_user_id || ' does not exist.');
END;


Question 9: Create a function named "calculate_bonus" to calculate the bonus amount for a given grade.
Answer:
CREATE OR REPLACE FUNCTION calculate_bonus (
    p_grade_id IN Grade.Grade_Id%TYPE
)
RETURN Grade.Grade_Bonus%TYPE
IS
    bonus_amount Grade.Grade_Bonus%TYPE;
BEGIN
    SELECT Grade_Bonus INTO bonus_amount FROM Grade WHERE Grade_Id = p_grade_id;
    RETURN bonus_amount;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL;
END;
