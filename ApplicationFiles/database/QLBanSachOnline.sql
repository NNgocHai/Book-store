CREATE DATABASE BanSachOnline;

USE BanSachOnline;

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
	 diachi_TG NVARCHAR(100),

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
	 tomtat NVARCHAR(4000),
	 anh_CuonSach VARCHAR(150),
	 sachKM CHAR(4) CONSTRAINT CS_sachKM_CHK CHECK (sachKM IN ('Yes', 'No')),
	 sachBC CHAR(4) CONSTRAINT CS_sachBC_CHK CHECK (sachBC IN ('Yes', 'No')),
	 activeCS CHAR(4) CONSTRAINT CS_activeCS_CHK CHECK (activeCS IN ('Yes', 'No')),

	 CONSTRAINT CS_maCuonSach_PK PRIMARY KEY(ma_CuonSach),
	 CONSTRAINT CS_maDS_FK FOREIGN KEY (ma_DauSach) REFERENCES DAUSACH(ma_DauSach),
	 CONSTRAINT CS_maNXB_FK FOREIGN KEY (ma_NXB) REFERENCES NHAXUATBAN(ma_NXB),
	 CONSTRAINT CS_maTG_FK FOREIGN KEY (ma_TG) REFERENCES TACGIA(ma_TG)
);

CREATE TABLE ADMIN(
     ma_Amin VARCHAR(10),
	 ten_Amin VARCHAR(20),
	 matkhau_Amin VARCHAR(50),
	 hovaten_Amin NVARCHAR(60),
	 gmail_Amin VARCHAR(100),

	 CONSTRAINT AM_maAmin_PK PRIMARY KEY(ma_Amin)
);
CREATE TABLE USERS(
     tenUser VARCHAR(20),
	 matkhau_User VARCHAR(20),
	 hovaten_User NVARCHAR(50),
	 ngaysinh DATETIME,
	 gmail VARCHAR(100),
	 activeUser CHAR(4) CONSTRAINT ND_activeUser_CHK CHECK (activeUser IN ('Yes', 'No')),

	 CONSTRAINT USERS_tenUser_PK PRIMARY KEY(tenUser)
);


CREATE TABLE DONHANG
(
     ma_DH VARCHAR(10),
	 ten_KH NVARCHAR(60),
	 diachi NVARCHAR(100),
	 sdt VARCHAR(15),
	 tongtien INT,
	 activeDH CHAR(4) CONSTRAINT DH_activeDH_CHK CHECK (activeDH IN ('Yes', 'No')),

	 CONSTRAINT DH_maDH_PK PRIMARY KEY(ma_DH)
);

CREATE TABLE GIOHANG
(
     ma_GH VARCHAR(10),
	 ma_User VARCHAR(20),
	 ma_CuonSach VARCHAR(10),
	 soluong INT,

	 CONSTRAINT GH_maGH_maUser_maCS_PK PRIMARY KEY(ma_GH, ma_User, ma_CuonSach),
	 CONSTRAINT GH_maUser_FK FOREIGN KEY (ma_User) REFERENCES USERS(tenUser),
	 CONSTRAINT GH_maCS_FK FOREIGN KEY (ma_CuonSach) REFERENCES CUONSACH (ma_CuonSach)
);

CREATE TABLE SUKIEN
(
     ma_SuKien VARCHAR(10),
	 chude_SuKien NVARCHAR(100),
	 anh_SuKien VARCHAR(150),
	 noidung_SuKien NVARCHAR(4000),
	 ngaydang DATETIME,
	 activeSK CHAR(4) CONSTRAINT SK_activeSK_CHK CHECK (activeSK IN ('Yes', 'No')),

	 CONSTRAINT SK_maSK_PK PRIMARY KEY(ma_SuKien)
);

CREATE TABLE KHUYENMAI
(
     ma_KM VARCHAR(10),
	 ten_KM NVARCHAR(100),
	 chitiet_KM NVARCHAR(4000),
	 ngaybatdau DATETIME,
	 ngayketthuc DATETIME,

	 CONSTRAINT KM_maKM_PK PRIMARY KEY(ma_KM)
);

CREATE TABLE REVIEW
(
     ma_Review VARCHAR(10),
	 ma_KH VARCHAR(20),
	 ngay_Review DATETIME,
	 binhluan VARCHAR(4000),

	 CONSTRAINT RV_maReview_ma_KH_PK PRIMARY KEY(ma_Review, ma_KH),
	 CONSTRAINT RV_ma_KH_FK FOREIGN KEY (ma_KH) REFERENCES USERS(tenUser)
);