-- Bảng giang_vien
CREATE TABLE giang_vien (
    ma_giang_vien INT AUTO_INCREMENT PRIMARY KEY,
    so_hieu_giangvien VARCHAR(50) UNIQUE NOT NULL,
    ho_ten VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    khoa VARCHAR(50),
    so_dien_thoai VARCHAR(15)
);

-- Bảng admin
CREATE TABLE admin (
    email VARCHAR(100) PRIMARY KEY,
    password VARCHAR(255) NOT NULL,
    is_admin BOOLEAN DEFAULT TRUE -- Mặc định là admin
);

-- Bảng sinh_vien
CREATE TABLE sinh_vien (
    ma_sinh_vien INT AUTO_INCREMENT PRIMARY KEY,
    ho_ten VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    lop VARCHAR(50),
    khoa VARCHAR(50),
    ma_giang_vien INT,
    so_dien_thoai VARCHAR(15),
    FOREIGN KEY (ma_giang_vien) REFERENCES giang_vien(ma_giang_vien) ON DELETE SET NULL
);

-- Bảng dang_ky_thuc_tap
CREATE TABLE dang_ky_thuc_tap (
    ma_dang_ky INT AUTO_INCREMENT PRIMARY KEY,
    ma_sinh_vien INT NOT NULL,
    ten_cong_ty VARCHAR(255) NOT NULL, -- Thay thế bảng co_so_thuc_tap
    dia_chi VARCHAR(255),
    linh_vuc VARCHAR(100),
    trang_thai ENUM('Đang chờ', 'Đã duyệt', 'Từ chối') DEFAULT 'Đang chờ',
    ngay_dang_ky DATE DEFAULT CURRENT_DATE,
    ghi_chu TEXT,
    FOREIGN KEY (ma_sinh_vien) REFERENCES sinh_vien(ma_sinh_vien) ON DELETE CASCADE
);

-- Bảng bao_cao_thuc_tap
CREATE TABLE bao_cao_thuc_tap (
    ma_bao_cao INT AUTO_INCREMENT PRIMARY KEY,
    ma_dang_ky INT NOT NULL,
    noi_dung TEXT NOT NULL,
    ngay_gui DATE DEFAULT CURRENT_DATE,
    trang_thai ENUM('Đang chờ', 'Đã duyệt', 'Bị từ chối') DEFAULT 'Đang chờ',
    FOREIGN KEY (ma_dang_ky) REFERENCES dang_ky_thuc_tap(ma_dang_ky) ON DELETE CASCADE
);

-- Bảng tuyen_dung
CREATE TABLE tuyen_dung (
    id INT AUTO_INCREMENT PRIMARY KEY,
    ten_cong_ty VARCHAR(255) NOT NULL, -- Kết nối với bảng dang_ky_thuc_tap
    dia_chi VARCHAR(255),
    linh_vuc VARCHAR(100),
    mo_ta TEXT NOT NULL,
    anh VARCHAR(255),
    quy_mo VARCHAR(100),
    khoa VARCHAR(50),
    tieu_de_tuyen_dung VARCHAR(255) NOT NULL,
    so_luong INT NOT NULL,
    yeu_cau TEXT,
    phuc_loi TEXT,
    han_nop DATE NOT NULL,
    trang_thai ENUM('Đang chờ', 'Đã duyệt', 'Từ chối') DEFAULT 'Đang chờ',
    ngay_dang DATE DEFAULT CURRENT_DATE
);
