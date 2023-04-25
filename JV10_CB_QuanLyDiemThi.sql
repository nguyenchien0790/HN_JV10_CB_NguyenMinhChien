create database QUANLYDIEMTHI;
use QUANLYDIEMTHI;

create table STUDENT(
	studentID varchar(4) primary key,
    studentName varchar(100) not null,
    birthday date not null,
    gender bit(1) not null,
    address text not null,
    phoneNumber varchar(45) unique
);

insert into STUDENT values
('S001','Nguyễn Thế Anh','1999-1-11',1,'Hà Nội','0984678082'),
('S002','Đặng Bảo Trâm','1998-12-22',0,'Lào Cai','0904982654'),
('S003','Trần Hà Phương','2000-5-5',0,'Nghệ An','0947645363'),
('S004','Đỗ Tiến Mạnh','1999-3-26',1,'Hà Nộ','0983665353'),
('S005','Phạm Duy Nhất','1998-10-4',1,'Tuyên Quang','0987242678'),
('S006','Mai Văn Thái','2002-6-22',1,'Nam Định','0982654268'),
('S007','Giang Gia Hân','1996-11-10',0,'Phú Thọ','0982364753'),
('S008','Nguyễn Ngọc Bảo My','1999-1-22',0,'Hà Nam','0927867453'),
('S009','Nguyễn Tiến Đạt','1998-8-7',1,'Tuyên Quang','098274673'),
('S010','Nguyễn Thiều Quang','2000-9-18',1,'Hà Nội','0984378291');

create table SUBJECT(
	subjectID varchar(4) primary key,
    subjectName varchar(45) not null,
    priority int(11) not null
);

insert into SUBJECT values
('MH01','Toán',2),
('MH02','Vật Lý',2),
('MH03','Hóa Học',1),
('MH04','Ngữ Văn',1),
('MH05','Tiếng Anh',2);

create table MARK(
	studentID varchar(4) not null,
	subjectID varchar(4) not null,
    point float(11) not null,
    foreign key (subjectID) references SUBJECT(subjectID),
    foreign key (studentID) references STUDENT(studentID),
    primary key (subjectID,studentID)
);

insert into MARK values
    ("S001","MH01", 8.5),
	("S001","MH02", 7),
	("S001","MH03", 9),
	("S001","MH04", 9),
	("S001","MH05", 5),
    
	("S002","MH01", 9),
	("S002","MH02", 8),
	("S002","MH03", 6.5),
	("S002","MH04", 8),
	("S002","MH05", 6),
    
	("S003","MH01", 7.5),
	("S003","MH02", 6.5),
	("S003","MH03", 8),
	("S003","MH04", 7),
	("S003","MH05", 7),
    
	("S004","MH01", 6),
	("S004","MH02", 7),
	("S004","MH03", 5),
	("S004","MH04", 6.5),
	("S004","MH05", 8),
    
	("S005","MH01", 5.5),
	("S005","MH02", 8),
	("S005","MH03", 7.5),
	("S005","MH04", 8.5),
	("S005","MH05", 9),
    
	("S006","MH01", 8),
	("S006","MH02", 10),
	("S006","MH03", 9),
	("S006","MH04", 7.5),
	("S006","MH05", 6.5),
    
	("S007","MH01", 9.5),
	("S007","MH02", 9),
	("S007","MH03", 6),
	("S007","MH04", 9),
	("S007","MH05", 4),
    
	("S008","MH01", 10),
	("S008","MH02", 8.5),
	("S008","MH03", 8.5),
	("S008","MH04", 6),
	("S008","MH05", 9.5),
    
	("S009","MH01", 7.5),
	("S009","MH02", 7),
	("S009","MH03", 9),
	("S009","MH04", 5),
	("S009","MH05", 10),
    
	("S010","MH01", 6.5),
	("S010","MH02", 8),
	("S010","MH03", 5.5),
	("S010","MH04", 4),
	("S010","MH05", 7);

 -- Bài 1  Tạo CSDL
 
 -- Bài 2 Thêm, sửa, xóa dữ liệu
		-- 1 Thêm dữ liệu vào các bảng
        
        -- 2 Sửa tên  sinh viên có mã 'S004' thành "Đỗ Đức Mạnh"
        update STUDENT set studentName = 'Đỗ Đức Mạnh' 
        where studentID = 'S004';
		-- Sửa tên môn học có mã 'MH05' thành 'Ngoại ngữ' và hs = 1
        update SUBJECT set subjectName = 'Ngoại Ngữ',priority = 1
        where subjectID = 'MH05';
        -- Cập nhật lại điểm của học sinh có mã 'S009' thành (MH01 : 8.5 , MH02 : 7 , MH03 : 5.5 ,MH04 : 6, MH5 : 9)
		update MARK set point = 8.5 where studentID = 'S009' and subjectID = 'MH01';
        update MARK set point = 7 where studentID = 'S009' and subjectID = 'MH02';
        update MARK set point = 5 where studentID = 'S009' and subjectID = 'MH03';
        update MARK set point = 6 where studentID = 'S009' and subjectID = 'MH04';
        update MARK set point = 9 where studentID = 'S009' and subjectID = 'MH05';
        -- Xóa toàn bộ học sinh có mã 'S010
        delete from MARK where studentID = 'S010';
        delete from STUDENT where studentID = 'S010';
        
-- BÀI 3 Truy vấn dữ liệu trong bảng
        -- 1.Lấy tất cả thông tin sinh viên trong bảng
        select *from STUDENT;
         -- 2.Hiển thị tên cà môn học có hs = 1
         select subject.subjectName,subject.subjectID from subject
		 where subject.priority = 1;
         -- 3 Hiển thị thông tin của học sinh 
         select studentId,studentName,birthday,
			case gender 
			when 1 then 'Nam'
			when 0 then 'Nữ'
			end as gender,
            address,
			phoneNumber from STUDENT;
         -- 4 Hiển thị thông tin bao gồm: tên học sinh, tên môn học , điểm thi của tất cả học sinh của môn Toán và sắp xếp theo điểm giảm dần.
		select s.studentName, sb.subjectName, m.point as Point
		from mark m
		join student s on s.studentID = m.studentID
		join subject sb on sb.subjectID = m.subjectID
		where m.subjectID = "MH01"
		order by Point DESC;

		-- 5 .Thống kê số lượng học sinh theo giới tính Nam /Nữ
		select case gender 
			when 1 then 'Nam'
			when 0 then 'Nữ'
			end  as Gender, count(gender) as Total
		from student
		group by Gender;

		-- 6 Tính tổng điểm và điểm trung bình của các môn học theo từng học sinh
		select s.studentID, s.studentName, sum(m.point) as Total, avg(m.point) as Average
		from mark m
		join student s on s.studentId = m.studentID
		group by s.studentID;
        
-- Bài4 Tạo View, Index , Procedure

        -- 1 Tạo View có tên STUDENT_VIEW gồm :  mã học sinh , tên học sinh, giới tính , quê quán
        create view STUDENT_VIEW as
        select studentID as 'Mã HS', studentName as 'Tên HS',gender as 'Giới Tính',address as 'Địa chỉ'
		from STUDENT;
        -- 2 Tạo view có tên AVERAGE_MARK_VIEW lấy thông tin gồm : Mã học sinh , tên học sinh, điểm trung bình các môn học
		create view AVERAGE_MARK_VIEW as
		select s.studentID as 'Mã HS', s.studentName as 'Tên HS', avg(m.point) as 'Điểm trung bình'
		from student s 
		join mark m on m.studentID = s.studentID
		group by s.studentID;
		select * from AVERAGE_MARK_VIEW;
		-- 3 Đánh Index cho trường phoneNumber của bảng STUDENT
		create index PHONE_NUMBER on student(phoneNumber);
        






