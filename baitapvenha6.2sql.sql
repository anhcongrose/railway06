-- File SQL đặt tên là "Testing_System_Assignment_6"
-- Question 1: Tạo store để người dùng nhập vào tên phòng ban và in ra tất cả các account thuộc phòng ban đó

DROP PROCEDURE IF EXISTS assigment1;
DELIMITER $$
CREATE PROCEDURE assigment1 (IN name_department NVARCHAR(50))
	BEGIN
        
		SELECT *
        FROM `Account`
        JOIN `department` USING (department_id)
        WHERE Department_Name LIKE CONCAT('%' , name_department , '%');
	END $$
DELIMITER ;
call testing_system_assignment_1.assigment1('kiểm thử');


-- Question 2: Tạo store để in ra số lượng account trong mỗi group

DROP PROCEDURE IF EXISTS getinaccount;
DELIMITER $$
CREATE PROCEDURE getinaccount (OUT account_id TINYINT)
                    BEGIN
                    SELECT *
                    FROM    `account` a
                    JOIN   ` group` g ON a.account_id=g.Creator_ID ;
                    END $$
                     DELIMITER ; 
call testing_system_assignment_1.getinaccount('');


-- Question 3: Tạo store để thống kê mỗi type question có bao nhiêu question được tạo trong tháng hiện tại

DROP PROCEDURE IF EXISTS type_question1;
DELIMITER $$
CREATE PROCEDURE type_question1(OUT Category_ID TINYINT)
BEGIN
                    SELECT *
                    FROM    question
                    JOIN CategoryQuestion USING (Category_ID)
                    WHERE   Create_Date >='1999/01/03';
                    END $$
                    DELIMITER ; 
set @Category_ID = 0;
call testing_system_assignment_1.type_question1(@Category_ID);
select @Category_ID;

-- Question 4: Tạo store để trả ra id của type question có nhiều câu hỏi nhất

DROP PROCEDURE IF EXISTS type_question2;
DELIMITER $$
CREATE PROCEDURE type_question2(OUT type_id TINYINT)
BEGIN
SELECT *
FROM    typequestion
JOIN    Question USING (type_id)
GROUP BY type_id
HAVING COUNT( type_id)=(
                                SELECT    COUNT(type_id)
                                FROM       typequestion
                                GROUP BY    type_id
                                ORDER BY    COUNT( type_id) DESC
                                LIMIT 1);

         END $$    )
  DELIMITER ;         

set @type_id = 1;
call testing_system_assignment_1.type_question2(@type_id);
select @type_id;

-- Question 5: Sử dụng store ở question 4 để tìm ra tên của type question




--  Question 6: Viết 1 store cho phép người dùng nhập vào 1 chuỗi và trả về group có tên
-- chứa chuỗi của người dùng nhập vào hoặc trả về user có username chứa
-- chuỗi của người dùng nhập vào
DROP PROCEDURE IF EXISTS gruop_ten_nguoi_dung ;
DELIMITER $$ 
CREATE PROCEDURE group_ten_nguoi_dung(IN outhur_username  NVARCHAR)
BEGIN
SELECT *
FROM 










