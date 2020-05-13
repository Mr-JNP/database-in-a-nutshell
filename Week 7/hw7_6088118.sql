--Q1
SELECT SlipID FROM MarinaSlip
EXCEPT
SELECT SlipID FROM ServiceRequest

--Q2
SELECT DISTINCT Status FROM ServiceRequest
EXCEPT
SELECT Status FROM ServiceRequest WHERE Status='Open'

--Q3
SELECT City, State FROM Owner
UNION
SELECT City, State FROM Owner
ORDER BY City, State DESC

SELECT DISTINCT City, State FROM Owner
ORDER BY City, State DESC

--Q4
SELECT City FROM Owner 
UNION 
SELECT City FROM Marina

--Q6
SELECT * FROM Owner o
CROSS APPLY (SELECT SlipID, BoatType FROM MarinaSlip m WHERE o.OwnerNum = m.OwnerNum) AS T

--Q7
SELECT Name, T.[Maximum Fee] FROM Marina m
CROSS APPLY (SELECT MAX(RentalFee) [Maximum Fee] FROM MarinaSlip s WHERE m.MarinaNum = s.MarinaNum GROUP BY MarinaNum) AS T

SELECT Name, MAX(RentalFee) [Maximum Fee] FROM Marina m
INNER JOIN MarinaSlip s ON m.MarinaNum = s.MarinaNum
GROUP BY m.Name, m.MarinaNum

--Q8
SELECT MarinaNum, SlipNum, BoatName, OwnerNum, T.* FROM MarinaSlip s
CROSS APPLY (Select FirstName, LastName FROM Owner o Where s.OwnerNum = o.OwnerNum) AS T

SELECT MarinaNum, SlipNum, BoatName, o.OwnerNum, FirstName, LastName FROM MarinaSlip s
INNER JOIN Owner o ON s.OwnerNum = o.OwnerNum