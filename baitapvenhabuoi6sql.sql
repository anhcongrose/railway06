--  Question 1: Tạo view có chứa danh sách nhân viên thuộc phòng ban sale:
CREATE VIEW getfordepartmentsale AS
SELECT *
FROM `Account` a
INNER JOIN   Department q USING(Department_ID)
WHERE Department_name = 'sale' ;
SELECT * FROM testing_system_assignment_4.getfordepartmentsale;



-- Question 2: Tạo view có chứa thông tin các account tham gia vào nhiều group nhất

CREATE OR REPLACE VIEW view4 AS
SELECT *,COUNT(*)
FROM `account`a 
INNER JOIN  `group`g ON  a.account_id=g.Creator_ID
GROUP BY    account_id
HAVING      COUNT( account_id)=(
                                SELECT    COUNT(account_id)
                                FROM       `account`
                                GROUP BY    account_id
                                ORDER BY    COUNT( account_id) DESC
                                LIMIT 1);



-- Question 3: Tạo view có chứa câu hỏi có những content quá dài (content quá 300 từ được coi là quá dài) và xóa nó đi);
INSERT INTO view1  (     Email                 , username ,        Department_ID    ,       Full_Name       ,Position_ID, CreateDate   )
value              ('anhcongroses2@gmail.com' ,  ' anhcong'    ,              7 ,         '7'          ,      ' 7 '  ,   '2020/02/02 '      );
SELECT  *
FROM    question;



-- Question 4: Tạo view có chứa danh sách các phòng ban có nhiều nhân viên nhất
CREATE OR REPLACE VIEW view3 AS
SELECT *,COUNT(*)
FROM    `account`
INNER JOIN department USING(department_id)
GROUP BY Department_ID 
HAVING COUNT(Department_ID)=(
                                SELECT COUNT(Department_ID)
                                FROM `account`
                                GROUP BY Department_ID
                                ORDER BY    COUNT(Department_ID) DESC
                                LIMIT 1 );

-- Question 5: Tạo view có chứa tất các các câu hỏi do user họ Nguyễn tạo
SELECT*
FROM Question q
INNER JOIN `account` a ON q.Creator_ID = a.Account_ID
WHERE Full_Name LIKE 'nguyễn%';












      