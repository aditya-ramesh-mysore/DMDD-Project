USE master;


GO
use P4
go


-- stored procedure to count all types of users in the User table.
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


DROP PROCEDURE IF EXISTS CountUserTypes;
DROP PROCEDURE IF EXISTS GetTop5StudentPosts;
DROP PROCEDURE IF EXISTS GetTop5EmployerPosts;
DROP PROCEDURE IF EXISTS get_top_5_users_with_most_posts;
DROP PROCEDURE IF EXISTS GetMostLikedAndCommentedPosts;
DROP PROCEDURE IF EXISTS UpdateProfessorData;


