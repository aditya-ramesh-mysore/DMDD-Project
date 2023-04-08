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



-- stored procedure that will return the top 5 active groups in a given time period
-- go
-- CREATE PROCEDURE GetMostActiveGroups
--     @start_date DATETIME,
--     @end_date DATETIME
-- AS
-- BEGIN
--     SET NOCOUNT ON;

--     SELECT TOP 5 [Group].G_UserID, COUNT(*) AS NumPosts
--     FROM [Group]
--     INNER JOIN [Post] ON [Group].G_UserID = [Post].UserID
--     WHERE [Post].Post_TimeStamp BETWEEN @start_date AND @end_date
--     GROUP BY [Group].G_UserID
--     ORDER BY NumPosts DESC;

-- END


-- EXEC GetMostActiveGroups '2012-04-14', '2012-04-16';
-- DROP PROCEDURE IF EXISTS GetMostActiveGroups;


DROP PROCEDURE IF EXISTS CountUserTypes;
DROP PROCEDURE IF EXISTS GetTop5StudentPosts;
DROP PROCEDURE IF EXISTS GetTop5EmployerPosts;
DROP PROCEDURE IF EXISTS get_top_5_users_with_most_posts;
DROP PROCEDURE IF EXISTS GetMostLikedAndCommentedPosts;


