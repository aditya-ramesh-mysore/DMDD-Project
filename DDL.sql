USE master;

CREATE DATABASE P4;
GO
use P4
go

CREATE TABLE [User]
(
	UserID int not null,
	[Name] nvarchar(25),
    UserName nvarchar(25),
	[Password] varchar(50),
	UserType varchar(50),
	CONSTRAINT User_PK PRIMARY KEY (UserID),
    CONSTRAINT UserType_Check CHECK (UserType IN ('Student', 'Professor', 'Employer', 'Group'))
);

CREATE TABLE [Group]
(
    G_UserID int not null,
    CreationDate datetime default GETDATE(),
    CONSTRAINT Group_PK PRIMARY KEY (G_UserID),
    CONSTRAINT Group_FK FOREIGN KEY (G_UserID) REFERENCES [User](UserID) ON DELETE CASCADE,
);

CREATE TABLE [Professor]
(
    P_UserID int not null,
    ReasarchInterest varchar(50),
    DateOfBirth date,
	Age int,
    Gender varchar(10),
    Check (Gender IN ('Male', 'Female', 'Other')),
    CONSTRAINT Professor_PK PRIMARY KEY (P_UserID),
    CONSTRAINT Professor_FK FOREIGN KEY (P_UserID) REFERENCES [User](UserID) ON DELETE CASCADE,
);

CREATE TABLE [Student]
(
    S_UserID int not null,
    Major varchar(50),
    DateOfBirth date,
	Age int,
    Gender varchar(10),
    Check (Gender IN ('Male', 'Female', 'Other')),
    CONSTRAINT Student_PK PRIMARY KEY (S_UserID),
    CONSTRAINT Student_FK FOREIGN KEY (S_UserID) REFERENCES [User](UserID) ON DELETE CASCADE,
);

CREATE TABLE [Employer]
(
    E_UserID int not null,
    [Location] varchar(50),
    CONSTRAINT Employer_PK PRIMARY KEY (E_UserID),
    CONSTRAINT Employer_FK FOREIGN KEY (E_UserID) REFERENCES [User](UserID) ON DELETE CASCADE,
);

CREATE TABLE [Post]
(
    PostID int not null,
    UserID int not null,
    [Description] varchar(200),
    Post_TimeStamp datetime default GETDATE(),
    CONSTRAINT Post_Pk PRIMARY KEY (PostID),
    CONSTRAINT User_FK FOREIGN key (UserID) REFERENCES [User](UserID)
);

CREATE TABLE [GeneralPost]
(
    G_PostID int not null,
    Category varchar(50),
    CONSTRAINT GeneralPost_PK PRIMARY KEY (G_PostID),
    CONSTRAINT GeneralPost_FK FOREIGN KEY (G_PostID) REFERENCES [Post](PostID)
);

CREATE TABLE [MarketPlacePost]
(
    M_PostID int not null,
    [Type] varchar(50),
    Price varchar(20),
    [Availability] Varchar(20),
    CONSTRAINT MarketPlacePost_PK PRIMARY KEY (M_PostID),
    CONSTRAINT MarketPlacePost_FK FOREIGN KEY (M_PostID) REFERENCES [Post](PostID)
);



CREATE TABLE [PostLike]
(
    Like_TimeStamp datetime default GETDATE(),
    UserID int NOT NULL,
    PostID int NOT NULL,
    CONSTRAINT PostLike_PK PRIMARY KEY (Like_TimeStamp, UserID),
    CONSTRAINT PostLike_FK_UserID FOREIGN KEY (UserID) REFERENCES [User](UserID),
    CONSTRAINT PostLike_FK_PostID FOREIGN KEY (PostID) REFERENCES [Post](PostID)
);



CREATE TABLE Comment
(
    CommentID int NOT NULL,
    UserID int NOT NULL,
    PostID int NOT NULL,
    Com_Description varchar(200),
    Cmt_TimeStamp datetime default GETDATE(),
    CONSTRAINT Comment_PK PRIMARY KEY (CommentID),
    CONSTRAINT Comment_FK_UserID FOREIGN KEY (UserID) REFERENCES [User](UserID),
    CONSTRAINT Comment_FK_PostID FOREIGN KEY (PostID) REFERENCES [Post](PostID)
);

CREATE TABLE CommentLike
(
    Cmt_like_TimeStamp datetime default GETDATE(),
    UserID int NOT NULL,
    CommentID int NOT NULL,
    CONSTRAINT CommentLike_PK PRIMARY KEY (Cmt_like_TimeStamp, UserID),
    CONSTRAINT CommentLike_FK_UserID FOREIGN KEY (UserID) REFERENCES [User](UserID),
    CONSTRAINT CommentLike_FK_CommentID FOREIGN KEY (CommentID) REFERENCES [Comment](CommentID)
);