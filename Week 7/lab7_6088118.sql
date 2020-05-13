--Q1
SELECT o.OrderNum, c.CustomerName FROM Orders o
INNER JOIN Customer c
ON o.CustomerNum = c.CustomerNum
GO

SELECT o.OrderNum, T.* FROM Orders o
CROSS APPLY
(SELECT CustomerName FROM Customer c WHERE o.CustomerNum = c.CustomerNum) AS T
GO

--Q2
SELECT c.*, o.OrderNum FROM Customer c
LEFT JOIN Orders o
ON c.CustomerNum = o.CustomerNum
GO

SELECT * FROM Customer c
OUTER APPLY
(SELECT OrderNum FROM Orders o WHERE c.CustomerNum = o.CustomerNum) AS T
GO

--Q3
SELECT o.OrderNum FROM Orders o
INNER JOIN OrderLine l
ON o.OrderNum = l.OrderNum
WHERE CustomerNum > 400
EXCEPT
SELECT OrderNum FROM Orders
WHERE OrderNum = '21617'
GO
