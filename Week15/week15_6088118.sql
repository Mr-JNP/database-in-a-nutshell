-- Lab --
SELECT * FROM Customer

SELECT @@TRANCOUNT AmountTransaction

BEGIN TRANSACTION TB
SELECT * FROM Customer

SELECT @@TRANCOUNT AmountTransaction

BEGIN TRANSACTION TB
    SELECT * FROM Customer
    COMMIT TRANSACTION TB
    SELECT @@TRANCOUNT AmountTransaction

ROLLBACK TRANSACTION TB
SELECT @@TRANCOUNT AmountTransaction

BEGIN TRANSACTION TB
    DECLARE @id INT = 995
    INSERT INTO Customer
    VALUES (@id, 'Mahidol University', 'Phuttamonthon 4 Road', 'Salaya', 'NP', '73170', 6000, 90000, 20)

SELECT * FROM Customer ORDER BY CustomerNum DESC

SELECT @@TRANCOUNT AmountTransaction

COMMIT TRANSACTION TB

BEGIN TRY
    BEGIN TRANSACTION
    INSERT INTO Customer
    VALUES (994, 'Mahidol University', 'Phuttamonthon 4 Road', 'Salaya', 'HP', '73170', 6000, 90000, 20),
           (995, 'Mahidol University', 'Phuttamonthon 4 Road', 'Salaya', 'HP', '73170', 6000, 90000, 20),
           (996, 'Mahidol University', 'Phuttamonthon 4 Road', 'Salaya', 'HP', '73170', 6000, 90000, 20)
    COMMIT
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0)
        ROLLBACK
END CATCH

BEGIN TRY
    BEGIN TRANSACTION
    INSERT INTO Customer
    VALUES (998, 'Mahidol University', 'Phuttamonthon 4 Road', 'Salaya', 'HP', '73170', 6000, 90000, 20),
           (999, 'Mahidol University', 'Phuttamonthon 4 Road', 'Salaya', 'HP', '73170', 6000, 90000, 20),
           (1000, 'Mahidol University', 'Phuttamonthon 4 Road', 'Salaya', 'HP', '73170', 6000, 90000, 20)
    COMMIT
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0)
        ROLLBACK
END CATCH

SELECT @@TRANCOUNT AmountTransaction

-- Homework --

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE proc_UPDATECustomer
    @customerNum int,
    @customerName nvarchar(255),
    @street nvarchar(255),
    @city nvarchar(100),
    @state nvarchar(30),
    @zip nvarchar(30),
    @balance money,
    @creditLine money,
    @repNum int
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION
            UPDATE Customer
            SET CustomerName = @customerName,
                Street = @street,
                City = @city,
                State = @state,
                Zip = @zip,
                Balance = @balance,
                CreditLine = @creditLine,
                RepNum = @repNum
            WHERE CustomerNum = @customerNum

            SELECT * FROM Customer
            WHERE CustomerNum = @customerNum

        COMMIT
    END TRY
    BEGIN CATCH
        PRINT 'The update can''t be done. The transaction will be rolled back'
        ROLLBACK
    END CATCH
END

EXEC proc_UPDATECustomer
            @customerNum = 998,
            @customerName = 'ICT',
            @street = 'Rama 6',
            @city = 'Phayathai',
            @state = 'BK',
            @zip = '10400',
            @balance = 5000.00,
            @creditLine = 7000.00,
            @repNum = 20

SELECT * FROM Customer