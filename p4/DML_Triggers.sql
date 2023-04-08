USE master;

CREATE DATABASE P4;
GO
use P4
go

--DML Triggers

--AFTER INSERT trigger that only inserts rows with the user type of 'Group' into the [Group] table

GO

CREATE TRIGGER [User_Insert_Group]
ON [User]
AFTER INSERT
AS
BEGIN
    IF EXISTS (SELECT * FROM inserted WHERE UserType = 'Group')
    BEGIN
        INSERT INTO [Group] (G_UserID) 
        SELECT UserID FROM inserted
        WHERE [UserType] = 'Group';
    END
END

--AFTER INSERT trigger that only inserts rows with the user type of 'Professor' into the [Professor] table

GO

CREATE TRIGGER [User_Insert_Professor]
ON [User]
AFTER INSERT
AS
BEGIN
    IF EXISTS (SELECT * FROM inserted WHERE UserType = 'Professor')
    BEGIN
        INSERT INTO [Professor] (P_UserID) 
        SELECT UserID FROM inserted
        WHERE [UserType] = 'Professor';
    END
END

--AFTER INSERT trigger that only inserts rows with the user type of 'Student' into the [Student] table

GO

CREATE TRIGGER [User_Student_Group]
ON [User]
AFTER INSERT
AS
BEGIN
    IF EXISTS (SELECT * FROM inserted WHERE UserType = 'Student')
    BEGIN
        INSERT INTO [Student] (S_UserID) 
        SELECT UserID FROM inserted
        WHERE [UserType] = 'Student';
    END
END

--AFTER INSERT trigger that only inserts rows with the user type of 'Employer' into the [Group] table

GO

CREATE TRIGGER [User_Insert_Employer]
ON [User]
AFTER INSERT
AS
BEGIN
    IF EXISTS (SELECT * FROM inserted WHERE UserType = 'Employer')
    BEGIN
        INSERT INTO [Employer] (E_UserID) 
        SELECT UserID FROM inserted
        WHERE [UserType] = 'Employer';
    END
END

