-- Q1
drop database testDB;

--Q2
create database testDB collate THAI_CI_AS

--Q3
CREATE TABLE [dbo].[Students](
	[StudentID] [int] NOT NULL,
	[FirstName] [nchar](20) NULL,
	[LastName] [nchar](20) NULL,
	[NickName] [nchar](20) NULL,
	[Email] [nchar](50) NULL,
	[PhoneNumber] [nchar](10) NULL,
	[Sex] [nchar](10) NULL,
	[BirthDate] [date] NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

--Q4
insert into Students
values	(6088219, 'Pantita', 'Wang', 'Fangfang', 'pantita.wan@student.mahidol.edu', '0892454675', 'Female', '1999-03-23')

--Q5
insert into Students (StudentID, FirstName, LastName)
values	(6088118, 'Nontapat', 'Pintira', 'Joke'),
		(6088023, 'Paweennat', 'Foitong', 'Petong'),
		(6088109, 'Thanakorn', 'Pasangthein', 'Ming')

--Q6
update Students
set PhoneNumber = '0832687444'
where StudentID = 6088118;

update Students
set PhoneNumber = '0892454675'
where StudentID = 6088219;

update Students
set PhoneNumber = '0805148984'
where StudentID = 6088023;

update Students
set PhoneNumber = '0968870823'
where StudentID = 6088109;

--Q7
delete from Students
where StudentID = 6088109
