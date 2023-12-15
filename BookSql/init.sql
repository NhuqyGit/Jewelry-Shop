CREATE DATABASE BookStore;
USE BookStore;


CREATE TABLE user(
	Id VARCHAR(100) PRIMARY KEY,
    Username VARCHAR(45) NOT NULL,
    Email VARCHAR(45) NOT NULL,
    Password_Hashed VARCHAR(100) NOT NULL,
	Email_Token VARCHAR(45) NOT NULL,
    IsActive INT NOT NULL,
    Avatar VARCHAR(1024),
    Role INT NOT NULL,
    Address VARCHAR(100),
    Phone VARCHAR(20),
    Create_At VARCHAR(30) NOT NULL
);

create table Collections(
	IdColl int primary key auto_increment,
    CollName varchar(300) not null unique,
    CollImage varchar(200) not null
);

create table JewelryType(
	IdType int primary key auto_increment,
    TypeName varchar(300) not null unique,
    TypeImage varchar(200) not null
);

CREATE TABLE jewelry(
	IdJewelry VARCHAR(100) primary key,
    IdColl int not null,
    IdType int not null,
    JewName varchar(300) not null unique,
    JewPrice int not null,
    JewDes varchar(300) not null,
    FOREIGN KEY (IdColl) REFERENCES Collections(IdColl),
    FOREIGN KEY (IdType) REFERENCES JewelryType(IdType)
);

CREATE TABLE jewelryImage(
	IdImage varchar(100) primary key,
    IdJewelry varchar(100) not null,
    PathImage varchar(200) not null,
    FOREIGN KEY (IdJewelry) REFERENCES jewelry(IdJewelry)
);

CREATE TABLE Ring(
	IdRing varchar(100) primary key,
    IdJewelry varchar(100) not null,
    Size varchar(10) not null,
    Material varchar(100) not null,
    Quantity int not null,
    FOREIGN KEY (IdJewelry) REFERENCES Jewelry(IdJewelry)
);

CREATE TABLE Glasses(
	IdGlasses varchar(100) primary key,
    IdJewelry varchar(100) not null,
    Material varchar(100) not null,
    Quantity int not null,
    FOREIGN KEY (IdJewelry) REFERENCES Jewelry(IdJewelry)
);

CREATE TABLE Necklace(
	IdNecklace varchar(100) primary key,
    IdJewelry varchar(100) not null,
    Material varchar(100) not null,
    Quantity int not null,
    FOREIGN KEY (IdJewelry) REFERENCES Jewelry(IdJewelry)
);

CREATE TABLE Bracelet(
	IdBracelet varchar(100) primary key,
    IdJewelry varchar(100) not null,
    Material varchar(100) not null,
    Quantity int not null,
    FOREIGN KEY (IdJewelry) REFERENCES Jewelry(IdJewelry)
);

CREATE TABLE Earrings(
	IdEarring varchar(100) primary key,
    IdJewelry varchar(100) not null,
	Size varchar(10) not null,
    Material varchar(100) not null,
    Quantity int not null,
    FOREIGN KEY (IdJewelry) REFERENCES Jewelry(IdJewelry)
);

INSERT INTO collections (CollName, CollImage)
VALUES
  ('Glints - Crack', "/images/750x950_JH20CFGX_08032022002600.jpg"),
  ('Baroque', "/images/750x950_XPEWSCT5_08032022002344.jpg"),
  ('Bloody Hearts', "/images/750x950_MR1QP8FH_08032022002159.jpg"),
  ('Lauris', "/images/750x950_UIL6C6F4_08032022002927.jpg"),
  ('Fenix', "/images/750x950_UIL6C6F4_08032022002927.jpg"),
  ('Flower', "/images/750x950_JH20CFGX_08032022002600.jpg");

INSERT INTO jewelrytype (TypeName, TypeImage)
VALUES
  ('Ring', "https://cdn.tranduythien.net/file/63b4180aa55eb051ce25d197"),
  ('Glasses', "https://cdn.tranduythien.net/file/63b41821a55eb051ce25d198"),
  ('Necklace', "https://cdn.tranduythien.net/file/63b4182f32013aa6a1382ae6"),
  ('Bracelet', "https://cdn.tranduythien.net/file/63b41842a55eb051ce25d199"),
  ('Earrings', "https://cdn.tranduythien.net/file/63b4185a32013aa6a1382ae7");



