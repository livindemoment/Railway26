DROP DATABASE IF EXISTS Testing_System_Assignment_1;
CREATE DATABASE Testing_System_Assignment_1;
USE Testing_System_Assignment_1;

CREATE TABLE Department (
	DepartmentID TINYINT UNSIGNED auto_increment PRIMARY KEY,
	DepartmentName VARCHAR(20) UNIQUE KEY
);

CREATE TABLE Position (
	PositionID TINYINT UNSIGNED auto_increment PRIMARY KEY,
	PositionName VARCHAR(20) UNIQUE KEY
);

CREATE TABLE `Account` (
	AccountID SMALLINT UNSIGNED auto_increment PRIMARY KEY,
	Email VARCHAR(30),
	Username VARCHAR(20),
	Fullname VARCHAR(30),
    DepartmentID TINYINT UNSIGNED,
    PositionID TINYINT UNSIGNED,
	CreateDate DATE,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID),
	FOREIGN KEY (PositionID) REFERENCES Position (PositionID)
);

CREATE TABLE `Group` (
	GroupID TINYINT UNSIGNED auto_increment PRIMARY KEY,
	GroupName VARCHAR(20),
	CreatorID SMALLINT UNSIGNED,
    CreateDate DATE,
    FOREIGN KEY (CreatorID) REFERENCES `Account` (AccountID)
);

CREATE TABLE GroupAccount (
	GroupID TINYINT UNSIGNED,
    AccountID SMALLINT UNSIGNED,
	JointDate DATE,
    FOREIGN KEY (GroupID) REFERENCES  `Group`(GroupID),
	FOREIGN KEY (AccountID) REFERENCES `Account`(AccountID)
);

CREATE TABLE TypeQuestion (
	TypeID TINYINT UNSIGNED auto_increment PRIMARY KEY,
	TypeName VARCHAR(20)
);

CREATE TABLE CategoryQuestion (
	CategoryID TINYINT UNSIGNED auto_increment PRIMARY KEY,
	CategoryName VARCHAR(20)
);

CREATE TABLE Question (
	QuestionID SMALLINT UNSIGNED auto_increment PRIMARY KEY,
	Content VARCHAR(100),
	CategoryID TINYINT UNSIGNED,
    TypeID TINYINT UNSIGNED,
    CreatorID SMALLINT UNSIGNED,
    CreateDate DATE,
    FOREIGN KEY (CategoryID) REFERENCES CategoryQuestion (CategoryID),
	FOREIGN KEY (TypeID) REFERENCES TypeQuestion (TypeID),
    FOREIGN KEY (CreatorID) REFERENCES `Account`(AccountID)
	
);

CREATE TABLE Answer (
	AnswerID TINYINT UNSIGNED auto_increment PRIMARY KEY,
	Content VARCHAR(500),
	QuestionID SMALLINT UNSIGNED,
    isCorrect ENUM ("True","False"),
    FOREIGN KEY (QuestionID) REFERENCES Question (QuestionID)
);

CREATE TABLE Exam (
	ExamID TINYINT UNSIGNED auto_increment primary key,
	`Code` TINYINT UNSIGNED,
	Title VARCHAR(50),
	CategoryID TINYINT UNSIGNED,
    Duration TIME, 
	CreatorID SMALLINT UNSIGNED,
    CreateDate DATE,
    FOREIGN KEY (CategoryID) REFERENCES CategoryQuestion (CategoryID),
    FOREIGN KEY (CreatorID) REFERENCES `Account`(AccountID)
   	
);

CREATE TABLE ExamQuestion (
	ExamID TINYINT UNSIGNED,
    QuestionID smallint UNSIGNED,
    FOREIGN KEY (ExamID) REFERENCES Exam (ExamID),
    FOREIGN KEY (QuestionID) REFERENCES Question (QuestionID)
);




