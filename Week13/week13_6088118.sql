CREATE DATABASE TestTrigger;
use TestTrigger;

CREATE TABLE person (
    pid varchar(255) PRIMARY KEY,
    full_name varchar(255) not null,
    budget decimal(18,2) not null,
    proj_id varchar(255)
);

CREATE TABLE project(
    proj_id varchar(255) PRIMARY KEY ,
    proj_name varchar(255) not null ,
    total_budget decimal(18,2) not null
);

insert into person(pid, full_name, budget, proj_id) values
('001', 'Peter Copper', 20000, '1'),
('002', 'Sarah MaCorr', 10000, '1'),
('003', 'Henry Pipe', 25000, '1'),
('004', 'Wilman Kala', 30000, '2'),
('005', 'Matti Karttunen', 5000, '2'),
('006', 'Luke Miller', 21000, '3'),
('007', 'Margaret Johnson', 22000, '3'),
('008', 'Bruce Randall', 32000, '3'),
('009', 'Hina Siddiqui', 23000, '3'),
('010', 'Joanne Mills', 25000, '4');

insert into project (proj_id, proj_name, total_budget) values
('1', 'Project 1', 55000)
,('2', 'Project 2', 35000)
,('3', 'Project 3', 98000)
,('4', 'Project 4', 25000);

select * from person
select * from project

create trigger minBudget
    on person
    for insert, update
    as
    begin
        set nocount on;
        if((select min(budget) from inserted) < 10000)
        begin
            print 'The minumum budget is 10000. You need more budget to perform insertion';
            rollback
        end
    end

insert into person(pid, full_name, budget, proj_id) values ('011', 'Sarah Mogan', 5000, '4');

create trigger sumBudget
    on person
    after insert, update, delete
    as
    begin
        set nocount on;
        declare @projID varchar(255);
        declare @sumBudget decimal(18,2);

        set @projID = (select distinct proj_id from inserted)

        if @projID is null
        begin
            set @projID = (select distinct proj_id from deleted)
        end

        set @sumbudget = (select sum(budget) from [person] where proj_id = @projID)
        update project set total_budget = @sumBudget where proj_id = @projID
    end

insert into person(pid, full_name, budget, proj_id) values ('011', 'Sarah Mogan', 15000, '4');
update person set budget = 10000 where pid = '001'

create trigger delProject
    on project
    after delete
    as
    begin
        set nocount on;
        declare @proj_id int;
        set @proj_id = (select proj_id from deleted)

        update person
        set proj_id = NULL
        where proj_id = @proj_id;
    end

create table LogFileAudit(
    LogID varchar(255) primary key,
    Action varchar(255) not null,
    Tablename varchar(255) not null
);

create trigger addLogINS
    on person
    after insert
    as
    begin
        set nocount on;
        declare @max_id int
        set @max_id = (select max(LogID) from LogFileAudit)

        if @max_id is null
        begin
            set @max_id = 0
        end

        set @max_id = @max_id + 1
        insert into LogFileAudit values (@max_id, 'INSERT', 'person')
    end

create trigger addLogDEL
    on project
    after delete
    as
    begin
        set nocount on;
        declare @max_id int
        set @max_id = (select max(LogID) from LogFileAudit)

        if @max_id is null
        begin
            set @max_id = 0
        end

        set @max_id = @max_id + 1
        insert into LogFileAudit values (@max_id, 'DELETE', 'project')

    end

insert into person(pid, full_name, budget, proj_id) values ('012', 'Joke', 100000, '4');
delete from project where proj_id='3'