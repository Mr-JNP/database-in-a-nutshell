--Q1
SELECT PartNum, Description FROM Part
WHERE Price >= (SELECT AVG(Price) FROM Part)

--Q2
SELECT CustomerName FROM Customer
WHERE CustomerNum IN (SELECT CustomerNum FROM Orders WHERE OrderDate < '2010-10-22')

--Q3
SELECT CustomerName FROM Customer
WHERE RepNum IN (SELECT RepNum FROM Rep WHERE FirstName = 'Valerie' AND LastName = 'Kaiser')

--Q4
SELECT CustomerName, Balance FROM Customer
WHERE Balance > (Select Balance FROM Customer WHERE CustomerName = 'Brookings Direct')