DROP DATABASE bansachonline;

CREATE DATABASE bansachonline;

use bansachonline;
CREATE TABLE ADMINS (
     ma_Admin VARCHAR(10),
	 taikhoan_Admin VARCHAR(20) UNIQUE,
	 matkhau_Admin VARCHAR(50),
	 hoten_Admin NVARCHAR(60),
	 gmail_Admin VARCHAR(100) UNIQUE,

	 CONSTRAINT AM_maAmin_PK PRIMARY KEY(ma_Admin)
);

CREATE TABLE CUSTOMER(
	 ma_Customer VARCHAR(10),
	 taikhoan_Customer VARCHAR(20) UNIQUE,
	 matkhau_Customer VARCHAR(20),
	 hoten_Customer NVARCHAR(50),
	 gmail_Customer VARCHAR(100) UNIQUE,
     sdt_Customer VARCHAR(10) UNIQUE,

	 CONSTRAINT CUSTOMER_maCustomer_PK PRIMARY KEY(ma_Customer)
);

CREATE TABLE SHIPPER(
     ma_Shipper VARCHAR(10),
     taikhoan_Shipper VARCHAR(20) UNIQUE,
     matkhau_Shipper VARCHAR(20),
     hoten_Shipper NVARCHAR(50),
     gmail_Shipper VARCHAR(100) UNIQUE,

     CONSTRAINT SHIPPER_maShipper_PK PRIMARY KEY(ma_Shipper)
);

CREATE TABLE DAUSACH
(
	 ma_DauSach VARCHAR(10),
	 ten_DauSach NVARCHAR(50),

	 CONSTRAINT DS_maDS_PK PRIMARY KEY(ma_DauSach)
);

CREATE TABLE NHAXUATBAN
(
	 ma_NXB VARCHAR(10),
	 ten_NXB NVARCHAR(50),
	 diachi_NXB NVARCHAR(100),
	 sdt_NXB VARCHAR(15),

	 CONSTRAINT NXB_maNXB_PK PRIMARY KEY(ma_NXB)
);

CREATE TABLE TACGIA
(
	 ma_TG VARCHAR(10),
	 ten_tG NVARCHAR(50),

	 CONSTRAINT TG_maTG_PK PRIMARY KEY(ma_TG)
);

CREATE TABLE CUONSACH
(
	 ma_CuonSach VARCHAR(10),
	 ten_CuonSach NVARCHAR(60),
	 ma_DauSach VARCHAR(10),
	 ma_TG VARCHAR(10),
	 ma_NXB VARCHAR(10),
	 soluong INT,
	 gianhap INT,
	 giaban INT,
	 ngaydang DATETIME,
	 anh_CuonSach VARCHAR(150),
	 sachKM CHAR(4) CONSTRAINT CS_sachKM_CHK CHECK(sachKM IN ('Yes', 'No')),
	 sachBC CHAR(4) CONSTRAINT CS_sachBC_CHK CHECK(sachBC IN ('Yes', 'No')),

	 CONSTRAINT CS_maCuonSach_PK PRIMARY KEY(ma_CuonSach),
	 CONSTRAINT CS_maDS_FK FOREIGN KEY (ma_DauSach) REFERENCES DAUSACH(ma_DauSach),
	 CONSTRAINT CS_maNXB_FK FOREIGN KEY (ma_NXB) REFERENCES NHAXUATBAN(ma_NXB),
	 CONSTRAINT CS_maTG_FK FOREIGN KEY (ma_TG) REFERENCES TACGIA(ma_TG)
);

CREATE TABLE GIOHANG
(
	 ma_GH VARCHAR(10),
	 ma_CuonSach VARCHAR(10),
	 soluong INT,

	 CONSTRAINT GH_maGH_PK PRIMARY KEY(ma_GH,ma_CuonSach),
	 CONSTRAINT GH_maCS_FK FOREIGN KEY (ma_CuonSach) REFERENCES CUONSACH(ma_CuonSach)
);

CREATE TABLE DONHANG
(
	 ma_DH VARCHAR(10),
	 ma_Customer VARCHAR(10),
     ma_Admin VARCHAR(10),
	 diachi NVARCHAR(100),
	 sdt VARCHAR(15),
	 tongtien INT,
     ngaydat DATETIME,
	 activeDH CHAR(4) CONSTRAINT DH_activeDH_CHK CHECK (activeDH IN ('Yes', 'No')),

	 CONSTRAINT DH_maDH_PK PRIMARY KEY(ma_DH),
	 CONSTRAINT DH_maAdmin_FK FOREIGN KEY (ma_Admin) REFERENCES ADMINS(ma_Admin),
	 CONSTRAINT DH_maCustomer_FK FOREIGN KEY(ma_Customer) REFERENCES CUSTOMER(ma_Customer)
);

CREATE TABLE CHITIETDONHANG(
	 ma_DH VARCHAR(10),
	 ma_CuonSach VARCHAR(10),
	 soluong VARCHAR(10),
	 gia INT,

	 CONSTRAINT CTDH_maDH_PK PRIMARY KEY(ma_DH, ma_CuonSach),
	 CONSTRAINT CTDH_maDH_FK FOREIGN KEY(ma_DH) REFERENCES DONHANG(ma_DH),
	 CONSTRAINT CTDH_maCS_FK FOREIGN KEY(ma_CuonSach) REFERENCES CUONSACH (ma_CuonSach)
);

CREATE TABLE GIAOHANG(
     ma_DH VARCHAR(10),
	 ma_Shipper VARCHAR(10),
	 tinhtrang NVARCHAR(5) CONSTRAINT GH_tinhtrang_CHK CHECK (tinhtrang IN (N'Yes', N'No')),

	 CONSTRAINT GIAOHANG_maDH_maShipper_PK PRIMARY KEY(ma_DH, ma_Shipper),
	 CONSTRAINT GIAOHANG_maDH_FK FOREIGN KEY(ma_DH) REFERENCES DONHANG(ma_DH),
	 CONSTRAINT GIAOHANG_maShipper_FK FOREIGN KEY(ma_Shipper) REFERENCES SHIPPER(ma_Shipper)
);

CREATE TABLE KHUYENMAI
(
	 ma_KM VARCHAR(10),
	 ten_KM NVARCHAR(100),
	 ngaybatdau DATETIME,
	 ngayketthuc DATETIME,
	 discount INT,

	 CONSTRAINT KM_maKM_PK PRIMARY KEY(ma_KM)
);

CREATE TABLE REVIEW
(
	 ma_Review VARCHAR(10),
     ma_Customer VARCHAR(10),
	 ngay_Review DATETIME,
	 binhluan VARCHAR(4000),

	 CONSTRAINT RV_maReview_PK PRIMARY KEY(ma_Review),
	 CONSTRAINT RV_maCustomer_FK FOREIGN KEY(ma_Customer) REFERENCES CUSTOMER(ma_Customer)
);

CREATE TABLE VITIEN(
     ma_Vitien VARCHAR(10),
     ma_Customer VARCHAR(10),
	 sotien INT,

	 CONSTRAINT VT_maVitien_PK PRIMARY KEY(ma_Vitien),
	 CONSTRAINT VT_maCustomer_FK FOREIGN KEY(ma_Customer) REFERENCES CUSTOMER(ma_Customer)
);

-- Thêm dữ liệu vào
USE bansachonline;
INSERT INTO ADMINS
VALUES ('AD001', 'nhuantp', '18110331','Phạm Xuân Nhuận', 'nhuan.cntt.k18@gmail.com');
INSERT INTO ADMINS
VALUES ('AD002', 'hieuxt', '18110282','Hồ Văn Hiếu', '18110282@student.hcmute.edu.vn');
INSERT INTO ADMINS
VALUES ('AD003', 'haibmt','18110278','Nguyễn Ngọc Hải', 'ngochai247@gmail.com');
INSERT INTO ADMINS
VALUES ('AD004', 'tuthanhqn', '18110387','Nguyễn Thanh Tú', '18110387@student.hcmute.edu.vn');

INSERT INTO CUSTOMER
VALUES('CUS001', 'taitran234', '123', 'Lương Trần Tài', 'luongtrantai23@gmail', '0987290386');
INSERT INTO CUSTOMER
VALUES ('CUS002', 'vanphuc37N', '222', 'Nguyễn Văn Phúc', 'bentre71@gmail.com', '113');
INSERT INTO CUSTOMER
VALUES ('CUS003', 'giang247', '333', 'Dương Ngọc Giang', 'giang49@gmail.com', '114');
INSERT INTO CUSTOMER
VALUES ('CUS004', 'nghiahuynh11', '444', 'Huỳnh Trọng Nghĩa', 'nghiapmp@gmail.com', '115');
INSERT INTO CUSTOMER
VALUES ('CUS005', 'phapcute09', '555', 'Nguyễn Văn Pháp', 'phapvanspkt@gmail.com', '116');

INSERT INTO SHIPPER
VALUES('SH001', 'giang247', '19110193', 'Dương Ngọc Giang', 'giangxt@gmail.com');
INSERT INTO SHIPPER
VALUES ('SH002','dangkhoabt', '18110227', 'Phạm Đăng Khoa', 'khoaphambt71@gmail.com');

INSERT INTO DAUSACH
VALUES ('DS0001', 'Giáo dục');
INSERT INTO DAUSACH
VALUES ('DS0002', '	Kỹ Năng Sống');
INSERT INTO DAUSACH
VALUES ('DS0003', 'Thiếu Nhi');
INSERT INTO DAUSACH
VALUES ('DS0004', 'Ngoại Ngữ');
INSERT INTO DAUSACH
VALUES ('DS0005', 'Văn Hóa Xã Hội');
INSERT INTO DAUSACH
VALUES ('DS0006', 'Văn Học');

INSERT INTO NHAXUATBAN
VALUES ('NXB0001', 'Kim Đồng', '55 Quang Trung, Hai Bà Trưng, Hà Nội', '024 3943 4730');
INSERT INTO NHAXUATBAN
VALUES ('NXB0002', 'Trẻ', '161B Lý Chính Thắng, Phường 7, Quận 3, Thành phố Hồ Chí Minh', '028 39316289');
INSERT INTO NHAXUATBAN
VALUES ('NXB0003', 'Tổng Hợp Thành Phố HCM', '62 Nguyễn Thị Minh Khai, Phường Đa Kao, Quận 1, TP.HCM', '028 3822 5340');
INSERT INTO NHAXUATBAN
VALUES ('NXB0004', 'Giáo dục', '81 Trần Hưng Đạo, Hà Nội', '024 3822 0801');
INSERT INTO NHAXUATBAN
VALUES ('NXB0005', 'Đại học quốc gia Hà Nội', '16 Hàng Chuối, Phạm Đình Hổ, Hai Bà Trưng, Hà Nội', '024 3971 4896');
INSERT INTO NHAXUATBAN
VALUES ('NXB0006', 'Thanh Niên', '54 đường số 8 Linh Trung Thủ Đức, Thành phố Hồ Chí Minh', '0368103208');

INSERT INTO TACGIA
VALUES ('TG0001', 'Kim Chi');
INSERT INTO TACGIA
VALUES ('TG0002', 'Tô Hoài');
INSERT INTO TACGIA
VALUES ('TG0003', 'Nguyễn Nhật Ánh');
INSERT INTO TACGIA
VALUES ('TG0004', 'Lý Qúi Trung');
INSERT INTO TACGIA
VALUES ('TG0005', 'Nguyễn Du');
INSERT INTO TACGIA
VALUES ('TG0006', 'Phạm Quang Hiển');
INSERT INTO TACGIA
VALUES ('TG0007', 'Nguyễn Công Kiệt');
INSERT INTO TACGIA
VALUES ('TG0008', 'Không Rõ');
INSERT INTO TACGIA
VALUES ('TG0009', 'Ngô Thừa Ân');

INSERT INTO CUONSACH(ma_CuonSach, ten_CuonSach, ma_DauSach, ma_TG, ma_NXB, soluong, gianhap, giaban, ngaydang)
VALUES ('CS0001', 'Điệu Buồn Phương Nam', 'DS0006', 'TG0001', 'NXB0003', '20', '80000', '95000', '2020-11-29');
INSERT INTO CUONSACH(ma_CuonSach, ten_CuonSach, ma_DauSach, ma_TG, ma_NXB, soluong, gianhap, giaban, ngaydang)
VALUES ('CS0002', 'Dế Mèn Phiêu Lưu Ký', 'DS0003', 'TG0002', 'NXB0001', '10', '115000', '135000', '2020-12-01');
INSERT INTO CUONSACH(ma_CuonSach, ten_CuonSach, ma_DauSach, ma_TG, ma_NXB, soluong, gianhap, giaban, ngaydang)
VALUES ('CS0003', 'Mắt Biếc', 'DS0006', 'TG0003', 'NXB0003', '14', '126000', '175000', '2020-12-01');
INSERT INTO CUONSACH(ma_CuonSach, ten_CuonSach, ma_DauSach, ma_TG, ma_NXB, soluong, gianhap, giaban, ngaydang)
VALUES ('CS0004', 'Kính Vạn Hoa (Bộ 14 Tập) - Phiên Bản Đặc Biệt', 'DS0003', 'TG0003', 'NXB0001', '5', '1126000', '1400000', '2020-12-02');
INSERT INTO CUONSACH(ma_CuonSach, ten_CuonSach, ma_DauSach, ma_TG, ma_NXB, soluong, gianhap, giaban, ngaydang)
VALUES ('CS0005', 'Bầu Trời Không Chỉ Có Màu Xanh', 'DS0002', 'TG0004', 'NXB0002', '15', '58000', '65000', '2020-12-04');
INSERT INTO CUONSACH(ma_CuonSach, ten_CuonSach, ma_DauSach, ma_TG, ma_NXB, soluong, gianhap, giaban, ngaydang)
VALUES ('CS0006', 'Truyện Kiều', 'DS0006', 'TG0005', 'NXB0002', '15', '46000', '50000', '2020-11-30');
INSERT INTO CUONSACH(ma_CuonSach, ten_CuonSach, ma_DauSach, ma_TG, ma_NXB, soluong, gianhap, giaban, ngaydang)
VALUES ('CS0007', 'Lập Trình Hệ Thống Thương Mại Điện tử', 'DS0001', 'TG0006', 'NXB0006', '12', '90000', '110000', '2020-12-01');
INSERT INTO CUONSACH (ma_CuonSach, ten_CuonSach, ma_DauSach, ma_TG, ma_NXB, soluong, gianhap, giaban, ngaydang)
VALUES ('CS0008', 'Chinh Phục chủ Đề Peptit', 'DS0001', 'TG0007', 'NXB0005', '7', '87000', '95000', '2020-11-20');
INSERT INTO CUONSACH(ma_CuonSach, ten_CuonSach, ma_DauSach, ma_TG, ma_NXB, soluong, gianhap, giaban, ngaydang)
VALUES ('CS0009', 'Very Easy Toeic', 'DS0004', 'TG0008', 'NXB0002', '10', '45000', '66000', '2020-11-22');
INSERT INTO CUONSACH(ma_CuonSach, ten_CuonSach, ma_DauSach, ma_TG, ma_NXB, soluong, gianhap, giaban, ngaydang)
VALUES ('CS0010', 'Tây Du Ký', 'DS0006', 'TG0009', 'NXB0005', '20', '560000', '750000', '2020-11-30');

INSERT INTO GIOHANG
VALUES ('GH001', 'CS0001', '2');
INSERT INTO GIOHANG
VALUES ('GH001', 'CS0002', '1');
INSERT INTO GIOHANG
VALUES ('GH002', 'CS0010', '2');
INSERT INTO GIOHANG
VALUES ('GH003', 'CS0005', '1');

INSERT INTO DONHANG
VALUES ('DH001', 'CUS003', 'AD003', 'KTX Khu D1', '0987935915', '190000', '2020-12-05', 'Yes');
INSERT INTO DONHANG
VALUES ('DH002', 'CUS001', 'AD002', 'Xuân Thọ - Đà Lạt', '0368103208', '135000', '2020-12-04', 'Yes');
INSERT INTO DONHANG
VALUES ('DH003', 'CUS003', 'AD002', 'Bến Tre', '0327300035', '1595000', '2020-12-06', 'Yes');

INSERT INTO CHITIETDONHANG
VALUES ('DH001', 'CS0010', '2', '95000');
INSERT INTO CHITIETDONHANG
VALUES ('DH002', 'CS0002', '1', '135000');
INSERT INTO CHITIETDONHANG
VALUES ('DH003', 'CS0004', '1', '1400000');
INSERT INTO CHITIETDONHANG
VALUES ('DH003', 'CS0005', '3', '65000');

INSERT INTO GIAOHANG
VALUES('DH001', 'SH001', 'Yes');
INSERT INTO GIAOHANG
VALUES('DH002', 'SH002', 'No');
INSERT INTO GIAOHANG
VALUES('DH003', 'SH002', 'No');

INSERT INTO KHUYENMAI
VALUES ('KM001', 'Noel Yêu Thuong',  '2020-12-20', '2021-01-05', '15');
INSERT INTO KHUYENMAI
VALUES ('KM002', 'Tết Dương Lịch', '2020-12-28', '2021-01-03', '35');

INSERT INTO REVIEW
VALUES ('RW001', 'CUS003', '2020-12-12', 'Sách còn mới, như quảng cáo. Nói chung tốt, sẽ quay lại ủng hộ shop tiếp ạ');

INSERT INTO VITIEN
VALUES('VT001', 'CUS001', '1000000');
INSERT INTO VITIEN
VALUES('VT002', 'CUS002', '5000000');
INSERT INTO VITIEN
VALUES('VT003', 'CUS003', '4000000');
INSERT INTO VITIEN
VALUES('VT004', 'CUS004', '3000000');
INSERT INTO VITIEN
VALUES('VT005', 'CUS005', '2000000');