CREATE DATABASE testing_system_assignment2;
CREATE TABLE	Department(
DepartmentID 	VARCHAR(50),
DeparmentName	VARCHAR(50)
);

CREATE TABLE	Posi_tion(
PositionID		VARCHAR(50),
PositionName	VARCHAR(50)
);


CREATE TABLE	Account(
Email			VARCHAR(50),
Username		VARCHAR(50),
Fullname		VARCHAR(50),
DepartmentID	VARCHAR(50),
PositionID		VARCHAR(50),
CreateDate		DATE
);

CREATE TABLE	Gr_oup(
GROUPID			VARCHAR(50),
AccountID		VARCHAR(50),
JoinDate		DATE
);


CREATE TABLE	TypeQuestion(
TypeID			VARCHAR(50),
TypeName		VARCHAR(50)
);

CREATE TABLE	CategoryQuestion(
CategoryID		VARCHAR(50),
CategoryName	VARCHAR(50)
);

CREATE TABLE	Question(
QuestionID		VARCHAR(50),
Content			VARCHAR(50),
CategoryID		VARCHAR(50),
TypeID			VARCHAR(50),
GreatorID		VARCHAR(50),
GreateDate		DATE
);

CREATE TABLE    AnswerID(
AnswerID      	VARCHAR(50),
Content			VARCHAR(50),
QuestionID 		VARCHAR(50),
IsCorrect		VARCHAR
);



CREATE TABLE	ExamID(
ExamID			VARCHAR(50),
Code			INT,
Title			VARCHAR(50),
CategoryID		VARCHAR(50),
Duration		VARCHAR(50),
CreatorID 		VARCHAR(50),
CreateDate		INT
);


 CREATE TABLE	ExamQuestion(
 ExamID			VARCHAR(50),
 QuestionID		VARCHAR(50)
 );











	


