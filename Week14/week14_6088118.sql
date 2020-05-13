-- Week 14 Exercise and Homework
-- Name: Nontapat Pintira
-- Student ID: 6088118
USE PremierProducts

-- Q1
SELECT OrderNum, OrderDate, C.CustomerNum, AmountOrder, SumPrice
FROM (
         SELECT O.OrderNum, O.OrderDate, O.CustomerNum, COUNT(O.OrderNum) AS AmountOrder, SUM(NumOrdered * QuotedPrice) AS SumPrice
         FROM Orders O
             INNER JOIN OrderLine OL ON O.OrderNum = OL.OrderNum
         GROUP BY O.OrderNum, O.OrderDate, O.CustomerNum
     )
    AS OrderDetail
    INNER JOIN Customer C ON C.CustomerNum = OrderDetail.CustomerNum
WHERE C.CustomerNum = 608
GO


-- Q2
WITH OrderDetail (OrderNum, OrderDate, CustomerNum, AmountOrder, SumPrice)
AS
(
    SELECT O.OrderNum, O.OrderDate, O.CustomerNum, COUNT(O.OrderNum) AS AmountOrder, SUM(NumOrdered * QuotedPrice) AS SumPrice
    FROM Orders O
        INNER JOIN OrderLine OL ON O.OrderNum = OL.OrderNum
    GROUP BY O.OrderNum, O.OrderDate, O.CustomerNum
)
SELECT *
FROM OrderDetail
WHERE OrderDetail.CustomerNum = 608
GO

-- Q3.1
CREATE FUNCTION func_OrderDetail(@customerNum INT) RETURNS TABLE
AS
RETURN
(
    SELECT O.OrderNum, O.OrderDate, O.CustomerNum, COUNT(O.OrderNum) AS AmountOrder, SUM(NumOrdered * QuotedPrice) AS SumPrice
    FROM Orders O
    INNER JOIN OrderLine OL ON O.OrderNum = OL.OrderNum
    WHERE O.CustomerNum = @customerNum
    GROUP BY O.OrderNum, O.OrderDate, O.CustomerNum
);
GO

-- Q3.2
SELECT * FROM func_OrderDetail(608)
GO