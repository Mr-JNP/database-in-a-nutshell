--Q6
CREATE TABLE Q3
(
	Uid uniqueidentifier,
	Fname nvarchar(20),
	LoginDate date,
	LoginTime time,
	LogoutTime time
);
GO

--Q7
INSERT INTO Q3 (Uid, Fname, LoginDate, LoginTime) VALUES(NEWID(), 'Nontapat', GETDATE(), GETDATE());
GO

--Q8
UPDATE Q3 SET LogoutTime = dateadd(MINUTE, 18, getdate()) WHERE Fname = 'Nontapat';
GO

--Q9
SELECT Fname, FORMAT(CONVERT(datetime, LoginTime), 'hh:mm:ss') AS [Login Time]
			, FORMAT(CONVERT(datetime, LogoutTime), 'hh:mm:ss') AS [Logout Time] FROM Q3;
GO

--Q10
SELECT Fname, CONCAT(DAY(LoginDate), '-', DATENAME(MONTH, LoginDate), '-', YEAR(LoginDate)) AS [Login Date]
			, DATEDIFF(MINUTE, LoginTime, LogoutTime) AS [Online Time] FROM Q3;
GO