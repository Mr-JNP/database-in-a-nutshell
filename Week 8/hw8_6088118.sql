--Q1
SELECT CustomerName FROM Customer
WHERE City = 'Fillmore' AND CustomerNum IN (
	SELECT CustomerNum FROM Orders)

--Q2
SELECT CustomerName, Balance, CreditLine FROM Customer
WHERE CreditLine > (
	SELECT AVG(CreditLine) FROM Customer)

--Q3
SELECT CustomerName, Balance FROM Customer
WHERE Balance > (
	SELECT Balance FROM Customer WHERE CustomerName = 'Ferguson''s')

--Q4
SELECT * FROM Customer 
WHERE CustomerNum IN (
	SELECT CustomerNum FROM Orders WHERE OrderNum IN (
		SELECT OrderNum FROM OrderLine
		WHERE PartNum IN (
			SELECT PartNum FROM Part WHERE Description = 'Home Gym')
		INTERSECT
		SELECT OrderNum FROM OrderLine
		WHERE PartNum IN (
			SELECT PartNum FROM Part WHERE Description = 'Microwave Oven'))
)

--Q5
SELECT PartNum, Description FROM Part
WHERE Price > (
	SELECT AVG(QuotedPrice) FROM OrderLine)
