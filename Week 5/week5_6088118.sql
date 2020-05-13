--Q1
SELECT COUNT(PartNum) TotalPart FROM Part
GO

--Q2
SELECT COUNT(PartNum) FROM Part WHERE Class = 'HW'
GO

--Q3
SELECT OrderNum, COUNT(*) AS TotalOrder FROM OrderLine GROUP BY OrderNum
GO

--Q4
SELECT COUNT(CustomerNum) AS TotalCustomer, SUM(Balance) AS TotalBalance FROM Customer
GO

--Q5
SELECT AVG(Balance) AverageBalance FROM Customer
GO

--Q6
SELECT e.RepNum, e.TotalBalance, e.TotalCustomer
FROM (SELECT RepNum, SUM(Balance) TotalBalance, COUNT(*) TotalCustomer FROM Customer GROUP BY RepNum) e
WHERE e.TotalCustomer < 4
GO

SELECT RepNum, SUM(Balance) TotalBalance, COUNT(CustomerNum) TotalCustomer
FROM Customer
GROUP BY RepNum
HAVING COUNT(CustomerNum) < 4

--Q7
SELECT c.CustomerNum, c.CustomerName, COUNT(o.OrderNum) as TotalOrder
FROM Customer c LEFT JOIN Orders o
ON c.CustomerNum = o.CustomerNum
WHERE c.Balance > 5000
GROUP BY c.CustomerNum, c.CustomerName, c.Balance
GO