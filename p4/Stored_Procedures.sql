USE master;

GO
use P4
go


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
EXEC GetStudentDetails @StudentID = 35, @StudentName = @StudentName OUTPUT, @CourseName = @CourseName OUTPUT
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




DROP PROCEDURE IF EXISTS CountUserTypes;
DROP PROCEDURE IF EXISTS GetTop5StudentPosts;
DROP PROCEDURE IF EXISTS GetTop5EmployerPosts;
DROP PROCEDURE IF EXISTS get_top_5_users_with_most_posts;
DROP PROCEDURE IF EXISTS GetMostLikedAndCommentedPosts;


