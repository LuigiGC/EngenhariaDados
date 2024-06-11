--Feito por: Luigi Fernando 202304419108
--Feito por: Guilherme Dantas 202309013088

CREATE DATABASE Empresai;
USE Empresai;

CREATE TABLE product (
    maker VARCHAR(10),
    model VARCHAR(50) PRIMARY KEY,
    type VARCHAR(50)
);
CREATE TABLE pc (
    code INT PRIMARY KEY,
    model VARCHAR(50),
    speed SMALLINT,
    ram SMALLINT,
    hd REAL,
    cd VARCHAR(10),
    price DECIMAL(10, 2),
    FOREIGN KEY (model) REFERENCES product(model)
);
CREATE TABLE laptop (
    code INT PRIMARY KEY,
    model VARCHAR(50),
    speed SMALLINT,
    ram SMALLINT,
    hd REAL,
    price DECIMAL(10, 2),
    screen TINYINT,
    FOREIGN KEY (model) REFERENCES product(model)
);
CREATE TABLE printer (
    code INT PRIMARY KEY,
    model VARCHAR(50),
    color CHAR(1),
    type VARCHAR(10),
    price DECIMAL(10, 2),
    FOREIGN KEY (model) REFERENCES product(model)
);
INSERT INTO product (maker, model, type) VALUES 
('B', '1121', 'PC'),
('A', '1232', 'PC'),
('A', '1233', 'PC'),
('E', '1260', 'PC'),
('A', '1276', 'Printer'),
('D', '1288', 'Printer'),
('A', '1298', 'Laptop'),
('C', '1321', 'Laptop'),
('A', '1401', 'Printer'),
('A', '1408', 'Printer'),
('D', '1433', 'Printer'),
('E', '1434', 'Printer'),
('B', '1750', 'Laptop'),
('A', '1752', 'Laptop'),
('E', '2113', 'PC'),
('E', '2112', 'PC');

INSERT INTO pc (code, model, speed, ram, hd, cd, price) VALUES 
(1, '1232', 500, 64, 5, '12x', 600), 
(2, '1121', 750, 128, 14, '40x', 850), 
(3, '1233', 500, 64, 5, '12x', 600), 
(4, '1121', 600, 128, 14, '40x', 850), 
(5, '1121', 600, 128, 8, '40x', 850), 
(6, '1233', 750, 128, 20, '50x', 950), 
(7, '1232', 500, 32, 10, '12x', 400), 
(8, '1232', 450, 64, 8, '24x', 350), 
(9, '1232', 450, 32, 10, '24x', 350), 
(10, '1260', 500, 32, 10, '12x', 350), 
(11, '1233', 900, 128, 40, '40x', 980), 
(12, '1233', 800, 128, 20, '50x', 970);


INSERT INTO Laptop (code, model, speed, ram, hd, price, screen) VALUES 
(1, '1298', 350, 32, 4, 700, 11), 
(2, '1321', 500, 64, 8, 970, 12), 
(3, '1750', 750, 128, 12, 1200, 14), 
(4, '1298', 600, 64, 10, 1050, 15), 
(5, '1752', 750, 128, 10, 1150, 14), 
(6, '1298', 450, 64, 10, 950, 12);

INSERT INTO Printer (code, model, color, type, price) VALUES 
(6, '1288', 'n', 'Laser', 400), 
(5, '1408', 'n', 'Matrix', 270), 
(4, '1401', 'n', 'Matrix', 150), 
(3, '1434', 'y', 'Jet', 290), 
(2, '1433', 'y', 'Jet', 270), 
(1, '1276', 'n', 'Laser', 400);


--3.1
SELECT model, speed, hd
FROM pc
WHERE price < 500;
--3.2
SELECT DISTINCT maker
FROM product
WHERE type = 'printer';
--3.3
SELECT model, ram, screen
FROM laptop
WHERE price > 1000;
--3.4
SELECT p.maker, l.speed
FROM laptop l
JOIN product p ON l.model = p.model
WHERE l.hd >= 10;
--3.5
SELECT p.model, COALESCE(pc.price, l.price, pr.price) AS price
FROM product p
LEFT JOIN pc pc ON p.model = pc.model
LEFT JOIN laptop l ON p.model = l.model
LEFT JOIN printer pr ON p.model = pr.model
WHERE p.maker = 'B';
--3.6
SELECT DISTINCT p1.maker
FROM product p1
JOIN pc ON p1.model = pc.model
WHERE p1.maker NOT IN (
    SELECT p2.maker
    FROM product p2
    JOIN laptop ON p2.model = laptop.model
);
--3.7
SELECT 'laptop' AS type, l.model, l.speed
FROM laptop l
WHERE l.speed < ALL (SELECT pc.speed FROM pc);
--3.8
SELECT p.maker, pr.price
FROM printer pr
JOIN product p ON pr.model = p.model
WHERE pr.color = 'y'
ORDER BY pr.price
LIMIT 1;
--3.9
SELECT p.maker, COUNT(DISTINCT p.model) AS num_models
FROM product p
JOIN pc ON p.model = pc.model
GROUP BY p.maker
HAVING COUNT(DISTINCT p.model) >= 3;
--3.10
SELECT p.maker, MAX(pc.price) AS max_price
FROM pc
JOIN product p ON pc.model = p.model
GROUP BY p.maker;
--3.11
SELECT model
FROM (
    SELECT model, price
    FROM pc
    UNION
    SELECT model, price
    FROM laptop
    UNION
    SELECT model, price
    FROM printer
) AS all_products
ORDER BY price DESC
LIMIT 1;
--3.12
SELECT DISTINCT p1.maker
FROM product p1
JOIN printer pr ON p1.model = pr.model
WHERE p1.maker IN (
    SELECT p2.maker
    FROM product p2
    JOIN pc pc ON p2.model = pc.model
    WHERE pc.ram = (SELECT MIN(ram) FROM pc)
    AND pc.speed = (SELECT MAX(speed) FROM pc WHERE ram = (SELECT MIN(ram) FROM pc))
);
