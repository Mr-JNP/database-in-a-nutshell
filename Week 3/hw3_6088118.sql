-- Q11
SELECT MarinaNum, SlipNum 
FROM MarinaSlip 
WHERE BoatType IN ('Sprite 4000', 'Sprite 3000', 'Ray 4025')

-- Q12
SELECT MarinaNum, SlipNum, BoatName 
FROM MarinaSlip 
ORDER BY MarinaNum, BoatName

-- Q13
SELECT COUNT(SlipID) Count_Type
FROM MarinaSlip 
WHERE BoatType = 'Dolphin 25'

-- Q14
SELECT Length, SUM(RentalFee) AnnualFee 
FROM MarinaSlip 
GROUP BY Length

-- Q15
SELECT MarinaNum, SlipNum, BoatName, o.OwnerNum, FirstName, LastName 
FROM MarinaSlip m 
INNER JOIN Owner o ON m.OwnerNum = o.OwnerNum

-- Q16
SELECT c.CategoryDescription, Description, Status 
FROM ServiceRequest s 
INNER JOIN ServiceCategory c ON s.CategoryNum = c.CategoryNum
WHERE c.CategoryDescription = 'Routine engine maintenance' 

-- Q17
SELECT c.CategoryDescription, m.SlipID, MarinaNum, SlipNum, EstHours, SpentHours, o.OwnerNum, LastName 
FROM MarinaSlip m
INNER JOIN Owner o ON m.OwnerNum = o.OwnerNum 
INNER JOIN ServiceRequest s ON m.SlipID = s.SlipID
INNER JOIN ServiceCategory c ON s.CategoryNum = c.CategoryNum
WHERE c.CategoryDescription = 'Routine engine maintenance'