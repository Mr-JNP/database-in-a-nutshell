-- Create database
create database Premiere_Products_Company collate THAI_CI_AS
go

use Premiere_Products_Company

--Create Rep Table
create table Rep 
(
	RepNum int not null,
	LastName nchar(255),
	FirstName nchar(255),
	Street nchar(50),
	City nchar(50),
	_State nchar(50),
	Zip int,
	Commission float,
	Rate float

	constraint PK_Rep_RepNum primary key (RepNum),
)

--Create table Customer
create table Customer
(
	CustomerNum int not null,
	CustomerName nchar(255),
	Street nchar(50),
	City nchar(50),
	_State nchar(50),
	Zip int,
	Balance float,
	CreditLimit float,
	RepNum int

	constraint PK_Customer_CustomerNum primary key (CustomerNum),
	constraint FK_Customer_RepNum foreign key (RepNum) references Rep (RepNum)
	on delete cascade
	on update cascade
)

INSERT INTO Rep
VALUES
('20','Kaiser','Valerie','624 Randall','Grove','FL','33321',20542.50,0.05);
INSERT INTO Rep
VALUES
('35','Hull','Richard','532 Jackson','Sheldon','FL','33553',39216.00,0.07);
INSERT INTO Rep
VALUES
('65','Perez','Juan','1626 Taylor','Fillmore','FL','33336',23487.00,0.05);
INSERT INTO Customer
VALUES
('148','Al''s Appliance and Sport','2837 Greenway','Fillmore','FL','33336',6550.00,7500.00,'20');
INSERT INTO Customer
VALUES
('282','Brookings Direct','3827 Devon','Grove','FL','33321',431.50,10000.00,'35');
INSERT INTO Customer
VALUES
('356','Ferguson''s','382 Wildwood','Northfield','FL','33146',5785.00,7500.00,'65');
INSERT INTO Customer
VALUES
('408','The Everything Shop','1828 Raven','Crystal','FL','33503',5285.25,5000.00,'35');
INSERT INTO Customer
VALUES
('462','Bargains Galore','3829 Central','Grove','FL','33321',3412.00,10000.00,'65');
INSERT INTO Customer
VALUES
('524','Kline''s','838 Ridgeland','Fillmore','FL','33336',12762.00,15000.00,'20');
INSERT INTO Customer
VALUES
('608','Johnson''s Department Store','372 Oxford','Sheldon','FL','33553',2106.00,10000.00,'65');
INSERT INTO Customer
VALUES
('687','Lee''s Sport and Appliance','282 Evergreen','Altonville','FL','32543',2851.00,5000.00,'35');
INSERT INTO Customer
VALUES
('725','Deerfield''s Four Seasons','282 Columbia','Sheldon','FL','33553',248.00,7500.00,'35');
INSERT INTO Customer
VALUES
('842','All Season','28 Lakeview','Grove','FL','33321',8221.00,7500.00,'20');