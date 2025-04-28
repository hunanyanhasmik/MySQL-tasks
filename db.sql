-- Create cars table
CREATE TABLE cars (
    id INT AUTO_INCREMENT PRIMARY KEY,
    brand VARCHAR(50) NOT NULL,
    model VARCHAR(50) NOT NULL,
    year INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    vin VARCHAR(17)
);

-- Create features table
CREATE TABLE features (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE
);

-- Create car_features table
CREATE TABLE car_features (
    car_id INT NOT NULL,
    feature_id INT NOT NULL,
    PRIMARY KEY (car_id, feature_id),
    FOREIGN KEY (car_id) REFERENCES cars(id) ON DELETE CASCADE,
    FOREIGN KEY (feature_id) REFERENCES features(id) ON DELETE CASCADE
);

-- Insert sample data into cars table
INSERT INTO cars (brand, model, year, price, vin) VALUES
('Toyota', 'Camry', 2018, 25000.00, 'JT2BF22K8W0123456'),
('Toyota', 'Camry', 2020, 28000.00, 'JT2BF22K0W0123457'),
('Honda', 'Accord', 2019, 27000.00, '1HGCV1F14LA012345'),
('Honda', 'Civic', 2015, 18000.00, '2HGFC1F56LH012346'),
('Ford', 'Mustang', 2021, 35000.00, '1FA6P8CFXL5123456'),
('Ford', 'F-150', 2017, 32000.00, '1FTFW1ET5HFA12345'),
('Tesla', 'Model 3', 2022, 48000.00, '5YJ3E1EAXNF123456'),
('Tesla', 'Model S', 2020, 75000.00, '5YJSA1E20LF123457'),
('BMW', '3 Series', 2016, 22000.00, 'WBA8B3C55HK123456'),
('BMW', '5 Series', 2018, 38000.00, 'WBAJF9C57JA123457'),
('Audi', 'A4', 2019, 34000.00, 'WAUANAF41KA012345'),
('Audi', 'Q5', 2017, 29000.00, 'WA1BNAFY5H2012345'),
('Toyota', 'RAV4', 2021, 30000.00, 'JTMFB3FV7MD012345'),
('Honda', 'Accord', 2018, 24000.00, '1HGCV1F14JA012347'),
('Ford', 'Mustang', 2015, 28000.00, '1FA6P8CF5F5123456');

-- Insert sample data into features table
INSERT INTO features (name) VALUES
('GPS'),
('Sunroof'),
('Leather Seats'),
('Heated Seats'),
('Bluetooth'),
('Backup Camera'),
('Navigation'),
('Premium Sound'),
('Alloy Wheels'),
('Remote Start');

-- Insert sample data into car_features table
INSERT INTO car_features (car_id, feature_id) VALUES
(1, 1), (1, 3), (1, 5),  
(2, 1), (2, 2), (2, 6),  
(3, 1), (3, 2), (3, 3), (3, 4),  
(4, 5), (4, 6),  
(5, 2), (5, 3), (5, 7), (5, 8),  
(6, 1), (6, 6), (6, 9), 
(7, 1), (7, 3), (7, 4), (7, 6), (7, 7), (7, 8),  
(8, 1), (8, 2), (8, 3), (8, 4), (8, 6), (8, 7), (8, 8), (8, 9),  
(9, 5), (9, 9),  
(10, 1), (10, 3), (10, 4), (10, 8),  
(11, 1), (11, 3), (11, 6),  
(12, 1), (12, 5), (12, 6), (12, 9), 
(13, 1), (13, 6),  
(14, 5), 
(15, 2), (15, 9); 