




CREATE TABLE [dbo].[Department] (
    [DepartmentID]   INT           IDENTITY (1, 3) NOT NULL,
    [DepartmentName] VARCHAR (100) NOT NULL,
    PRIMARY KEY CLUSTERED ([DepartmentID] ASC)
);




CREATE TABLE [dbo].[Doctor] (
    [DoctorID]     INT          IDENTITY (1, 2) NOT NULL,
    [Name]         VARCHAR (50) NOT NULL,
    [Email]        VARCHAR (50) NOT NULL,
    [ContactNo]    VARCHAR (50) NOT NULL,
    [DepartmentID] INT          NULL,
    [Username]     VARCHAR (50) NULL,
    [Password]     VARCHAR (15) NULL,
    PRIMARY KEY CLUSTERED ([DoctorID] ASC),
    FOREIGN KEY ([DepartmentID]) REFERENCES [dbo].[Department] ([DepartmentID])
);

--------------------------------------------------------------------------------------------------------------------------

CREATE TABLE [dbo].[Employee] (
    [EmployeeID]   INT          IDENTITY (1, 2) NOT NULL,
    [Name]         VARCHAR (50) NOT NULL,
    [Email]        VARCHAR (50) NOT NULL,
    [ContactNo]    VARCHAR (50) NOT NULL,
    [DepartmentID] INT          NULL,
    [Username]     VARCHAR (50) NULL,
    [Password]     VARCHAR (15) NULL,
    PRIMARY KEY CLUSTERED ([EmployeeID] ASC),
    FOREIGN KEY ([DepartmentID]) REFERENCES [dbo].[Department] ([DepartmentID])
);



--CREATE TABLE [dbo].[ReunionRegistration] (
--    [ReunionRegistrationID] INT           IDENTITY (1, 1) NOT NULL,
--    [FullName]              VARCHAR (50)  NOT NULL,
--    [EmailAddress]          VARCHAR (50)  NOT NULL,
--    [BatchNo]               VARCHAR (50)  NOT NULL,
--    [PhoneNumber]           VARCHAR (15)  NOT NULL,
--    [Message]               VARCHAR (250) NULL,
--    PRIMARY KEY CLUSTERED ([ReunionRegistrationID] ASC)
--);


CREATE TABLE [dbo].[Patient] (
    [PatientID]    INT          IDENTITY (1, 2) NOT NULL,
    [Name]         VARCHAR (50) NOT NULL,
    [Age]          VARCHAR (50) NOT NULL,
    [Gender]       VARCHAR (10) NOT NULL,
    [Email]        VARCHAR (50) NOT NULL,
    [ContactNo]    VARCHAR (50) NOT NULL,
    [DepartmentID] INT          NULL,
    [AppointmentDate]  Date NOT NULL,

    PRIMARY KEY CLUSTERED ([PatientID] ASC),
    FOREIGN KEY ([DepartmentID]) REFERENCES [dbo].[Department] ([DepartmentID])
);

ALTER TABLE  [dbo].[Patient]  WITH CHECK ADD  CONSTRAINT [FK_Department] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Department] ([DepartmentID])
ON DELETE CASCADE
ON Update CASCADE

GO

ALTER TABLE  [dbo].[Patient] CHECK CONSTRAINT [FK_Department]
GO

INSERT INTO Department VALUES ('Medicine')
INSERT INTO Department VALUES ('Surgery')
INSERT INTO Department VALUES ('Gynae')
INSERT INTO Department VALUES ('Dental')
INSERT INTO Department VALUES ('OrthoPaediacis')

Select * From Department
Select * From [dbo].[Patient]


 Delete From [dbo].[Patient] Where PatientID=3


 Update  [dbo].[Patient] Set Name='Alamgir' Where PatientID=9



create procedure sp_hospital_departmentsignup(@departmentname varchar(20))
as
begin
insert into sp_hospital_departmentsignup values(@departmentname)
end

create procedure sp_hospital_doctorsignup(@name varchar(20),@email varchar(20),@contactno varchar(20),
@departmentid varchar(20),@username varchar(20),@password varchar(20))
as
begin
insert into hospital_doctorsignup values(@name,@email,@contactno,@departmentid,@username,@password)
end

create procedure sp_hospital_empsignup(@name varchar(20),@email varchar(20),@contactno varchar(20),
@departmentid varchar(20),@username varchar(20),@password varchar(20))
as
begin
insert into sp_hospital_empsignup values(@name,@email,@contactno,@departmentid,@username,@password)
end
