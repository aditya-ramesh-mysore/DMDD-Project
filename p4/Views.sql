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