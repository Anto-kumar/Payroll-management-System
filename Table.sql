-- Create table Users
CREATE TABLE Users (
    User_Id NUMBER PRIMARY KEY,
    User_Name VARCHAR2(30),
    E_mail VARCHAR2(20),
    Password VARCHAR2(10),
    Role VARCHAR2(20)
);


-- Create table Department
CREATE TABLE Department (
    Dept_Id NUMBER PRIMARY KEY,
    Dept_Name VARCHAR2(30)
);

-- Create table Grade
CREATE TABLE Grade (
    Grade_Id NUMBER PRIMARY KEY,
    Grade_Name VARCHAR2(20),
    Basic_Salary NUMBER,
    Grade_Bonus NUMBER
);

-- Create table Employee

CREATE TABLE Employee (
    Employee_Id NUMBER PRIMARY KEY,
    User_Id NUMBER,
    Dept_Id NUMBER,
    Grade_Id NUMBER,
    Hire_Date DATE,
    FOREIGN KEY (User_Id) REFERENCES Users(User_Id),
    FOREIGN KEY (Dept_Id) REFERENCES Department(Dept_Id),
    FOREIGN KEY (Grade_Id) REFERENCES Grade(Grade_Id)
);

-- Create table Salary
CREATE TABLE Salary (
    Salary_Id NUMBER PRIMARY KEY,
    Employee_Id NUMBER,
    Salary NUMBER,
    Salary_Date DATE,
    FOREIGN KEY (Employee_Id) REFERENCES Employee(Employee_Id)
);
