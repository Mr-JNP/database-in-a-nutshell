--Q1
SELECT COUNT(*) NumberOfParts
FROM Part p
WHERE p.Price < 100 AND Class = 'HW'
GO

--Q2
SELECT SUM(Balance) TotalBalance FROM Customer
GO

SELECT RepNum, COUNT(*) TotalCustomer FROM Customer
GROUP BY RepNum

--Q3
SELECT COUNT(CustomerNum) NumberOfCustomers
FROM Customer
WHERE CreditLine = (SELECT MIN(CreditLine) FROM Customer)

SELECT * FROM Customer

--Q4
SELECT COUNT(CustomerNum) NumberOfCustomers
FROM Customer
WHERE Balance > (SELECT AVG(Balance) FROM Customer)

--Q5
SELECT c.CustomerNum, c.CustomerName, COUNT(o.OrderNum) TotalOrder
FROM Customer c LEFT JOIN Orders o
ON c.CustomerNum = o.CustomerNum
WHERE c.Balance > 5000
GROUP BY c.CustomerNum, c.CustomerName
HAVING COUNT(o.OrderNum) > 1