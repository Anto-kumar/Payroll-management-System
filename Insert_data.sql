INSERT INTO Users (User_Id, User_Name, E_mail, Password, Role) VALUES (1, 'Anto', 'anto@gmail.com', '1234', 'Admin');

INSERT INTO Users (User_Id, User_Name, E_mail, Password, Role) VALUES (2, 'Niloy', 'niloy@gmail.com', '1234', 'Manager');

INSERT INTO Users (User_Id, User_Name, E_mail, Password, Role) VALUES (3, 'Rahul', 'rahul@gmail.com', '1423', 'worker');

INSERT INTO Users (User_Id, User_Name, E_mail, Password, Role) VALUES (4, 'Raj', 'raj@gmail.com' , '1234', 'worker');



INSERT INTO Department (Dept_Id, Dept_Name) VALUES (1, 'HR');

INSERT INTO Department (Dept_Id, Dept_Name) VALUES (2, 'IT');

INSERT INTO Department (Dept_Id, Dept_Name) VALUES (3, 'Finance');

INSERT INTO Department (Dept_Id, Dept_Name) VALUES (4, 'Marketing');


INSERT INTO Grade (Grade_Id, Grade_Name, Basic_Salary, Grade_Bonus) VALUES (1, 'A', 5000, 1000);

INSERT INTO Grade (Grade_Id, Grade_Name, Basic_Salary, Grade_Bonus) VALUES (2, 'B', 4000, 800);

INSERT INTO Grade (Grade_Id, Grade_Name, Basic_Salary, Grade_Bonus) VALUES (3, 'C', 3000, 600);

INSERT INTO Grade (Grade_Id, Grade_Name, Basic_Salary, Grade_Bonus) VALUES (4, 'D', 2000, 400);



INSERT INTO Employee (Employee_Id, User_Id, Dept_Id, Grade_Id, Hire_Date)
VALUES (1, 1, 1, 1, TO_DATE('2024-04-15', 'YYYY-MM-DD'));

INSERT INTO Employee (Employee_Id, User_Id, Dept_Id, Grade_Id, Hire_Date)
VALUES (2, 2, 2, 2, TO_DATE('2024-05-5', 'YYYY-MM-DD'));

INSERT INTO Employee (Employee_Id, User_Id, Dept_Id, Grade_Id, Hire_Date)
VALUES (3, 3, 3, 3, TO_DATE('2023-01-15', 'YYYY-MM-DD'));

INSERT INTO Employee (Employee_Id, User_Id, Dept_Id, Grade_Id, Hire_Date)
VALUES (4, 4, 4, 1, TO_DATE('2023-01-15', 'YYYY-MM-DD'));



INSERT INTO Salary (Salary_Id, Employee_Id, Salary, Salary_Date)
VALUES (1, 2, 6000, TO_DATE('2024-04-30', 'YYYY-MM-DD'));

INSERT INTO Salary (Salary_Id, Employee_Id, Salary, Salary_Date)
VALUES (2, 1, 5000, TO_DATE('2024-05-31', 'YYYY-MM-DD'));

INSERT INTO Salary (Salary_Id, Employee_Id, Salary, Salary_Date)
VALUES (3, 3, 4000, TO_DATE('2024-01-31', 'YYYY-MM-DD'));

INSERT INTO Salary (Salary_Id, Employee_Id, Salary, Salary_Date)
VALUES (4, 4, 3000, TO_DATE('2024-01-31', 'YYYY-MM-DD'));
