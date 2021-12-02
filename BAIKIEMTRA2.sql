/*BÀI KIỂM TRA SỐ 2
(User, Grant, Revoke)
Thời gian làm bài: 90 phút
*/

USE KiemTra
-- CÂU 1 A Tạo các users John, Joe, Fred, Lynn, Amy, and Beth: (2đ)
GO
CREATE LOGIN John WITH PASSWORD='JOHN'
GO
CREATE USER John FOR LOGIN John

GO
CREATE LOGIN Joe WITH PASSWORD='JOE'
GO
CREATE USER Joe FOR LOGIN Joe

GO
CREATE LOGIN Fred WITH PASSWORD='FRED'
GO
CREATE USER Fred FOR LOGIN Fred

GO
CREATE LOGIN Lynn WITH PASSWORD='LYNN'
GO
CREATE USER Lynn FOR LOGIN Lynn

GO
CREATE LOGIN Amy WITH PASSWORD='AMY'
GO
CREATE USER Amy FOR LOGIN Amy

GO
CREATE LOGIN Beth WITH PASSWORD='BETH'
GO
CREATE USER Beth FOR LOGIN Beth


-- CÂU 1 B
GO
CREATE USER Tam IDENTIFIED BY TAM ;
DEFAULT TABLESPACE VIDU
QUOTA 10M ON VIDU
TEMPORARY TABLESPACE TMP
QUOTA 10M ON system 
PROFILE Amy PASSWORD AMY


-- CÂU 2 Tạo cơ sở dữ liệu có tên là KiemTra và tạo bảng Attendance (6đ)
CREATE DATABASE KiemTra
USE KiemTra

CREATE TABLE Attendance
(
	ID INT PRIMARY KEY, 
	Name NVARCHAR(20) 
)

-- A Tạo các role sau: DataEntry, Supervisor, và Management
CREATE ROLE DataEntry
CREATE ROLE Supervisor
CREATE ROLE Management
-- B Gán John, Joe, và Lynn vào role DataEntry, gán Fred vào role Supervisor và gán Amy và Beth vào role Management.
-- Cách 1
GRANT DataEntry TO John;
GRANT DataEntry TO Lynn;
GRANT DataEntry TO Joe;
GRANT Supervisor TO Fred;
GRANT Management TO Beth;
GRANT Management TO Amy;
-- Cách 2
exec sp_addrolemember 'DataEntry','John'
exec sp_addrolemember 'DataEntry','Joe'
exec sp_addrolemember 'DataEntry','Lynn'
exec sp_addrolemember 'Supervisor','Fred'
exec sp_addrolemember 'Management','Beth'
exec sp_addrolemember 'Management','Amy'

-- C Cho role DataEntry các quyền SELECT, INSERT, và UPDATE trên bảng Attendance
GRANT SELECT,INSERT, UPDATE ON Attendance TO DataEntry
-- D Cho role Supervisor các quyền SELECT và DELETE trên bảng Attendance
GRANT SELECT,DELETE ON Attendance TO Supervisor
-- E Cho role Management quyền SELECT trên bảng Attendance
GRANT SELECT ON Attendance TO Management
-- F Lần lượt kiểm tra kết quả phân quyền đã cấp cho các role

	-- CÂU 3
-- A Gán password cho role DataEntry ở bài 2a là “mgt”
ALTER ROLE DataEntry IDENTIFIED BY mgt;
-- B Cho phép user John quyền cấp quyền cho các user khác
GRANT SELECT,INSERT, UPDATE ON Attendance to John WITH GRANT OPTION
-- C Gán tất cả các quyền mà John có cho Beth. Beth có quyền INSERT và UPDATE trên bảng Attendance không?
GRANT SELECT,INSERT, UPDATE ON Attendance to Beth


INSERT INTO Attendance VALUES (01,N'SV01')
INSERT INTO Attendance VALUES (02,N'SV02')
SELECT * FROM Attendance

UPDATE Attendance
SET NAME = N'SV02_UPDATE'
WHERE ID='02'
GO
SELECT * FROM Attendance
--Vậy Beth có quyền INSERT và UPDATE trên bảng Attendance

