CREATE DATABASE IF NOT EXISTS phone;
USE phone;

DROP TABLE IF EXISTS model_phone;
CREATE TABLE model_phone
(
id INT PRIMARY KEY AUTO_INCREMENT,
ProductName VARCHAR(100),
Manufacturer VARCHAR(100),
ProductCount INT(100),
Price INT(100)
);


INSERT model_phone(ProductName, Manufacturer, ProductCount, Price) 
VALUES 
("Iphone 8", "Apple", 4, 70000), 
("Galaxy S20Fe", "Sumsung", 10, 50000), 
("Iphone 10", "Apple", 6, 100000), 
("Iphone 14", "Apple", 10, 150000), 
("Xiaomi Mi Note", "Xiaomi", 5, 20000), 
("Xiaomi MIX", "Xiaomi", 2, 10000), 
("Nokia 3310", "Nokia", 7, 10000), 
("Galaxy A71", "Sumsung", 1, 25000), 
("Xperia 10 V", "Sony", 3, 40000), 
("Galaxy A54", "Sumsung", 10, 30000);

SELECT * FROM model_phone;

SELECT ProductName, Manufacturer, Price FROM model_phone WHERE ProductCount > 2;

SELECT ProductName, Manufacturer, ProductCount, Price FROM model_phone WHERE Manufacturer = "Sumsung";

SELECT ProductName, Manufacturer, ProductCount, Price FROM model_phone WHERE ProductCount * Price > 100000 AND ProductCount * Price < 145000;

SELECT ProductName, Manufacturer, ProductCount, Price FROM model_phone WHERE ProductName RLIKE 'Iphone';

SELECT ProductName, Manufacturer, ProductCount, Price FROM model_phone WHERE ProductName RLIKE 'Galaxy';

SELECT ProductName, Manufacturer, ProductCount, Price FROM model_phone WHERE ProductName RLIKE '[0-9]';

SELECT ProductName, Manufacturer, ProductCount, Price FROM model_phone WHERE ProductName RLIKE '8';