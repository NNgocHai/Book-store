DROP DATABASE bansachonline;

CREATE DATABASE bansachonline;

use bansachonline;
CREATE TABLE ADMINS (
     ma_Admin INT AUTO_INCREMENT,
	 taikhoan_Admin VARCHAR(20) UNIQUE,
	 matkhau_Admin VARCHAR(50),
	 hoten_Admin NVARCHAR(60),
	 gmail_Admin VARCHAR(100) UNIQUE,

	 CONSTRAINT AM_maAmin_PK PRIMARY KEY(ma_Admin)
);

CREATE TABLE CUSTOMER(
	 ma_Customer INT AUTO_INCREMENT,
	 taikhoan_Customer VARCHAR(20) UNIQUE,
	 matkhau_Customer VARCHAR(20),
	 hoten_Customer NVARCHAR(50),
	 gmail_Customer VARCHAR(100) UNIQUE,
     sdt_Customer VARCHAR(10) UNIQUE,
     vitien INT,

	 CONSTRAINT CUSTOMER_maCustomer_PK PRIMARY KEY(ma_Customer)
);

CREATE TABLE SHIPPER(
     ma_Shipper INT AUTO_INCREMENT,
     taikhoan_Shipper VARCHAR(20) UNIQUE,
     matkhau_Shipper VARCHAR(20),
     hoten_Shipper NVARCHAR(50),
     gmail_Shipper VARCHAR(100) UNIQUE,

     CONSTRAINT SHIPPER_maShipper_PK PRIMARY KEY(ma_Shipper)
);

CREATE TABLE DAUSACH
(
	 ma_DauSach INT AUTO_INCREMENT,
	 ten_DauSach NVARCHAR(50),

	 CONSTRAINT DS_maDS_PK PRIMARY KEY(ma_DauSach)
);

CREATE TABLE TACGIA
(
	 ma_TG INT AUTO_INCREMENT,
	 ten_tG NVARCHAR(50),

	 CONSTRAINT TG_maTG_PK PRIMARY KEY(ma_TG)
);

CREATE TABLE CUONSACH
(
	 ma_CuonSach INT AUTO_INCREMENT,
	 ten_CuonSach NVARCHAR(60),
	 ma_DauSach INT,
	 ma_TG INT,
	 soluong INT,
	 gianhap INT,
	 giaban INT,
	 ngaydang DATETIME,
	 anh_CuonSach VARCHAR(150),
	 sachKM CHAR(4) CONSTRAINT CS_sachKM_CHK CHECK(sachKM IN ('Yes', 'No')),
	 sachBC CHAR(4) CONSTRAINT CS_sachBC_CHK CHECK(sachBC IN ('Yes', 'No')),

	 CONSTRAINT CS_maCuonSach_PK PRIMARY KEY(ma_CuonSach),
	 CONSTRAINT CS_maDS_FK FOREIGN KEY (ma_DauSach) REFERENCES DAUSACH(ma_DauSach) ON DELETE CASCADE,
	 CONSTRAINT CS_maTG_FK FOREIGN KEY (ma_TG) REFERENCES TACGIA(ma_TG) ON DELETE CASCADE
);

CREATE TABLE GIOHANG
(
	 ma_GH INT AUTO_INCREMENT,
	 ma_CuonSach INT,
     soluong INT,

	 CONSTRAINT GH_maGH_PK PRIMARY KEY(ma_GH,ma_CuonSach),
	 CONSTRAINT GH_maCS_FK FOREIGN KEY (ma_CuonSach) REFERENCES CUONSACH(ma_CuonSach) ON DELETE NO ACTION
);

CREATE TABLE DONHANG
(
	 ma_DH INT AUTO_INCREMENT,
	 ma_Customer INT,
	 diachi NVARCHAR(100),
	 sdt VARCHAR(15),
	 tongtien INT,
     ngaydat DATETIME,
	 activeDH CHAR(4) CONSTRAINT DH_activeDH_CHK CHECK (activeDH IN ('Yes', 'No')),

	 CONSTRAINT DH_maDH_PK PRIMARY KEY(ma_DH),
	 CONSTRAINT DH_maCustomer_FK FOREIGN KEY(ma_Customer) REFERENCES CUSTOMER(ma_Customer) ON DELETE CASCADE
);

CREATE TABLE CHITIETDONHANG(
	 ma_DH INT,
	 ma_CuonSach INT,
	 soluong VARCHAR(10),
	 gia INT,

	 CONSTRAINT CTDH_maDH_PK PRIMARY KEY(ma_DH, ma_CuonSach),
	 CONSTRAINT CTDH_maDH_FK FOREIGN KEY(ma_DH) REFERENCES DONHANG(ma_DH) ON DELETE CASCADE,
	 CONSTRAINT CTDH_maCS_FK FOREIGN KEY(ma_CuonSach) REFERENCES CUONSACH (ma_CuonSach) ON DELETE CASCADE
);

CREATE TABLE GIAOHANG(
     ma_DH INT AUTO_INCREMENT,
	 ma_Shipper INT,
	 tinhtrang NVARCHAR(5) CONSTRAINT GH_tinhtrang_CHK CHECK (tinhtrang IN (N'Yes', N'No')),

	 CONSTRAINT GIAOHANG_maDH_maShipper_PK PRIMARY KEY(ma_DH, ma_Shipper),
	 CONSTRAINT GIAOHANG_maDH_FK FOREIGN KEY(ma_DH) REFERENCES DONHANG(ma_DH) ON DELETE CASCADE,
	 CONSTRAINT GIAOHANG_maShipper_FK FOREIGN KEY(ma_Shipper) REFERENCES SHIPPER(ma_Shipper) ON DELETE NO ACTION
);

CREATE TABLE KHUYENMAI
(
	 ma_KM INT AUTO_INCREMENT,
	 ten_KM NVARCHAR(100),
	 ngaybatdau DATETIME,
	 ngayketthuc DATETIME,
	 discount INT,

	 CONSTRAINT KM_maKM_PK PRIMARY KEY(ma_KM)
);

CREATE TABLE REVIEW
(
	 ma_Review INT AUTO_INCREMENT,
     ma_Customer INT,
	 ngay_Review DATETIME,
	 binhluan VARCHAR(4000),

	 CONSTRAINT RV_maReview_PK PRIMARY KEY(ma_Review),
	 CONSTRAINT RV_maCustomer_FK FOREIGN KEY(ma_Customer) REFERENCES CUSTOMER(ma_Customer) ON DELETE CASCADE
);

USE bansachonline;
INSERT INTO ADMINS (taikhoan_Admin, matkhau_Admin , hoten_Admin, gmail_Admin)
VALUES ('nhuantp', '18110331','Phạm Xuân Nhuận', 'nhuan.cntt.k18@gmail.com');
INSERT INTO ADMINS (taikhoan_Admin, matkhau_Admin , hoten_Admin, gmail_Admin)
VALUES ('hieuxt', '18110282','Hồ Văn Hiếu', '18110282@student.hcmute.edu.vn');
INSERT INTO ADMINS(taikhoan_Admin, matkhau_Admin , hoten_Admin, gmail_Admin)
VALUES ('haibmt','18110278','Nguyễn Ngọc Hải', 'ngochai247@gmail.com');
INSERT INTO ADMINS(taikhoan_Admin, matkhau_Admin , hoten_Admin, gmail_Admin)
VALUES ('tuthanhqn', '18110387','Nguyễn Thanh Tú', '18110387@student.hcmute.edu.vn');

INSERT INTO CUSTOMER (taikhoan_Customer, matkhau_Customer, hoten_Customer, gmail_Customer, sdt_Customer, vitien)
VALUES('taitran234', '123', 'Lương Trần Tài', 'luongtrantai23@gmail', '0987290386', '10000000');
INSERT INTO CUSTOMER(taikhoan_Customer, matkhau_Customer, hoten_Customer, gmail_Customer, sdt_Customer, vitien)
VALUES ('vanphuc37N', '222', 'Nguyễn Văn Phúc', 'bentre71@gmail.com', '113', '10000000');
INSERT INTO CUSTOMER(taikhoan_Customer, matkhau_Customer, hoten_Customer, gmail_Customer, sdt_Customer, vitien)
VALUES ('giang247', '333', 'Dương Ngọc Giang', 'giang49@gmail.com', '114', '10000000');
INSERT INTO CUSTOMER(taikhoan_Customer, matkhau_Customer, hoten_Customer, gmail_Customer, sdt_Customer, vitien)
VALUES ('nghiahuynh11', '444', 'Huỳnh Trọng Nghĩa', 'nghiapmp@gmail.com', '115', '10000000');
INSERT INTO CUSTOMER(taikhoan_Customer, matkhau_Customer, hoten_Customer, gmail_Customer, sdt_Customer, vitien)
VALUES ('phapcute09', '555', 'Nguyễn Văn Pháp', 'phapvanspkt@gmail.com', '116', '10000000');

INSERT INTO SHIPPER (taikhoan_Shipper, matkhau_Shipper, hoten_Shipper, gmail_Shipper)
VALUES('giang247', '19110193', 'Dương Ngọc Giang', 'giangxt@gmail.com');
INSERT INTO SHIPPER(taikhoan_Shipper, matkhau_Shipper, hoten_Shipper, gmail_Shipper)
VALUES ('dangkhoabt', '18110227', 'Phạm Đăng Khoa', 'khoaphambt71@gmail.com');

INSERT INTO DAUSACH (ten_DauSach)
VALUES ('Giáo dục');
INSERT INTO DAUSACH(ten_DauSach)
VALUES ('Kỹ Năng Sống');
INSERT INTO DAUSACH(ten_DauSach)
VALUES ('Thiếu Nhi');
INSERT INTO DAUSACH(ten_DauSach)
VALUES ('Ngoại Ngữ');
INSERT INTO DAUSACH(ten_DauSach)
VALUES ('Văn Hóa Xã Hội');
INSERT INTO DAUSACH(ten_DauSach)
VALUES ('Văn Học');

INSERT INTO TACGIA (ten_tG)
VALUES ('Kim Chi');
INSERT INTO TACGIA(ten_tG)
VALUES ('Tô Hoài');
INSERT INTO TACGIA(ten_tG)
VALUES ('Nguyễn Nhật Ánh');
INSERT INTO TACGIA(ten_tG)
VALUES ('Lý Qúi Trung');
INSERT INTO TACGIA(ten_tG)
VALUES ('Nguyễn Du');
INSERT INTO TACGIA(ten_tG)
VALUES ('Phạm Quang Hiển');
INSERT INTO TACGIA(ten_tG)
VALUES ('Nguyễn Công Kiệt');
INSERT INTO TACGIA(ten_tG)
VALUES ('Không Rõ');
INSERT INTO TACGIA(ten_tG)
VALUES ('Ngô Thừa Ân');

INSERT INTO CUONSACH(ten_CuonSach, ma_DauSach, ma_TG, soluong, gianhap, giaban, ngaydang)
VALUES ('Điệu Buồn Phương Nam', '6', '1', '20', '80000', '95000', '2020-11-29');
INSERT INTO CUONSACH(ten_CuonSach, ma_DauSach, ma_TG, soluong, gianhap, giaban, ngaydang)
VALUES ('Dế Mèn Phiêu Lưu Ký', '3', '2', '10', '115000', '135000', '2020-12-01');
INSERT INTO CUONSACH(ten_CuonSach, ma_DauSach, ma_TG, soluong, gianhap, giaban, ngaydang)
VALUES ('Mắt Biếc', '6', '3', '14', '126000', '175000', '2020-12-01');
INSERT INTO CUONSACH(ten_CuonSach, ma_DauSach, ma_TG, soluong, gianhap, giaban, ngaydang)
VALUES ('Kính Vạn Hoa (Bộ 14 Tập) - Phiên Bản Đặc Biệt', '3', '3', '5', '1126000', '1400000', '2020-12-02');
INSERT INTO CUONSACH(ten_CuonSach, ma_DauSach, ma_TG, soluong, gianhap, giaban, ngaydang)
VALUES ('Bầu Trời Không Chỉ Có Màu Xanh', '2', '4', '15', '58000', '65000', '2020-12-04');
INSERT INTO CUONSACH(ten_CuonSach, ma_DauSach, ma_TG, soluong, gianhap, giaban, ngaydang)
VALUES ('Truyện Kiều', '6', '5', '15', '46000', '50000', '2020-11-30');
INSERT INTO CUONSACH(ten_CuonSach, ma_DauSach, ma_TG, soluong, gianhap, giaban, ngaydang)
VALUES ('Lập Trình Hệ Thống Thương Mại Điện tử', '1', '6', '12', '90000', '110000', '2020-12-01');
INSERT INTO CUONSACH (ten_CuonSach, ma_DauSach, ma_TG, soluong, gianhap, giaban, ngaydang)
VALUES ('Chinh Phục chủ Đề Peptit', '1', '7', '7', '87000', '95000', '2020-11-20');
INSERT INTO CUONSACH(ten_CuonSach, ma_DauSach, ma_TG, soluong, gianhap, giaban, ngaydang)
VALUES ('Very Easy Toeic', '4', '8', '10', '45000', '66000', '2020-11-22');
INSERT INTO CUONSACH(ten_CuonSach, ma_DauSach, ma_TG, soluong, gianhap, giaban, ngaydang)
VALUES ('Tây Du Ký', '6', '9', '20', '560000', '750000', '2020-11-30');

INSERT INTO GIOHANG(ma_CuonSach, soluong)
VALUES ('1', '2');
INSERT INTO GIOHANG(ma_CuonSach, soluong)
VALUES ('2', '1');
INSERT INTO GIOHANG(ma_CuonSach, soluong)
VALUES ( '10', '2');
INSERT INTO GIOHANG(ma_CuonSach, soluong)
VALUES ('5', '1');

INSERT INTO DONHANG(ma_Customer, diachi, sdt, tongtien, ngaydat, activeDH)
VALUES ('3', 'KTX Khu D1', '0987935915', '190000', '2020-12-05', 'Yes');
INSERT INTO DONHANG(ma_Customer, diachi, sdt, tongtien, ngaydat, activeDH)
VALUES ('1', 'Xuân Thọ - Đà Lạt', '0368103208', '135000', '2020-12-04', 'Yes');
INSERT INTO DONHANG(ma_Customer, diachi, sdt, tongtien, ngaydat, activeDH)
VALUES ('3', 'Bến Tre', '0327300035', '1595000', '2020-12-06', 'Yes');

INSERT INTO CHITIETDONHANG
VALUES ('1', '10', '2', '95000');
INSERT INTO CHITIETDONHANG
VALUES ('2', '2', '1', '135000');
INSERT INTO CHITIETDONHANG
VALUES ('3', '4', '1', '1400000');
INSERT INTO CHITIETDONHANG
VALUES ('3', '5', '3', '65000');

INSERT INTO GIAOHANG
VALUES('1', '1', 'Yes');
INSERT INTO GIAOHANG
VALUES('2', '2', 'No');
INSERT INTO GIAOHANG
VALUES('3', '2', 'No');

INSERT INTO KHUYENMAI(ten_KM, ngaybatdau, ngayketthuc, discount)
VALUES ('Noel Yêu Thuong',  '2020-12-20', '2021-01-05', '15');
INSERT INTO KHUYENMAI(ten_KM, ngaybatdau, ngayketthuc, discount)
VALUES ('Tết Dương Lịch', '2020-12-28', '2021-01-03', '35');

INSERT INTO REVIEW(ma_Customer, ngay_Review, binhluan)
VALUES ('3', '2020-12-12', 'Sách còn mới, như quảng cáo. Nói chung tốt, sẽ quay lại ủng hộ shop tiếp ạ');