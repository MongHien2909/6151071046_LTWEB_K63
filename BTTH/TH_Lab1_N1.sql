create database QLBANSACH
GO
use QLBANSACH

GO
CREATE TABLE KHACHHANG
(
	MaKH INT IDENTITY(1,1),
	HoTen nVarchar(50) NOT NULL,
	Taikhoan Varchar(50) UNIQUE,
	Matkhau Varchar(50) NOT NULL,
	Email Varchar(100) UNIQUE,
	DiachiKH nVarchar(200),
	DienthoaiKH Varchar(50),
	Ngaysinh DATETIME
	CONSTRAINT PK_Khachhang PRIMARY KEY(MaKH)
)

GO
Create Table CHUDE
(
	MaCD int Identity(1,1),
	TenChuDe nvarchar(50) NOT NULL,
	CONSTRAINT PK_ChuDe PRIMARY KEY(MaCD)
)

GO
Create Table NHAXUATBAN
(
	MaNXB int identity(1,1),
	TenNXB nvarchar(50) NOT NULL,
	Diachi NVARCHAR(200),
	DienThoai VARCHAR(50),
	CONSTRAINT PK_NhaXuatBan PRIMARY KEY(MaNXB)
)

GO
CREATE TABLE SACH
(
	Masach INT IDENTITY(1,1),
	Tensach NVARCHAR(100) NOT NULL,
	Giaban Decimal(18,0) CHECK (Giaban>=0),
	Mota NVarchar(Max),
	Anhbia VARCHAR(50),
	Ngaycapnhat DATETIME,
	Soluongton INT,
	MaCD INT,
	MaNXB INT,
	Constraint PK_Sach Primary Key(Masach),
	Constraint FK_Chude Foreign Key(MaCD) References CHUDE(MaCD),
	Constraint FK_NhaXB Foreign Key(MaNXB) References NHAXUATBAN(MANXB)
)

GO
CREATE TABLE TACGIA
(
	MaTG INT IDENTITY(1,1),
	TenTG NVARCHAR(50) NOT NULL,
	Diachi NVARCHAR(100),
	Tieusu nVarchar(Max),
	Dienthoai VARCHAR(50),
	CONSTRAINT PK_TacGia PRIMARY KEY(MaTG)
)


GO
CREATE TABLE VIETSACH
(
	MaTG INT NOT NULL,
	Masach INT NOT NULL,  
	Vaitro NVARCHAR(50) NULL,
	Vitri NVARCHAR(50) NULL,
	CONSTRAINT FK_VIETSACH_TACGIA FOREIGN KEY (MaTG) REFERENCES TACGIA(MaTG),
	CONSTRAINT FK_VIETSACH_SACH FOREIGN KEY (Masach) REFERENCES SACH(Masach),
	CONSTRAINT PK_VIETSACH PRIMARY KEY (MaTG, Masach)
)

GO
CREATE TABLE DONDATHANG
(
	MaDonHang INT IDENTITY(1,1),
	Dathanhtoan bit,
	Tinhtranggiaohang bit,
	Ngaydat Datetime,
	Ngaygiao Datetime,
	MaKH INT,
	CONSTRAINT FK_Khachhang FOREIGN KEY (MaKH) REFERENCES KHACHHANG(MaKH),
	CONSTRAINT PK_DonDatHang PRIMARY KEY (MaDonHang)
)

Go
CREATE TABLE CHITIETDONTHANG
(
	MaDonHang INT,
	Masach INT,
	Soluong Int Check(Soluong>0),
	Dongia Decimal(18,0) Check(Dongia>=0),
	CONSTRAINT PK_CTDatHang PRIMARY KEY(MaDonHang,Masach),
	CONSTRAINT FK_Donhang FOREIGN KEY (MaDonHang) REFERENCES Dondathang(MaDonHang),
	CONSTRAINT FK_Sach FOREIGN KEY (Masach) REFERENCES Sach(Masach)
)

SELECT * FROM CHUDE;

INSERT INTO CHUDE (TenChuDe)
VALUES 
(N'Literature'),
(N'Science'),
(N'Technology'),
(N'History'),
(N'Philosophy');



INSERT INTO SACH (Tensach, Giaban, Mota, Anhbia, Ngaycapnhat, Soluongton, MaCD, MaNXB)
VALUES 
(N'Product 1', 100000, N'Description of Product 1', 'templatemo_image_02.jpg', GETDATE(), 50, 1, 1),
(N'Product 2', 150000, N'Description of Product 2', 'templatemo_image_02.jpg', GETDATE(), 30, 1, 1),
(N'Product 3', 200000, N'Description of Product 3', 'templatemo_image_02.jpg', GETDATE(), 20, 2, 2),
(N'Product 4', 250000, N'Description of Product 4', 'templatemo_image_02.jpg', GETDATE(), 10, 2, 2),
(N'Product 5', 300000, N'Description of Product 5', 'templatemo_image_02.jpg', GETDATE(), 5, 3, 3);

INSERT INTO NHAXUATBAN (TenNXB, Diachi, DienThoai)
VALUES 
(N'Publisher A', N'123 Main St, City A', '0123456789'),
(N'Publisher B', N'456 Elm St, City B', '0987654321'),
(N'Publisher C', N'789 Maple Ave, City C', '0234567890'),
(N'Publisher D', N'101 Oak Rd, City D', '0345678901'),
(N'Publisher E', N'202 Pine Blvd, City E', '0456789012');

INSERT INTO TACGIA (TenTG, Diachi, Tieusu, Dienthoai) VALUES 
('Tác giả 1', 'Địa chỉ 1', 'Tiểu sử tác giả 1', '0123456789'),
('Tác giả 2', 'Địa chỉ 2', 'Tiểu sử tác giả 2', '0123456788'),
('Tác giả 3', 'Địa chỉ 3', 'Tiểu sử tác giả 3', '0123456787'),
('Tác giả 4', 'Địa chỉ 4', 'Tiểu sử tác giả 4', '0123456786'),
('Tác giả 5', 'Địa chỉ 5', 'Tiểu sử tác giả 5', '0123456785');

