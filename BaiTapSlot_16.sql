create table KhachHang (
TenKH nvarchar (50) Primary Key not null,
DiaChiKH nvarchar (150) not null,
SDT varchar (10) not null unique,
)

create table SanPham (
TenSP nvarchar (50) Primary Key not null,
GiaSP  money not null,
MoTaSP nvarchar (255) not null,
DonVi nvarchar (30) not null,
)

create table HoaDon (
IdHoaDon int Primary Key, 
ThoiGianHoaDon date not null,
TenKH nvarchar (50) Foreign Key references KhachHang (TenKH)
)

create table HoaDon_SanPham (
ID_hoadon int Foreign Key references HoaDon(IdHoaDon),
TenSP nvarchar (50) Foreign Key references SanPham (TenSP),
SoLuong int not null,
)

drop table KhachHang
drop table SanPham
drop table HoaDon
drop table HoaDon_SanPham

--Bài 2
insert into KhachHang (TenKH, DiaChiKH, SDT) values 
	   ('Nguyễn Văn An','111 Nguyễn Trãi, Thanh Xuân, Hà Nội', '987654321')

insert into SanPham (TenSP, GiaSP, MoTaSP, DonVi) values 
	   ('Máy tính T450', 1000, 'Máy nhập mới', 'Chiếc'),
	   ('Điện thoại Nokia5670', 200, 'Điện thoại đang hot', 'Chiếc'),
	   ('Máy In Samsung 450', 100, 'Máy in đang ế', 'Chiếc')

insert into HoaDon (IdHoaDon, ThoiGianHoaDon, TenKH) values 
	   (123, '11-18-09', 'Nguyễn Văn An')

insert into HoaDon_SanPham (ID_hoadon, TenSP, SoLuong) values
((select IdHoaDon from HoaDon where IdHoaDon like 123), (select TenSP from SanPham where TenSP like 'Máy tính T450'),1),
((select IdHoaDon from HoaDon where IdHoaDon like 123), (select TenSP from SanPham where TenSP like 'Điện thoại Nokia5670'),2),
((select IdHoaDon from HoaDon where IdHoaDon like 123), (select TenSP from SanPham where TenSP like 'Máy In Samsung 450'),1)

select * from KhachHang
select * from SanPham
select * from HoaDon
select * from HoaDon_SanPham

--Bài 3

	--Khách hàng Nguyễn Thị Bích
insert into KhachHang (TenKH, DiaChiKH, SDT) values 
	   ('Nguyễn Thị Bích','25 Thái Hà, Đống Đa, Hà Nội', '986257445')

insert into SanPham (TenSP, GiaSP, MoTaSP, DonVi) values 
	   ('Điện thoại Iphone 12', 1500, 'Điện thoại SecondHand', 'Chiếc'),
	   ('Máy tính Legion 5', 4000, 'Máy tính đang hot', 'Chiếc'),
	   ('TV Samsung 15 inch', 1100, 'TV tồn kho được giảm giá', 'Chiếc')

insert into HoaDon (IdHoaDon, ThoiGianHoaDon, TenKH) values 
	   (124, '05-18-10', 'Nguyễn Thị Bích')

insert into HoaDon_SanPham (ID_hoadon, TenSP, SoLuong) values
((select IdHoaDon from HoaDon where IdHoaDon like 124), (select TenSP from SanPham where TenSP like 'Điện thoại Iphone 12'),3),
((select IdHoaDon from HoaDon where IdHoaDon like 124), (select TenSP from SanPham where TenSP like 'Máy tính Legion 5'),1),
((select IdHoaDon from HoaDon where IdHoaDon like 124), (select TenSP from SanPham where TenSP like 'TV Samsung 15 inch'),2)

select * from KhachHang
select * from SanPham
select * from HoaDon
select * from HoaDon_SanPham

	--Khách hàng Trần Phương Tuấn
insert into KhachHang (TenKH, DiaChiKH, SDT) values 
	   ('Trần Phương Tuấn','36 Tôn Thất Thuyết, Cầu Giấy, Hà Nội', '352478129')

insert into SanPham (TenSP, GiaSP, MoTaSP, DonVi) values 
	   ('Tai Nghe Airpods Pro', 500, 'Phụ kiện Apple', 'Chiếc'),
	   ('Bút Applepen', 800, 'Phụ kiện Apple', 'Chiếc'),
	   ('Ipad pro Gen 11', 1500, 'Ipad mới nhập', 'Chiếc')

insert into HoaDon (IdHoaDon, ThoiGianHoaDon, TenKH) values 
	   (125, '12-12-12', 'Trần Phương Tuấn')

insert into HoaDon_SanPham (ID_hoadon, TenSP, SoLuong) values
((select IdHoaDon from HoaDon where IdHoaDon like 125), (select TenSP from SanPham where TenSP like 'Tai Nghe Airpods Pro'),1),
((select IdHoaDon from HoaDon where IdHoaDon like 125), (select TenSP from SanPham where TenSP like 'Bút Applepen'),1),
((select IdHoaDon from HoaDon where IdHoaDon like 125), (select TenSP from SanPham where TenSP like 'Ipad pro Gen 11'),2)

select * from KhachHang
select * from SanPham
select * from HoaDon
select * from HoaDon_SanPham

--Bài 4
select TenKH as KhachHang from HoaDon group by TenKH
select * from SanPham
select * from HoaDon

--Bài 5
select * from KhachHang order by TenKH ASC
select * from SanPham order by TenSP DESC
select TenSP from SanPham where TenSP 
	in (select TenSP from HoaDon_SanPham where ID_hoadon 
		in (select IdHoaDon from HoaDon where TenKH like 'Nguyễn Văn An'))

--Bài 6
select count(*) as SoLuong_KH from KhachHang group by TenKH
select count(*) as SoLuong_SP from SanPham

select KhachHang.TenKH, HoaDon.IdHoaDon, sum(SoLuong * GiaSP) as TongGiaTien from KhachHang
											join HoaDon on KhachHang.TenKH = HoaDon.TenKH
											join HoaDon_SanPham on HoaDon.IdHoaDon = HoaDon_SanPham.ID_hoadon
											join SanPham on HoaDon_SanPham.TenSP = SanPham.TenSP
											group by KhachHang.TenKH, HoaDon.IdHoaDon;

--Bài 7
update SanPham set GiaSP = GiaSP where GiaSP > 0

update KhachHang set SDT = '0' + SDT where left (SDT, 1) <> '0'

--Xác định khóa chính của bảng KhachHang
select column_name from information_schema.key_column_usage where table_name = 'KhachHang' and constraint_name like 'PK_%'

--Xác định khóa chính của bảng SanPham
select column_name from information_schema.key_column_usage where table_name = 'SanPham' and constraint_name like 'PK_%'

--Xác định khóa ngoại của bảng HoaDon
select 
    fk.name as [constraintname], 
    object_name(fk.parent_object_id) as [tablename], 
    col_name(fkc.parent_object_id, fkc.parent_column_id) as [columnname], 
    object_name(fk.referenced_object_id) as [referencedtablename], 
    col_name(fkc.referenced_object_id, fkc.referenced_column_id) as [referencedcolumnname] 
from sys.foreign_keys as fk 
inner join sys.foreign_key_columns as fkc on fk.object_id = fkc.constraint_object_id 
where object_name(fk.parent_object_id) = 'HoaDon'

--Xác định khóa ngoại của bảng HoaDon_SanPham
select 
    fk.name as [constraintname], 
    object_name(fk.parent_object_id) as [tablename], 
    col_name(fkc.parent_object_id, fkc.parent_column_id) as [columnname], 
    object_name(fk.referenced_object_id) as [referencedtablename], 
    col_name(fkc.referenced_object_id, fkc.referenced_column_id) as [referencedcolumnname] 
from sys.foreign_keys as fk 
inner join sys.foreign_key_columns as fkc on fk.object_id = fkc.constraint_object_id 
where object_name(fk.parent_object_id) = 'HoaDon_SanPham'

--Bài 8