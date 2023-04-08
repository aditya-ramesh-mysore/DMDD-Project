USE master;
use P4
go
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