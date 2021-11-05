CREATE DATABASE Testing_System_Assignment_1;
USE Testing_System_Assignment_1;

CREATE TABLE Department (
	DeparmentID INT,
	DeparmentName VARCHAR(50)
);

CREATE TABLE Position (
	PositionID INT,
	PositionName VARCHAR(50)
);

CREATE TABLE `Account` (
	AccountID INT,
	Email VARCHAR(50),
	Username VARCHAR(50),
	Fullname VARCHAR(50),
	DeparmentID INT,
	PositionID INT,
	CreateDate date
);

CREATE TABLE `Group` (
	GroupID INT,
	GroupName VARCHAR(50),
	CreatorID INT,
	CreateDate DATE
);

CREATE TABLE GroupAccount (
	GroupID INT,
	AccountID INT,
	JointDate DATE
);

CREATE TABLE TypeQuestion (
	TypeID INT,
	TypeName VARCHAR(50)
);

CREATE TABLE CategoryQuestion (
	CategoryID INT,
	CategoryName VARCHAR(50)
);

CREATE TABLE Question (
	QuestionID INT,
	Content VARCHAR(100),
	CategoryID INT,
	TypeID INT,
	CreatorID INT,
	CreateDate DATE
);

CREATE TABLE Answer (
	AnswerID INT,
	Content VARCHAR(100),
	QuestionID INT,
	isCorrect INT
);

CREATE TABLE Excam (
	ExamID INT,
	`Code` INT,
	Title VARCHAR(50),
	CategoryID INT,
	Duration VARCHAR(50), 
	CreatorID INT,
	CreateDate DATE 
);

CREATE TABLE ExamQuestion (
	ExamID INT,
	QuestionID INT
);




