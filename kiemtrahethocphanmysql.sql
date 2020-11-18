
-- question 1
DROP DATABASE IF EXISTS thuc_tap;
CREATE DATABASE thuc_tap;
USE thuc_tap;

-- Table 1: Country 
DROP TABLE IF EXISTS Country ;
CREATE TABLE Country(
        country_id    TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
        country_name   VARCHAR(50)
        );

--
DROP TABLE IF EXISTS Location ;
CREATE TABLE Location(
            location_id   TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
            street_address    NVARCHAR(50),
            postal_code     NVARCHAR(50),
            country_id      TINYINT UNSIGNED,
FOREIGN KEY (country_id) REFERENCES Country (country_id)          
);

DROP TABLE IF EXISTS Employee  ;
CREATE TABLE Employee(
        employee_id     TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
        full_name       VARCHAR(50),
        email           NVARCHAR(50),
        location_id     TINYINT UNSIGNED,
        FOREIGN KEY(location_id ) REFERENCES Location (location_id )
        );

INSERT INTO Country ( country_id ,  country_name     )
VALUES              (   '1',         'viet_nam'         ),
                    (   '2',        'hongkong'       ),
                    (   '3',        'backinh'         );

INSERT INTO Location(  location_id , street_address,  postal_code,  country_id  )
VALUES              (   '1',         'trần duy hưng',  'NM_1',           '1'   ),
                    (   '2',         'trần thủ độ',     'AB_1',          '2'    ),
                    (   '3',          'quán thánh',     'ac_2',          '3'    );

INSERT INTO Employee ( employee_id,  full_name              ,   email           ,   location_id)
VALUES               (  '1'         , 'nguyễn thành công','anhcongrose@gmail.com',      '1'     ),
                     (  '2'         , 'bé tẹo'           ,  'nn03@gmail.com'     ,     '2'    ) ,
                     (  '3'         ,'to thị tý'         ,'tothity@gmail.com'      ,    '3');
                        
-- question 2. Viết lệnh để
-- a) Lấy tất cả các nhân viên thuộc Việt nam
-- b) Lấy ra tên quốc gia của employee có email là "nn03@gmail.com"
-- c) Thống kê mỗi country, mỗi location có bao nhiêu employee đang làm việc

-- A
SELECT *
FROM Employee e
INNER JOIN  Country c on c.country_id =e.employee_id 
where country_name='viet_nam';

-- B
SELECT *
FROM Employee e
JOIN Country c on c.country_id =e.employee_id 
WHERE  email ='nn03@gmail.com';

-- c 
SELECT *, COUNT(1)
FROM Employee e
INNER JOIN  Country c ON c.country_id =e.employee_id 
INNER JOIN  location USING(location_id)
GROUP BY country_name;

 
-- 3. Tạo trigger cho table Employee chỉ cho phép insert mỗi quốc gia có tối đa
-- 10 employee
DROP TRIGGER IF EXISTS insertinto_in_Employee ;
DELIMITER $$
CREATE TRIGGER insertinto_in_Employee
BEFORE DELETE ON  Employee
FOR EACH ROW
BEGIN
IF new. Employee.id IN (SELECT Employee.id FROM(SELECT Employee.id count(country_id) AS soluong
                                                from Country
                                                group by Employee.id
                                                HAVING soluong = 10) AS temp) THEN
    SIGNAL SQLSTATE '12345'
    





);

-- Hãy cấu hình table sao cho khi xóa 1 location nào đó thì tất cả employee ở location đó sẽ có location_id = null
DROP TRIGGER IF EXISTS xoa_location;
DELIMITER $$
CREATE TRIGGER xoa_location
BEFORE DELETE ON  location
FOR EACH ROW
BEGIN
        DECLARE  location_id_1 INT;
        SELECT location_id INTO location_id_1
        FROM location ;
        DELETE FROM location where location_id=location_id_1;
        UPDATE employee SET location_id = null WHERE location_id=location_id_1;
       end $$ 
DELIMITER $$