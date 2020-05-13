-- Nontapat Pintira, 6088118, Track CS

-- Q1 --
CREATE DATABASE TestTrigger;

CREATE TABLE Person(
    pid VARCHAR(255) PRIMARY KEY,
    fullname VARCHAR(255) NOT NULL,
    budget DECIMAL(18,2) NOT NULL,
    proj_id  VARCHAR(255)
);

CREATE TABLE project(
    proj_id varchar(255) PRIMARY KEY ,
    proj_name varchar(255) not null ,
    total_budget decimal(18,2) not null
);

create table LogFileAudit(
    LogID varchar(255) primary key,
    Action varchar(255) not null,
    Tablename varchar(255) not null
);

-- Q2.1 --
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

insert into person(pid, fullname, budget, proj_id) values ('011', 'AAA', 20000, '1');

-- Q2.2 --
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

delete from project where proj_id='4'

