DROP DATABASE IF EXISTS session05;
CREATE DATABASE session05;
USE session05;

/*
Phân tích lỗi:
- Dòng code trên gần như không có lệnh để kiểm tra thứ tự
- Nên LIMIT nó chỉ giới hạn số lượng chứ không kiểm tra xếp hàng
SELECT restaurant_name, created_at FROM Restaurants LIMIT 5;
*/
CREATE TABLE Restaurants (
	res_id INT PRIMARY KEY AUTO_INCREMENT,
    restaurant_name VARCHAR(100) NOT NULL,
    district VARCHAR(100) NOT NULL,
    address VARCHAR(100),
    rating DECIMAL(4,2),
    created_at DATE
);

INSERT INTO Restaurants(restaurant_name, address, district, rating) 
VALUES ('Hủ Tiếu', '99 Nguyễn Trãi', 'Quận 1', 2.5), 
('Lẩu Gà', '12 Tú Xương', 'Quận 3', 4.6), 
('Bánh Mì', '26 Lê Thị Riêng', 'Quận 1', 4.9), 
('Bún Chả', '55 Phan Xích Long', 'Quận Phú Nhuận', 5.0),
('Cà Phê Muối', '10 Phan Kế Bính', 'Quận 1', 4.0);

SELECT restaurant_name, created_at FROM Restaurants
ORDER BY created_at DESC
LIMIT 5;