create table departments(
dep_Id int primary key,
dep_name varchar(30),
);
create table employeess (
emp_Id int primary key,
emp_name varchar(30),
emp_birthdate date,
emp_phoneNumber varchar(15),
emp_nationalID varchar(30),
emp_nationalities varchar(30),
emp_PersonalPhoto varbinary(MAX),
emp_EntryDate date,
emp_Password varchar(30),
dep_Id int,
foreign key (dep_Id) REFERENCES departments (dep_Id)
);
CREATE TABLE Tasks (
    task_ID INT PRIMARY KEY,
    task_Title VARCHAR(100),
     task_StartDate DATE,
     task_DueDate DATE,
    task_Description TEXT,
     task_ImportanceLevel INT,
    emp_Id INT,
    FOREIGN KEY (emp_Id) REFERENCES employeess(emp_Id)
);
CREATE TABLE employeessTasks (
    emptask_ID INT PRIMARY KEY,
    emp_Id INT,
	task_ID INT,
    Date DATE,
    Status VARCHAR(20),
    FOREIGN KEY (emp_Id) REFERENCES employeess(emp_Id),
    FOREIGN KEY (task_ID) REFERENCES Tasks(task_ID)
);

CREATE TABLE Manager (
    ManagerID INT PRIMARY KEY,
    ManagerName VARCHAR(50),
    ManagerPassword VARCHAR(50)
);

CREATE TABLE FeedBack (
    Feedback_ID INT PRIMARY KEY,
    SenderFName VARCHAR(35),
    SenderLName VARCHAR(35),
    SenderEmail VARCHAR(35),
    Feedback_Message TEXT,
	 ManagerID INT,
	 foreign key (ManagerID) references Manager(ManagerID)
);
INSERT INTO departments (dep_Id, dep_name)
VALUES (1, 'Sales'),
       (2, 'Marketing'),
       (3, 'IT');

INSERT INTO employeess (emp_Id, emp_name, emp_birthdate, emp_phoneNumber, emp_nationalID, emp_nationalities, emp_PersonalPhoto, emp_EntryDate, emp_Password, dep_Id)
VALUES (1, 'John Doe', '1990-01-15', '123456789', 'ABC123', 'USA', NULL, '2022-01-01', 'password123', 1),
       (2, 'Jane Smith', '1985-05-20', '987654321', 'XYZ456', 'Canada', NULL, '2022-02-01', 'securepass', 2),
       (3, 'Bob Johnson', '1995-09-10', '555666777', 'PQR789', 'UK', NULL, '2022-03-01', 'pass123', 1);

INSERT INTO Tasks (task_ID, task_Title, task_StartDate, task_DueDate, task_Description, task_ImportanceLevel, emp_Id)
VALUES (1, 'Complete Sales Report', '2023-01-15', '2023-02-01', 'Generate and analyze sales report', 3, 1),
       (2, 'Marketing Campaign', '2023-02-01', '2023-03-01', 'Plan and execute marketing campaign', 2, 2),
       (3, 'IT System Upgrade', '2023-03-15', '2023-04-01', 'Upgrade company IT systems', 4, 3);

INSERT INTO employeessTasks (emptask_ID, emp_Id, task_ID, Date, Status)
VALUES (1, 1, 1, '2023-01-20', 'In Progress'),
       (2, 2, 2, '2023-02-05', 'Completed'),
       (3, 3, 3, '2023-03-20', 'Pending');

	   INSERT INTO FeedBack (Feedback_ID, SenderFName, SenderLName, SenderEmail, Feedback_Message, ManagerID)
VALUES
    (1, 'John', 'Doe', 'john@example.com', 'Great work!', 1),
    (2, 'Jane', 'Smith', 'jane@example.com', 'Keep it up!', 1),
    (3, 'Bob', 'Johnson', 'bob@example.com', 'Interesting suggestions', 1);

INSERT INTO Manager (ManagerID, ManagerName, ManagerPassword)
VALUES (1, 'Manager1', 'managerpass123');

UPDATE employeess
SET emp_maritalStatus = 'Single'
WHERE emp_Id IN (1, 2);

UPDATE employeess
SET emp_maritalStatus = 'Married'
WHERE emp_Id = 3;


UPDATE employeess
SET dep_Id = 3
WHERE emp_Id = 3;



UPDATE Manager
SET ManagerName = 'Mohammad'
WHERE ManagerID = 1;

UPDATE Manager
SET ManagerPassword = 'Admin123'
WHERE ManagerID = 1;



SELECT * FROM departments;
SELECT * FROM employeess;
SELECT * FROM Tasks;
SELECT * FROM employeessTasks;
SELECT * FROM FeedBack;
SELECT * FROM Manager;





