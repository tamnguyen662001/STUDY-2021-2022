﻿
/*				NGÔN NGỮ ĐIỀU KHIỂN DỮ LIỆU
- 1 USER
- Tạo user : CREATE USER USERNAME FOR LOGIN LOGINNAME

- 2 ROLE
- Tạo một role : +	CREATE ROLE ROLENAME
					[IDENTIFIED BY PASS];
				 + GRANT ROLENAME TO USER
				 + GRANT CREATE TABLE TO ROLENAME
				 + REVOKE CREATE TABLE FROM ROLENAME
- Enable tất cả các role : SET ROLE ALL;
- Disable tất cả các role : SET ROLE NONE;
- Xoá ROLE : DROP ROLE ROLENAME;

- 3 GRANT : gán quyền/role cho user/role khác 
- GRANT [PREVILEGES] ON [OBJECT] TO [USER] [WITH GRANT OPTIN]
- Gán quyền DELETE cho user :	GRANT DELETE ANY TABLE TO USER1
- Gán quyền SELECT, INSERT , UPDATE cho user :	GRANT SELECT,INSERT, UPDATE ON PHONGMAY TO USER
- Gán quyền SELECT, INSERT , UPDATE, DELETE , REFERNCES cho user :	GRANT ALL ON PHONGMAY TO USER
- Gán quyền Tạo CSDL : GRANT ALTER ANY DATABASE TO USER
- Gán quyền Tạo bảng : GRANT CREATE TABLE TO USER
- Gán quyền kết nối đến CSDL  : CREATE SESSION TO USER

- Xem thông tin các quyền hệ thống đã được gán cho user hiện tại: SELECT * FROM user_sys_privs;

- 4 REVOKE : Loại bỏ các quyền truy xuất dữ liệu đã được gán thông qua lệnh GRANT
- REVOKE [GRANT OPTION FOR] [PREVILEGES] ON [OBJECT] FROM [USER] [CASECADE]



*/
create login 




--câu 3.1
CREATE USER TruongLV FOR LOGIN TruongLV
CREATE USER AnhLV FOR LOGIN AnhLV
--câu 3.2
GRANT ALTER ANY DATABASE TO TruongLV
GRANT CREATE TABLE TO TruongLV

GRANT SELECT,INSERT ON PHONGMAY TO AnhLV WITH GRANT OPTION


-- CÂU 1
CREATE DATABASE QLPHONGMAY
ON PRIMARY 
(
	NAME=Data_1,
	FILENAME='E:\Project\SQLServer\BT5\Data1.mdf',
	SIZE=10MB,
	MAXSIZE=1000MB,
	FILEGROWTH=10MB
),
(
	NAME=Data_2,
	FILENAME='E:\Project\SQLServer\BT5\Data2.ndf',
	SIZE=10MB,
	MAXSIZE=1000MB,
	FILEGROWTH=10MB
)
LOG ON 
(
	NAME=Log_1,
	FILENAME='E:\Project\SQLServer\BT5\Log1.ldf',
	SIZE=30MB,
	MAXSIZE=2GB,
	FILEGROWTH=30MB
),
(
	NAME=Log_2,
	FILENAME='E:\Project\SQLServer\BT5\Log2.ldf',
	SIZE=30MB,
	MAXSIZE=2GB,
	FILEGROWTH=30MB
);

--Câu 2: GRANT CREATE TABLE TO TANDAT
CREATE DATABASE QLPM
USE QLPM
CREATE TABLE PhongMay(
MaPhong VARCHAR(20) PRIMARY KEY,
GhiChu NVARCHAR(100),
)
CREATE TABLE MayTinh(
MaMay VARCHAR(20) PRIMARY KEY,
GhiChu NVARCHAR(100),
MaPhong VARCHAR(20) FOREIGN KEY REFERENCES PhongMay(MaPhong),
)
CREATE TABLE MonHoc(
MaMon VARCHAR(20) PRIMARY KEY,
TenMon NVARCHAR(100),
SoGio INT,
)
CREATE TABLE DangKy(
MaMon VARCHAR(20) PRIMARY KEY,
MaPhong VARCHAR(20),
NgayDK DATETIME,
);