USE master;
GO

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
	[UserType] varchar(50),
	CONSTRAINT User_PK PRIMARY KEY (UserID),
    CONSTRAINT UserType_Check CHECK (UserType IN ('Student', 'Professor', 'Employer', 'Group'))
);

CREATE TABLE [Group]
(
    G_UserID int not null,
    CreationDate datetime default GETDATE(),
    CONSTRAINT Group_PK PRIMARY KEY (G_UserID),
    CONSTRAINT Group_FK FOREIGN KEY (G_UserID) REFERENCES [User](UserID) ON DELETE CASCADE,
    CONSTRAINT Group_Check_CreationDate CHECK (CreationDate <= GETDATE())
);

CREATE TABLE [Professor]
(
    P_UserID int not null,
    ReasarchInterest varchar(50),
    DateOfBirth date,
    Gender varchar(10),
    CHECK (Gender IN ('Male', 'Female', 'Other')),
    CONSTRAINT Professor_PK PRIMARY KEY (P_UserID),
    CONSTRAINT Professor_FK FOREIGN KEY (P_UserID) REFERENCES [User](UserID) ON DELETE CASCADE,
);

CREATE TABLE [Student]
(
    S_UserID int not null,
    Major varchar(50),
    DateOfBirth date,
    Gender varchar(10),
    CHECK (Gender IN ('Male', 'Female', 'Other')),
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


-- Done creating tables





-- Stored procedures with input and output parameters

-- GetStudentDetails - This stored procedure takes in an input parameter StudentID 
-- and returns the output parameters StudentName and CourseName.
GO
CREATE PROCEDURE GetStudentDetails
    @StudentID INT,
    @StudentName VARCHAR(50) OUTPUT,
    @CourseName VARCHAR(50) OUTPUT
AS
BEGIN
    SELECT @StudentName = [Name], @CourseName = Major
    FROM [User]
    JOIN [Student] ON [User].UserID = [Student].S_UserID
    WHERE [Student].S_UserID = @StudentID
END

DECLARE @StudentName VARCHAR(50), @CourseName VARCHAR(50)
EXEC GetStudentDetails @StudentID = 25, @StudentName = @StudentName OUTPUT, @CourseName = @CourseName OUTPUT
SELECT @StudentName, @CourseName



-- GetCourseStudents - This stored procedure takes in an input parameter CourseID 
-- and returns a list of student names who are enrolled in that course.

GO
CREATE PROCEDURE GetCourseStudents
    @Major VARCHAR(50),
    @StudentList VARCHAR(MAX) OUTPUT
AS
BEGIN
    SET @StudentList = ''
    SELECT @StudentList = @StudentList + [Name] + ','
    FROM [User] U
    JOIN [Student] S ON U.UserID = S.S_UserID
    WHERE S.Major = @Major
    SET @StudentList = LEFT(@StudentList, LEN(@StudentList) - 1)
END


DECLARE @StudentList VARCHAR(MAX)
EXEC GetCourseStudents @Major = 'Computer Vision', @StudentList = @StudentList OUTPUT
SELECT @StudentList


-- stored procedure that retrieves the number of likes and comments for a given post
-- with PostID as input.
GO
CREATE PROCEDURE GetPostStats
    @PostID INT,
    @NumLikes INT OUTPUT,
    @NumComments INT OUTPUT
AS
BEGIN
    SELECT @NumLikes = COUNT(*)
    FROM [PostLike]
    WHERE PostID = @PostID
    
    SELECT @NumComments = COUNT(*)
    FROM Comment
    WHERE PostID = @PostID
END

DECLARE @NumLikes INT, @NumComments INT
EXEC GetPostStats @PostID = 4, @NumLikes = @NumLikes OUTPUT, @NumComments = @NumComments OUTPUT
SELECT @NumLikes, @NumComments



--Stored procedure that takes in the required values and updates the existing row in the Professor table for the specified P_UserID
GO
CREATE PROCEDURE UpdateProfessorData
    @P_UserID INT,
    @ResearchInterest VARCHAR(50),
    @DateOfBirth DATE,
    @Gender VARCHAR(10)
AS
BEGIN
    SET NOCOUNT ON;
    
    UPDATE Professor
    SET ReasarchInterest = @ResearchInterest,
        DateOfBirth = @DateOfBirth,
        Gender = @Gender
    WHERE P_UserID = @P_UserID;
END

GO
EXEC UpdateProfessorData @P_UserID = 11, @ResearchInterest = 'Artificial Intelligence', @DateOfBirth = '1990-01-01', @Gender = 'Male';



DROP PROCEDURE IF EXISTS GetStudentDetails;
DROP PROCEDURE IF EXISTS GetCourseStudents;
DROP PROCEDURE IF EXISTS GetPostStats;
DROP PROCEDURE IF EXISTS UpdateProfessorData;








-- general stored procedures
-- stored procedure to count all types of users in the User table.
GO
CREATE PROCEDURE CountUserTypes
AS
BEGIN
    SELECT 
        (SELECT COUNT(*) FROM [User]) AS 'Total',
        (SELECT COUNT(*) FROM [Student]) AS 'Students',
        (SELECT COUNT(*) FROM [Professor]) AS 'Professors',
        (SELECT COUNT(*) FROM [Group]) AS 'Groups',
        (SELECT COUNT(*) FROM [Employer]) AS 'Employers'
END

EXEC CountUserTypes

-- stored procedure to show top 5 student who have made highest number of posts
go
CREATE PROCEDURE GetTop5StudentPosts
AS
BEGIN
    SELECT TOP 5 [User].UserID, [User].Name, COUNT(*) AS NumPosts
    FROM [User]
    JOIN [Student] ON [User].UserID = [Student].S_UserID
    JOIN [Post] ON [User].UserID = [Post].UserID
    GROUP BY [User].UserID, [User].Name
    ORDER BY NumPosts DESC;
END

EXEC GetTop5StudentPosts;


-- stored procedure to show top 5 employers who have made highest number of posts
go
CREATE PROCEDURE GetTop5EmployerPosts
AS
BEGIN
    SELECT TOP 5 [User].UserID, [User].Name, COUNT(*) AS NumPosts
    FROM [User]
    JOIN [Employer] ON [User].UserID = [Employer].E_UserID
    JOIN [Post] ON [User].UserID = [Post].UserID
    GROUP BY [User].UserID, [User].Name
    ORDER BY NumPosts DESC;
END

EXEC GetTop5EmployerPosts;


-- stored procedure to show top 10 users who have made highest number of posts
go
CREATE PROCEDURE get_top_5_users_with_most_posts
AS
BEGIN
    SELECT TOP 5 u.UserName, COUNT(*) as post_count
    FROM [User] u
    JOIN [Post] p ON u.UserID = p.UserID
    GROUP BY u.UserName
    ORDER BY post_count DESC;
END

EXEC get_top_5_users_with_most_posts;


-- stored procedure to show top 5 posts which have most likes and comments
GO
CREATE PROCEDURE GetMostLikedAndCommentedPosts
AS
BEGIN
    SELECT TOP 5
        Post.PostID,
        Post.[Description],
        COUNT(DISTINCT PostLike.UserID) AS NumLikes,
        COUNT(DISTINCT Comment.CommentID) AS NumComments
    FROM Post
    LEFT JOIN PostLike ON Post.PostID = PostLike.PostID
    LEFT JOIN Comment ON Post.PostID = Comment.PostID
    GROUP BY Post.PostID, Post.[Description]
    ORDER BY COUNT(DISTINCT PostLike.UserID) + COUNT(DISTINCT Comment.CommentID) DESC;
END

EXEC GetMostLikedAndCommentedPosts;


--Views

--A view that shows all posts with their associated comments

Go
CREATE VIEW [PostWithComments] AS
SELECT 
    [Post].[Description], 
    [Post].[Post_TimeStamp], 
    [Comment].[Com_Description], 
    [Comment].[Cmt_TimeStamp], 
    [User].[Name] AS [CommenterName]
FROM 
    [Post] 
    LEFT JOIN [Comment] ON [Post].[PostID] = [Comment].[PostID]
    JOIN [User] ON [Comment].[UserID] = [User].[UserID];

GO
SELECT * from [PostWithComments]

--A view that shows all the posts, along with the user who created the post and the number of likes each post has received
GO
CREATE VIEW [AllPosts] AS
SELECT [User].UserName, [Post].PostID, [Post].Description, COUNT([PostLike].UserID) AS Likes
FROM [User]
INNER JOIN [Post] ON [User].UserID = [Post].UserID
LEFT JOIN [PostLike] ON [Post].PostID = [PostLike].PostID
GROUP BY [User].UserName, [Post].PostID, [Post].Description;

GO
select * from [AllPosts];

--A view that shows all the marketplace posts along with the names of the users who created them and their user types
GO
CREATE VIEW MarketplacePostsWithUser AS
SELECT P.PostID, M.Type, M.Price, M.Availability, U.UserName, U.UserType
FROM Post P
INNER JOIN MarketPlacePost M ON P.PostID = M.M_PostID
INNER JOIN [User] U ON P.UserID = U.UserID;

GO
Select * from MarketplacePostsWithUser;


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

GO
-- User defined funciton to calculate age based on a given date
CREATE FUNCTION Calculate_Age(@DateOfBirth DATE)
RETURNS INT
AS
   BEGIN
      DECLARE @Age INT = DATEDIFF(hour,@DateOfBirth,GETDATE())/8766;
      RETURN @Age;
END
GO

ALTER TABLE Student
ADD Age AS dbo.Calculate_Age(DateOfBirth);
GO

SELECT * FROM Student;
GO

-- User defined function to calculate the number of likes on a post
CREATE FUNCTION Calculate_Number_Of_Likes(@PostID INT)
RETURNS INT
AS
   BEGIN
      DECLARE @NoOfLikes INT;
      SET @NoOfLikes = (
         SELECT COUNT(PostID)
         FROM dbo.PostLike
         WHERE PostID = @PostID
      );
      RETURN @NoOfLikes;
END
GO

ALTER TABLE dbo.Post
ADD NumberOfLikes AS dbo.Calculate_Number_Of_Likes(PostID);
GO

SELECT * FROM dbo.Post;
GO

-- User defined function to return the number of comments on a single post

CREATE FUNCTION Calculate_Number_Of_Comments(@PostID INT)
RETURNS INT
AS
   BEGIN
      DECLARE @NoOfComments INT;
      SET @NoOfComments = (
         SELECT COUNT(CommentID)
         FROM dbo.Comment
         WHERE PostID = @PostID
      );
      RETURN @NoOfComments;
END
GO

ALTER TABLE dbo.Post
ADD NumberOfComments AS dbo.Calculate_Number_Of_Comments(PostID);
GO

SELECT * FROM dbo.Post;
GO

-- Created non clustered indexes for Post, Student, Comment and Like tables to ensure efficient query retrieval

CREATE NONCLUSTERED INDEX NonClustered_Post
ON [Post] ([Description])
WITH (ONLINE = ON , FILLFACTOR=90)

CREATE NONCLUSTERED INDEX NonClustered_Student
ON [Student] ([Major], [DateOfBirth])
WITH (ONLINE = ON , FILLFACTOR=90)

CREATE NONCLUSTERED INDEX NonClustered_Comment
ON [Comment] ([UserID], [PostID])
WITH (ONLINE = ON , FILLFACTOR=90)

CREATE NONCLUSTERED INDEX NonClustered_Like
ON [PostLike] ([UserID], [PostID])