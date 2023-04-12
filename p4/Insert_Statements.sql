
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
    (11, 'NU Hackers',  'hevel', EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Password10'), 'Group'),
    (12, 'NU Srvices',  'john', EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Password10'), 'Group'),

(13, 'Dr. Rachel Kim',  'rkim', EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Password11'), 'Professor'),
(14, 'Prof. John Smith',  'jsmith2', EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Password12'), 'Professor'),
(15, 'Dr. Michael Brown', 'mbrown2', EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Password13'), 'Professor'),
(16, 'Prof. Sophia Lee',  'slee2', EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Password14'), 'Professor'),
(17, 'Dr. Robert Chen',  'rchen2', EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Password15'), 'Professor'),
(18, 'Prof. Olivia Kim',  'okim2', EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Password16'), 'Professor'),
(19, 'Dr. Ethan Wang',  'ewang2', EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Password17'), 'Professor'),
(20, 'Prof. Avery Park',  'apark2', EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Password18'), 'Professor'),
(21, 'Dr. William Davis',  'wdavis2', EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Password19'), 'Professor'),
(22, 'Prof. Samantha Yang',  'syang2', EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Password20'), 'Professor'),
(23, 'Prof. Manuel Montrond',  'manuel', EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Password16'), 'Professor'),
(24, 'Dr. Yusf Ozbek',  'yusuf', EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Password17'), 'Professor'),
(25, 'Prof. Khaled Bugrara',  'khaled', EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Password18'), 'Professor'),
(26, 'Dr. Tejas Parikh',  'tejas', EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Password19'), 'Professor'),
(27, 'Prof. Yu Jones',  'yu', EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Password20'), 'Professor'),


(28, 'David Kim', 'dkim', EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Password21'), 'Student'),
    (29, 'Sophie Brown', 'sbrown', EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Password22'), 'Student'),
    (30, 'Jacob Chen',  'jchen', EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Password23'), 'Student'),
    (31, 'Chloe Lee',  'clee', EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Password24'), 'Student'),
    (32, 'Daniel Smith',  'dsmith', EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Password25'), 'Student'),
    (33, 'Ava Kim',  'akim', EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Password26'), 'Student'),
    (34, 'Alexander Jones', 'ajones', EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Password27'), 'Student'),
    (35, 'Mia Davis', 'mdavis', EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Password28'), 'Student'),
    (36, 'Elijah Brown', 'ebrown', EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Password29'), 'Student'),
    (37, 'Emma Lee', 'elee', EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Password30'), 'Student'),
    (38, 'Anwesh roy', 'anwesh', EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Password21'), 'Student'),
    (39, 'Aditya roy', 'aditya', EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Password22'), 'Student'),
    (40, 'Ritika roy',  'ritika', EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Password23'), 'Student'),
    (41, 'Smrithi roy',  'smrithi', EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Password24'), 'Student'),
    (42, 'Payal roy',  'payal', EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Password25'), 'Student'),
    (43, 'Vamsi roy',  'vamsi', EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Password26'), 'Student'),
    (44, 'Pooja roy', 'pooja', EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Password27'), 'Student'),
    (45, 'Sneha rao', 'sneha', EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Password28'), 'Student'),
    (46, 'Ravi kiran', 'ravi', EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Password29'), 'Student'),
    (47, 'Utkarsha sen', 'utkarsha', EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Password30'), 'Student'),
    (48, 'Roopa kapoor', 'roopa', EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Password21'), 'Student'),
    (49, 'Mahesh babu', 'mahesh', EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Password22'), 'Student'),
    (50, 'Deppak sha',  'deepak', EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Password23'), 'Student'),
    (51, 'Sofia Garcia',  'sofia', EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Password24'), 'Student'),
    (52, 'Carmen Hernandez',  'carmen', EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Password25'), 'Student'),
    (53, 'Mustafa Yilmaz',  'mustafa', EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Password26'), 'Student'),
    (54, 'Alexandre Silva', 'alexandra', EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Password27'), 'Student'),
    (55, 'Ahmed Ali', 'ahmed', EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Password28'), 'Student'),
    (56, 'Juani Perez', 'juani', EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Password29'), 'Student'),
    (57, 'Weil Chen', 'weil', EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Password30'), 'Student'),



(58, 'Google',  'google', EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Password31'), 'Employer'),
(59, 'Meta', 'meta', EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Password32'), 'Employer'),
(60, 'Fidelity', 'fidelity', EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Password33'), 'Employer'),
(61, 'Target', 'target', EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Password34'), 'Employer'),
(62, 'Walmart',  'walmart', EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Password35'), 'Employer'),
(63, 'Stripe', 'stripe', EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Password36'), 'Employer'),
(64, 'JP Morgan',  'jpmorgan', EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Password37'), 'Employer'),
(65, 'Bloomberg',  'bloomberg', EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Password38'), 'Employer'),
(66, 'Amazon', 'amazon', EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Password39'), 'Employer'),
(67, 'Tesla', 'tesla', EncryptByKey(Key_GUID(N'TestSymmetricKey'), 'Password40'), 'Employer');



INSERT INTO [Group]
VALUES
(1, '2018-01-01'),
(2, '2019-02-14'),
(3, '2019-03-07'),
(4, '2019-04-30'),
(5, '2019-05-15'),
(6, '2021-06-20'),
(7, '2019-07-01'),
(8, '2021-08-15'),
(9, '2021-09-07'),
(10, '2021-10-10'),
(11, '2021-10-10'),
(12, '2022-10-10');


INSERT INTO [Professor]
VALUES
(13, 'Artificial Intelligence', '1980-05-21', 'Male'),
(14, 'Data Science', '1975-08-10', 'Male'),
(15, 'Artificial Intelligence', '1985-02-12', 'Female'),
(16, 'Computer Vision', '1972-11-15', 'Male'),
(17, 'Database Systems', '1988-06-30', 'Other'),
(18, 'Machine Learning', '1990-04-02', 'Female'),
(19, 'Natural Language Processing', '1983-09-18', 'Male'),
(20, 'Artificial Intelligence', '1979-12-08', 'Male'),
(21, 'Security and Privacy', '1987-03-25', 'Other'),
(22, 'Computer Vision', '1981-07-12', 'Female'),
(23, 'Computer Vision', '1990-04-02', 'Female'),
(24, 'Natural Language Processing', '1983-09-18', 'Male'),
(25, 'Computer Networks', '1979-12-08', 'Male'),
(26, 'Security and Privacy', '1987-03-25', 'Other'),
(27, 'Computer Vision', '1981-07-12', 'Female');


INSERT INTO [Student]
VALUES
(28, 'Computer Science', '2001-03-14', 'Male'),
(29, 'Computer Science', '2000-11-27', 'Male'),
(30, 'Natural Language Processing', '2002-05-06', 'Female'),
(31, 'Artificial Intelligence', '2001-01-12', 'Male'),
(32, 'Data Science', '2002-09-23', 'Other'),
(33, 'Computer Networks', '2000-06-30', 'Female'),
(34, 'Data Science', '2001-08-09', 'Male'),
(35, 'Database Systems', '2002-02-18', 'Female'),
(36, 'Computer Engineering', '2000-12-08', 'Male'),
(37, 'Computer Graphics', '2002-04-15', 'Female'),
(38, 'Computer Science', '2001-03-14', 'Male'),
(39, 'Computer Science', '2000-11-27', 'Male'),
(40, 'Natural Language Processing', '2002-05-06', 'Female'),
(41, 'Artificial Intelligence', '2001-01-12', 'Male'),
(42, 'Data Science', '2002-09-23', 'Other'),
(43, 'Computer Networks', '2000-06-30', 'Female'),
(44, 'Data Science', '2001-08-09', 'Male'),
(45, 'Database Systems', '2002-02-18', 'Female'),
(46, 'Computer Science', '2000-12-08', 'Male'),
(47, 'Computer Graphics', '2002-04-15', 'Female'),
(48, 'Artificial Intelligence', '2002-04-15', 'Female'),
(49, 'Computer Science', '2001-03-14', 'Male'),
(50, 'Computer Vision', '2000-11-27', 'Male'),
(51, 'Natural Language Processing', '2002-05-06', 'Female'),
(52, 'Artificial Intelligence', '2001-01-12', 'Male'),
(53, 'Data Science', '2002-09-23', 'Other'),
(54, 'Computer Networks', '2000-06-30', 'Female'),
(55, 'Data Science', '2001-08-09', 'Male'),
(56, 'Database Systems', '2002-02-18', 'Female'),
(57, 'Computer Engineering', '2000-12-08', 'Male');

INSERT INTO [Employer]
VALUES
(58, 'New York'),
(59, 'Los Angeles'),
(60, 'Boston'),
(61, 'New York'),
(62, 'Philadelphia'),
(63, 'Phoenix'),
(64, 'Boston'),
(65, 'San Diego'),
(66, 'Boston'),
(67, 'Los Angeles');




INSERT INTO [Post]
VALUES
(1, 21, 'I just finished reading a great book - highly recommend!', DATEADD(second, CAST(RAND() * 1000000 as int), '2022-04-16 00:00:00')),
(2, 21, 'I tried a new restaurant today and it was amazing!', DATEADD(second, CAST(RAND() * 1000000 as int), '2021-05-15 01:00:00')),
(3, 21, 'Anyone have any good recommendations for a new TV show to watch?', DATEADD(second, CAST(RAND() * 1000000 as int), '2021-06-15 02:00:00')),
(4, 22, 'Just wanted to share some good news - I got a promotion at work!', DATEADD(second, CAST(RAND() * 1000000 as int), '2020-04-17 03:00:00')),
(5, 22, 'I went on an amazing hike over the weekend and wanted to share some pictures!', DATEADD(second, CAST(RAND() * 1000000 as int), '2020-09-15 04:00:00')),
(6, 22, 'Anyone interested in forming a book club?', DATEADD(second, CAST(RAND() * 1000000 as int), '2020-10-15 05:00:00')),
(7, 22, 'Just got back from a trip to Hawaii - it was incredible!', DATEADD(second, CAST(RAND() * 1000000 as int), '2021-01-15 06:00:00')),
(8, 48, 'I am thinking of starting a new hobby - any suggestions?', DATEADD(second, CAST(RAND() * 1000000 as int), '2021-02-15 07:00:00')),
(9, 48, 'I just finished a big project at work and am feeling great!', DATEADD(second, CAST(RAND() * 1000000 as int), '2021-03-15 08:00:00')),
(10, 48, 'Just wanted to share some cute pictures of my dog!', DATEADD(second, CAST(RAND() * 1000000 as int), '2021-07-15 09:00:00')),
(11, 48, 'Breaking news: Scientists discover new planet in our galaxy!',  DATEADD(second, CAST(RAND() * 1000000 as int), '2021-09-01 12:34:56')),
(12, 48, 'Just learned a new coding language - feeling accomplished!',  DATEADD(second, CAST(RAND() * 1000000 as int), '2020-02-02 09:45:30')),
(13, 48, 'Just heard a hilarious joke that made my day!',  DATEADD(second, CAST(RAND() * 1000000 as int), '2023-03-03 18:22:15')),
(14, 49, 'Excited to share my latest painting - art is my therapy!',  DATEADD(second, CAST(RAND() * 1000000 as int), '2023-03-04 15:10:05')),
(15, 49, 'Watched an interesting documentary on ancient civilizations - mind blown!',  DATEADD(second, CAST(RAND() * 1000000 as int), '2023-03-05 20:55:45')),
(16, 56, 'Incredible breakthrough in medical research announced today!',  DATEADD(second, CAST(RAND() * 1000000 as int), '2023-03-06 11:20:30')),
(17, 56, 'Tried a new workout routine - sore but feeling accomplished!',  DATEADD(second, CAST(RAND() * 1000000 as int), '2023-03-07 07:15:10')),
(18, 14, 'Just finished reading a book that made me laugh out loud!',  DATEADD(second, CAST(RAND() * 1000000 as int), '2023-03-08 16:40:25')),
(19, 16, 'Watched a thought-provoking TED talk that inspired me!',  DATEADD(second, CAST(RAND() * 1000000 as int), '2023-03-09 14:30:50')),
(20, 17, 'Excited to share my latest DIY project - turned out better than expected!',  DATEADD(second, CAST(RAND() * 1000000 as int), '2023-03-10 19:05:15')),
(21, 2, 'Breaking news: Historic monument discovered in remote jungle!',  DATEADD(second, CAST(RAND() * 1000000 as int), '2023-03-11 13:50:40')),
(22, 27, 'Just completed an online course and earned a certification!',  DATEADD(second, CAST(RAND() * 1000000 as int), '2023-03-12 10:25:20')),
(23, 15, 'Tried a new recipe and it was a disaster - kitchen fail!',  DATEADD(second, CAST(RAND() * 1000000 as int), '2023-03-13 17:15:35')),
(24, 29, 'Had a hilarious encounter with a squirrel in the park today!',  DATEADD(second, CAST(RAND() * 1000000 as int), '2023-03-14 14:05:10')),
(25, 15, 'Just finished a challenging puzzle - feeling accomplished!',  DATEADD(second, CAST(RAND() * 1000000 as int), '2023-03-15 09:30:45')),
(26, 19, 'Breaking news: Scientists discover cure for a rare disease!',  DATEADD(second, CAST(RAND() * 1000000 as int), '2023-03-16 12:40:20')),
(27, 20, 'Watched a fascinating documentary on space exploration - mind blown!',  DATEADD(second, CAST(RAND() * 1000000 as int), '2023-03-17 18:55:30')),
(28, 1, 'Tried a new workout routine and it kicked my butt!',  DATEADD(second, CAST(RAND() * 1000000 as int), '2023-03-18 07:10:15')),
(29, 4, 'Just finished a hilarious comedy series - non-stop laughter!',  DATEADD(second, CAST(RAND() * 1000000 as int), '2023-03-19 16:25:50')),
(30, 32, 'Excited to share my latest woodworking project - turned out amazing!',  DATEADD(second, CAST(RAND() * 1000000 as int), '2023-03-20 13:15:25')),
(31, 31, 'Breaking news: Global warming reaches alarming levels!',  DATEADD(second, CAST(RAND() * 1000000 as int), '2023-03-21 11:30:10')),
(32, 51, 'Just completed an online course on financial management - learned a lot!',  DATEADD(second, CAST(RAND() * 1000000 as int), '2023-03-22 08:20:35')),


(33, 2, 'Selling a used car - great condition!', DATEADD(second, CAST(RAND() * 1000000 as int), '2012-04-15 10:00:00')),
(34, 5, 'Selling a used chair - good condition?', DATEADD(second, CAST(RAND() * 1000000 as int), '2012-04-15 11:00:00')),
(35, 31, 'Selling some gently used furniture - message me if interested!', DATEADD(second, CAST(RAND() * 1000000 as int), '2012-04-15 12:00:00')),
(36, 34, 'Looking for a new bike - any recommendations?', DATEADD(second, CAST(RAND() * 1000000 as int), '2012-04-15 13:00:00')),
(37, 36, 'Selling tickets to a concert - DM me for more info!', DATEADD(second, CAST(RAND() * 1000000 as int), '2012-04-15 14:00:00')),
(38, 35, 'Anyone selling a used laptop?', DATEADD(second, CAST(RAND() * 1000000 as int), '2012-04-15 15:00:00')),
(39, 38, 'Looking for a new apartment - any leads?', DATEADD(second, CAST(RAND() * 1000000 as int), '2012-04-15 16:00:00')),
(40, 30, 'Selling a collection of vintage records - DM if interested!', DATEADD(second, CAST(RAND() * 1000000 as int), '2012-04-15 17:00:00')),
(41, 32, 'Looking to buy a used camera - any suggestions?', DATEADD(second, CAST(RAND() * 1000000 as int), '2012-04-15 18:00:00')),
(42, 26, 'Selling a gently used wedding dress - message me for details!', DATEADD(second, CAST(RAND() * 1000000 as int), '2012-04-15 19:00:00')),
(43, 27, 'Selling a brand new laptop - still in the box!', DATEADD(second, CAST(RAND() * 1000000 as int), '2023-03-01 10:00:00')),
(44, 33, 'Looking for a used bike - preferably mountain bike', DATEADD(second, CAST(RAND() * 1000000 as int), '2023-03-02 14:00:00')),
(45, 39, 'Selling a vintage typewriter - great for collectors!', DATEADD(second, CAST(RAND() * 1000000 as int), '2023-03-03 16:00:00')),
(46, 28, 'Looking for a used guitar - acoustic or electric', DATEADD(second, CAST(RAND() * 1000000 as int), '2023-03-04 12:00:00')),
(47, 37, 'Selling a gently used baby stroller - perfect for new parents!', DATEADD(second, CAST(RAND() * 1000000 as int), '2023-03-05 11:00:00'));


INSERT INTO [GeneralPost]
VALUES 
(1, 'Eduacational'),
(2, 'Fun'),
(3, 'Fun'),
(4, 'News'),
(5, 'Fun'),
(6, 'Fun'),
(7, 'Fun'),
(8, 'Fun'),
(9, 'Eduacational'),
(10, 'Fun'),
(11, 'News'),
(12, 'Eduacational'),
(13, 'Fun'),
(14, 'Fun'),
(15, 'Eduacational'),
(16, 'News'),
(17, 'Fun'),
(18, 'Fun'),
(19, 'Eduacational'),
(20, 'Fun'),
(21, 'News'),
(22, 'Eduacational'),
(23, 'Fun'),
(24, 'Fun'),
(25, 'Eduacational'),
(26, 'News'),
(27, 'Eduacational'),
(28, 'Fun'),
(29, 'Fun'),
(30, 'Eduacational'),
(31, 'News'),
(32, 'Eduacational');

INSERT INTO [MarketPlacePost]
VALUES 
(33, 'large sized item', '$500', 'Available'),
(34, 'smal sized item', '$30', 'Available'),
(35, 'small sized item', '$20', 'Available'),
(36, 'medium sized item', '$80', 'Available'),
(37, 'small sized item', '$60', 'Available'),
(38, 'small sized item', '$100', 'Available'),
(39, 'large sized item', '$1000', 'Sold out'),
(40, 'medium sized item', '$25', 'Sold out'),
(41, 'small sized item', '$30', 'Sold out'),
(42, 'small sized item', '$55', 'Sold out'),
(43, 'small sized item', '$500', 'Available'),
(44, 'medium sized item', '$45', 'Sold out'),
(45, 'small sized item', '$25', 'Sold out'),
(46, 'small sized item', '$30', 'Sold out'),
(47, 'small sized item', '$55', 'Sold out');


INSERT INTO [PostLike]
VALUES
(DATEADD(second, CAST(RAND() * 1000000 as int), '2021-06-15 00:00:00'), 1, 2),
(DATEADD(second, CAST(RAND() * 1000000 as int), '2021-04-15 12:00:00'), 2, 4),
(DATEADD(second, CAST(RAND() * 1000000 as int), '2021-04-15 01:00:00'), 1, 4),
(DATEADD(second, CAST(RAND() * 1000000 as int), '2020-10-15 02:00:00'), 3, 5),
(DATEADD(second, CAST(RAND() * 1000000 as int), '2023-03-25 03:00:00'), 2, 30),
(DATEADD(second, CAST(RAND() * 1000000 as int), '2023-03-26 04:00:00'), 44, 30),
(DATEADD(second, CAST(RAND() * 1000000 as int), '2023-03-27 05:00:00'), 43, 30),
(DATEADD(second, CAST(RAND() * 1000000 as int), '2023-03-28 06:00:00'), 45, 30),
(DATEADD(second, CAST(RAND() * 1000000 as int), '2021-04-15 07:00:00'), 49, 4),
(DATEADD(second, CAST(RAND() * 1000000 as int), '2022-04-15 08:00:00'), 7, 2);

INSERT INTO [Comment]
VALUES
(1, 32, 30, 'Great book, I love it!', DATEADD(second, CAST(RAND() * 1000000 as int), '2023-04-01 01:00:00')),
(2, 39, 30, 'I want to read this book next!', DATEADD(second, CAST(RAND() * 1000000 as int), '2023-04-02 01:00:00')),
(3, 3, 30, 'The food was delicious, thanks for the recommendation!', DATEADD(second, CAST(RAND() * 1000000 as int), '2023-04-03 02:00:00')),
(4, 4, 4, 'I need to try this place soon!', DATEADD(second, CAST(RAND() * 1000000 as int), '2021-04-01 03:00:00')),
(5, 5, 2, 'I just finished watching Bridgerton and it was amazing!', DATEADD(second, CAST(RAND() * 1000000 as int), '2022-04-15 04:00:00')),
(6, 6, 3, 'Have you seen Schitts Creek yet? It is also great!', DATEADD(second, CAST(RAND() * 1000000 as int), '2022-04-15 05:00:00')),
(7, 7, 4, 'Congratulations on the promotion!', DATEADD(second, CAST(RAND() * 1000000 as int), '2021-04-15 06:00:00')),
(8, 8, 4, 'I hope I can get a promotion soon too!', DATEADD(second, CAST(RAND() * 1000000 as int), '2021-04-16 07:00:00')),
(9, 9, 30, 'I love hiking too! Where did you go?', DATEADD(second, CAST(RAND() * 1000000 as int), '2023-04-05 08:00:00')),
(10, 10, 5, 'Great pictures, thanks for sharing!', DATEADD(second, CAST(RAND() * 1000000 as int), '2022-07-01 09:00:00'));


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
