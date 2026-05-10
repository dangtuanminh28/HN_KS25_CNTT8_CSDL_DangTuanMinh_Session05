DROP DATABASE IF EXISTS session05;
CREATE DATABASE session05;
USE session05;

/*
Bản vẽ Logic:
- Vì AND có độ ưu tiên cao hơn OR nên sẽ làm lọt các giá trị sai hoặc đã bị hủy (is NULL)

Kỹ thuật khóa chặt bẫy:
- Dùng dấu ngoặc đơn () để kiểm tra và trả về kết quả chuẩn hơn
- Ép SQL phải xử lý code này để thành khối thống nhất

Quy trình chống bẫy
- Hệ thống không trả dữ liệu rỗng mà sẽ trả về mã lỗi 
*/
CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NULL,
    total_amount DECIMAL(15, 2) NOT NULL,
    status VARCHAR(50) NOT NULL,
    note TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO Orders (user_id, total_amount, status, note) VALUES

(101, 4500000, 'PENDING', 'Giao hàng gấp trong ngày'),
(NULL, 3000000, 'COMPLETED', 'Đơn hàng tự động'),
(103, 2500000, 'PROCESSING', 'Khách báo cần gấp nhé'),
(NULL, 4800000, 'SHIPPING', NULL),

(105, 3500000, 'CANCELLED', 'Hủy gấp do sai địa chỉ'),      
(NULL, 2500000, 'CANCELLED', 'Hệ thống tự hủy gấp'),

(NULL, 10000000, 'PENDING', 'Đơn sỉ'),
(106, 1500000, 'PROCESSING', 'Giao gấp'),

(107, 3000000, 'COMPLETED', 'Giao giờ hành chính'),         

(108, 4100000, 'PENDING', 'gấp'),
(NULL, 2200000, 'PROCESSING', ''),
(109, 4900000, 'SHIPPING', 'gấp, gọi trước khi giao');


SELECT order_id, user_id, total_amount, status, note FROM Orders
-- 1 Lấy đơn có khoảng số tiền này
WHERE (total_amount BETWEEN 2000000 AND 5000000)
-- 2 Loại đơn bị hủy
AND status != 'CANCELLED'
-- 3 Khóa bẫy logic
AND (note LIKE '%gấp%' OR user_id IS NULL)
-- 4. Xếp đơn hàng đắt nhất trên đầu
ORDER BY total_amount DESC
-- 5. Phân trang
LIMIT 20 OFFSET 40;