-- Bảng giang_vien
CREATE TABLE giang_vien (
    ma_giang_vien INT AUTO_INCREMENT PRIMARY KEY,
    so_hieu_giangvien VARCHAR(50) UNIQUE NOT NULL,
    ho_ten VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    khoa VARCHAR(50),
    so_dien_thoai VARCHAR(15)
);

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


-- Bảng co_so_thuc_tap
CREATE TABLE co_so_thuc_tap (
    so_thu_tu_cs INT AUTO_INCREMENT,
    ma_co_so INT PRIMARY KEY,
    ten_co_so VARCHAR(100) NOT NULL,
    dia_chi VARCHAR(255),
    linh_vuc VARCHAR(100),
    so_luong INT,
    mo_ta TEXT,
    trang_thai ENUM('Đang chờ', 'Đã duyệt', 'Từ chối') DEFAULT 'Đang chờ' -- Đã thêm trạng thái
);

-- Bảng dang_ky_thuc_tap
CREATE TABLE dang_ky_thuc_tap (
    so_thu_tu_dang_ky INT AUTO_INCREMENT,
    ma_dang_ky INT PRIMARY KEY,
    ma_sinh_vien INT,
    ma_co_so INT,
    trang_thai ENUM('Đang chờ', 'Đã duyệt', 'Từ chối') DEFAULT 'Đang chờ',
    ngay_dang_ky DATE,
    ghi_chu TEXT, -- Đã thêm ghi chú
    FOREIGN KEY (ma_sinh_vien) REFERENCES sinh_vien(ma_sinh_vien),
    FOREIGN KEY (ma_co_so) REFERENCES co_so_thuc_tap(ma_co_so)
);

-- Bảng bao_cao_thuc_tap
CREATE TABLE bao_cao_thuc_tap (
    so_thu_tu_bao_cao INT AUTO_INCREMENT,
    ma_bao_cao INT PRIMARY KEY,
    ma_dang_ky INT,
    noi_dung TEXT,
    ngay_gui DATE,
    trang_thai ENUM('Đang chờ', 'Đã duyệt', 'Bị từ chối') DEFAULT 'Đang chờ', -- Đã sửa trạng thái
    FOREIGN KEY (ma_dang_ky) REFERENCES dang_ky_thuc_tap(ma_dang_ky)
);



-- nháp
CREATE TABLE tuyen_dung (
    id INT AUTO_INCREMENT PRIMARY KEY, -- ID tự động tăng
    so_thu_tu_css INT, -- Số thứ tự của cơ sở
    ten_cty VARCHAR(255) NOT NULL, -- Tên công ty
    dia_chi VARCHAR(255), -- Địa chỉ công ty
    linh_vuc VARCHAR(100), -- Lĩnh vực hoạt động
    mo_ta TEXT NOT NULL, -- Mô tả công việc
    anh VARCHAR(255), -- Ảnh minh họa công ty hoặc công việc
    quy_mo VARCHAR(100), -- Quy mô công ty (Nhỏ, vừa, lớn)
    tieu_de_tuyen_dung VARCHAR(255) NOT NULL, -- Tiêu đề tuyển dụng
    so_luong INT NOT NULL, -- Số lượng tuyển
    yeu_cau TEXT, -- Yêu cầu công việc
    phuc_loi TEXT, -- Phúc lợi
    han_nop DATE NOT NULL, -- Hạn nộp hồ sơ
    trang_thai ENUM('Đang chờ', 'Đã duyệt', 'Từ chối') DEFAULT 'Đang chờ', -- Trạng thái duyệt tin
    ngay_dang DATE DEFAULT CURRENT_DATE -- Ngày đăng tin
      FOREIGN KEY (so_thu_tu_cs) REFERENCES co_so_thuc_tap(ma_co_so) ON DELETE CASCADE
);
