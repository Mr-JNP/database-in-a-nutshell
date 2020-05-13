-- Exercise 1
CREATE PROCEDURE proc_CustomerOrder
	@date datetime2,
	@orderCount int
AS
BEGIN
	Select o.OrderNum, OrderDate, CustomerNum, COUNT(o.OrderNum) AS [Amount of Order], SUM(QuotedPrice) AS [Total Price]
	FROM OrderLine l INNER JOIN Orders o
	ON l.OrderNum = o.OrderNum
	WHERE OrderDate = @date
	GROUP BY o.OrderNum, OrderDate, CustomerNum
    HAVING COUNT(o.OrderNum) >= @orderCount
END;


EXEC proc_CustomerOrder
@date = '2010-10-21', @orderCount = 1
GO


-- Exercise 2 (Homework)
CREATE PROCEDURE proc_InsertOrder
    @amount int,
    @part nvarchar(10),
    @customerNum int
    AS
    BEGIN
        declare @orderNum int;
        declare @price float;
        SET @orderNum = (SELECT MAX(OrderNum) FROM Orders)
        SET @price = (SELECT Price FROM Part WHERE PartNum = @part)
        INSERT INTO Orders VALUES (@orderNum+1, GETDATE(), @customerNum)
        INSERT INTO OrderLine VALUES (@orderNum+1, @part, @amount, @amount * @price)
    END;

EXEC proc_InsertOrder @amount = 2, @part = 'DR93', @customerNum = '608'


