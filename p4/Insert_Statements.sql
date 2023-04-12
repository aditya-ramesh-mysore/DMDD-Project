USE master;

GO
USE P4;
GO

-- Create DMK
CREATE MASTER KEY
ENCRYPTION BY PASSWORD = 'Test_P@sswOrd';

-- Create certificate to protect symmetric key
CREATE CERTIFICATE TestCertificate
WITH SUBJECT = 'AdventureWorks Test Certificate',
EXPIRY_DATE = '2026-10-31';

-- Create symmetric key to encrypt data
CREATE SYMMETRIC KEY TestSymmetricKey
WITH ALGORITHM = AES_128
ENCRYPTION BY CERTIFICATE TestCertificate;

-- Open symmetric key
OPEN SYMMETRIC KEY TestSymmetricKey
DECRYPTION BY CERTIFICATE TestCertificate;


INSERT INTO [User]
VALUES 
(1, 'NU Sanskriti', 'jsmith', EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Password1'), 'Group'),
    (2, 'NU HusKy', 'ejones', EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Password2'), 'Group'),
    (3, 'NU Sports',  'mbrown', EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Password3'), 'Group'),
    (4, 'NU Fashion',  'slee', EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Password4'), 'Group'),
    (5, 'NU Music',  'rchen', EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Password5'), 'Group'),
    (6, 'NU Drama',  'okim', EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Password6'), 'Group'),
    (7, 'NU Jobs',  'ewang', EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Password7'), 'Group'),
    (8, 'NU Photography',  'apark', EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Password8'), 'Group'),
    (9, 'NU Coders',  'wdavis', EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Password9'), 'Group'),
    (10, 'NU Debate',  'syang', EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Password10'), 'Group'),

(11, 'Dr. Rachel Kim',  'rkim', EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Password11'), 'Professor'),
(12, 'Prof. John Smith',  'jsmith2', EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Password12'), 'Professor'),
(13, 'Dr. Michael Brown', 'mbrown2', EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Password13'), 'Professor'),
(14, 'Prof. Sophia Lee',  'slee2', EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Password14'), 'Professor'),
(15, 'Dr. Robert Chen',  'rchen2', EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Password15'), 'Professor'),
(16, 'Prof. Olivia Kim',  'okim2', EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Password16'), 'Professor'),
(17, 'Dr. Ethan Wang',  'ewang2', EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Password17'), 'Professor'),
(18, 'Prof. Avery Park',  'apark2', EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Password18'), 'Professor'),
(19, 'Dr. William Davis',  'wdavis2', EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Password19'), 'Professor'),
(20, 'Prof. Samantha Yang',  'syang2', EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Password20'), 'Professor'),


(21, 'David Kim', 'dkim', EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Password21'), 'Student'),
    (22, 'Sophie Brown', 'sbrown', EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Password22'), 'Student'),
    (23, 'Jacob Chen',  'jchen', EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Password23'), 'Student'),
    (24, 'Chloe Lee',  'clee', EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Password24'), 'Student'),
    (25, 'Daniel Smith',  'dsmith', EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Password25'), 'Student'),
    (26, 'Ava Kim',  'akim', EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Password26'), 'Student'),
    (27, 'Alexander Jones', 'ajones', EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Password27'), 'Student'),
    (28, 'Mia Davis', 'mdavis', EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Password28'), 'Student'),
    (29, 'Elijah Brown', 'ebrown', EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Password29'), 'Student'),
    (30, 'Emma Lee', 'elee', EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Password30'), 'Student'),

(31, 'Mark Johnson',  'mjohnson', EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Password31'), 'Employer'),
(32, 'Rachel Green', 'rgreen', EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Password32'), 'Employer'),
(33, 'Patrick Roberts', 'proberts', EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Password33'), 'Employer'),
(34, 'Caroline Scott', 'cscott', EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Password34'), 'Employer'),
(35, 'Steven Baker',  'sbaker', EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Password35'), 'Employer'),
(36, 'Jennifer Evans', 'jevans', EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Password36'), 'Employer'),
(37, 'Robert Johnson',  'rjohnson', EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Password37'), 'Employer'),
(38, 'Emma Watson',  'ewatson', EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Password38'), 'Employer'),
(39, 'William Turner', 'wturner', EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Password39'), 'Employer'),
(40, 'Laura Davis', 'ldavis', EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Password40'), 'Employer');



INSERT INTO [Group]
VALUES
(1, '2022-01-01'),
(2, '2022-02-14'),
(3, '2022-03-07'),
(4, '2022-04-30'),
(5, '2022-05-15'),
(6, '2022-06-20'),
(7, '2022-07-01'),
(8, '2022-08-15'),
(9, '2022-09-07'),
(10, '2022-10-10');

INSERT INTO [Professor]
VALUES
(11, 'Artificial Intelligence', '1980-05-21', 'Male'),
(12, 'Data Science', '1975-08-10', 'Male'),
(13, 'Bioinformatics', '1985-02-12', 'Female'),
(14, 'Computer Vision', '1972-11-15', 'Male'),
(15, 'Database Systems', '1988-06-30', 'Other'),
(16, 'Machine Learning', '1990-04-02', 'Female'),
(17, 'Natural Language Processing', '1983-09-18', 'Male'),
(18, 'Computer Networks', '1979-12-08', 'Male'),
(19, 'Security and Privacy', '1987-03-25', 'Other'),
(20, 'Computer Graphics', '1981-07-12', 'Female');


INSERT INTO [Student]
VALUES
(21, 'Computer Science', '2001-03-14', 'Male'),
(22, 'Computer Vision', '2000-11-27', 'Male'),
(23, 'Natural Language Processing', '2002-05-06', 'Female'),
(24, 'Artificial Intelligence', '2001-01-12', 'Male'),
(25, 'Data Science', '2002-09-23', 'Other'),
(26, 'Computer Networks', '2000-06-30', 'Female'),
(27, 'Data Science', '2001-08-09', 'Male'),
(28, 'Database Systems', '2002-02-18', 'Female'),
(29, 'Computer Engineering', '2000-12-08', 'Male'),
(30, 'Computer Graphics', '2002-04-15', 'Female');

INSERT INTO [Employer]
VALUES
(31, 'New York'),
(32, 'Los Angeles'),
(33, 'Chicago'),
(34, 'Houston'),
(35, 'Philadelphia'),
(36, 'Phoenix'),
(37, 'San Antonio'),
(38, 'San Diego'),
(39, 'Dallas'),
(40, 'San Jose');




INSERT INTO [Post]
VALUES
(1, 1, 'I just finished reading a great book - highly recommend!', DATEADD(second, CAST(RAND() * 1000000 as int), '2012-04-15 00:00:00')),
(2, 4, 'I tried a new restaurant today and it was amazing!', DATEADD(second, CAST(RAND() * 1000000 as int), '2012-04-15 01:00:00')),
(3, 10, 'Anyone have any good recommendations for a new TV show to watch?', DATEADD(second, CAST(RAND() * 1000000 as int), '2012-04-15 02:00:00')),
(4, 11, 'Just wanted to share some good news - I got a promotion at work!', DATEADD(second, CAST(RAND() * 1000000 as int), '2012-04-15 03:00:00')),
(5, 15, 'I went on an amazing hike over the weekend and wanted to share some pictures!', DATEADD(second, CAST(RAND() * 1000000 as int), '2012-04-15 04:00:00')),
(6, 7, 'Anyone interested in forming a book club?', DATEADD(second, CAST(RAND() * 1000000 as int), '2012-04-15 05:00:00')),
(7, 8, 'Just got back from a trip to Hawaii - it was incredible!', DATEADD(second, CAST(RAND() * 1000000 as int), '2012-04-15 06:00:00')),
(8, 10, 'I am thinking of starting a new hobby - any suggestions?', DATEADD(second, CAST(RAND() * 1000000 as int), '2012-04-15 07:00:00')),
(9, 19, 'I just finished a big project at work and am feeling great!', DATEADD(second, CAST(RAND() * 1000000 as int), '2012-04-15 08:00:00')),
(10, 20, 'Just wanted to share some cute pictures of my dog!', DATEADD(second, CAST(RAND() * 1000000 as int), '2012-04-15 09:00:00')),

(11, 2, 'Selling a used car - great condition!', DATEADD(second, CAST(RAND() * 1000000 as int), '2012-04-15 10:00:00')),
(12, 5, 'Selling a used chair - good condition?', DATEADD(second, CAST(RAND() * 1000000 as int), '2012-04-15 11:00:00')),
(13, 31, 'Selling some gently used furniture - message me if interested!', DATEADD(second, CAST(RAND() * 1000000 as int), '2012-04-15 12:00:00')),
(14, 34, 'Looking for a new bike - any recommendations?', DATEADD(second, CAST(RAND() * 1000000 as int), '2012-04-15 13:00:00')),
(15, 36, 'Selling tickets to a concert - DM me for more info!', DATEADD(second, CAST(RAND() * 1000000 as int), '2012-04-15 14:00:00')),
(16, 35, 'Anyone selling a used laptop?', DATEADD(second, CAST(RAND() * 1000000 as int), '2012-04-15 15:00:00')),
(17, 38, 'Looking for a new apartment - any leads?', DATEADD(second, CAST(RAND() * 1000000 as int), '2012-04-15 16:00:00')),
(18, 30, 'Selling a collection of vintage records - DM if interested!', DATEADD(second, CAST(RAND() * 1000000 as int), '2012-04-15 17:00:00')),
(19, 32, 'Looking to buy a used camera - any suggestions?', DATEADD(second, CAST(RAND() * 1000000 as int), '2012-04-15 18:00:00')),
(20, 26, 'Selling a gently used wedding dress - message me for details!', DATEADD(second, CAST(RAND() * 1000000 as int), '2012-04-15 19:00:00'));


INSERT INTO [GeneralPost]
VALUES 
(1, 'categoryA'),
(2, 'categoryB'),
(3, 'categoryC'),
(4, 'categoryA'),
(5, 'categoryB'),
(6, 'categoryC'),
(7, 'categoryA'),
(8, 'categoryB'),
(9, 'categoryC'),
(10, 'categoryA');

INSERT INTO [MarketPlacePost]
VALUES 
(11, 'large', '$500', 'Available'),
(12, 'medium', '$30', 'Available'),
(13, 'small', '$20', 'Available'),
(14, 'large', '$40', 'Available'),
(15, 'medium', '$60', 'Available'),
(16, 'small', '$35', 'Available'),
(17, 'large', '$45', 'Sold out'),
(18, 'medium', '$25', 'Sold out'),
(19, 'small', '$30', 'Sold out'),
(20, 'large', '$55', 'Sold out');


INSERT INTO [PostLike]
VALUES
(DATEADD(second, CAST(RAND() * 1000000 as int), '2012-04-15 00:00:00'), 1, 2),
(DATEADD(second, CAST(RAND() * 1000000 as int), '2012-04-15 12:00:00'), 2, 3),
(DATEADD(second, CAST(RAND() * 1000000 as int), '2012-04-15 01:00:00'), 1, 3),
(DATEADD(second, CAST(RAND() * 1000000 as int), '2012-04-15 02:00:00'), 3, 1),
(DATEADD(second, CAST(RAND() * 1000000 as int), '2012-04-15 03:00:00'), 2, 1),
(DATEADD(second, CAST(RAND() * 1000000 as int), '2012-04-15 04:00:00'), 3, 2),
(DATEADD(second, CAST(RAND() * 1000000 as int), '2012-04-15 05:00:00'), 1, 4),
(DATEADD(second, CAST(RAND() * 1000000 as int), '2012-04-15 06:00:00'), 2, 4),
(DATEADD(second, CAST(RAND() * 1000000 as int), '2012-04-15 07:00:00'), 3, 4),
(DATEADD(second, CAST(RAND() * 1000000 as int), '2012-04-15 08:00:00'), 1, 5);

INSERT INTO [Comment]
VALUES
(1, 1, 1, 'Great book, I love it!', DATEADD(second, CAST(RAND() * 1000000 as int), '2012-04-15 01:00:00')),
(2, 2, 1, 'I want to read this book next!', DATEADD(second, CAST(RAND() * 1000000 as int), '2012-04-15 01:00:00')),
(3, 3, 2, 'The food was delicious, thanks for the recommendation!', DATEADD(second, CAST(RAND() * 1000000 as int), '2012-04-15 02:00:00')),
(4, 4, 2, 'I need to try this place soon!', DATEADD(second, CAST(RAND() * 1000000 as int), '2012-04-15 03:00:00')),
(5, 5, 3, 'I just finished watching Bridgerton and it was amazing!', DATEADD(second, CAST(RAND() * 1000000 as int), '2012-04-15 04:00:00')),
(6, 6, 3, 'Have you seen Schitts Creek yet? It is also great!', DATEADD(second, CAST(RAND() * 1000000 as int), '2012-04-15 05:00:00')),
(7, 7, 4, 'Congratulations on the promotion!', DATEADD(second, CAST(RAND() * 1000000 as int), '2012-04-15 06:00:00')),
(8, 8, 4, 'I hope I can get a promotion soon too!', DATEADD(second, CAST(RAND() * 1000000 as int), '2012-04-15 07:00:00')),
(9, 9, 5, 'I love hiking too! Where did you go?', DATEADD(second, CAST(RAND() * 1000000 as int), '2012-04-15 08:00:00')),
(10, 10, 5, 'Great pictures, thanks for sharing!', DATEADD(second, CAST(RAND() * 1000000 as int), '2012-04-15 09:00:00'));


INSERT INTO [CommentLike]
VALUES
(DATEADD(second, CAST(RAND() * 1000000 as int), '2012-04-15 00:00:00'), 2, 1),
(DATEADD(second, CAST(RAND() * 1000000 as int), '2012-04-15 01:00:00'), 3, 1),
(DATEADD(second, CAST(RAND() * 1000000 as int), '2012-04-15 02:00:00'), 4, 2),
(DATEADD(second, CAST(RAND() * 1000000 as int), '2012-04-15 03:00:00'), 5, 2),
(DATEADD(second, CAST(RAND() * 1000000 as int), '2012-04-15 04:00:00'), 6, 3),
(DATEADD(second, CAST(RAND() * 1000000 as int), '2012-04-15 05:00:00'), 7, 3),
(DATEADD(second, CAST(RAND() * 1000000 as int), '2012-04-15 06:00:00'), 8, 4),
(DATEADD(second, CAST(RAND() * 1000000 as int), '2012-04-15 07:00:00'), 9, 4),
(DATEADD(second, CAST(RAND() * 1000000 as int), '2012-04-15 08:00:00'), 10, 5),
(DATEADD(second, CAST(RAND() * 1000000 as int), '2012-04-15 09:00:00'), 1, 5);













-- Use DecryptByKey to decrypt the encrypted data and see what we have in the table
select 'NU Sanskriti', DecryptByKey(0x00C4DF9657A82042B4842B26243EC848020000005EE14EA1AF01EF8201CA8AB9910BA878B73DF6C9E6F23619067C3ABD92051AA63009AADA40B28BA6DF6B692309DF635C)
from [User];

-- Use DecryptByKey to decrypt the encrypted data and see what we have in the table
-- DecryptByKey returns VARBINARY with a maximum size of 8,000 bytes
-- Also use CONVERT to convert the decrypted data to VARCHAR so that we can see the plain passwords
select 'NU Sanskriti', convert(varchar, DecryptByKey(0x00C4DF9657A82042B4842B26243EC848020000005EE14EA1AF01EF8201CA8AB9910BA878B73DF6C9E6F23619067C3ABD92051AA63009AADA40B28BA6DF6B692309DF635C))
from [User];

-- Close the symmetric key
CLOSE SYMMETRIC KEY TestSymmetricKey;

-- Drop the symmetric key
DROP SYMMETRIC KEY TestSymmetricKey;

-- Drop the certificate
DROP CERTIFICATE TestCertificate;

--Drop the DMK
DROP MASTER KEY;

