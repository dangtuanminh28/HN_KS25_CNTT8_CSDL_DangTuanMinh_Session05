DROP DATABASE IF EXISTS session05;
CREATE DATABASE session05;
USE session05;

/*
Phân tích lỗi:
- Dòng code WHERE vì AND được ưu tiên trước OR nên nó sẽ kiểm tra rating trước 
- Quận 1 sẽ lấy các quán cực tệ và các quận 3 sẽ chỉ hiện những quán 4.0 trở lên
SELECT restaurant_name, address, rating FROM Restaurants
WHERE district = 'Quận 1' OR district = 'Quận 3' AND rating > 4.0;
*/
CREATE TABLE Restaurants (
	res_id INT PRIMARY KEY AUTO_INCREMENT,
    restaurant_name VARCHAR(100) NOT NULL,
    district VARCHAR(100) NOT NULL,
    address VARCHAR(100) NOT NULL,
    rating DECIMAL(4,2)
);

INSERT INTO Restaurants(restaurant_name, address, district, rating) 
VALUES ('Hủ Tiếu', '99 Nguyễn Trãi', 'Quận 1', 2.5), 
('Lẩu Gà', '12 Tú Xương', 'Quận 3', 4.6), 
('Bánh Mì', '26 Lê Thị Riêng', 'Quận 1', 4.9), 
('Bún Chả', '55 Phan Xích Long', 'Quận Phú Nhuận', 5.0),
('Cà Phê Muối', '10 Phan Kế Bính', 'Quận 1', 4.0);

SELECT res_id, restaurant_name, address, rating FROM Restaurants 
WHERE (district = 'Quận 1' OR district = 'Quận 3')
AND rating > 4.0;