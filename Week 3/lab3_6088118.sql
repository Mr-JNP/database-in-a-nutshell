-- Q1
SELECT OwnerNum, LastName, FirstName FROM Owner

-- Q2
SELECT * FROM Marina

-- Q3
SELECT LastName, FirstName 
FROM Owner 
WHERE City = 'Bowton'

-- Q4
SELECT LastName, FirstName 
FROM Owner 
WHERE City != 'Bowton'

-- Q5
SELECT MarinaNum, SlipNum 
FROM MarinaSlip 
WHERE Length <= 30

-- Q6
SELECT MarinaNum, SlipNum 
FROM MarinaSlip 
WHERE BoatType = 'Dolphin 28'

-- Q7
SELECT SlipNum 
FROM MarinaSlip 
WHERE BoatType = 'Dolphin 28' AND MarinaNum = 1

-- Q8
SELECT BoatName 
FROM MarinaSlip 
WHERE Length BETWEEN 25 AND 30

-- Q9
SELECT SlipNum 
FROM MarinaSlip 
WHERE MarinaNum = 1 AND RentalFee < 3000

-- Q10
SELECT SlipID, CategoryNum, EstHours, EstHours*60 LaborCost
FROM ServiceRequest