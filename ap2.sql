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
