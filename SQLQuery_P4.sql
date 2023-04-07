USE P4;
GO

INSERT INTO [User]
VALUES 
    (1, 'NU Sanskriti', 'jsmith', 'password', 'Group'),
    (2, 'NU HusKy', 'ejones', 'password', 'Group'),
    (3, 'NU Sports',  'mbrown', 'password', 'Group'),
    (4, 'NU Fashion',  'slee', 'password', 'Group'),
    (5, 'NU Music',  'rchen', 'password', 'Group'),
    (6, 'NU Drama',  'okim', 'password', 'Group'),
    (7, 'NU Jobs',  'ewang', 'password', 'Group'),
    (8, 'NU Photography',  'apark', 'password', 'Group'),
    (9, 'NU Coders',  'wdavis', 'password', 'Group'),
    (10, 'NU Debate',  'syang', 'password', 'Group'),

(11, 'Dr. Rachel Kim',  'rkim', 'password', 'Professor'),
(12, 'Prof. John Smith',  'jsmith2', 'password', 'Professor'),
(13, 'Dr. Michael Brown', 'mbrown2', 'password', 'Professor'),
(14, 'Prof. Sophia Lee',  'slee2', 'password', 'Professor'),
(15, 'Dr. Robert Chen',  'rchen2', 'password', 'Professor'),
(16, 'Prof. Olivia Kim',  'okim2', 'password', 'Professor'),
(17, 'Dr. Ethan Wang',  'ewang2', 'password', 'Professor'),
(18, 'Prof. Avery Park',  'apark2', 'password', 'Professor'),
(19, 'Dr. William Davis',  'wdavis2', 'password', 'Professor'),
(20, 'Prof. Samantha Yang',  'syang2', 'password', 'Professor'),


(21, 'David Kim', 'dkim', 'password', 'Student'),
    (22, 'Sophie Brown', 'sbrown', 'password', 'Student'),
    (23, 'Jacob Chen',  'jchen', 'password', 'Student'),
    (24, 'Chloe Lee',  'clee', 'password', 'Student'),
    (25, 'Daniel Smith',  'dsmith', 'password', 'Student'),
    (26, 'Ava Kim',  'akim', 'password', 'Student'),
    (27, 'Alexander Jones', 'ajones', 'password', 'Student'),
    (28, 'Mia Davis', 'mdavis', 'password', 'Student'),
    (29, 'Elijah Brown', 'ebrown', 'password', 'Student'),
    (30, 'Emma Lee', 'elee', 'password', 'Student'),

(31, 'Mark Johnson',  'mjohnson', 'password', 'Employer'),
(32, 'Rachel Green', 'rgreen', 'password', 'Employer'),
(33, 'Patrick Roberts', 'proberts', 'password', 'Employer'),
(34, 'Caroline Scott', 'cscott', 'password', 'Employer'),
(35, 'Steven Baker',  'sbaker', 'password', 'Employer'),
(36, 'Jennifer Evans', 'jevans', 'password', 'Employer'),
(37, 'Robert Johnson',  'rjohnson', 'password', 'Employer'),
(38, 'Emma Watson',  'ewatson', 'password', 'Employer'),
(39, 'William Turner', 'wturner', 'password', 'Employer'),
(40, 'Laura Davis', 'ldavis', 'password', 'Employer');

-- Delete from [User]


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
(11, 'Artificial Intelligence', '1980-05-21', 43, 'Male'),
(12, 'Data Science', '1975-08-10', 48, 'Male'),
(13, 'Bioinformatics', '1985-02-12', 38, 'Female'),
(14, 'Computer Vision', '1972-11-15', 51, 'Male'),
(15, 'Database Systems', '1988-06-30', 35, 'Other'),
(16, 'Machine Learning', '1990-04-02', 33, 'Female'),
(17, 'Natural Language Processing', '1983-09-18', 40, 'Male'),
(18, 'Computer Networks', '1979-12-08', 44, 'Male'),
(19, 'Security and Privacy', '1987-03-25', 36, 'Other'),
(20, 'Computer Graphics', '1981-07-12', 42, 'Female');


INSERT INTO [Student]
VALUES
(21, 'Computer Science', '2001-03-14', 22, 'Male'),
(22, 'Computer Vision', '2000-11-27', 22, 'Male'),
(23, 'Natural Language Processing', '2002-05-06', 20, 'Female'),
(24, 'Artificial Intelligence', '2001-01-12', 22, 'Male'),
(25, 'Data Science', '2002-09-23', 19, 'Other'),
(26, 'Computer Networks', '2000-06-30', 21, 'Female'),
(27, 'Data Science', '2001-08-09', 20, 'Male'),
(28, 'Database Systems', '2002-02-18', 19, 'Female'),
(29, 'Computer Engineering', '2000-12-08', 21, 'Male'),
(30, 'Computer Graphics', '2002-04-15', 19, 'Female');

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




INSERT INTO [Post] ([Description], Post_TimeStamp)
VALUES
(1, 'I just finished reading a great book - highly recommend!'),
(2, 'I tried a new restaurant today and it was amazing!'),
(3, 'Anyone have any good recommendations for a new TV show to watch?'),
(4, 'Just wanted to share some good news - I got a promotion at work!'),
(5, 'I went on an amazing hike over the weekend and wanted to share some pictures!'),
(6, 'Anyone interested in forming a book club?'),
(7, 'Just got back from a trip to Hawaii - it was incredible!'),
(8, 'I am thinking of starting a new hobby - any suggestions?'),
(9, 'I just finished a big project at work and am feeling great!'),
(10, 'Just wanted to share some cute pictures of my dog!'),

(11, 'Selling a used car - great condition!'),
(12, 'Selling a used chair - good condition?'),
(13, 'Selling some gently used furniture - message me if interested!'),
(14, 'Looking for a new bike - any recommendations?'),
(15, 'Selling tickets to a concert - DM me for more info!'),
(16, 'Anyone selling a used laptop?'),
(17, 'Looking for a new apartment - any leads?'),
(18, 'Selling a collection of vintage records - DM if interested!'),
(19, 'Looking to buy a used camera - any suggestions?'),
(20, 'Selling a gently used wedding dress - message me for details!');


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
(1, 2),
(2, 3),
(1, 3),
(3, 1),
(2, 1),
(3, 2),
(1, 4),
(2, 4),
(3, 4),
(1, 5);

INSERT INTO [Comment]
VALUES
(1, 1, 1, 'Great book, I love it!'),
(2, 2, 1, 'I want to read this book next!'),
(3, 3, 2, 'The food was delicious, thanks for the recommendation!'),
(4, 4, 2, 'I need to try this place soon!'),
(5, 5, 3, 'I just finished watching Bridgerton and it was amazing!'),
(6, 6, 3, 'Have you seen Schitts Creek yet? It is also great!'),
(7, 7, 4, 'Congratulations on the promotion!'),
(8, 8, 4, 'I hope I can get a promotion soon too!'),
(9, 9, 5, 'I love hiking too! Where did you go?'),
(10, 10, 5, 'Great pictures, thanks for sharing!');


INSERT INTO [CommentLike]
VALUES
(2, 1),
(3, 1),
(4, 2),
(5, 2),
(6, 3),
(7, 3),
(8, 4),
(9, 4),
(10, 5),
(1, 5);