CREATE TABLE [dbo].[Department] (
    [DepartmentID]   INT           IDENTITY (1, 3) NOT NULL,
    [DepartmentName] VARCHAR (100) NOT NULL,
    PRIMARY KEY CLUSTERED ([DepartmentID] ASC)
);