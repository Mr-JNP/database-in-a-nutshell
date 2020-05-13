--Q1
CREATE TABLE Q1
(
	userId uniqueIdentifier,
	firstName nvarchar(20),
	lastName nvarchar(20)
);
GO

--Q2
INSERT INTO Q1 VALUES (NEWID(), 'Nontapat', 'Pintira');
INSERT INTO Q1 VALUES (NEWID(), 'Napadol', 'Bangjing');
GO

--Q3
SELECT LEN(CONCAT(firstName, lastName)) AS [Number of Characters] FROM Q1;
GO

--Q4
CREATE TABLE Q2
(
	Uname nvarchar(32) UNIQUE,
	Upass binary(64)
);
GO

--Q5
INSERT INTO Q2 VALUES ('u6088118', HASHBYTES('MD5', '123456'));
GO

SELECT * FROM Q1
SELECT * FROM Q2
SELECT LEN(CONCAT(firstName, lastName)) AS [Number of Characters] FROM Q1;