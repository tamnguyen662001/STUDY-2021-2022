CREATE DATABASE BTQLSV

USE BTQLSV
/* ===================== Tạo bảng =====================*/

CREATE TABLE KHOA
(
	MaKhoa varchar(10) primary key not null,
	TenKhoa nvarchar(50) not null,
	SL_CBGV smallint not null,
)

CREATE TABLE SINHVIEN
(
	MSSV varchar(5) primary key not null,
	Ten nvarchar(50) not null,
	PhaiNu varchar(5) not null,
	DiaChi nvarchar (100) not null,
	DienThoai varchar (10) ,
	MaKhoa varchar (10) not null foreign key (MaKhoa) references KHOA (MaKhoa),
)

CREATE TABLE GIAOVIEN
(	
	MaGV varchar(5) not null PRIMARY KEY,
	TenGV nvarchar(50) not null,
	MaKhoa varchar (10) not null foreign key (MaKhoa) references KHOA (MaKhoa),
)

CREATE TABLE MONHOC
(
	MaMH varchar(5) not null primary key,
	TenMH nvarchar (50) not null,
	SoTC int not null,
)

CREATE TABLE GIANGDAY
(
	MaKhoaHoc varchar (5) not null primary key,
	MaGV varchar(5) not null foreign key (MaGV) references GIAOVIEN (MaGV),
	MaMH varchar(5) not null foreign key (MaMH) references MONHOC (MaMH),
	HocKy smallint not null,
	Nam int not null,
)

CREATE TABLE KETQUA
(	
	MaSV varchar(5) not null,
	MaKhoaHoc varchar(5) not null foreign key (MaKhoaHoc) references GIANGDAY (MaKhoaHoc),
	Diem decimal(3,1) not null
	CONSTRAINT PK_KQ PRIMARY KEY (MaSV,MaKhoaHoc)
)







/* ===================== Nhập dữ liệu cho các bảng =====================*/


INSERT KHOA VALUES ('CNTT', N'Công nghệ thông tin',15)
INSERT KHOA VALUES ('TOAN', N'Toán',20)
INSERT KHOA VALUES ('SINH', N'Sinh học',7)

INSERT SINHVIEN VALUES ('SV001','BUI THUY AN','YES','223 TRAN HUNG DAO, HCM',0843132202,'CNTT')
INSERT SINHVIEN VALUES ('SV002','NGUYEN THANH TUNG','NO','140 CONG QUYNH, HCM',0581425678,'CNTT')
INSERT SINHVIEN VALUES ('SV003','NGUYEN THANH LONG','NO','112/4 CONG QUYNH, HCM',0918345623,'TOAN')
INSERT SINHVIEN VALUES ('SV004','HOANG THI HOA','YES','90 DANG VAN CU, HCM',0988320123,'CNTT')
INSERT SINHVIEN VALUES ('SV005','TRAN HONG SON','NO','54 CAO THANG HN',0928345987,'TOAN')


INSERT GIAOVIEN VALUES ('GV01','PHAM THI THAO','CNTT')
INSERT GIAOVIEN VALUES ('GV02','LAM HOANG VU','TOAN')
INSERT GIAOVIEN VALUES ('GV03','TRAN VAN TIEN','CNTT')
INSERT GIAOVIEN VALUES ('GV04','HOANG VUONG','CNTT')

INSERT MONHOC VALUES ('CSDL','CO SO DU LIEU',3)
INSERT MONHOC VALUES ('CTDL','CAU TRUC DU LIEU',4)
INSERT MONHOC VALUES ('KTLT','KI THUAT LAP TRINH',5)
INSERT MONHOC VALUES ('CWIN','LAP TRINH C TREN WINDOW',4)



INSERT GIANGDAY VALUES('K1','GV01','CSDL',1,2001)
INSERT GIANGDAY VALUES('K2','GV04','KTLT',2,2001)
INSERT GIANGDAY VALUES('K3','GV03','CTDL',1,2002)
INSERT GIANGDAY VALUES('K4','GV04','CWIN',1,2002)
INSERT GIANGDAY VALUES('K5','GV01','CSDL',1,2002)


/* ==================Cập nhật dữ liệu cho bảng giảng dạy===================*/


INSERT KETQUA VALUES ('SV001','K1',8.5)
INSERT KETQUA VALUES ('SV002','K3',7.0)
INSERT KETQUA VALUES ('SV003','K4',7.5)
INSERT KETQUA VALUES ('SV001','K2',9.0)
INSERT KETQUA VALUES ('SV004','K3',6.0)
INSERT KETQUA VALUES ('SV005','K3',7.0)
INSERT KETQUA VALUES ('SV002','K1',7.0)
INSERT KETQUA VALUES ('SV003','K2',8.5)
INSERT KETQUA VALUES ('SV005','K5',7.0)
INSERT KETQUA VALUES ('SV004','K4',2.0)
  
SELECT *FROM KETQUA

/* ===================Truy vấn dữ liệu ====================*/
/*Bài tập chương 4 - Bài tập 2 */
/* Câu 1 */
SELECT Ten, DiaChi, DienThoai
FROM SINHVIEN
/* Câu 2 */
SELECT TenMH, SoTC
FROM MONHOC
/* Câu 3 */
SELECT Diem
FROM KETQUA
WHERE MaSV = 'SV003'
/* Câu 4 */
SELECT TenMH,SoTC
FROM MONHOC
WHERE LEFT(MaMH,1) = 'C' or LEFT(MaMH,3) = 'D'
/* Câu 5*/
SELECT TenGV
FROM GIAOVIEN
WHERE TenGV LIKE '__A%' 
/* Câu 6 */
SELECT TenMH
FROM MONHOC
WHERE TenMH LIKE '%DU%'
/* Câu 7 */
SELECT TenGV
FROM GIAOVIEN
WHERE LEFT(TenGV,1) = 'P' or  LEFT(TenGV,1) = 'L'
/* Câu 8 */
SELECT Ten, DiaChi
FROM SINHVIEN
WHERE DiaChi LIKE '%CONG QUYNH%'
/* Câu 9 */
SELECT TenMH
FROM MONHOC A, GIANGDAY B
WHERE A.MaMH = B.MaMH AND B.Nam = 2002
/* Câu 10 ?*/
SELECT Ten, DiaChi, MSSV
FROM SINHVIEN,KHOA
ORDER BY Ten
/* Câu 11*/
SELECT Diem
FROM KETQUA,SINHVIEN,GIANGDAY
WHERE SINHVIEN.MSSV = KETQUA.MaSV AND GIANGDAY.MaKhoaHoc = KETQUA.MaKhoaHoc
GROUP BY Diem
/* Câu 12 */
SELECT MaSV 
FROM  KETQUA B , GIANGDAY D
WHERE B.MaKhoaHoc = D.MaKhoaHoc AND D.MaMH ='CSDL' AND (B.Diem BETWEEN 8 AND 10)
/* Câu 13*/
SELECT MaSV,MaKhoaHoc,Diem
FROM KETQUA,SINHVIEN
WHERE KETQUA.MaSV = SINHVIEN.MSSV AND SINHVIEN.Ten LIKE '%TUNG%'
/* Câu 14*/
SELECT b.TenKhoa, c.TenMH, a.Ten 
FROM SINHVIEN a, KHOA b, MONHOC c,KETQUA d,GIANGDAY e
WHERE (a.MSSV = d.MaSV) AND (a.MaKhoa = b.MaKhoa) AND (d.MaKhoaHoc = e.MaKhoaHoc)
AND (e.MaMH = c.MaMH)
ORDER BY TenKhoa
/* Câu 15*/
SELECT A.TenKhoa, B.MaKhoaHoc
FROM KHOA A, GIANGDAY B ,GIAOVIEN C
WHERE C.MaKhoa = A.MaKhoa AND B.MaGV = C.MaGV
/* Câu 16*/
SELECT  DISTINCT Ten,MaKhoa
FROM SINHVIEN A, MONHOC B,KETQUA C,GIANGDAY D
WHERE A.MSSV = C.MaSV AND B.MaMH = D.MaMH AND C.MaKhoaHoc = D.MaKhoaHoc AND (B.MaMH = 'CSDL' OR B.MaMH ='CTDL')

/* Câu 17*/
SELECT A.TenGV
FROM GIAOVIEN A, GIANGDAY B, MONHOC C
WHERE A.MaGV = B.MaGV AND B.MaMH = C.MaMH AND C.TenMH ='KI THUAT LAP TRINH'
/* Câu 18*/
SELECT B.TenMH
FROM GIANGDAY A, MONHOC B, GIAOVIEN C
WHERE A.MaGV = C.MaGV AND B.MaMH = A.MaMH AND (C.TenGV = 'Tran Van Tien' AND A.HocKy = 1 AND A.Nam = 2002)
/* Câu 19*/
SELECT DISTINCT MSSV, Ten
FROM SINHVIEN A, KETQUA B
WHERE (A.MSSV = B.MaSV) AND (B.Diem >=8)
/* Câu 20 ?*/
select  MSSV, Ten
from dbo.SINHVIEN sv, dbo.KETQUA kq
where (sv.MSSV = kq.MaSV) and kq.Diem >= all( Select sv1.MSSV, sv1.Ten
from dbo.SINHVIEN sv1, dbo.KETQUA kq1
where (sv1.MSSV = kq1.MaSV) and kq1.Diem>8)

--===============PHẦN NÂNG CAO===================

--==============AGGREGATE FUNTION=================
/* Câu 21*/
SELECT COUNT(MSSV) AS SL_SINHVIEN
FROM SINHVIEN
/* Câu 22*/
SELECT COUNT(MaGV) AS SL_GIAOVIEN
FROM GIAOVIEN
/* Câu 23*/
SELECT COUNT(MSSV) AS SV_NU_CNTT
FROM SINHVIEN
WHERE PhaiNu = 'YES' AND MaKhoa = 'CNTT'
/* Câu 24*/
SELECT COUNT(MaGV) AS GV_CNTT
FROM GIAOVIEN
WHERE MaKhoa = 'CNTT'
/* Câu 25*/
SELECT  DISTINCT COUNT(Ten) AS SV_HOC_CSDL
FROM SINHVIEN A, MONHOC B,KETQUA C,GIANGDAY D
WHERE A.MSSV = C.MaSV AND B.MaMH = D.MaMH AND C.MaKhoaHoc = D.MaKhoaHoc AND B.MaMH = 'CSDL'
/* Câu 26*/
SELECT COUNT(B.TenMH) AS HK1_2001
FROM GIANGDAY A, MONHOC B, GIAOVIEN C
WHERE A.MaGV = C.MaGV AND B.MaMH = A.MaMH AND  A.HocKy = 1 AND A.Nam = 2001
/* Câu 27 sai*/
SELECT SUM(SoTC * Diem) / SUM(SoTC) AS [DIEM TB]
FROM KETQUA KQ INNER JOIN GIANGDAY GD ON KQ.MAKHOAHOC = GD.MAKHOAHOC
			   INNER JOIN MONHOC MH ON GD.MAMH = MH.MAMH
WHERE KQ.MaSV = 'SV004'
/* Câu 28*/
SELECT DISTINCT A.MSSV, A.Ten, A.DiaChi,SUM(MH.SoTC * KQ.Diem) / SUM(MH.SoTC)  AS DTB
FROM SINHVIEN A , KETQUA B,KETQUA KQ INNER JOIN GIANGDAY GD ON KQ.MAKHOAHOC = GD.MAKHOAHOC
			   INNER JOIN MONHOC MH ON GD.MAMH = MH.MAMH
WHERE A.MSSV = B.MaSV
GROUP BY A.MSSV, A.Ten, A.DiaChi

--CAU 28
SELECT MSSV,TEN,DIACHI,sum (mh.SoTC*kq.Diem)/sum(mh.SoTC) as [DiemTB]
	FROM SINHVIEN sv, KETQUA kq, GIANGDAY gd, MONHOC mh
	WHERE SV.MSSV = KQ.MASV AND gd.MAKHOAHOC=kq.MAKHOAHOC AND gd.MAMH = mh.MAMH
	GROUP BY MSSV,TEN,DIACHI
/* Câu 29*/
SELECT A.MSSV, A.Ten, A.DiaChi ,COUNT(B.Diem) AS SL_DIEMGIOI
FROM SINHVIEN A, KETQUA B
WHERE A.MSSV = B.MaSV AND B.Diem >= 8
GROUP BY A.MSSV, A.Ten, A.DiaChi
/* Câu 30*/
SELECT B.TenKhoa AS KHOA, COUNT(A.MSSV) AS SL_SINHVIEN
FROM SINHVIEN A ,KHOA B
WHERE A.MaKhoa = B.MaKhoa
GROUP BY B.TenKhoa
/* Câu 31*/
SELECT A.TenKhoa AS KHOA, COUNT(B.MaKhoaHoc) AS KHOAHOC_GV_KHOA_GD
FROM KHOA A, GIANGDAY B ,GIAOVIEN C
WHERE C.MaKhoa = A.MaKhoa AND B.MaGV = C.MaGV
GROUP BY A.TenKhoa
/* Câu 32 SAI*/
SELECT DISTINCT A.Ten AS HOTEN ,AVG(B.Diem) AS DTB, COUNT(B.MaKhoaHoc) AS SL_KHOAHOC_THAMGIA
FROM SINHVIEN A , KETQUA B
WHERE A.MSSV = B.MaSV
GROUP BY A.Ten
/* Câu 33*/
SELECT   A.MSSV ,A.Ten AS HOTEN,SUM((B.SoTC)) AS SL_TINCHI
FROM SINHVIEN A, MONHOC B,KETQUA C,GIANGDAY D
WHERE A.MSSV = C.MaSV AND B.MaMH = D.MaMH AND C.MaKhoaHoc = D.MaKhoaHoc
GROUP BY A.MSSV, A.Ten
-- các thuộc tính không nằm trong các HÀM ở mđ select thường sẽ nằm trong mđ group by (-SoTC do nó ở trong SUM )

--==============HAVING=================
/* Câu 34 CÔ CHƯA ĐÚNG*/
SELECT sv.Ten, count(kq.MaSV) AS [Mon thi mot lan]
FROM SINHVIEN sv JOIN KETQUA kq ON sv.MSSV=kq.MaSV
GROUP BY sv.Ten
HAVING  count(kq.MaSV)=1
/* Câu 35 sai*/
SELECT DISTINCT A.MSSV, A.Ten, A.DiaChi, (AVG(B.Diem)) AS DTB
FROM SINHVIEN A , KETQUA B
WHERE A.MSSV = B.MaSV
GROUP BY A.MSSV, A.Ten, A.DiaChi
HAVING AVG(B.Diem) >8.5

select MaSV, Ten, DiaChi, sum(SoTC*Diem)/sum(SoTC) as 'DiemTB'
from SINHVIEN SV join KETQUA KQ on SV.MSSV=KQ.MaSV join GIANGDAY GD on GD.MaKhoaHoc=KQ.MaKhoaHoc join MONHOC MH on MH.MaMH=GD.MaMH
group by MaSV, Ten, DiaChi
having sum(SoTC*Diem)/sum(SoTC)>8.5

/* Câu 36*/
SELECT A.MaKhoaHoc, A.HocKy, A.Nam, COUNT(B.MSSV) AS SL_SV
FROM GIANGDAY A, SINHVIEN B, KETQUA C
WHERE A.MaKhoaHoc = C.MaKhoaHoc AND B.MSSV = C.MaSV 
GROUP BY A.MaKhoaHoc, A.HocKy, A.Nam
HAVING COUNT(B.MSSV) BETWEEN 2 AND 4
/* Câu 37*/
SELECT  DISTINCT A.MSSV,A.Ten
FROM SINHVIEN A, MONHOC B,KETQUA C,GIANGDAY D
WHERE A.MSSV = C.MaSV AND B.MaMH = D.MaMH AND C.MaKhoaHoc = D.MaKhoaHoc AND (B.MaMH IN ('CTDL','CSDL') AND C.Diem >= 8)
GROUP BY  A.MSSV,A.Ten
HAVING COUNT(DISTINCT B.MaMH) >= 2




/* Câu 37 HƯNG*/
SELECT MSSV,Ten
FROM (KETQUA INNER JOIN SINHVIEN ON SINHVIEN.MSSV=KETQUA.MaSV) INNER JOIN GIANGDAY ON KETQUA.MaKhoaHoc=GIANGDAY.MaKhoaHoc 
WHERE MaMH IN ('CSDL','CTDL') AND Diem > 7
GROUP BY MSSV,Ten
HAVING COUNT(DISTINCT MaMH) >= 2
/* Câu 38 1*/
SELECT DISTINCT A.MaKhoaHoc, B.MaMH,B.HocKy,B.Nam ,MAX(A.Diem) AS DiemCaoNhat
FROM KETQUA A, GIANGDAY B
WHERE A.MaKhoaHoc = B.MaKhoaHoc
GROUP BY  A.MaKhoaHoc, B.MaMH,B.HocKy,B.Nam 
/* Câu 38 2*/
SELECT DISTINCT MaKhoaHoc, MAX(Diem)
FROM KETQUA
GROUP BY MaKhoaHoc	
/* Câu 39*/
SELECT TenMH,SoTC AS'SO TC NHỎ NHẤT'
FROM MONHOC
WHERE SoTC<= ALL(SELECT SoTC FROM MONHOC)
/* Câu 40*/
SELECT TenMH 
FROM MONHOC
WHERE SoTC=(SELECT MAX(SoTC) FROM MONHOC)
/* Câu 41 BẢNG KHOA CÓ SL CBGD R*/
select TenKhoa, count(MaGV) as 'So Luong'
from Khoa inner join GiaoVien on Khoa.MaKhoa = GiaoVien.MaKhoa
group by TenKhoa
having count(MaGV) <= all(select count(MaGV)from Khoa inner join GiaoVien on Khoa.MaKhoa = GiaoVien.MaKhoa
group by TenKhoa)

 select kh.TenKhoa
from KHOA kh 
where kh.SL_CBGD<=(select  min(kh.SL_CBGD) from KHOA kh)
/* Câu 42*/
SELECT Ten
FROM SINHVIEN
WHERE MSSV IN (SELECT MaSV
				FROM KETQUA INNER JOIN GIANGDAY ON KETQUA.MaKhoaHoc = GIANGDAY.MaKhoaHoc
							INNER JOIN MONHOC ON GIANGDAY.MaMH = MONHOC.MaMH
				WHERE  Diem >= ALL (SELECT Diem
									FROM KETQUA KQ INNER JOIN GIANGDAY GD ON KQ.MaKhoaHoc = GD.MaKhoaHoc
												   INNER JOIN MONHOC MH ON GD.MaMH = MH.MaMH) 
				AND TenMH = 'KY THUAT LAP TRINH')

---Cau 42: Ten cac sv co diem cao nhat trong mon KTLT--- CÔ
select sv.MSSV, sv.Ten, kq.Diem
from SINHVIEN sv inner join KETQUA kq on sv.MSSV=kq.MaSV
				 inner join GIANGDAY gd on kq.MaKhoaHoc=gd.MaKhoaHoc
				 inner join MONHOC mh on mh.MaMH=gd.MaMH
where kq.Diem>=ALL (select max(kq.Diem) from KETQUA kq) and mh.TenMH='KI THUAT LAP TRINH'
/* Câu 43*/
SELECT SV.MSSV, Ten, DiaChi, KQ.Diem
FROM SINHVIEN SV INNER JOIN KETQUA KQ ON SV.MSSV = KQ.MaSV
				 INNER JOIN GIANGDAY GD ON KQ.MAKHOAHOC = GD.MAKHOAHOC
WHERE MAMH = 'CSDL' AND Diem >= ALL (SELECT MAX(Diem) FROM KETQUA INNER JOIN GIANGDAY
				ON KETQUA.MaKhoaHoc = GIANGDAY.MaKhoaHoc WHERE MaMH = 'CSDL')
/* Câu 44*/
SELECT TenMonHoc, Count([MaSV]) AS SoLuongSV
FROM (MonHoc INNER JOIN lop ON MonHoc.MaMonHoc = Lop.MaMonHoc) INNER JOIN SinhVien ON Lop.MaLop = SinhVien.MaLop
GROUP BY MonHoc.MaMonHoc, MonHoc.TenMonHoc
HaVing Count(MaSV)>=All(Select Count(MaSV) From((SinhVien Inner Join Lop On Lop.Malop=SinhVien.Malop) Inner Join 
		MonHoc On MonHoc.MaMonHoc = Lop.MaMonHoc)Group By MonHoc.MaMonHoc)
/* Câu 45*/
SELECT mh.mamh, tenmh, ten, diem 
FROM monhoc mh inner join giangday gd on mh.mamh = gd.mamh inner join ketqua kq on gd.makhoahoc = kq.makhoahoc inner join sinhvien sv on kq.mssv = sv.mssv
 WHERE diem >= ALL(select max(diem) from ketqua inner join giangday on ketqua.makhoahoc = giangday.makhoahoc where mamh = mh.mamh)
/* Câu 46*/
SELECT HocKy, COUNT(MaMH) AS [SO MON HOC DUOC GIANG DAY]
FROM GIANGDAY
GROUP BY HocKy
HAVING COUNT(MaMH) >= ALL (SELECT COUNT(MaMH) FROM GIANGDAY GROUP BY HocKy)
/* Câu 47 LPC*/
SELECT SV.Ten, COUNT(KQ.Diem) AS [Số lượng điểm 7]
FROM dbo.SINHVIEN SV INNER JOIN dbo.KETQUA KQ ON KQ.MaSV = SV.MSSV
WHERE KQ.Diem = 7
GROUP BY SV.Ten
HAVING COUNT(KQ.Diem) >= ALL (SELECT COUNT(Diem) FROM dbo.KETQUA WHERE Diem = 7 AND KQ.MaSV = SV.MSSV)
/* Câu 48 CÔ*/
select sv.Ten, sum(mh.SoTC) as [So luong tin chi]
from SINHVIEN sv, MONHOC mh, KETQUA kq, GIANGDAY gd
where sv.MSSV = kq.MaSV and kq.MaKhoaHoc=gd.MaKhoaHoc and mh.MaMH=gd.MaMH
group by sv.Ten
having sum(mh.SoTC) >= all (select sum(mh.SoTC) from MONHOC mh, GIANGDAY gd,
KETQUA kq where kq.MaKhoaHoc = gd.MaKhoaHoc and gd.MaMH = mh.MaMH group by kq.MaSV)
/* Câu 49*/
SELECT TENMH, TEN, DIEM
FROM SINHVIEN SV INNER JOIN KETQUA KQ ON SV.MSSV = KQ.MaSV
				 INNER JOIN GIANGDAY GD ON KQ.MAKHOAHOC = GD.MAKHOAHOC
				 INNER JOIN (SELECT MAMH, TENMH FROM MONHOC WHERE SOTC <= ALL (SELECT SOTC FROM MONHOC)) MH ON GD.MAMH = MH.MAMH
/* Câu 50*/

-- CÂU 66
SELECT MSSV, Ten
FROM SINHVIEN
WHERE NOT EXISTS (
SELECT MaMH
FROM MONHOC EXCEPT			
SELECT DISTINCT MaMH
FROM GIANGDAY JOIN KETQUA ON 
GIANGDAY.MaKhoaHoc = KETQUA.MaKhoaHoc
		WHERE KETQUA.MaSV = SINHVIEN.MSSV)

--61

select gv.TenGV
from GIAOVIEN gv join GiangDay gd1 tbc
where  not exists
	(
		select * from MonHoc mh tc
		where not exists
		(
			select * from GiangDay gd2
			where gd1.MaGV = gd2.MaGV and gd2.MAMH=mh.MaMH
		)
	)
--62
SELECT TenMH
FROM MONHOC MH JOIN GIANGDAY GD ON MH.MaMH=GD.MaMH
WHERE NOT EXISTS (
	SELECT * FROM GIAOVIEN GV
	WHERE NOT EXISTS (
		SELECT * FROM GIANGDAY GD2
		WHERE GD2.MaGV=GV.MaGV AND GD2.MaGV=GD.MaGV
	)
)
-- 63
SELECT MaKhoaHoc 
   FROM KETQUA
   GROUP BY MaKhoaHoc Having COUNT(Distinct MaSV) = (SELECT COUNT(MaSV) FROM SINHVIEN)

--65
select MONHOC.TenMH
from GIANGDAY join KETQUA KQ1 ON GIANGDAY.MaKhoaHoc = KQ1.MaKhoaHoc JOIN MONHOC ON MONHOC.MaMH = GIANGDAY.MaMH
where  not exists
	(
		select * from GIANGDAY GD
		where not exists
		(
			select * from KETQUA KQ2
			where KQ1.MaSV = KQ2.MaSV and KQ2.MaKhoaHoc=GD.MaKhoaHoc
		)
	)


--=============================== CHƯƠNG 6===================================================
--=============================== BÀI TẬP 2==================================================
--CÂU 1

--CÂU 2
CREATE PROC SP_INSERT_SINHVIEN
	(@MSSV varchar(5) ,
	@Ten nvarchar(50) ,
	@PhaiNu varchar(5) ,
	@DiaChi nvarchar (100),
	@DienThoai varchar (10) ,
	@MaKhoa varchar (10))
AS
BEGIN
	IF @MSSV IS NULL
	 PRINT 'MSSV K DC RONG'
	 ELSE
	 BEGIN
		INSERT SINHVIEN VALUES (@MSSV ,@Ten ,@PhaiNu  ,@DiaChi ,@DienThoai  ,@MaKhoa )
	 END

END

EXEC SP_INSERT_SINHVIEN NULL,'TRAN HONG SON','NO','54 CAO THANG HN',0928345987,'TOAN'
--CÂU 3
IF EXISTS (SELECT * FROM SINHVIEN WHERE MSSV = @Masv And Ten is null)
BEGIN
	UPDATE SINHVIEN SET Ten = @Hoten
	WHERE Mssv = @Masv
END

IF EXISTS (SELECT * FROM SINHVIEN WHERE MSSV = @Masv And DiaChi is null)
BEGIN
	UPDATE SINHVIEN SET DiaChi = @Diachi
	WHERE Mssv = @Masv
END

IF EXISTS (SELECT * FROM SINHVIEN WHERE MSSV = @Masv And MaKhoa is null)
BEGIN
	UPDATE SINHVIEN SET MaKhoa = @Makhoa
	WHERE Mssv = @Masv
END
END
--CÂU 4
