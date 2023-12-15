CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    Username VARCHAR(255) NOT NULL,
    FullName VARCHAR(255),
    Email VARCHAR(255),
    PhoneNumber VARCHAR(20)
);

CREATE TABLE Messagess (
    MessageID INT PRIMARY KEY,
    SenderID INT,
    ReceiverID INT,
    MessageText TEXT,
    InDtTs DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (SenderID) REFERENCES Users(UserID),
    FOREIGN KEY (ReceiverID) REFERENCES Users(UserID)
);

CREATE TABLE Servicess (
    ServiceID INT PRIMARY KEY,
    ServiceName VARCHAR(255) NOT NULL,
    Description TEXT,
    Price DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY,
    UserID INT,
    ServiceID INT,
    Amount DECIMAL(10, 2) NOT NULL,
    PaymentDate DATE,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (ServiceID) REFERENCES Servicess(ServiceID)
);


CREATE TABLE UserServices (
    UserID INT,
    ServiceID INT,
    PRIMARY KEY (UserID, ServiceID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (ServiceID) REFERENCES Servicess(ServiceID)
);


INSERT INTO Users (UserID, Username, FullName, Email, PhoneNumber)
VALUES (1, 'yousef', 'yousef aldeeb', 'yousef@email.com', '123-456-7890'),
       (2, 'mohammad', 'mohammad aldeeb', 'mohammad@email.com', '987-654-3210'),
       (3, 'ahmad', 'ahmad aldeeb', 'ahmad@email.com', '555-123-4567');

INSERT INTO Messagess (MessageID, SenderID, ReceiverID, MessageText,InDtTs)
VALUES (1, 1, 2, 'Hello mohammad aldeeb!',CURRENT_TIMESTAMP),
       (2, 2, 1, 'Hi yousef aldeeb!',CURRENT_TIMESTAMP),
       (3, 1, 3, 'Greetings ahmad aldeeb!',CURRENT_TIMESTAMP);

INSERT INTO Servicess (ServiceID, ServiceName, Description, Price)
VALUES (1, 'Basic Messaging', 'Text messaging service', 9.99),
       (2, 'Premium Messaging', 'Enhanced messaging features', 19.99),
       (3, 'File Sharing', 'Send and receive files', 14.99);

INSERT INTO Payments (PaymentID, UserID, ServiceID, Amount, PaymentDate)
VALUES (1, 1, 1, 9.99, '2023-01-01'),
       (2, 2, 2, 19.99, '2023-02-01'),
       (3, 3, 3, 14.99, '2023-03-01');

INSERT INTO UserServices (UserID, ServiceID)
VALUES (1, 1),
       (2, 2),
       (3, 3);


UPDATE Users SET PhoneNumber = '111-222-3333' WHERE UserID = 1;

UPDATE Messagess SET MessageText = 'Updated message text.' WHERE MessageID = 1;

UPDATE Servicess SET Price = 24.99 WHERE ServiceID = 3;

UPDATE Payments SET Amount = 29.99 WHERE PaymentID = 1;

UPDATE UserServices SET ServiceID = 2 WHERE UserID = 1;

DELETE FROM Users WHERE UserID = 1;

DELETE FROM Messagess WHERE MessageID = 2;

DELETE FROM Servicess WHERE ServiceID = 1;

DELETE FROM Payments WHERE PaymentID = 3;

DELETE FROM UserServices WHERE UserID = 3;


exec sp_rename 'Messagess', 'conversations';

ALTER TABLE Users
ADD updatedClmnwithtype varchar(100);

update Users
set updatedclmnwithtype = Username
where UserID  in (1,2,3);

ALTER TABLE Users
DROP COLUMN Username;
--------------------------------------------
ALTER TABLE conversations
ADD updatedClmnwithtype varchar(100);

update conversations
set updatedclmnwithtype = MessageText
where MessageID  in (1,2,3);

ALTER TABLE conversations
DROP COLUMN MessageText;

EXEC sp_rename 'Users.NewColumnName', 'RenamedColumnName', 'COLUMN';


	select * from Users;
	select * from Conversations;
	select * from Servicess;
	select * from Payments;
	select * from UserServices;

