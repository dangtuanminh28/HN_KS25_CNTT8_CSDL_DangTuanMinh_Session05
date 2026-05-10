DROP DATABASE IF EXISTS session05;
CREATE DATABASE session05;
USE session05;


/*
Giải pháp 1
SELECT order_id, cancel_reason FROM Orders
WHERE cancel_reason = 'KHACH_HUY' 
   OR cancel_reason = 'QUAN_DONG_CUA' 
   OR cancel_reason = 'KHONG_CO_TAI_XE' 
   OR cancel_reason = 'BOM_HANG';
- Lặp lại tên cột nhiều lần gây lú cho người đọc
- Nếu như có nhiều trường hợp khác sẽ phải tạo nhiều câu lệnh và dễ sai sót
- Phải kiểm tra từng dòng code
   
Giải pháp 2
SELECT order_id, cancel_reason FROM Orders
WHERE cancel_reason IN ('KHACH_HUY', 'QUAN_DONG_CUA', 'KHONG_CO_TAI_XE', 'BOM_HANG');
- Gọn gàng
- Khi có trường hợp khác sẽ chỉ cần thêm giá trị vào
- Kiểm tra nhanh, tối ưu

Xử lý bấy NULL
Không. Vì
- NULL không phải 1 giá trị, mà là trạng thái không xác định
- Khi so sánh NULL sẽ luôn trả về Unknown nên đơn hàng sẽ bị loại bỏ kết quả
*/

CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(50),
    cancel_reason VARCHAR(50)
);

INSERT INTO Orders (customer_name, cancel_reason) 
VALUES ('Minh', 'KHACH_HUY'),
('Tuấn', 'BOM_HANG'),
('An', NULL),
('Bình', 'DA_GIAO'),
('Linh', 'KHONG_CO_TAI_XE');

SELECT order_id, customer_name, cancel_reason FROM Orders
WHERE cancel_reason IN ('KHACH_HUY', 'QUAN_DONG_CUA', 'KHONG_CO_TAI_XE', 'BOM_HANG')
OR cancel_reason IS NULL;