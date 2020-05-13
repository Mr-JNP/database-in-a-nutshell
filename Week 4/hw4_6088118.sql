--HW
SELECT p.ProductID, s.SpecialOfferID
FROM Production.Product p
LEFT JOIN Sales.SpecialOfferProduct s
ON p.ProductID = s.ProductID
LEFT JOIN Sales.SpecialOffer o
ON s.SpecialOfferID = o.SpecialOfferID
WHERE s.SpecialOfferID IS NULL OR o.Category = 'No Discount' 