USE P4
GO

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