-- Create database
create database Premiere collate THAI_CI_AS
go

use Premiere

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
);

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
);

create table Orders
(
	OrderNum int not null,
	OrderDate date,
	CustomerNum int

	constraint PK_Orders_OrderNum primary key (OrderNum)
	constraint FK_Orders_CustomerNum foreign key (CustomerNum) references Customer (CustomerNum)
	on delete cascade
	on update cascade
);

create table Part
(
	PartNum nchar(50) not null,
	_Description nchar(255),
	OnHand int,
	Class nchar(50),
	Warehouse int,
	Price float

	constraint PK_Part_PartNum primary key (PartNum)
);

create table OrderLine
(
	OrderNum int not null,
	PartNum nchar(50) not null,
	NumOrdered int,
	QuotedPrice float

	constraint PK_OrderLine_OrderLinePK primary key (OrderNum, PartNum)
	constraint FK_OrderLine_OrderNum foreign key (OrderNum) references Orders (OrderNum) on delete cascade on update cascade,
	constraint FK_OrderLine_PartNum foreign key (PartNum) references Part (PartNum) on delete cascade on update cascade
)

create table CurrentOrders
(
	CustomerName nchar(255),
	OrderNum int not null,
	PartNum nchar(50) not null,
	_Description nchar(255),
	NumOrdered int,
	QuotedPrice float,
	Warehouse int,
	RepNum int

	constraint PK_CurrentOrders_CurrentOrdersPK primary key (OrderNum, PartNum, RepNum)
	constraint FK_CurrentOrders_OrderNum foreign key (OrderNum) references Orders (OrderNum),
	constraint FK_CurrentOrders_PartNum foreign key (PartNum) references Part (PartNum),
	constraint FK_CurrentOrders_RepNum foreign key (RepNum) references Rep (RepNum)
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
INSERT INTO Orders
VALUES
('21608','20-OCT-2013','148');
INSERT INTO Orders
VALUES
('21610','20-OCT-2013','356');
INSERT INTO Orders
VALUES
('21613','21-OCT-2013','408');
INSERT INTO Orders
VALUES
('21614','21-OCT-2013','282');
INSERT INTO Orders
VALUES
('21617','23-OCT-2013','608');
INSERT INTO Orders
VALUES
('21619','23-OCT-2013','148');
INSERT INTO Orders
VALUES
('21623','23-OCT-2013','608');
INSERT INTO Part
VALUES
('AT94','Iron',50,'HW','3',24.95);
INSERT INTO Part
VALUES
('BV06','Home Gym',45,'SG','2',794.95);
INSERT INTO Part
VALUES
('CD52','Microwave Oven',32,'AP','1',165.00);
INSERT INTO Part
VALUES
('DL71','Cordless Drill',21,'HW','3',129.95);
INSERT INTO Part
VALUES
('DR93','Gas Range',8,'AP','2',495.00);
INSERT INTO Part
VALUES
('DW11','Washer',12,'AP','3',399.99);
INSERT INTO Part
VALUES
('FD21','Stand Mixer',22,'HW','3',159.95);
INSERT INTO Part
VALUES
('KL62','Dryer',12,'AP','1',349.95);
INSERT INTO Part
VALUES
('KT03','Dishwasher',8,'AP','3',595.00);
INSERT INTO Part
VALUES
('KV29','Treadmill',9,'SG','2',1390.00);
INSERT INTO OrderLine
VALUES
('21608','AT94',11,21.95);
INSERT INTO OrderLine
VALUES
('21610','DR93',1,495.00);
INSERT INTO OrderLine
VALUES
('21610','DW11',1,399.99);
INSERT INTO OrderLine
VALUES
('21613','KL62',4,329.95);
INSERT INTO OrderLine
VALUES
('21614','KT03',2,595.00);
INSERT INTO OrderLine
VALUES
('21617','BV06',2,794.95);
INSERT INTO OrderLine
VALUES
('21617','CD52',4,150.00);
INSERT INTO OrderLine
VALUES
('21619','DR93',1,495.00);
INSERT INTO OrderLine
VALUES
('21623','KV29',2,1290.00);
