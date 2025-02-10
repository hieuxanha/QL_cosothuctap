-- Bảng sinh_vien
CREATE TABLE sinh_vien (
    so_thu_tu_sv INT AUTO_INCREMENT,
    ma_sinh_vien INT PRIMARY KEY,
    ho_ten VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    lop VARCHAR(50),
    khoa VARCHAR(50),
    ma_giang_vien INT,
    FOREIGN KEY (ma_giang_vien) REFERENCES giang_vien(ma_giang_vien)
);

-- Bảng giang_vien
CREATE TABLE giang_vien (
    so_thu_tu_gv INT AUTO_INCREMENT,
    ma_giang_vien INT PRIMARY KEY,
    ho_ten VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    khoa VARCHAR(50),
    so_dien_thoai VARCHAR(15)
);

-- Bảng co_so_thuc_tap
CREATE TABLE co_so_thuc_tap (
    so_thu_tu_cs INT AUTO_INCREMENT,
    ma_co_so INT PRIMARY KEY,
    ten_co_so VARCHAR(100) NOT NULL,
    dia_chi VARCHAR(255),
    linh_vuc VARCHAR(100),
    so_luong INT,
    mo_ta TEXT
);

-- Bảng dang_ky_thuc_tap
CREATE TABLE dang_ky_thuc_tap (
    so_thu_tu_dang_ky INT AUTO_INCREMENT,
    ma_dang_ky INT PRIMARY KEY,
    ma_sinh_vien INT,
    ma_co_so INT,
    trang_thai ENUM('Đang chờ', 'Đã duyệt', 'Từ chối') DEFAULT 'Đang chờ',
    ngay_dang_ky DATE,
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
    FOREIGN KEY (ma_dang_ky) REFERENCES dang_ky_thuc_tap(ma_dang_ky)
);


admin: quản lý sv, quản lý gv, quản lý đv thực tập
gv: quản lý sinh viên (trong quản lý sv có thể sẽ có thêm những option khác kiểu như: xem thông tin, xem quá trình đánh giá thực tập, cập nhật điểm)
t đang phân vân ko biết nên gói nó lại trong qly sinh viên của gv hay tách ra cho nó rõ ràng, với cả khác cái chức năng quản lý sv của admin cho đỡ lẫn
đv thực tập: cập nhật thông tin, đánh giá nhận xét sinh, xét duyệt hồ sơ