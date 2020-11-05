DROP DATABASE IF EXISTS Testing_System_Assignment_1;
CREATE DATABASE Testing_System_Assignment_1;
USE Testing_System_Assignment_1;


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
INSERT INTO `Account`   (     Email ,               username ,     Department_ID    ,   Full_Name ,                 Position_ID ,            CreateDate   )
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
VALUES                  ('deverlop'     ,           '1'     ,   '1999/01/2'      ),
                        ('destoppc'     ,           '2'     ,   '1999/01/3'      ),
                        ('VTIAcademy'   ,           '3'     ,   '1999/01/4'      ),
                        ('VTIAcademyS'  ,           '4'     ,   '1999/01/1'      ),
                        ('Meocon'       ,           '5'     ,   '1999/01/1'      ),
                        ('Chocon'       ,           '6'     ,   '1999/01/1'      ),
                        ('Lợn con'      ,           '7'     ,   '1999/01/1'      ),
                        ('Cún con'      ,           '8'     ,   '1999/01/1'      ),
                        ('Mồn lèo'      ,           '9'     ,   '1999/01/1'      ),
                        ('Mò phèo'      ,           '10'    ,   '1999/01/1'      );         
                        

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
-- lấy ra tất cả các phòng ban ---            
SELECT *
FROM Department;
-- lấy ra ID của phòng SALE --
SELECT (Department_ID)
FROM Department 
WHERE Department_Name = 'sale';

SELECT `Code`,Title
FROM Exam;

 -- lấy ra và đếm thông tin phòng ban của tallble  account:
 
 SELECT *, COUNT(*)
FROM `account`
GROUP BY Department_ID;

--  lấy ra thông tin account có full name dài nhất, ''nguyen thanh trung'
SELECT *
FROM `account`
WHERE  full_name='nguyễn thành trung';

-- Lấy ra thông tin account có full name dài nhất 
                    
SELECT *,length(Full_Name)
FROM `Account`
WHERE length(Full_Name) = (
SELECT MAX(length(Full_Name))
FROM `Account`
);

-- Lấy ra thông tin account có full name dài nhất và thuộc phòng ban có id=3


SELECT 			*
FROM 			`Account`
WHERE 			length(Full_Name)= (
SELECT 			MAX(length(Full_Name))
FROM  			`Account`
WHERE 			Department_ID =3) AND Department_ID='3' ;

-- Question 6: Lấy ra tên group đã tham gia trước ngày  '1999/01/02':

SELECT      Group_Name, Group_id
FROM        `Group`
WHERE       Create_Date <'1999-01-2';

-- Lấy ra ID của question có >= 4 câu trả lời
 

SELECT       question_id  ,COUNT(*)
FROM         Answers
GROUP BY     Answer_ID >4;  
                    
                    
   -- Lấy ra các mã đề thi có thời gian thi >= 60 phút và được tạo trước ngày  '1999/01/01'

SELECT      `Code`
FROM        Exam
WHERE       Create_Date <= '1999-01-01' AND  Duration='60';
        
-- Question 9: Lấy ra 5 group được tạo gần đây nhất
        
SELECT *
FROM         `group` 
ORDER BY  Group_Name DESC
LIMIT 5;
        
  -- Question 10: Đếm số nhân viên thuộc department có id = 2
 
 SELECT * , COUNT(*)
 FROM       department
 WHERE     department_id=2;
 
 
 -- Question 11: Lấy ra nhân viên có tên bắt đầu bằng chữ "D" và kết thúc bằng chữ "o"
 
 
-- SELECT *
-- FROM department
-- WHERE fist_name Like 'D%'AND  last_name like '%o' ;
 
 
 
 
        
        
   
        

        
        
        