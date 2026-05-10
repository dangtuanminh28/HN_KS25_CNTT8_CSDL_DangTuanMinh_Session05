DROP DATABASE IF EXISTS session05;
CREATE DATABASE session05;
USE session05;

/*
INPUT 
status : lọc điều kiện cần mặc định là AVAILABLE
trust_score : lọc điều kiện điểm 
distance_km : Tiêu chí sắp xếp 

OUTPUT
- Trả về danh sách tài xế có uy tín cao, chất lượng và ưu tiên những người ở gần

- Mệnh đề WHERE: 
+ Dùng AND để lọc cùng lúc các tài xế
+ Dùng ORDER BY ASC để tìm quán gần nhất và DECS để tìm điểm cao nhất tài xế
*/

CREATE TABLE Drivers (
    driver_id INT PRIMARY KEY AUTO_INCREMENT,
    driver_name VARCHAR(100) NOT NULL,
    d_status ENUM('AVAILABLE', 'BUSY', 'LOCKED') DEFAULT 'AVAILABLE',
    trust_score INT,
    distance_km DECIMAL(5,2)
);

INSERT INTO Drivers (driver_name, d_status, trust_score, distance_km) VALUES
('Tài xế A', 'AVAILABLE', 85, 1.5),
('Tài xế B', 'AVAILABLE', 95, 1.5),
('Tài xế C', 'BUSY', 90, 0.5),
('Tài xế D', 'LOCKED', 100, 0.2),
('Tài xế E', 'AVAILABLE', 75, 0.8),
('Tài xế F', 'AVAILABLE', 88, 2.0);

SELECT driver_id, driver_name, d_status, trust_score, distance_km FROM Drivers
WHERE d_status = 'AVAILABLE'
AND trust_score >= 80
ORDER BY distance_km ASC, trust_score DESC;