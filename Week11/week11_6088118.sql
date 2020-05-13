-- Q1 Using View
CREATE VIEW [Housewares] AS
SELECT PartNum , Description, OnHand, Price
FROM Part
WHERE Class = 'HW';

SELECT * FROM Housewares WHERE OnHand < 25;

-- Q1 Not Using View
SELECT PartNum, Description, OnHand, Price
FROM Part
WHERE Class = 'HW' AND OnHand < 25;

-- Q2 Using View
CREATE VIEW [SalesCust] (SNum, SLast, SFirst, CNum, CName) AS
SELECT Rep.RepNum, LastName, FirstName, CustomerNum, CustomerName
FROM Rep, Customer
WHERE Rep.RepNum = Customer.RepNum

SELECT SNum, SLast, SFirst
FROM SalesCust
WHERE CNum = '282'

-- Q2 Not Using View
SELECT r.RepNum AS SNum, LastName AS SLast, FirstName AS SFirst
FROM Rep r INNER JOIN Customer c on r.RepNum = c.RepNum
WHERE c.CustomerNum = '282'