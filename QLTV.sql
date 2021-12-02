--Bài 4 chương 6: (1,2,3,4)
Create database BTQLTV
Go
Use BTQLTV
Go

Create table DocGia
(
	Ma_DocGia NUMERIC IDENTITY(1,1), 
	Ho nvarchar(10), 
	TenLot nvarchar(20), 
	Ten nvarchar(20), 
	NgaySinh date,
	Primary key(Ma_DocGia)
)
Go

Create table NguoiLon
(
	Ma_DocGia NUMERIC IDENTITY(1,1) REFERENCES DocGia(Ma_DocGia), 
	SoNha nvarchar(50), 
	Duong nvarchar(50), 
	Quan nvarchar(50), 
	DienThoai nvarchar(10),  
	HanSuDung date,
	Primary key(Ma_DocGia)
)
Go

Create table TreEm
(
	Ma_DocGia NUMERIC IDENTI