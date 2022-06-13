CREATE DATABASE Web
GO
USE Web
GO
CREATE TABLE Users (
    firstname NVARCHAR(100) NOT NULL,
    lastname NVARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
	phone varchar(10) NULL,
	[address] nvarchar(255) NULL,
	birthday date NULL,
    username VARCHAR(30) NOT NULL,
    [password] varchar(255) NOT NULL,
    [role] VARCHAR(2) NOT NULL,
    PRIMARY KEY(username),
)
GO
CREATE TABLE Category (
	cid int IDENTITY(1,1) NOT NULL,
	cname nvarchar(50) NOT NULL
	PRIMARY KEY(cid),
)
GO
CREATE TABLE Products (
	id int IDENTITY(1,1) NOT NULL,
	pid varchar(20) NOT NULL,
	cid int NOT NULL,
	[name] nvarchar(128) NOT NULL,
	[image] nvarchar(128) NOT NULL DEFAULT 'https://fomantic-ui.com/images/wireframe/white-image.png',
	price int NOT NULL DEFAULT 0,
	[description] NVARCHAR(max),
	[amount] int NOT NULL,
	PRIMARY KEY(pid),
)
GO
CREATE TABLE ProductDetails(
	id int IDENTITY(1,1) NOT NULL,
	pid varchar(20) NOT NULL,
	screen nvarchar(100) NULL,
	os nvarchar(100) NULL,
	rearcam nvarchar(100) NULL,
	frontcam nvarchar(100) NULL,
	soc nvarchar(100) NULL,
	ram nvarchar(100) NULL,
	sim nvarchar(100) NULL,
	battery nvarchar(100) NULL,
	PRIMARY KEY(id),
)

Insert into ProductDetails(pid,screen,os,rearcam,frontcam,soc,ram,sim,battery)
values('AP_13PRO','OLED6.7"Super Retina XDR', 'iOS 15', '3 camera 12 MP', '
12 MP', 'Apple A15 Bionic', '6 GB', N'1 Nano SIM & 1 eSIM, Hỗ trợ 5G', '4352 mAh, 20 W')
select * from ProductDetails
GO
CREATE TABLE ColorDetails(
	id int IDENTITY(1,1) NOT NULL,
	pid varchar(20) NOT NULL,
	color nvarchar(30) NOT NULL,
	PRIMARY KEY(pid, color),
)
select* from ColorDetails
Insert into ColorDetails(pid, color)
values('AP_13PRO',N'Vàng Đồng')
Insert into ColorDetails(pid, color)
values('AP_13PRO',N'Xám')
Insert into ColorDetails(pid, color)
values('AP_13PRO',N'Bạc')
Insert into ColorDetails(pid, color)
values('AP_13PRO',N'Xanh Dương')
GO
CREATE TABLE StorageDetails(
	id int IDENTITY(1,1) NOT NULL,
	pid varchar(20) NOT NULL,
	storage nvarchar(30) NOT NULL,
	PRIMARY KEY(pid,storage),
)
Select * from StorageDetails
Insert into StorageDetails(pid,storage)
values('AP_13PRO','128GB')
Insert into StorageDetails(pid,storage)
values('AP_13PRO','256GB')
Insert into StorageDetails(pid,storage)
values('AP_13PRO','512GB')
Insert into StorageDetails(pid,storage)
values('AP_13PRO','1TB')
GO
CREATE TABLE Orders (
	id int IDENTITY(1,1) NOT NULL,
	uname VARCHAR(30) NOT NULL,
	orderdate date NOT NULL,
	total int NOT NULL,
	PRIMARY KEY(id, uname),
)
GO
CREATE TABLE OrderDetails (
	oid int NOT NULL,
	pid varchar(20) NOT NULL,
	quantity int NOT NULL,
	price int NOT NULL,
	discount int NOT NULL,
	total_price int NOT NULL,
	[status] varchar NOT NULL,
	[description] nvarchar(1000) NULL,
	PRIMARY KEY(oid, pid),
)
GO

--Insert Users
INSERT INTO Users(firstname, lastname, email, username, [password], [role])
VALUES (N'Phạm Hồng', N'Dương','hongduong5441@gmail.com','admin','admin','sa')
INSERT INTO Users(firstname, lastname, email, username, [password], [role])
VALUES (N'Phạm Văn', N'A','phamvana@gmail.com','pva','12345','us')
GO
-- Insert Category
INSERT INTO Category(cname)
VALUES ('Apple')
INSERT INTO Category(cname)
VALUES ('Samsung')
INSERT INTO Category(cname)
VALUES ('Xiaomi')
INSERT INTO Category(cname)
VALUES ('Oppo')
INSERT INTO Category(cname)
VALUES ('Oneplus')
INSERT INTO Category(cname)
VALUES ('Sony')
INSERT INTO Category(cname)
VALUES ('Vivo')
GO
-- Insert product
INSERT INTO Products(pid,cid,[name],[image],price,[description],[amount])
VALUES ('AP_12PRO','1','Apple Iphone 12 PRO','https://cdn.discordapp.com/attachments/941665674273644574/941666479114420244/apple-iphone-12-pro--.jpg',18490000,N'Sản phẩm cao cấp do Apple sản suất',50)
INSERT INTO Products(pid,cid,[name],[image],price,[description],[amount])
VALUES ('AP_13PRO','1','Apple Iphone 13 PRO','https://cdn.discordapp.com/attachments/941665674273644574/941666477659025438/apple-iphone-13-pro.jpg',21490000,N'Sản phẩm cao cấp do Apple sản suất',50)
INSERT INTO Products(pid,cid,[name],[image],price,[description],[amount])
VALUES ('XM_RMN11','3','Xiaomi Redmi Note 11','https://cdn.discordapp.com/attachments/941665674273644574/941666501738508339/xiaomi-redmi-note-11-pro-global.jpg',4690000,N'Sản phẩm do Xiaomi sản suất',50)
INSERT INTO Products(pid,cid,[name],[image],price,[description],[amount])
VALUES ('SM_FLIP','2','Samsung Galaxy ZFlip','https://cdn.discordapp.com/attachments/941665674273644574/941666502300561449/samsung-galaxy-z-flip3-5g.jpg',25490000,N'Sản phẩm cao cấp do Samsung sản suất',50)
INSERT INTO Products(pid,cid,[name],[image],price,[description],[amount])
VALUES ('SM_FOLD','2','Samsung Galaxy Fold','https://cdn.discordapp.com/attachments/941665674273644574/941666500631232542/samsung-galaxy-z-fold3-5g.jpg',25490000,N'Sản phẩm cao cấp do Samsung sản suất',50)
INSERT INTO Products(pid,cid,[name],[image],price,[description],[amount])
VALUES ('OP_RENO7','4','Oppo Reno 7','https://cdn.discordapp.com/attachments/941665674273644574/941666501998547024/oppo-reno7.jpg',7890000,N'Sản phẩm do Oppo sản suất',50)
INSERT INTO Products(pid,cid,[name],[image],price,[description],[amount])
VALUES ('OP_FIND3PRO','4','Oppo Find X3 PRO','https://cdn.discordapp.com/attachments/941665674273644574/941666478418194432/oppo-find-x3-pro.jpg',9890000,N'Sản phẩm do Oppo sản suất',50)
INSERT INTO Products(pid,cid,[name],[image],price,[description],[amount])
VALUES ('ONE_10PRO','5','Oneplus 10 PRO','https://cdn.discordapp.com/attachments/941665674273644574/941666478221058048/oneplus-10-pro.jpg',10890000,N'Sản phẩm do OnePlus sản suất',50)
Select * from Products
Select * from ProductDetails
Select * from ColorDetails
Select * from StorageDetails

Select * from Products order by id desc offset 0 rows fetch next 4 rows only

Select top 4 * from Products

Select * from Users

Select * from Products where pid = 'OP_FIND3PRO'
Select * from ProductDetails where pid = 'AP_13PRO'
Select * from ColorDetails where pid = 'AP_13PRO'
Select * from StorageDetails where pid = 'AP_13PRO'

Select * from Products where name like '%Iphone%'
Select * from Products where cid = 2

Select * from Products where price between 4000000 and 5000000

Delete from Products 
Delete from ColorDetails where pid = ?
Delete from ProductDetails where pid = ?
Delete from StorageDetails where pid = ?
Delete from ColorDetails where id = ?
Delete from StorageDetails where pid = ?