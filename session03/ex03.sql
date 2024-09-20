create database session03_ex03;
use session03_ex03;

create table PhieuXuat(
soPx int auto_increment primary key,
ngayXuat datetime
);

create table VatTu(
maVt int auto_increment primary key,
tenVt varchar(255)
);
create table PhieuNhap(
soPn int auto_increment primary key,
ngayNhap datetime
);
create table PhieuNhapChiTiet(
soPn int,foreign key(soPn) references PhieuNhap(soPn),
maVt int, foreign key(maVt) references VatTu(maVt),
donGiaNhap double,
soLuongNhap int 
);
create table PhieuXuatChiTiet(
soPx int,foreign key(soPx) references PhieuXuat(soPx),
maVt int,foreign key(maVt) references VatTu(maVt),
donGiaXuat double,
soLuongXuat int
);


create table NhaCungCap(
maNCC int auto_increment primary key,
tenNCC varchar(255),
diaChi varchar(255),
soDienThoai varchar(11)
);

create table DonDatHang(
soDH int auto_increment primary key,
maNCC int,foreign key(maNCC) references NhaCungCap(maNCC),
ngayDH datetime
);

create table ChiTietDonHang(
maVt int, foreign key(maVt) references VatTu(maVt),
soDH int,foreign key(soDH) references DonDatHang(soDH)
);


-- Thêm dữ liệu vào bảng PhieuXuat
INSERT INTO PhieuXuat (ngayXuat) VALUES 
('2023-09-01 10:00:00'),
('2023-09-05 14:30:00'),
('2023-09-10 09:45:00'),
('2023-09-15 12:00:00'),
('2023-09-20 16:15:00');

-- Thêm dữ liệu vào bảng VatTu
INSERT INTO VatTu (tenVt) VALUES 
('Vật liệu A'),
('Vật liệu B'),
('Vật liệu C'),
('Vật liệu D'),
('Vật liệu E');

-- Thêm dữ liệu vào bảng PhieuNhap
INSERT INTO PhieuNhap (ngayNhap) VALUES 
('2023-08-01 08:00:00'),
('2023-08-06 13:30:00'),
('2023-08-11 10:15:00'),
('2023-08-16 15:00:00'),
('2023-08-21 09:00:00');

-- Thêm dữ liệu vào bảng PhieuNhapChiTiet
INSERT INTO PhieuNhapChiTiet (soPn, maVt, donGiaNhap, soLuongNhap) VALUES 
(1, 1, 100000, 10),
(2, 2, 120000, 15),
(3, 3, 130000, 20),
(4, 4, 140000, 25),
(5, 5, 150000, 30);

-- Thêm dữ liệu vào bảng PhieuXuatChiTiet
INSERT INTO PhieuXuatChiTiet (soPx, maVt, donGiaXuat, soLuongXuat) VALUES 
(1, 1, 110000, 5),
(2, 2, 125000, 8),
(3, 3, 135000, 12),
(4, 4, 145000, 10),
(5, 5, 155000, 15);

-- Thêm dữ liệu vào bảng NhaCungCap
INSERT INTO NhaCungCap (tenNCC, diaChi, soDienThoai) VALUES 
('Nhà cung cấp 1', 'Địa chỉ 1', '0901234567'),
('Nhà cung cấp 2', 'Địa chỉ 2', '0902345678'),
('Nhà cung cấp 3', 'Địa chỉ 3', '0903456789'),
('Nhà cung cấp 4', 'Địa chỉ 4', '0904567890'),
('Nhà cung cấp 5', 'Địa chỉ 5', '0905678901');

-- Thêm dữ liệu vào bảng DonDatHang
INSERT INTO DonDatHang (maNCC, ngayDH) VALUES 
(1, '2024-2-13 10:00:00'),
(2, '2024-2-12 14:30:00'),
(3, '2023-07-10 09:45:00'),
(4, '2023-07-15 12:00:00'),
(5, '2023-07-20 16:15:00');

-- Thêm dữ liệu vào bảng ChiTietDonHang
INSERT INTO ChiTietDonHang (maVt, soDH) VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);


select *  from PhieuXuatChiTiet;


SELECT maVt, soLuongXuat 
FROM PhieuXuatChiTiet 
where soLuongXuat =(
select max(soLuongXuat) 
from PhieuXuatChiTiet)
;
select * from VatTu;

select PhieuNhapChiTiet.maVt, VatTu.tenVt ,PhieuNhapChiTiet.soLuongNhap from PhieuNhapChiTiet join VatTu on PhieuNhapChiTiet.maVt = VatTu.maVt && PhieuNhapChiTiet.soLuongNhap = (
select max(soLuongNhap) from PhieuNhapChiTiet) group by PhieuNhapChiTiet.maVt , VatTu.tenVt, PhieuNhapChiTiet.soLuongNhap
;


select * from NhaCungCap;
select * from DonDatHang;
SELECT NhaCungCap.tenNCC, NhaCungCap.diaChi, NhaCungCap.soDienThoai, DonDatHang.ngayDH
FROM NhaCungCap
JOIN DonDatHang ON NhaCungCap.maNCC = DonDatHang.maNCC
WHERE DonDatHang.ngayDH BETWEEN '2024-02-12 00:00:00' AND '2024-02-22 23:59:59';


