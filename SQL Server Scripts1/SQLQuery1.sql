use Supermarket_Management
go
insert into NhanVien
values('NV01', 'Do Xuan Thuong', '101-NguyenTrai', 'Nu'),('NV02', 'Do Quang Huy', '108-TanPhu,Son Dong, Son Tay', 'Nam'),('NV03', 'Pham Thu Hien', '99-Son Loc, SOn Tay', 'Nu'),('NV04', 'Tran Van Nam', '39-Co Dong, Son Tay', 'Nam'), ('NV05', 'Nguyen Ngoc Minh', '16-Thach That, Hoa Lac, HaNoi ','Nam')
insert into KhachHang
values ('KH01', 'Do Xuan Hoa', 'Vu Ban, Nam Dinh', 'Nam'), ('KH02', 'Vu Anh Tuan', 'Trung Son Tram, Son Tay', 'Nam'), ('KH03', 'Nguyen Huy Vu', 'Xuan Khanh, Son Tay', 'Nam'),('KH04', 'Pham Vu Phuong', 'Xuan Khanh, Son Tay', 'Nu'),('KH05', 'Nguyen Thanh An', 'Kim Son, Ha Noi', 'Nu')
insert into NhaCC
values ('CC01', 'Cong ty banh keo ABC', '18-Trieu Khuc,Ha Noi','0395728746'),('CC02', 'Van phong pham DEF', '74-Le Loi, Thai Binh','0756287464'),('CC03', 'Cong ty DQH', '08-Me Linh, Ha Noi','0391818756')
insert into SanPham
values ('SP01', 'Banh AB' ,'Goi','2024-12-10','CC01',40000 ),('SP02','Keo','Goi','2023-12-9','CC01',25000),('SP03','Keo cao su','cai', '2023-10-14','CC01',1000),('SP04','But','Cai','2025-01-01','CC02',5000),('SP05','Vo','Quyen','2025-01-01','CC02',10000)
insert into SanPham
values ('SP06', 'But Chi','Cai','2022-12-24','CC02',4000),('SP07','Chao chong dinh','Cai','2024-04-11','CC03',100000),('SP08','Noi ap suat','Cai','2030-12-31','CC03',200000)
insert into HoaDon (maHD, ngaylap, giatri,ID_NV,ID_KH)
values 
('HD01','2023-10-12',220000,'NV03','KH05'),
('HD02','2023-10-10',56000,'NV02','KH05'),
('HD03','2023-10-13',300000,'NV01','KH03'),
('HD04','2023-10-10',880000,'NV05','KH01'),
('HD05','2023-10-4',24000,'NV04','KH05'),
('HD06','2023-10-13',490000,'NV02','KH02')
insert into CTHoaDon (maCTHD, maHD, maSP, tenSP, soluong)
values 
('CTHD01-1', 'HD01','SP01', 'Banh AB',3),
('CTHD01-2','HD01','SP02', 'Keo',4);
insert into CTHoaDon (maCTHD, maHD, maSP, tenSP, soluong)
values 
('CTHD02-1', 'HD02', 'SP04' ,'But', 2),
('CTHD02-2','HD02','SP05','Vo',4),
('CTHD02-3','HD02','SP06','But chi',1),
('CTHD02-4','HD02','SP03','Keo cao su',4)
insert into CTHoaDon (maCTHD, maHD, maSP, tenSP, soluong)
values 
('CTHD03-1','HD03','SP07','Chao chong dinh',1),
('CTHD03-2','HD03','SP07','Noi ap suat',1)
insert into CTHoaDon (maCTHD, maHD, maSP, tenSP, soluong)
values 
('CTHD04-1','HD04','SP01','Banh AB',2),
('CTHD04-2','HD04','SP06','But chi',2)
insert into CTHoaDon (maCTHD, maHD, maSP, tenSP, soluong)
values
('CTHD05-1','HD05','SP05','Vo',2),
('CTHD05-2','HD05','SP06','But chi',1)
insert into CTHoaDon (maCTHD, maHD, maSP, tenSP, soluong)
values
('CTHD06-1','HD06','SP08','Noi ap suat',2),
('CTHD06-2','HD06','SP02','Keo',2),
('CTHD06-3','HD06','SP06','But chi',10)


go
select * from NhanVien where NhanVien.gioitinh = 'Nam'
go
select * from SanPham ORDER BY tenSP
go
select * from KhachHang where KhachHang.tenKH like 'Do%'
go
select * from NhanVien, HoaDon where NhanVien.ID_NV = HoaDon.ID_NV and HoaDon.maHD = 'HD02'
go
select CTHoaDon.tenSP, CTHoaDon.maHD from HoaDon,CTHoaDon, SanPham where CTHoaDon.maSP=Sanpham.maSP and Hoadon.maHD=CTHoaDon.maHD and Hoadon.giatri>200000
go
select * from NhanVien, HoaDon 
where NhanVien.ID_NV = HoaDon.ID_NV and HoaDon.maHD = 'HD02'
go
select MAX(ngaylap) as NgayMuaHangGanNhat from HoaDon 
where ID_KH = 'KH_05'
select COUNT(*) as TongNhaCC FROM NhaCC
go
select * from SanPham 
where HSD <= GETDATE()
go
select Khachhang.tenKH,Khachhang.diachi,Hoadon.maHD,Hoadon.giatri,CTHoaDon.tenSP from Khachhang,Hoadon,CTHoaDon 
WHERE Khachhang.ID_KH=HoaDon.ID_KH AND CTHoaDon.maHD=Hoadon.maHD and HoaDon.ngaylap = '2023-10-10'
go
select * from SanPham 
where giatri = (select MAX(giatri) from SanPham)
go
select NhanVien.ID_NV, NhanVien.tenNV, SUM(HoaDon.giatri) as DoanhThu
from NhanVien
join HoaDon on NhanVien.ID_NV = HoaDon.ID_NV
group by NhanVien.ID_NV, NhanVien.tenNV;
go
select MAX(giatri) as GiaTriLonNhat, MIN(giatri) AS GiaTriLonNhat from HoaDon
go
select * from HoaDon
WHERE ngaylap BETWEEN '2023-10-01' AND '2023-10-31'
go
update KhachHang set diachi = 'Ha Noi' where tenKH = 'Do Xuan Hoa'
--select SUM(SanPham.giatri * CTHD.soluong) AS TongGiaTri from SanPham sp JOIN CTHoaDon cthd ON sp.maSP = cthd.maSP WHERE cthd.maHD = 'HD001';
-- DELETE FROM SanPham WHERE maSP = 'SP001'
SELECT TOP 1
    SanPham.maSP,
    SanPham.tenSP,
    SUM(CTHoaDon.soluong) AS SoLuongTieuThu
FROM SanPham
JOIN CTHoaDon ON SanPham.maSP = CTHoaDon.maSP
JOIN HoaDon ON CTHoaDon.maHD = HoaDon.maHD
WHERE HoaDon.ngaylap = '2023-10-10'
GROUP BY SanPham.maSP, SanPham.tenSP
ORDER BY SoLuongTieuThu DESC;
