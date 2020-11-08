DROP DATABASE IF EXISTS Testing_System_Assignment_4;
CREATE DATABASE Testing_System_Assignment_4;
USE Testing_System_Assignment_4;


-- Table 1:Department
DROP TABLE IF EXISTS Department;
CREATE TABLE Department(
Department_ID       TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
Department_Name     VARCHAR(50) NOT NULL UNIQUE KEY
);

-- Table 2: Position
DROP TABLE IF EXISTS `Position`;
CREATE TABLE `Position`(
Position_ID         TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
Position_Name     ENUM('dev', 'Test', 'Scrum Master','PM')

);

-- Table 3: Account
DROP TABLE IF EXISTS `Account`  ;
CREATE TABLE  `Account`(
Account_ID          TINYINT UNSIGNED  PRIMARY KEY AUTO_INCREMENT,
Full_Name            VARCHAR(50),
Email               VARCHAR(50),
username            VARCHAR(50),
Department_ID       TINYINT UNSIGNED,
Position_ID         TINYINT UNSIGNED,
CreateDate          DATE,
FOREIGN KEY(Department_ID) REFERENCES Department(Department_ID)
);
-- Table 4: Group
DROP TABLE IF EXISTS `Group` ;
CREATE TABLE `Group`(
Group_ID            TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
Group_Name          VARCHAR(50),
Creator_ID          TINYINT UNSIGNED ,
Create_Date         DATETIME DEFAULT NOW(),
FOREIGN KEY(Creator_ID) REFERENCES `Account`( Account_ID)                         
);


-- Table 5: Groupaccount
DROP TABLE IF EXISTS Groupaccount ;
CREATE TABLE Groupaccount(
Group_ID            TINYINT UNSIGNED ,
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
Category_Name       VARCHAR(50) NOT NULL UNIQUE KEY

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

-- tablle 9: answers
DROP TABLE IF EXISTS answers;
CREATE TABLE answers(
Answer_ID           TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Content             VARCHAR(100),
Question_ID         TINYINT UNSIGNED NOT NULL,
isCorrect           BIT DEFAULT 1,
FOREIGN KEY(Question_ID) REFERENCES Question(Question_ID )
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

-- thêm 10 phòng ban vào department
INSERT INTO Department(Department_Name ) 
VALUES
        (' nhân sự'),
        (' hành chính'),
        (' kinh doanh'),
        ('masketing'),
        (' quản lý mentor'),
        (' thi công'),
        (' giám sát'),
        ('nghiệm thư'),
        ('kiểm thử'),
        ('sale');

-- thêm 10 reccord vào Position ---
INSERT INTO `Position`(Position_Name)
VALUES
        ('dev'),
        ('Test'),
        ('Scrum Master'),
        ('PM');

-- thêm vào  `Account`       
INSERT INTO `Account`   (     Email ,               username ,     Department_ID    ,   Full_Name ,                     Position_ID,          CreateDate   )
VALUES                  ('tantran@gmail.com',       'trantan' ,         '1'         ,    'trần quốc tấn' ,          '1'         ,           '1999/01/01'     ),
                        ('nguyentrung@gmail.com' ,  'nguyentrung' ,     '2'         ,    'nguyễn thành trung' ,     '2'         ,           '1999/01/01'     ),          
                        ('nguyendat@gmail.com' ,    'nguyendat' ,       '3'         ,    'nguyễn thành đạt',        '3'         ,           '1999/01/01'     ),                                      
                        ('behieu@gmail.com' ,       'behieu'    ,       '4'         ,    ' hiếu híu' ,              '4'         ,           '1999/01/01'     ),           
                        ('bexinh@gmail.com' ,       'bexinh'    ,       '5'         ,    'bé xinh' ,                '5'         ,           '1999/01/01'     ),
                        ('bedep@gmail.com'  ,       'bedep'     ,       '6'         ,    'bé đẹp',                  '6'         ,           '1999/01/01'     ),
                        ('bekhoe@gmail.com' ,       'bekhoe'     ,      '7'         ,    'bé khỏe' ,                '7'         ,           '1999/01/01'     ),
                        ('behu@gmail.com'   ,       'behu'      ,       '8'         ,    'bé hư' ,                  '8'         ,           '1999/01/01'     ),
                        ('bengu@gmail.com'  ,       'bengu'     ,       '9'         ,    'bé ngu' ,                 '9'         ,           '1999/01/01'     ),
                        ('beteo@gmail.com'  ,       'beteo'     ,       '10'        ,    'bé tẹo' ,                 '10'        ,           '1999/01/01'    );        
        
-- thêm vào dữ liệu  Group
INSERT INTO `Group`     (   Group_Name  ,        Creator_ID ,    Create_Date   )
VALUES                  ('deverlop'     ,           '1'     ,   '1999/01/01'      ),
                        ('destoppc'     ,           '2'     ,   '1999/01/01'      ),
                        ('VTIAcademy'   ,           '3'     ,   '1999/01/01'      ),
                        ('VTIAcademyS'  ,           '4'     ,   '1999/01/01'      ),
                        ('Meocon'       ,           '5'     ,   '1999/01/01'      ),
                        ('Chocon'       ,           '6'     ,   '1999/01/01'      ),
                        ('Lợn con'      ,           '7'     ,   '1999/01/01'      ),
                        ('Cún con'      ,           '8'     ,   '1999/01/01'      ),
                        ('Mồn lèo'      ,           '9'     ,   '1999/01/01'      ),
                        ('Mò phèo'      ,           '10'    ,   '1999/01/01'      );         
                        

-- thêm vào tallble Groupaccount
INSERT INTO Groupaccount    (Account_ID,      Group_ID,         Join_Date)
VALUES                      (1      ,          2     ,        '1999/01/01'),
                            (1      ,          3     ,        '1999/01/01'),
                            (2      ,          2     ,        '1999/01/01'),
                            (2      ,          1     ,        '1999/01/01'),
                            (3       ,         1     ,        '1999/01/01'),
                            (3      ,          2     ,        '1999/01/01'),
                            (4      ,          1     ,        '1999/01/01'),
                            (4      ,          2     ,        '1999/01/01'),
                            (4      ,          3     ,        '1999/01/01'),
                            (4      ,          4     ,         '1999/01/01');      

-- thêm vào TypeQuestion
INSERT INTO  TypeQuestion   (Type_Name)
VALUES                      ('Essay'),
                            ('Multiple-Choice');

-- thêm vào  CategoryQuestion
INSERT INTO CategoryQuestion    ( Category_Name )
VALUES                          ('Java'),
                                ('NET'),
                                ( 'SQL'),
                                ( 'Postman'),
                                ('Ruby'),
                                ('luxury'),
                                ('katarina'),
                                ('irenia'),
                                ('mazahar'),
                                ('capshophia');
                                
                                
 -- thêm vào  Question                                      
INSERT INTO Question(   Content         ,    Category_ID,     Type_ID   , Creator_ID    ,      Create_Date)
VALUES              ('lamflanhmuahe'    ,       '1'     ,       '1'     ,       '1'     ,       '1999/01/01'),
                    ('lamnongmuadong'   ,       '1'     ,       '2'     ,       '2'     ,       '1999/01/01'),
                    ('giặt áo'          ,       '2'     ,       '3'     ,       '3'     ,       '1999/01/01'),
                    ('giặt quần'        ,       '3'     ,       '4'     ,       '4'     ,       '1999/01/01'),
                    ('phơi áo'          ,       '4'     ,       '5'     ,       '5'     ,       '1999/01/01'),
                    ('ủi đồ'            ,       '5'     ,       '6'     ,       '6'     ,       '1999/01/01'),
                    ('chạy máy'         ,       '6'     ,       '6'     ,       '6'     ,       '1999/01/01'),
                    ('kiểm thử'         ,       '7'     ,       '7'     ,       '7'     ,       '1999/01/01'),
                    ('máy xúc'          ,       '8'     ,       '8'     ,       '8'     ,       '1999/01/01'),
                    ('nghiệm thu'       ,       '9'     ,       '9'     ,       '9'     ,       '1999/01/01');
                    
 -- them vao answers
 INSERT INTO    answers (Content ,      Question_ID ,   isCorrect   )
 VALUES                 ('content1' ,   1         ,   1         ),
                        ('content2' ,   2         ,   1         ),
                        ('content3' ,   3         ,   0         ),
                        ('content4' ,   4         ,   1         ),
                        ('content5' ,   5         ,   0         ),
                        ('content6' ,   6         ,   0         ),
                        ('content7' ,   7         ,   0         ),
                        ('content8' ,   8          ,  1         ),
                        ('content9' ,   9         ,   1         ),
                        ('content10',   10        ,   0         );
        
   
-- thêm vào  Exam
INSERT INTO  Exam   (`Code` , Title  ,     Category_ID  ,      Duration ,  Creator_ID  ,   Create_Date)
VALUES              ('abc'  , 'đề 1' ,      '1'         ,       '60'   ,        '1'     ,   '1999/01/01'),        
                    ('abd'  , 'đề 2' ,      '1'         ,       '60'   ,        '2'     ,   '1999/01/01'),           
                    ('abf'  , 'đề 3' ,      '2'         ,       '60'   ,        '3'     ,   '1999/01/01'),
                    ('abg'  , 'đề 4' ,      '3'         ,       '60'   ,        '4'     ,   '1999/01/01'),
                    ('abh'  , 'đề 5' ,      '4'         ,       '60'   ,        '5'     ,   '1999/01/01'),
                    ('abj'  , 'đề 6' ,      '5'         ,       '60'   ,        '6'     ,   '1999/01/01'),
                    ('abk'  , 'đề 7' ,      '6'         ,       '60'   ,        '6'     ,   '1999/01/01'),
                    ('abl'  , 'đề 8' ,      '7'         ,       '60'   ,        '7'     ,   '1999/01/01'),
                    ('abz'  , 'đề 9' ,      '8'         ,       '60'   ,        '8'     ,   '1999/01/01'),
                    ('abx'  , 'đề 10',      '9'         ,       '60'   ,        '9'     ,   '1999/01/01');
                    
                    
                    
INSERT INTO   ExamQuestion  ( Exam_ID, Question_ID)
VALUES                      ('1'     ,      '1'),
                            ('3'     ,      '2'),
                            ('2'     ,      '3'),
                            ('4'     ,      '4'),
                            ('4'     ,      '5'),
                            ('5'     ,      '6'),
                            ('6'     ,      '7'),
                            ('7'     ,      '8'),
                            ('8'     ,      '9'),
                            ('9'     ,      '10');


-- Question 1: Viết lệnh để lấy ra danh sách nhân viên và thông tin phòng ban của họ:

SELECT *
FROM  department d
INNER JOIN `Account` a ON d.department_id=a. department_id;

-- Question 2: Viết lệnh để lấy ra thông tin các account được tạo sau ngày 1999-01-01:

SELECT *
FROM  `Account` 
WHERE CreateDate>= 1999-01-01;

-- Question 3: Viết lệnh để lấy ra tất cả các developer:

SELECT *
FROM   `Account`;






-- Question 4: Viết lệnh để lấy ra danh sách các phòng ban có =1 nhân viên

SELECT * , count(a.Account_ID ) AS số_nhân_viên
FROM department d
INNER JOIN  `Account` a ON d.department_id=a. department_id
GROUP BY d.department_id
HAVING COUNT(Account_id)=1;

-- Question 5: Viết lệnh để lấy ra danh sách câu hỏi được sử dụng trong đề thi nhiều nhất:

SELECT  *, COUNT(1)
FROM        ExamQuestion
GROUP BY    question_id
HAVING COUNT(1)=1;

SELECT COUNT(1)
FROM        ExamQuestion
GROUP BY     Question_ID
ORDER BY COUNT(1) DESC
LIMIT 1;

-- Question 6: Thông kê mỗi category Question được sử dụng trong bao nhiêu Question:
SELECT *
FROM  Question;

SELECT      *
FROM        Question q 
INNER JOIN  CategoryQuestion c  ON q.category_ID =c. Category_ID  
ORDER BY     c.category_ID;


  -- Question 7: Thông kê mỗi Question được sử dụng trong bao nhiêu Exam:                  
                    
SELECT    *
FROM        Exam;     
 
SELECT *
FROM        Question q
INNER JOIN  Exam e ON q.Creator_ID=e.Creator_Id
ORDER BY    e.Creator_Id ;

-- Question 8: Lấy ra Question có nhiều câu trả lời nhất:

SELECT *
FROM   answers  ;

SELECT*
FROM    Question q
INNER JOIN  answers a ON q .Question_id=a.Question_id
ORDER BY    a.Question_id;
SELECT COUNT(1)
FROM         Question
GROUP BY     Question_ID
ORDER BY COUNT(1) DESC
LIMIT 1;

-- Question 9: Thống kê số lượng account trong mỗi group:
        
SELECT *
FROM `Account`;
SELECT *
FROM `Group`;

SELECT COUNT(account_id), group_id, group_name
FROM groupaccount
RIGHT JOIN `group` USING (group_id)
GROUP BY group_id;


 -- Question 10: Tìm chức vụ có ít người nhất:
 
SELECT*
FROM position ;

SELECT *,count(1)
FROM `Account`
GROUP BY Position_id
HAVING count(1) = 1;

SELECT *
FROM `Account`a
INNER JOIN  Position p ON a.Position_ID=p.Position_ID
ORDER BY        a.Position_ID  ;

-- Question 11: Thống kê mỗi phòng ban có bao nhiêu dev, test, scrum master, PM:
SELECT*
FROM department;

SELECT * ,count(Department_ID)
FROM `account`
JOIN position USING (Position_ID)
WHERE Position_Name IN('Dev', 'Test', 'Scrum Master', 'PM')
GROUP BY Department_ID;


-- Question 12: Lấy thông tin chi tiết của câu hỏi bao gồm: thông tin cơ bản của
-- question, loại câu hỏi, ai là người tạo ra câu hỏi, câu trả lời là gì, ...
SELECT *
FROM  Question q
INNER JOIN answers a ON  q.Question_id=a.Question_id
ORDER BY  q. Question_id;

-- Question 13: Lấy ra số lượng câu hỏi của mỗi loại tự luận hay trắc nghiệm
SELECT*,COUNT(*) AS tự_luận, trắc_nghiệm
FROM Question;



-- Question 14:Lấy ra group không có account nào


SELECT COUNT(account_id), group_id, group_name
FROM groupaccount
LEFT JOIN `group` USING (group_id)
GROUP BY group_id;

-- Question 16: Lấy ra question không có answer nào:
SELECT  COUNT(Answer_ID ),Question_ID
FROM     Answers
LEFT JOIN question USING(Question_ID)
ORDER BY  Answer_ID;



        
        
        
        