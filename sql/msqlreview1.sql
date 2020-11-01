DROP DATABASE IF EXISTS Testing_System_Assignment_1;
CREATE DATABASE Testing_System_Assignment_1;
USE Testing_System_Assignment_1;


-- Table 1:Department
DROP TABLE IF EXISTS Department;
CREATE TABLE Department(
Department_ID       TINYINT UNSIGNED PRIMARY KEY,
Department_Name     VARCHAR(50)
);

-- Table 2: Position
DROP TABLE IF EXISTS `Position`;
CREATE TABLE `Position`(
Position_ID         TINYINT UNSIGNED PRIMARY KEY,
Department_Name     ENUM('dev', 'Test', 'Scrum Master','PM')

);

-- Table 3: Account
DROP TABLE IF EXISTS `Account`  ;
CREATE TABLE  `Account`(
Account_ID          TINYINT UNSIGNED  PRIMARY KEY,
Email               VARCHAR(50),
username            VARCHAR(50),
Department_ID       INT UNSIGNED,
Position_ID         TINYINT UNSIGNED,
CreateDate          DATETIME,
FOREIGN KEY(Department_ID) REFERENCES Department(Department_ID),
FOREIGN KEY(Position_ID) REFERENCES `Position`(Position_ID)
);

-- Table 4: Group
DROP TABLE IF EXISTS `Group` ;
CREATE TABLE `Group`(
Group_Name          VARCHAR(50),
Creator_ID          TINYINT UNSIGNED PRIMARY KEY,
Create_Date         DATETIME,
FOREIGN KEY(Creator_ID) REFERENCES `Account`( Account_ID)                         
);


-- Table 5: Groupaccount
DROP TABLE IF EXISTS Groupaccount ;
CREATE TABLE Groupaccount(
Group_ID            TINYINT UNSIGNED,
Account_ID          TINYINT UNSIGNED ,
Join_Date           DATE,
PRIMARY KEY(Group_ID,Account_ID),
FOREIGN KEY(Group_ID) REFERENCES `group`( Group_ID)   ,
FOREIGN KEY(Account_ID) REFERENCES `Account`( Account_ID)   
);


-- Table 6: TypeQuestion
DROP TABLE IF EXISTS  TypeQuestion;
CREATE TABLE TypeQuestion(
Type_ID             TINYINT PRIMARY KEY AUTO_INCREMENT,
Type_Name           ENUM('Essay', 'Multiple-Choice')          
);


-- Table 7:  CategoryQuestion
DROP TABLE IF EXISTS CategoryQuestion;
CREATE TABLE CategoryQuestion(
Category_ID         TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
Category_Name       ENUM('Java', 'NET', 'SQL', 'Postman', 'Ruby')

);

-- Table 8: Question 
DROP TABLE IF EXISTS Question;
CREATE TABLE Question(
Question_ID         TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
Content             VARCHAR(100),
Category_ID         TINYINT UNSIGNED,
Type_ID             TINYINT UNSIGNED NOT NULL,
Creator_ID          TINYINT UNSIGNED NOT NULL,
Create_Date         DATE,
FOREIGN KEY(Category_ID) REFERENCES CategoryQuestion (Category_ID),
FOREIGN KEY(Creator_ID) REFERENCES `Account`(Account_ID)
);

-- Table 10: Exam
DROP TABLE IF EXISTS Exam;
CREATE TABLE Exam(
Exam_ID             TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
`Code`              VARCHAR(50) NOT NULL,
Title               TEXT,
Category_ID         TINYINT UNSIGNED,
Duration            NVARCHAR(50),
Creator_ID          TINYINT UNSIGNED  NOT NULL,
Create_Date         DATE,
FOREIGN KEY(Creator_ID) REFERENCES `Account`(Account_ID  )

);

-- Table 11: ExamQuestion
DROP TABLE IF EXISTS ExamQuestion;
CREATE TABLE ExamQuestion(
Exam_ID             TINYINT UNSIGNED,
Question_ID         TINYINT UNSIGNED,
PRIMARY KEY(Exam_ID,Question_ID),
FOREIGN KEY(Question_ID ) REFERENCES Question(Question_ID ),
FOREIGN KEY(Exam_ID) REFERENCES Exam(Exam_ID)
);













