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
	HSD nvarchar(15) not null,
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

create table PhieuNhap(
	maPN varchar(20) primary key not null,
    ngaynhap date not null,
    giatrinhap int not null,
    ID_NV nvarchar(10) not null,
    
    Foreign key(ID_NV) references Nhanvien(ID_NV)
)

create table CTPhieuNhap(
	maPN nvarchar(20) primary key not null,
    maSP nvarchar(10) not null,
    tenSP nvarchar(30) not null,
    slNhap int not null,
    
    Foreign key(maSP) references SanPham(maSP)
)    

create table PhieuXuat(
	maPX varchar(20) primary key not null,
    ngayxuat date not null,
    giatrixuat int not null,
    ID_NV nvarchar(10) not null,
    
    Foreign key(ID_NV) references Nhanvien(ID_NV)
)

create table CTPhieuXuat(
	maPX nvarchar(20) primary key not null,
    maSP nvarchar(10) not null,
    tenSP nvarchar(30) not null,
    slXuat int not null,
    
    Foreign key(maSP) references SanPham(maSP)
) 

insert into NhanVien
values('NV01', 'Do Xuan Thuong', '101-NguyenTrai', 'Nu'),('NV02', 'Do Quang Huy', '108-TanPhu,Son Dong, Son Tay', 'Nam'),('NV03', 'Pham Thu Hien', '99-Son Loc, SOn Tay', 'Nu'),('NV04', 'Tran Van Nam', '39-Co Dong, Son Tay', 'Nam'), ('NV05', 'Nguyen Ngoc Minh', '16-Thach That, Hoa Lac, HaNoi ','Nam')
insert into KhachHang
values ('KH01', 'Do Xuan Hoa', 'Vu Ban, Nam Dinh', 'Nam'), ('KH02', 'Vu Anh Tuan', 'Trung Son Tram, Son Tay', 'Nam'), ('KH03', 'Nguyen Huy Vu', 'Xuan Khanh, Son Tay', 'Nam'),('KH04', 'Pham Vu Phuong', 'Xuan Khanh, Son Tay', 'Nu'),('KH05', 'Nguyen Thanh An', 'Kim Son, Ha Noi', 'Nu')
insert into NhaCC
values('CC01', 'Cong ty banh keo ABC', '18-Trieu Khuc,Ha Noi','0395728746'),('CC02', 'Van phong pham DEF', '74-Le Loi, Thai Binh','0756287464'),('CC03', 'Cong ty DQH', '08-Me Linh, Ha Noi','0391818756')
insert into SanPham
values ('SP01', 'Banh AB' ,'Goi', 10/12/2024, )




-- select * from NhanVien where NhanVien.gioitinh = 'Nam'
-- SELECT * FROM SanPham ORDER BY tenSP
-- select CTHoaDon.tenSP, CTHoaDon.maHD from HoaDon,CTHoaDon, SanPham where CTHD.maSP=Sanpham.maSP and Hoadon.maHD=CTHD.maHD and Hoadon.giatri>1000000)
-- select * from KhachHang where KhachHang.tenKH like 'Do%'
-- select ID_NV,tenNV from NhanVien, HoaDon where NhanVien.ID_NV = HoaDon.ID_NV and HoaDon.maHD = 'HD02'
-- SELECT MAX(ngaylap) AS LatestPurchaseDate FROM HoaDon WHERE ID_KH = 'CustomerID'
-- SELECT COUNT(*) AS SupplierCount FROM NhaCC;
-- select Khachhang.tenKH,Khachhang.diachi,Hoadon.maHD,Hoadon.giatri,CTHD.tenSP FROM Khachhang,Hoadon,CTHD WHERE Khachhang.tenKH=CTHD.tenKH AND CTHD.maHD=Hoadon.maHD and HoaDon.ngaylap = 11/10/2023
-- select Sanpham.maSP,Sanpham.tenSP,CTPNhap.slNhap,PNhap.giatrinhap,NhaCC.tenNhaCC, NhaCC.diachi from Sanpham,CTPNhap,NhaCC,PNhap where Sanpham.maNhaCC=NhaCC.maNhaCC and PNhap.maPN=CTPNhap.maPN and CTPNhap.maSP=Sanpham.maSP and Nhacc.tenNhaCC=@TENNHACC
-- SELECT * FROM SanPham WHERE HSD <= CURDATE()
--SELECT * FROM SanPham WHERE giatri = (SELECT MAX(giatri) FROM SanPham)
-- select Sanpham.maSP,Sanpham.tenSP FROM Sanpham,PXuat,CTPXuat WHERE  Sanpham.maSP=CTPXuat.maSP AND CTPXuat.maPX=CTPXuat.maPX AND PXuat.ngayxuat= 13/9/2023
-- select ID_NV, tenNV, SUM(HoaDon.giatri) from NhanVien, HoaDon WHERE Hoadon.ID_NV=Nhanvien.ID_NV group by NhanVien.ID_NV
-- select maSP,tenSP FROM CTPNhap,Sanpham WHERE CTPNhap.maSP=Sanpham.maSP and CTPNhap.soluong > 5000
-- select SUM(PhieuXuat.giatrixuat) from PhieuXuat where PhieuXuat.ngayxuat = 12/10/2023
-- SELECT MAX(giatri) AS MaxValue, MIN(giatri) AS MinValue FROM HoaDon
-- SELECT * FROM HoaDon WHERE ngaylap BETWEEN '2023-01-01' AND '2023-12-31'
-- UPDATE KhachHang SET diachi = 'New Address' WHERE tenKH = 'John Doe'
-- SELECT SUM(sp.giatri * cthd.soluong) AS TotalValue FROM SanPham sp JOIN CTHoaDon cthd ON sp.maSP = cthd.maSP WHERE cthd.maHD = 'HD001';
-- DELETE FROM SanPham WHERE maSP = 'SP001'



