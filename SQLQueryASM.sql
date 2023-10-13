create database Supermarket_Management
go
use Supermarket_Management
go
create table NhanVien(
	ID_NV nvarchar(10) primary key not null,
	tenNV nvarchar(30) not null,
	diachi nvarchar(30) not null,
	gioitinh nvarchar(5) not null,
)
create table KhachHang(
	ID_KH nvarchar(10) primary key not null,
	tenKH nvarchar(30) not null,
	diachi nvarchar(30) not null,
	gioitinh nvarchar(5) not null,
)
create table NhaCC(
	maNhaCC nvarchar(10) primary key not null,
    tenNhaCC nvarchar(20) not null,
    diachi nvarchar(20) not null,
    sdt nvarchar(10) not null,
)

create table SanPham(
	maSP nvarchar(10) primary key not null,
	tenSP nvarchar(30) not null,
	DVT nvarchar(10) not null,
	HSD date not null,
	maNhaCC nvarchar(10) not null,
	giatri int not null,
    
    Foreign key(maNhaCC) references NhaCC(maNhaCC)
)
create table HoaDon(
	maHD nvarchar(10) primary key,
	ngaylap date not null,
	giatri int not null,
	ID_NV nvarchar(10) not null,
    ID_KH nvarchar(10) not null,

	Foreign key(ID_NV) references NhanVien(ID_NV),
    Foreign key(ID_KH) references KhachHang(ID_KH)
)
create table CTHoaDon(
	maCTHD varchar(10) primary key not null,
    maHD nvarchar(10) not null,
    maSP nvarchar(10) not null,
    tenSP nvarchar(30) not null,
    soluong int not null,
    
    Foreign key(maHD) references HoaDon(maHD),
    Foreign key(maSP) references SanPham(maSP)
)




insert into NhanVien
values('NV01', 'Do Xuan Thuong', '101-NguyenTrai', 'Nu'),('NV02', 'Do Quang Huy', '108-TanPhu,Son Dong, Son Tay', 'Nam'),('NV03', 'Pham Thu Hien', '99-Son Loc, SOn Tay', 'Nu'),('NV04', 'Tran Van Nam', '39-Co Dong, Son Tay', 'Nam'), ('NV05', 'Nguyen Ngoc Minh', '16-Thach That, Hoa Lac, HaNoi ','Nam')
insert into KhachHang
values ('KH01', 'Do Xuan Hoa', 'Vu Ban, Nam Dinh', 'Nam'), ('KH02', 'Vu Anh Tuan', 'Trung Son Tram, Son Tay', 'Nam'), ('KH03', 'Nguyen Huy Vu', 'Xuan Khanh, Son Tay', 'Nam'),('KH04', 'Pham Vu Phuong', 'Xuan Khanh, Son Tay', 'Nu'),('KH05', 'Nguyen Thanh An', 'Kim Son, Ha Noi', 'Nu')
insert into NhaCC
values ('CC01', 'Cong ty banh keo ABC', '18-Trieu Khuc,Ha Noi','0395728746'),('CC02', 'Van phong pham DEF', '74-Le Loi, Thai Binh','0756287464'),('CC03', 'Cong ty DQH', '08-Me Linh, Ha Noi','0391818756')
insert into SanPham
values ('SP01', 'Banh AB' ,'Goi', 10/12/2024,'CC01',40000 ),('SP02','Keo','Goi',9/12/2023,'CC01',25000),('SP03','Keo cao su','cai', 14/10/2023,'CC01',1000),('SP04','But','Cai',01/01/2025,'CC02',5000),('SP05','Vo','Quyen',01/01/2025,'CC02',10000)
insert into SanPham
values ('SP06', 'But Chi','Cai',24/12/2022,'CC02',4000),('SP07','Chao chong dinh','Cai',11/04/2024,'CC03',100000),('SP08','Noi ap suat','Cai',31/12/2030,'CC03',200000)
insert into HoaDon
values 
('HD01',12/10/2023,220000,'NV03','KH05'),
('HD02',10/10/2023,56000,'NV02','KH05'),
('HD03',13/10/2023,300000,'NV01','KH03'),
('HD04',10/10/2023,880000,'NV05','KH01'),
('HD05',10/10/2023,24000,'NV04','KH05'),
('HD06',10/10/2023,490000,'NV02','KH02')
insert into CTHoaDon
values 
('CTHD01-1', 'HD01','SP01', 'Banh AB',3),
('CTHD01-2','HD01','SP02', 'Keo',4)
insert into CTHoaDon
values 
('CTHD02-1', 'HD02', 'SP04' ,'But', 2),
('CTHD02-2','HD02','SP05','Vo',4),
('CTHD02-3','HD02','SP06','But chi',1),
('CTHD02-4','HD02','SP03','Keo cao su',4)
insert into CTHoaDon
values 
('CTHD03-1','HD03','SP07','Chao chong dinh',1),
('CTHD03-2','HD03','SP07','Noi ap suat',1)
insert into CTHoaDon
values 
('CTHD04-1','HD04','SP01','Banh AB',2),
('CTHD04-2','HD04','SP06','But chi',2)
insert into CTHoaDon
values
('CTHD05-1','HD05','SP05','Vo',2),
('CTHD05-2','HD05','SP06','But chi',1)
insert into CTHoaDon
values
('CTHD06-1','HD06','SP08','Noi ap suat',2),
('CTHD06-2','HD06','SP02','Keo',2),
('CTHD06-3','HD06','SP06','But chi',10)




-- tìm các nhân viên có giới tính là nam
select * from NhanVien 
where NhanVien.gioitinh = 'Nam'
go
-- xuất ra các sản phẩm có thứ tự tăng dần theo sắp xếp theo tên sản phẩm
SELECT * FROM SanPham ORDER BY tenSP
go 
-- xuất ra tên sản phẩm, mã hóa đơn mà giá trị hóa đơn đó trên 1000000
 select CTHoaDon.tenSP, CTHoaDon.maHD from HoaDon,CTHoaDon, SanPham where CTHD.maSP=Sanpham.maSP and Hoadon.maHD=CTHD.maHD and Hoadon.giatri>1000000)
 go
-- xuất ra những khách hàng có họ là Do
select * from KhachHang 
where KhachHang.tenKH like 'Do%'
go
-- xuất ra tên và id nhân viên đã lập hóa đơn có mã hóa đơn là HD02
select ID_NV,tenNV from NhanVien, HoaDon 
where NhanVien.ID_NV = HoaDon.ID_NV and HoaDon.maHD = 'HD02'
go
-- xuất ra ngày mua gần nhất của khách hàng có id là KH03
SELECT MAX(ngaylap) AS NgayMuaGanNhat FROM HoaDon 
WHERE ID_KH = 'KH03'
go
-- đếm số lượng nhà cung cấp
 SELECT COUNT(*) AS NhaCC FROM NhaCC
go
-- xuất ra thông tin của khách hàng ,mã hóa đơn, sản phẩm mà hóa đơn đó lập vào ngày '2023-13-10'
select Khachhang.tenKH,Khachhang.diachi,Hoadon.maHD,Hoadon.giatri,CTHD.tenSP FROM Khachhang,Hoadon,CTHD \
WHERE Khachhang.tenKH=CTHD.tenKH AND CTHD.maHD=Hoadon.maHD and HoaDon.ngaylap = '2023-13-10'
go
--  chọn ra sản phẩm đã hết hạn sử dụng
SELECT * FROM SanPham 
WHERE HSD <= CURDATE()
go
-- chọn ra sản phẩm có giá trị cao nhất
SELECT * FROM SanPham 
WHERE giatri = (SELECT MAX(giatri) FROM SanPham)
go
-- xuất ra id và tên nhân viên cùng với doanh số bán hàng của họ
select ID_NV, tenNV, SUM(HoaDon.giatri) from NhanVien, HoaDon WHERE Hoadon.ID_NV=Nhanvien.ID_NV group by NhanVien.ID_NV
go
-- tìm ra hóa đơn có giá trị thấp nhất và cao nhất
SELECT MAX(giatri) AS MaxValue, MIN(giatri) AS MinValue FROM HoaDon
go
-- xuất ra thông tin hóa các hóa đơn được lập trong th
SELECT * FROM HoaDon 
WHERE ngaylap BETWEEN '2023-01-01' AND '2023-12-31'
go
-- cập nhật địa chỉ mới của khách hàng
UPDATE KhachHang SET diachi = 'New Address' WHERE tenKH = 'Do Xuan Hoa'
-- xuất ra tổng giá trị hóa đơn có mã hóa đơn là HD01
SELECT SUM(sp.giatri * cthd.soluong) AS TotalValue FROM SanPham sp JOIN CTHoaDon cthd ON sp.maSP = cthd.maSP WHERE cthd.maHD = 'HD001';
-- xóa sản phẩm theo mã sản phẩm
DELETE FROM SanPham WHERE maSP = 'SP001'




