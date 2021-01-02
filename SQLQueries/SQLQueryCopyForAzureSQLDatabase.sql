/****** Object:  Table [dbo].[Ages]    Script Date: 12/19/2020 1:17:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](25) NOT NULL,
	[IconUrl] [nvarchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GameAges]    Script Date: 12/19/2020 1:17:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GameAges](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GameId] [int] NOT NULL,
	[AgeId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GameIcons]    Script Date: 12/19/2020 1:17:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GameIcons](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](25) NOT NULL,
	[IconUrl] [nvarchar](1000) NULL,
	[Html] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GameInstruments]    Script Date: 12/19/2020 1:17:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GameInstruments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GameId] [int] NOT NULL,
	[InstrumentId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Games]    Script Date: 12/19/2020 1:17:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Games](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Songs] [nvarchar](1000) NULL,
	[Description] [nvarchar](1000) NULL,
	[PreworkLevelId] [int] NOT NULL,
	[Prework] [nvarchar](1000) NULL,
	[Instructions] [nvarchar](2500) NULL,
	[Credit] [nvarchar](1000) NULL,
	[WebsiteUrl] [nvarchar](1000) NULL,
	[SubmittedByUserId] [int] NULL,
	[DateCreated] [datetime] NOT NULL,
	[GameIconId] [int] NULL,
	[PhotoUrl] [nvarchar](1000) NULL,
	[Keywords] [nvarchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Instruments]    Script Date: 12/19/2020 1:17:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Instruments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](25) NOT NULL,
	[IconUrl] [nvarchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PracticePlanGames]    Script Date: 12/19/2020 1:17:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PracticePlanGames](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[PracticePlanId] [int] NOT NULL,
	[GameId] [int] NOT NULL,
	[PracticeDate] [datetime] NULL,
	[UserNotes] [nvarchar](1000) NULL,
	[IsCompleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PracticePlans]    Script Date: 12/19/2020 1:17:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PracticePlans](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NOT NULL,
	[UserId] [int] NOT NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[IsActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PreworkLevels]    Script Date: 12/19/2020 1:17:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PreworkLevels](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](25) NOT NULL,
	[IconUrl] [nvarchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserChildren]    Script Date: 12/19/2020 1:17:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserChildren](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[ChildName] [nvarchar](100) NOT NULL,
	[ChildBirthday] [datetime] NULL,
	[ChildOrder] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserPhotos]    Script Date: 12/19/2020 1:17:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserPhotos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[GameId] [int] NOT NULL,
	[Comment] [nvarchar](1000) NOT NULL,
	[PhotoUrl] [nvarchar](1000) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRatings]    Script Date: 12/19/2020 1:17:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRatings](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[GameId] [int] NOT NULL,
	[Value] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserReviews]    Script Date: 12/19/2020 1:17:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserReviews](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[GameId] [int] NOT NULL,
	[Comment] [nvarchar](1000) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 12/19/2020 1:17:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[FirebaseUid] [nvarchar](50) NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[PhotoUrl] [nvarchar](1000) NULL,
	[DateCreated] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Ages] ON 
GO
INSERT [dbo].[Ages] ([Id], [Name], [IconUrl]) VALUES (1, N'Preschool', N'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/child.svg')
GO
INSERT [dbo].[Ages] ([Id], [Name], [IconUrl]) VALUES (2, N'Elementary', N'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/brands/etsy.svg')
GO
INSERT [dbo].[Ages] ([Id], [Name], [IconUrl]) VALUES (3, N'Middle School', N'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/brands/monero.svg')
GO
INSERT [dbo].[Ages] ([Id], [Name], [IconUrl]) VALUES (4, N'High School', N'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/heading.svg')
GO
INSERT [dbo].[Ages] ([Id], [Name], [IconUrl]) VALUES (5, N'All', N'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/universal-access.svg')
GO
SET IDENTITY_INSERT [dbo].[Ages] OFF
GO
SET IDENTITY_INSERT [dbo].[GameAges] ON 
GO
INSERT [dbo].[GameAges] ([Id], [GameId], [AgeId]) VALUES (1, 1, 5)
GO
INSERT [dbo].[GameAges] ([Id], [GameId], [AgeId]) VALUES (2, 2, 5)
GO
INSERT [dbo].[GameAges] ([Id], [GameId], [AgeId]) VALUES (3, 3, 5)
GO
INSERT [dbo].[GameAges] ([Id], [GameId], [AgeId]) VALUES (4, 4, 5)
GO
INSERT [dbo].[GameAges] ([Id], [GameId], [AgeId]) VALUES (5, 6, 5)
GO
INSERT [dbo].[GameAges] ([Id], [GameId], [AgeId]) VALUES (6, 7, 5)
GO
INSERT [dbo].[GameAges] ([Id], [GameId], [AgeId]) VALUES (7, 8, 1)
GO
INSERT [dbo].[GameAges] ([Id], [GameId], [AgeId]) VALUES (8, 8, 2)
GO
INSERT [dbo].[GameAges] ([Id], [GameId], [AgeId]) VALUES (9, 9, 1)
GO
INSERT [dbo].[GameAges] ([Id], [GameId], [AgeId]) VALUES (10, 9, 2)
GO
INSERT [dbo].[GameAges] ([Id], [GameId], [AgeId]) VALUES (11, 10, 5)
GO
INSERT [dbo].[GameAges] ([Id], [GameId], [AgeId]) VALUES (12, 11, 1)
GO
INSERT [dbo].[GameAges] ([Id], [GameId], [AgeId]) VALUES (13, 12, 1)
GO
INSERT [dbo].[GameAges] ([Id], [GameId], [AgeId]) VALUES (14, 12, 2)
GO
INSERT [dbo].[GameAges] ([Id], [GameId], [AgeId]) VALUES (15, 13, 5)
GO
INSERT [dbo].[GameAges] ([Id], [GameId], [AgeId]) VALUES (16, 14, 5)
GO
INSERT [dbo].[GameAges] ([Id], [GameId], [AgeId]) VALUES (17, 15, 5)
GO
INSERT [dbo].[GameAges] ([Id], [GameId], [AgeId]) VALUES (18, 16, 1)
GO
INSERT [dbo].[GameAges] ([Id], [GameId], [AgeId]) VALUES (19, 16, 2)
GO
INSERT [dbo].[GameAges] ([Id], [GameId], [AgeId]) VALUES (20, 17, 1)
GO
INSERT [dbo].[GameAges] ([Id], [GameId], [AgeId]) VALUES (21, 17, 2)
GO
INSERT [dbo].[GameAges] ([Id], [GameId], [AgeId]) VALUES (22, 18, 1)
GO
INSERT [dbo].[GameAges] ([Id], [GameId], [AgeId]) VALUES (23, 18, 2)
GO
INSERT [dbo].[GameAges] ([Id], [GameId], [AgeId]) VALUES (24, 19, 1)
GO
INSERT [dbo].[GameAges] ([Id], [GameId], [AgeId]) VALUES (25, 19, 2)
GO
INSERT [dbo].[GameAges] ([Id], [GameId], [AgeId]) VALUES (26, 20, 1)
GO
INSERT [dbo].[GameAges] ([Id], [GameId], [AgeId]) VALUES (27, 20, 2)
GO
INSERT [dbo].[GameAges] ([Id], [GameId], [AgeId]) VALUES (28, 21, 5)
GO
INSERT [dbo].[GameAges] ([Id], [GameId], [AgeId]) VALUES (29, 22, 1)
GO
INSERT [dbo].[GameAges] ([Id], [GameId], [AgeId]) VALUES (30, 22, 2)
GO
INSERT [dbo].[GameAges] ([Id], [GameId], [AgeId]) VALUES (31, 23, 5)
GO
INSERT [dbo].[GameAges] ([Id], [GameId], [AgeId]) VALUES (32, 24, 5)
GO
INSERT [dbo].[GameAges] ([Id], [GameId], [AgeId]) VALUES (33, 25, 1)
GO
INSERT [dbo].[GameAges] ([Id], [GameId], [AgeId]) VALUES (34, 25, 2)
GO
INSERT [dbo].[GameAges] ([Id], [GameId], [AgeId]) VALUES (35, 26, 5)
GO
INSERT [dbo].[GameAges] ([Id], [GameId], [AgeId]) VALUES (36, 27, 5)
GO
INSERT [dbo].[GameAges] ([Id], [GameId], [AgeId]) VALUES (37, 28, 1)
GO
INSERT [dbo].[GameAges] ([Id], [GameId], [AgeId]) VALUES (38, 28, 2)
GO
INSERT [dbo].[GameAges] ([Id], [GameId], [AgeId]) VALUES (39, 28, 3)
GO
INSERT [dbo].[GameAges] ([Id], [GameId], [AgeId]) VALUES (40, 29, 1)
GO
INSERT [dbo].[GameAges] ([Id], [GameId], [AgeId]) VALUES (41, 29, 2)
GO
INSERT [dbo].[GameAges] ([Id], [GameId], [AgeId]) VALUES (42, 30, 1)
GO
INSERT [dbo].[GameAges] ([Id], [GameId], [AgeId]) VALUES (43, 30, 2)
GO
INSERT [dbo].[GameAges] ([Id], [GameId], [AgeId]) VALUES (44, 31, 1)
GO
INSERT [dbo].[GameAges] ([Id], [GameId], [AgeId]) VALUES (45, 31, 2)
GO
INSERT [dbo].[GameAges] ([Id], [GameId], [AgeId]) VALUES (46, 32, 1)
GO
INSERT [dbo].[GameAges] ([Id], [GameId], [AgeId]) VALUES (47, 32, 2)
GO
INSERT [dbo].[GameAges] ([Id], [GameId], [AgeId]) VALUES (48, 33, 1)
GO
INSERT [dbo].[GameAges] ([Id], [GameId], [AgeId]) VALUES (49, 33, 2)
GO
INSERT [dbo].[GameAges] ([Id], [GameId], [AgeId]) VALUES (50, 34, 5)
GO
INSERT [dbo].[GameAges] ([Id], [GameId], [AgeId]) VALUES (51, 35, 1)
GO
INSERT [dbo].[GameAges] ([Id], [GameId], [AgeId]) VALUES (52, 35, 2)
GO
INSERT [dbo].[GameAges] ([Id], [GameId], [AgeId]) VALUES (53, 35, 3)
GO
INSERT [dbo].[GameAges] ([Id], [GameId], [AgeId]) VALUES (54, 36, 5)
GO
INSERT [dbo].[GameAges] ([Id], [GameId], [AgeId]) VALUES (55, 37, 5)
GO
INSERT [dbo].[GameAges] ([Id], [GameId], [AgeId]) VALUES (56, 38, 5)
GO
INSERT [dbo].[GameAges] ([Id], [GameId], [AgeId]) VALUES (57, 39, 1)
GO
INSERT [dbo].[GameAges] ([Id], [GameId], [AgeId]) VALUES (58, 39, 2)
GO
INSERT [dbo].[GameAges] ([Id], [GameId], [AgeId]) VALUES (59, 40, 1)
GO
INSERT [dbo].[GameAges] ([Id], [GameId], [AgeId]) VALUES (60, 40, 2)
GO
INSERT [dbo].[GameAges] ([Id], [GameId], [AgeId]) VALUES (61, 41, 1)
GO
INSERT [dbo].[GameAges] ([Id], [GameId], [AgeId]) VALUES (62, 41, 2)
GO
INSERT [dbo].[GameAges] ([Id], [GameId], [AgeId]) VALUES (63, 42, 5)
GO
INSERT [dbo].[GameAges] ([Id], [GameId], [AgeId]) VALUES (64, 43, 5)
GO
INSERT [dbo].[GameAges] ([Id], [GameId], [AgeId]) VALUES (65, 44, 5)
GO
INSERT [dbo].[GameAges] ([Id], [GameId], [AgeId]) VALUES (66, 45, 2)
GO
INSERT [dbo].[GameAges] ([Id], [GameId], [AgeId]) VALUES (67, 45, 3)
GO
INSERT [dbo].[GameAges] ([Id], [GameId], [AgeId]) VALUES (68, 46, 2)
GO
INSERT [dbo].[GameAges] ([Id], [GameId], [AgeId]) VALUES (69, 46, 3)
GO
INSERT [dbo].[GameAges] ([Id], [GameId], [AgeId]) VALUES (70, 47, 2)
GO
INSERT [dbo].[GameAges] ([Id], [GameId], [AgeId]) VALUES (71, 47, 3)
GO
INSERT [dbo].[GameAges] ([Id], [GameId], [AgeId]) VALUES (72, 48, 2)
GO
INSERT [dbo].[GameAges] ([Id], [GameId], [AgeId]) VALUES (73, 48, 3)
GO
INSERT [dbo].[GameAges] ([Id], [GameId], [AgeId]) VALUES (74, 49, 2)
GO
INSERT [dbo].[GameAges] ([Id], [GameId], [AgeId]) VALUES (75, 49, 3)
GO
INSERT [dbo].[GameAges] ([Id], [GameId], [AgeId]) VALUES (76, 50, 2)
GO
INSERT [dbo].[GameAges] ([Id], [GameId], [AgeId]) VALUES (77, 50, 3)
GO
INSERT [dbo].[GameAges] ([Id], [GameId], [AgeId]) VALUES (78, 51, 2)
GO
INSERT [dbo].[GameAges] ([Id], [GameId], [AgeId]) VALUES (79, 51, 3)
GO
INSERT [dbo].[GameAges] ([Id], [GameId], [AgeId]) VALUES (80, 52, 2)
GO
INSERT [dbo].[GameAges] ([Id], [GameId], [AgeId]) VALUES (81, 52, 3)
GO
INSERT [dbo].[GameAges] ([Id], [GameId], [AgeId]) VALUES (82, 53, 1)
GO
INSERT [dbo].[GameAges] ([Id], [GameId], [AgeId]) VALUES (83, 53, 2)
GO
INSERT [dbo].[GameAges] ([Id], [GameId], [AgeId]) VALUES (84, 54, 3)
GO
INSERT [dbo].[GameAges] ([Id], [GameId], [AgeId]) VALUES (85, 54, 4)
GO
SET IDENTITY_INSERT [dbo].[GameAges] OFF
GO
SET IDENTITY_INSERT [dbo].[GameIcons] ON 
GO
INSERT [dbo].[GameIcons] ([Id], [Name], [IconUrl], [Html]) VALUES (1, N'Dice', N'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/dice.svg', N'fas fa-dice')
GO
INSERT [dbo].[GameIcons] ([Id], [Name], [IconUrl], [Html]) VALUES (2, N'Dice-six', N'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/dice-six.svg', N'fas fa-dice-six')
GO
INSERT [dbo].[GameIcons] ([Id], [Name], [IconUrl], [Html]) VALUES (3, N'Dice-one', N'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/dice-one.svg', N'fas fa-dice-one')
GO
INSERT [dbo].[GameIcons] ([Id], [Name], [IconUrl], [Html]) VALUES (4, N'Hands', N'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/hands.svg', N'fas fa-hands')
GO
INSERT [dbo].[GameIcons] ([Id], [Name], [IconUrl], [Html]) VALUES (5, N'Chess-knight', N'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/chess-knight.svg', N'fas fa-chess-knight')
GO
INSERT [dbo].[GameIcons] ([Id], [Name], [IconUrl], [Html]) VALUES (6, N'Puzzle-piece', N'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/puzzle-piece.svg', N'fas fa-puzzle-piece')
GO
INSERT [dbo].[GameIcons] ([Id], [Name], [IconUrl], [Html]) VALUES (7, N'Trophy', N'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/trophy.svg', N'fas fa-trophy')
GO
INSERT [dbo].[GameIcons] ([Id], [Name], [IconUrl], [Html]) VALUES (8, N'Heart', N'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/heart.svg', N'fas fa-heart')
GO
INSERT [dbo].[GameIcons] ([Id], [Name], [IconUrl], [Html]) VALUES (9, N'Hat-wizard', N'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/hat-wizard.svg', N'fas fa-hat-wizard')
GO
INSERT [dbo].[GameIcons] ([Id], [Name], [IconUrl], [Html]) VALUES (10, N'Video', N'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/video.svg', N'fas fa-video')
GO
INSERT [dbo].[GameIcons] ([Id], [Name], [IconUrl], [Html]) VALUES (11, N'Music', N'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/music.svg', N'fas fa-music')
GO
INSERT [dbo].[GameIcons] ([Id], [Name], [IconUrl], [Html]) VALUES (12, N'Play-circle', N'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/play-circle.svg', N'fas fa-play-circle')
GO
INSERT [dbo].[GameIcons] ([Id], [Name], [IconUrl], [Html]) VALUES (13, N'Drum', N'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/drum.svg', N'fas fa-drum')
GO
INSERT [dbo].[GameIcons] ([Id], [Name], [IconUrl], [Html]) VALUES (14, N'Clipboard-list', N'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/clipboard-list.svg', N'fas fa-clipboard-list')
GO
INSERT [dbo].[GameIcons] ([Id], [Name], [IconUrl], [Html]) VALUES (15, N'Sleigh', N'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/sleigh.svg', N'fas fa-sleigh')
GO
INSERT [dbo].[GameIcons] ([Id], [Name], [IconUrl], [Html]) VALUES (16, N'Exclamation-triangle', N'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/exclamation-triangle.svg', N'fas fa-exclamation-triangle')
GO
INSERT [dbo].[GameIcons] ([Id], [Name], [IconUrl], [Html]) VALUES (17, N'History', N'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/history.svg', N'fas fa-history')
GO
INSERT [dbo].[GameIcons] ([Id], [Name], [IconUrl], [Html]) VALUES (18, N'Vector-square', N'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/vector-square.svg', N'fas fa-vector-square')
GO
INSERT [dbo].[GameIcons] ([Id], [Name], [IconUrl], [Html]) VALUES (19, N'Hourglass-half', N'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/hourglass-half.svg', N'fas fa-hourglass-half')
GO
INSERT [dbo].[GameIcons] ([Id], [Name], [IconUrl], [Html]) VALUES (20, N'Globe', N'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/globe.svg', N'fas fa-globe')
GO
INSERT [dbo].[GameIcons] ([Id], [Name], [IconUrl], [Html]) VALUES (21, N'Map-signs', N'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/map-signs.svg', N'fas fa-map-signs')
GO
INSERT [dbo].[GameIcons] ([Id], [Name], [IconUrl], [Html]) VALUES (22, N'Map-pin', N'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/map-pin.svg', N'fas fa-map-pin')
GO
INSERT [dbo].[GameIcons] ([Id], [Name], [IconUrl], [Html]) VALUES (23, N'Directions', N'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/directions.svg', N'fas fa-directions')
GO
INSERT [dbo].[GameIcons] ([Id], [Name], [IconUrl], [Html]) VALUES (24, N'Street-view', N'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/street-view.svg', N'fas fa-street-view')
GO
INSERT [dbo].[GameIcons] ([Id], [Name], [IconUrl], [Html]) VALUES (25, N'Traffic-light', N'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/traffic-light.svg', N'fas fa-traffic-light')
GO
INSERT [dbo].[GameIcons] ([Id], [Name], [IconUrl], [Html]) VALUES (26, N'Binoculars', N'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/binoculars.svg', N'fas fa-binoculars')
GO
INSERT [dbo].[GameIcons] ([Id], [Name], [IconUrl], [Html]) VALUES (27, N'Key', N'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/key.svg', N'fas fa-key')
GO
INSERT [dbo].[GameIcons] ([Id], [Name], [IconUrl], [Html]) VALUES (28, N'Gift', N'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/gift.svg', N'fas fa-gift')
GO
INSERT [dbo].[GameIcons] ([Id], [Name], [IconUrl], [Html]) VALUES (29, N'Gifts', N'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/gifts.svg', N'fas fa-gifts')
GO
INSERT [dbo].[GameIcons] ([Id], [Name], [IconUrl], [Html]) VALUES (30, N'Eye', N'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/eye.svg', N'fas fa-eye')
GO
INSERT [dbo].[GameIcons] ([Id], [Name], [IconUrl], [Html]) VALUES (31, N'Birthday-cake', N'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/birthday-cake.svg', N'fas fa-birthday-cake')
GO
INSERT [dbo].[GameIcons] ([Id], [Name], [IconUrl], [Html]) VALUES (32, N'Plane-departure', N'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/plane-departure.svg', N'fas fa-plane-departure')
GO
INSERT [dbo].[GameIcons] ([Id], [Name], [IconUrl], [Html]) VALUES (33, N'Snowman', N'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/snowman.svg', N'fas fa-snowman')
GO
INSERT [dbo].[GameIcons] ([Id], [Name], [IconUrl], [Html]) VALUES (34, N'Shapes', N'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/shapes.svg', N'fas fa-shapes')
GO
INSERT [dbo].[GameIcons] ([Id], [Name], [IconUrl], [Html]) VALUES (35, N'Robot', N'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/robot.svg', N'fas fa-robot')
GO
INSERT [dbo].[GameIcons] ([Id], [Name], [IconUrl], [Html]) VALUES (36, N'Ice-cream', N'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/ice-cream.svg', N'fas fa-ice-cream')
GO
INSERT [dbo].[GameIcons] ([Id], [Name], [IconUrl], [Html]) VALUES (37, N'Gem', N'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/regular/gem.svg', N'fas fa-gem')
GO
INSERT [dbo].[GameIcons] ([Id], [Name], [IconUrl], [Html]) VALUES (38, N'Clock', N'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/regular/clock.svg', N'fas fa-clock')
GO
INSERT [dbo].[GameIcons] ([Id], [Name], [IconUrl], [Html]) VALUES (39, N'Lock-open', N'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/lock-open.svg', N'fas fa-lock-open')
GO
INSERT [dbo].[GameIcons] ([Id], [Name], [IconUrl], [Html]) VALUES (40, N'Money-bill-alt', N'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/regular/money-bill-alt.svg', N'fas fa-money-bill-alt')
GO
INSERT [dbo].[GameIcons] ([Id], [Name], [IconUrl], [Html]) VALUES (41, N'Camera', N'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/camera.svg', N'fas fa-camera')
GO
INSERT [dbo].[GameIcons] ([Id], [Name], [IconUrl], [Html]) VALUES (42, N'Star', N'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/regular/star.svg', N'fas fa-star')
GO
INSERT [dbo].[GameIcons] ([Id], [Name], [IconUrl], [Html]) VALUES (43, N'Bell', N'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/regular/bell.svg', N'fas fa-bell')
GO
INSERT [dbo].[GameIcons] ([Id], [Name], [IconUrl], [Html]) VALUES (44, N'Layer-group', N'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/layer-group.svg', N'fas fa-layer-group')
GO
INSERT [dbo].[GameIcons] ([Id], [Name], [IconUrl], [Html]) VALUES (45, N'Ethereum', N'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/brands/ethereum.svg', N'fas fa-ethereum')
GO
INSERT [dbo].[GameIcons] ([Id], [Name], [IconUrl], [Html]) VALUES (46, N'Rainbow', N'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/rainbow.svg', N'fas fa-rainbow')
GO
INSERT [dbo].[GameIcons] ([Id], [Name], [IconUrl], [Html]) VALUES (47, N'Sun', N'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/sun.svg', N'fas fa-sun')
GO
INSERT [dbo].[GameIcons] ([Id], [Name], [IconUrl], [Html]) VALUES (48, N'Users', N'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/users.svg', N'fas fa-users')
GO
INSERT [dbo].[GameIcons] ([Id], [Name], [IconUrl], [Html]) VALUES (49, N'Grin-stars', N'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/grin-stars.svg', N'fas fa-grin-stars')
GO
INSERT [dbo].[GameIcons] ([Id], [Name], [IconUrl], [Html]) VALUES (50, N'Medal', N'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/medal.svg', N'fas fa-medal')
GO
INSERT [dbo].[GameIcons] ([Id], [Name], [IconUrl], [Html]) VALUES (51, N'Magic', N'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/magic.svg', N'fas fa-magic')
GO
INSERT [dbo].[GameIcons] ([Id], [Name], [IconUrl], [Html]) VALUES (52, N'Dragon', N'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/dragon.svg', N'fas fa-dragon')
GO
INSERT [dbo].[GameIcons] ([Id], [Name], [IconUrl], [Html]) VALUES (53, N'Grin-beam', N'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/grin-beam.svg', N'fas fa-grin-beam')
GO
INSERT [dbo].[GameIcons] ([Id], [Name], [IconUrl], [Html]) VALUES (54, N'Grin-hearts', N'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/grin-hearts.svg', N'fas fa-grin-hearts')
GO
INSERT [dbo].[GameIcons] ([Id], [Name], [IconUrl], [Html]) VALUES (55, N'Anchor', N'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/anchor.svg', N'fas fa-anchor')
GO
INSERT [dbo].[GameIcons] ([Id], [Name], [IconUrl], [Html]) VALUES (56, N'User-circle', N'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/user-circle.svg', N'fas fa-user-circle')
GO
INSERT [dbo].[GameIcons] ([Id], [Name], [IconUrl], [Html]) VALUES (57, N'Chalkboard-teacher', N'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/chalkboard-teacher.svg', N'fas fa-chalkboard-teacher')
GO
INSERT [dbo].[GameIcons] ([Id], [Name], [IconUrl], [Html]) VALUES (58, N'Balance-scale', N'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/balance-scale.svg', N'fas fa-balance-scale')
GO
INSERT [dbo].[GameIcons] ([Id], [Name], [IconUrl], [Html]) VALUES (59, N'User-friends', N'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/user-friends.svg', N'fas fa-user-friends')
GO
INSERT [dbo].[GameIcons] ([Id], [Name], [IconUrl], [Html]) VALUES (60, N'User-cog', N'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/user-cog.svg', N'fas fa-user-cog')
GO
INSERT [dbo].[GameIcons] ([Id], [Name], [IconUrl], [Html]) VALUES (61, N'List-ol', N'', N'fas fa-list-ol')
GO
INSERT [dbo].[GameIcons] ([Id], [Name], [IconUrl], [Html]) VALUES (62, N'font', N'', N'fas fa-font')
GO
INSERT [dbo].[GameIcons] ([Id], [Name], [IconUrl], [Html]) VALUES (63, N'home', N'', N'fas fa-home')
GO
SET IDENTITY_INSERT [dbo].[GameIcons] OFF
GO
SET IDENTITY_INSERT [dbo].[GameInstruments] ON 
GO
INSERT [dbo].[GameInstruments] ([Id], [GameId], [InstrumentId]) VALUES (1, 1, 1)
GO
INSERT [dbo].[GameInstruments] ([Id], [GameId], [InstrumentId]) VALUES (2, 2, 1)
GO
INSERT [dbo].[GameInstruments] ([Id], [GameId], [InstrumentId]) VALUES (3, 3, 1)
GO
INSERT [dbo].[GameInstruments] ([Id], [GameId], [InstrumentId]) VALUES (4, 4, 5)
GO
INSERT [dbo].[GameInstruments] ([Id], [GameId], [InstrumentId]) VALUES (5, 4, 4)
GO
INSERT [dbo].[GameInstruments] ([Id], [GameId], [InstrumentId]) VALUES (6, 4, 2)
GO
INSERT [dbo].[GameInstruments] ([Id], [GameId], [InstrumentId]) VALUES (7, 4, 6)
GO
INSERT [dbo].[GameInstruments] ([Id], [GameId], [InstrumentId]) VALUES (8, 5, 1)
GO
INSERT [dbo].[GameInstruments] ([Id], [GameId], [InstrumentId]) VALUES (9, 6, 1)
GO
INSERT [dbo].[GameInstruments] ([Id], [GameId], [InstrumentId]) VALUES (10, 7, 1)
GO
INSERT [dbo].[GameInstruments] ([Id], [GameId], [InstrumentId]) VALUES (11, 8, 5)
GO
INSERT [dbo].[GameInstruments] ([Id], [GameId], [InstrumentId]) VALUES (12, 9, 5)
GO
INSERT [dbo].[GameInstruments] ([Id], [GameId], [InstrumentId]) VALUES (13, 10, 1)
GO
INSERT [dbo].[GameInstruments] ([Id], [GameId], [InstrumentId]) VALUES (14, 11, 1)
GO
INSERT [dbo].[GameInstruments] ([Id], [GameId], [InstrumentId]) VALUES (15, 12, 1)
GO
INSERT [dbo].[GameInstruments] ([Id], [GameId], [InstrumentId]) VALUES (16, 13, 1)
GO
INSERT [dbo].[GameInstruments] ([Id], [GameId], [InstrumentId]) VALUES (17, 14, 1)
GO
INSERT [dbo].[GameInstruments] ([Id], [GameId], [InstrumentId]) VALUES (18, 15, 1)
GO
INSERT [dbo].[GameInstruments] ([Id], [GameId], [InstrumentId]) VALUES (19, 16, 1)
GO
INSERT [dbo].[GameInstruments] ([Id], [GameId], [InstrumentId]) VALUES (20, 17, 1)
GO
INSERT [dbo].[GameInstruments] ([Id], [GameId], [InstrumentId]) VALUES (21, 18, 1)
GO
INSERT [dbo].[GameInstruments] ([Id], [GameId], [InstrumentId]) VALUES (22, 19, 1)
GO
INSERT [dbo].[GameInstruments] ([Id], [GameId], [InstrumentId]) VALUES (23, 20, 1)
GO
INSERT [dbo].[GameInstruments] ([Id], [GameId], [InstrumentId]) VALUES (24, 21, 1)
GO
INSERT [dbo].[GameInstruments] ([Id], [GameId], [InstrumentId]) VALUES (25, 22, 1)
GO
INSERT [dbo].[GameInstruments] ([Id], [GameId], [InstrumentId]) VALUES (26, 23, 1)
GO
INSERT [dbo].[GameInstruments] ([Id], [GameId], [InstrumentId]) VALUES (27, 24, 1)
GO
INSERT [dbo].[GameInstruments] ([Id], [GameId], [InstrumentId]) VALUES (28, 25, 1)
GO
INSERT [dbo].[GameInstruments] ([Id], [GameId], [InstrumentId]) VALUES (29, 26, 1)
GO
INSERT [dbo].[GameInstruments] ([Id], [GameId], [InstrumentId]) VALUES (30, 27, 1)
GO
INSERT [dbo].[GameInstruments] ([Id], [GameId], [InstrumentId]) VALUES (31, 28, 1)
GO
INSERT [dbo].[GameInstruments] ([Id], [GameId], [InstrumentId]) VALUES (32, 29, 1)
GO
INSERT [dbo].[GameInstruments] ([Id], [GameId], [InstrumentId]) VALUES (33, 30, 1)
GO
INSERT [dbo].[GameInstruments] ([Id], [GameId], [InstrumentId]) VALUES (34, 31, 1)
GO
INSERT [dbo].[GameInstruments] ([Id], [GameId], [InstrumentId]) VALUES (35, 32, 1)
GO
INSERT [dbo].[GameInstruments] ([Id], [GameId], [InstrumentId]) VALUES (36, 33, 1)
GO
INSERT [dbo].[GameInstruments] ([Id], [GameId], [InstrumentId]) VALUES (37, 34, 1)
GO
INSERT [dbo].[GameInstruments] ([Id], [GameId], [InstrumentId]) VALUES (38, 35, 1)
GO
INSERT [dbo].[GameInstruments] ([Id], [GameId], [InstrumentId]) VALUES (39, 36, 1)
GO
INSERT [dbo].[GameInstruments] ([Id], [GameId], [InstrumentId]) VALUES (40, 37, 1)
GO
INSERT [dbo].[GameInstruments] ([Id], [GameId], [InstrumentId]) VALUES (41, 38, 1)
GO
INSERT [dbo].[GameInstruments] ([Id], [GameId], [InstrumentId]) VALUES (42, 39, 1)
GO
INSERT [dbo].[GameInstruments] ([Id], [GameId], [InstrumentId]) VALUES (43, 40, 1)
GO
INSERT [dbo].[GameInstruments] ([Id], [GameId], [InstrumentId]) VALUES (44, 41, 5)
GO
INSERT [dbo].[GameInstruments] ([Id], [GameId], [InstrumentId]) VALUES (45, 41, 4)
GO
INSERT [dbo].[GameInstruments] ([Id], [GameId], [InstrumentId]) VALUES (46, 42, 5)
GO
INSERT [dbo].[GameInstruments] ([Id], [GameId], [InstrumentId]) VALUES (47, 42, 4)
GO
INSERT [dbo].[GameInstruments] ([Id], [GameId], [InstrumentId]) VALUES (48, 43, 5)
GO
INSERT [dbo].[GameInstruments] ([Id], [GameId], [InstrumentId]) VALUES (49, 43, 4)
GO
INSERT [dbo].[GameInstruments] ([Id], [GameId], [InstrumentId]) VALUES (50, 44, 1)
GO
INSERT [dbo].[GameInstruments] ([Id], [GameId], [InstrumentId]) VALUES (51, 45, 1)
GO
INSERT [dbo].[GameInstruments] ([Id], [GameId], [InstrumentId]) VALUES (52, 46, 1)
GO
INSERT [dbo].[GameInstruments] ([Id], [GameId], [InstrumentId]) VALUES (53, 47, 1)
GO
INSERT [dbo].[GameInstruments] ([Id], [GameId], [InstrumentId]) VALUES (54, 48, 1)
GO
INSERT [dbo].[GameInstruments] ([Id], [GameId], [InstrumentId]) VALUES (55, 49, 1)
GO
INSERT [dbo].[GameInstruments] ([Id], [GameId], [InstrumentId]) VALUES (56, 50, 1)
GO
INSERT [dbo].[GameInstruments] ([Id], [GameId], [InstrumentId]) VALUES (57, 51, 1)
GO
INSERT [dbo].[GameInstruments] ([Id], [GameId], [InstrumentId]) VALUES (58, 52, 1)
GO
INSERT [dbo].[GameInstruments] ([Id], [GameId], [InstrumentId]) VALUES (59, 53, 3)
GO
INSERT [dbo].[GameInstruments] ([Id], [GameId], [InstrumentId]) VALUES (60, 54, 3)
GO
SET IDENTITY_INSERT [dbo].[GameInstruments] OFF
GO
SET IDENTITY_INSERT [dbo].[Games] ON 
GO
INSERT [dbo].[Games] ([Id], [Name], [IsActive], [Songs], [Description], [PreworkLevelId], [Prework], [Instructions], [Credit], [WebsiteUrl], [SubmittedByUserId], [DateCreated], [GameIconId], [PhotoUrl], [Keywords]) VALUES (1, N'Countdown to Valentine’s Day Practice Chart', 1, N'', N'Improve a specific set of skills or difficult spot by working on it 100 times!', 1, N'Print the chart and pick a reward to give the student.', N'1. Print the chart. 
 2. Pick a set of skills to focus on. 
 3. Have the student mark down every time they practice that specific skill set or difficult spot.
 4. Reward the student when they read 100 practices for this skill set!', N'Suzuki Violin Practice Shop', N'https://www.teacherspayteachers.com/Product/Suzuki-Violin-Practice-Chart-Valentines-Day-3592686', 1, CAST(N'2020-01-01T00:00:00.000' AS DateTime), 17, N'https://ecdn.teacherspayteachers.com/thumbitem/Suzuki-5-Practice-Chart-Valentine-s-Day-3592686-1554897191/original-3592686-1.jpg', N'Practice Chart, Valentine’s Day,')
GO
INSERT [dbo].[Games] ([Id], [Name], [IsActive], [Songs], [Description], [PreworkLevelId], [Prework], [Instructions], [Credit], [WebsiteUrl], [SubmittedByUserId], [DateCreated], [GameIconId], [PhotoUrl], [Keywords]) VALUES (2, N'Review Songs Card Game', 1, N'', N'Reviewing past repertoire songs is an important component of a child’s ongoing development given that all new songs build on skills learned in prior songs. But reviewing past songs doesn’t have to be a bore!', 2, N'Buy the cards (or make them).', N'1. Shuffle cards.
 2. Let child pick 2 review song cards to practice that day /week.', N'Suzuki 5 Practice Shop', N'https://www.teacherspayteachers.com/Product/Valentines-Day-Suzuki-Violin-Review-Cards-Book-1-3588897', 2, CAST(N'2020-01-01T00:00:00.000' AS DateTime), 11, N'https://ecdn.teacherspayteachers.com/thumbitem/Valentine-s-Day-Suzuki-Violin-Review-Cards-Book-1-3588897-1551559262/original-3588897-2.jpg', N'Review, Cards, Valentine’s Day')
GO
INSERT [dbo].[Games] ([Id], [Name], [IsActive], [Songs], [Description], [PreworkLevelId], [Prework], [Instructions], [Credit], [WebsiteUrl], [SubmittedByUserId], [DateCreated], [GameIconId], [PhotoUrl], [Keywords]) VALUES (3, N'Task Cards', 1, N'', N'Help your student practice specific skills with new or past songs while giving them the independence of picking the skill to work on themselves and the fun surprise element of not knowing which one they will pick!', 2, N'Buy the cards (or make them).', N'1. Shuffle cards.
 2. Let child pick 2 review song cards to practice that day /week.', N'Suzuki 5 Practice Shop', N'https://www.teacherspayteachers.com/Product/Suzuki-Violin-Valentines-Cards-3631183', 3, CAST(N'2020-01-01T00:00:00.000' AS DateTime), 44, N'https://ecdn.teacherspayteachers.com/thumbitem/Suzuki-Violin-Valentine-s-Cards-3631183-1581247051/original-3631183-3.jpg', N'Review, Cards, Valentine’s Day')
GO
INSERT [dbo].[Games] ([Id], [Name], [IsActive], [Songs], [Description], [PreworkLevelId], [Prework], [Instructions], [Credit], [WebsiteUrl], [SubmittedByUserId], [DateCreated], [GameIconId], [PhotoUrl], [Keywords]) VALUES (4, N'Music Tour', 1, N'', N'Take the student “on tour” —playing something different in each room of the house, on the front or back porch or in a different places in the yard.', 1, N'None', N'1. Ask the student to pick 5 (or the number of songs they need to play) places in the house / neighborhood where they would like to practice. 
 1. Go to each location and play.
 1. Notice how the instrument sound may be different in different locations - for example, based on room size or whether it is inside or outside.', N'Sarah Mitchell', N'', 4, CAST(N'2020-01-01T00:00:00.000' AS DateTime), 32, N'https://cdn.pixabay.com/photo/2016/08/24/19/18/violin-1617787_1280.jpg', N'Review, Home, House')
GO
INSERT [dbo].[Games] ([Id], [Name], [IsActive], [Songs], [Description], [PreworkLevelId], [Prework], [Instructions], [Credit], [WebsiteUrl], [SubmittedByUserId], [DateCreated], [GameIconId], [PhotoUrl], [Keywords]) VALUES (5, N'Number Game', 1, N'', N'Foster independence by allowing your child to pick how many times they will practice a given skill or difficult practice spot.', 2, N'1. Write numbers 1-9 on a set of cards.', N'1. Lay the cards out on the floor. 
 2. Identify the tasks the child needs to practice and start going through the task list.
 3. Let them pick a number - and that tells them how many times they need to do the next task.', N'Maria @ Music Teaching and Parenting', N'https://www.musicteachingandparenting.com/suzuki-violin-games-for-the-young-ones/', 5, CAST(N'2020-01-01T00:00:00.000' AS DateTime), 61, N'https://www.musicteachingandparenting.com/wp-content/uploads/2013/03/IMG_0373.jpg', N'Practice Spot, Cards')
GO
INSERT [dbo].[Games] ([Id], [Name], [IsActive], [Songs], [Description], [PreworkLevelId], [Prework], [Instructions], [Credit], [WebsiteUrl], [SubmittedByUserId], [DateCreated], [GameIconId], [PhotoUrl], [Keywords]) VALUES (6, N'Treasure Hunt', 1, N'', N'Who doesn’t love a good treasure hunt? The thrill of finding the next treasure will make them forget this even counts as practice!', 2, N'1. Tape instructions for practice assignments to little toys or candy. 
 2. Hide them throughout the house.', N'As the child finds each treasure, they need to complete the challenge to move on to hunt for the next treasure.', N'Maria @ Music Teaching and Parenting', N'https://www.musicteachingandparenting.com/suzuki-violin-practice-games-piano/', 6, CAST(N'2020-01-01T00:00:00.000' AS DateTime), 7, N'https://cdn.pixabay.com/photo/2015/02/01/17/06/treasure-chest-619868_1280.jpg', N'Practice Spot, Hunt')
GO
INSERT [dbo].[Games] ([Id], [Name], [IsActive], [Songs], [Description], [PreworkLevelId], [Prework], [Instructions], [Credit], [WebsiteUrl], [SubmittedByUserId], [DateCreated], [GameIconId], [PhotoUrl], [Keywords]) VALUES (7, N'Board Game', 1, N'', N'Make a board game that has the child advance along the board by practicing the tasks assigned by where he lands.', 3, N'1. Find a big piece of cardboard and colorful construction paper.
 2. Write the practice activities on different pieces of paper and tape them along the edge of the cardboard. 
 3. Fun tip: Include some extra fun unexpected activities such as hug your baby sister, kiss mom, get a cookie.
 4. Indicate the START and FINISH places.
 5. Have a die ready to go.', N'1. Have the child roll the die to start the game.
 2. The child has to complete the activity on which he landed before he can move to it. 
 3. You can take turns rolling the die. 
 4. Keep rolling until someone (everyone?) reaches the Finish line.', N'', N'', 7, CAST(N'2020-01-01T00:00:00.000' AS DateTime), 23, N'https://cdn.pixabay.com/photo/2017/10/01/17/22/goose-game-2806291__480.jpg', N'Practice Spot, Review, Game, Board Game, Dice')
GO
INSERT [dbo].[Games] ([Id], [Name], [IsActive], [Songs], [Description], [PreworkLevelId], [Prework], [Instructions], [Credit], [WebsiteUrl], [SubmittedByUserId], [DateCreated], [GameIconId], [PhotoUrl], [Keywords]) VALUES (8, N'Bow Parts Song', 1, N'Bow Parts Song', N'Sing the parts of the bow to make it easier to remember them.', 1, N'None', N'1. Parent asks the question: Where is the frog? And the child answers in the same note: Here is the frog. 
 2. Parent keeps asking question, raising the pitch with each question and having the child match her pitch. 
 3. Show the child how to make exaggerated dramatic No No No hand gestures to answer the last question: Where is the hair? Answer: DON’T TOUCH THE HAIR!', N'Sarah Mitchell', N'', 8, CAST(N'2020-01-01T00:00:00.000' AS DateTime), 11, N'https://cdn.pixabay.com/photo/2018/05/12/23/47/violin-3394881_1280.jpg', N'Bow, Song, Car, Travel')
GO
INSERT [dbo].[Games] ([Id], [Name], [IsActive], [Songs], [Description], [PreworkLevelId], [Prework], [Instructions], [Credit], [WebsiteUrl], [SubmittedByUserId], [DateCreated], [GameIconId], [PhotoUrl], [Keywords]) VALUES (9, N'Violin Parts Song', 1, N'Violin Parts Song', N'Sing the parts of the violin to make it easier to remember them.', 1, N'None', N'1. Parent asks the question: Where is the frog? And the child answers in the same note: Here is the frog. 
 2. Parent keeps asking question, raising the pitch with each question and having the child match her pitch.', N'Sarah Mitchell', N'', 9, CAST(N'2020-01-01T00:00:00.000' AS DateTime), 11, N'https://cdn.pixabay.com/photo/2018/02/04/23/14/wood-3131120_1280.jpg', N'Violin, Song, Car, Travel')
GO
INSERT [dbo].[Games] ([Id], [Name], [IsActive], [Songs], [Description], [PreworkLevelId], [Prework], [Instructions], [Credit], [WebsiteUrl], [SubmittedByUserId], [DateCreated], [GameIconId], [PhotoUrl], [Keywords]) VALUES (10, N'Sing it!', 1, N'Suzuki Curriculum Songs', N'Sing lyrics to the Suzuki curriculum songs to make it easier to remember them.', 2, N'1. Find the song lyrics online.', N'1. Sing the lyrics with your child when you listen to the CD.', N'Suzuki Practice Is Fun', N'http://suzukipracticeisfun.blogspot.com/2012/10/are-you-and-your-child-listening-to.html', 10, CAST(N'2020-01-01T00:00:00.000' AS DateTime), 11, N'https://media.istockphoto.com/photos/lyrics-written-on-an-old-typewriter-picture-id1011442690', N'Car, Travel, Lyrics, Review')
GO
INSERT [dbo].[Games] ([Id], [Name], [IsActive], [Songs], [Description], [PreworkLevelId], [Prework], [Instructions], [Credit], [WebsiteUrl], [SubmittedByUserId], [DateCreated], [GameIconId], [PhotoUrl], [Keywords]) VALUES (11, N'Clap Clap Clap Your Hands', 1, N'Twinkle Variations', N'Listen to the Twinkle variations and clap the rhythms together.', 1, N'None', N'1. Listen to the Twinkle variations on the practice CD and clap along. 
 2. Take turns clapping a rhythm and having the child / parent guess the rhythm.', N'Maria @ Music Teaching and Parenting', N'https://www.musicteachingandparenting.com/suzuki-violin-practice-games-listening-challenge/', 11, CAST(N'2020-01-01T00:00:00.000' AS DateTime), 4, N'https://cdn.pixabay.com/photo/2013/11/24/11/11/happy-217089__480.jpg', N'Car, Travel')
GO
INSERT [dbo].[Games] ([Id], [Name], [IsActive], [Songs], [Description], [PreworkLevelId], [Prework], [Instructions], [Credit], [WebsiteUrl], [SubmittedByUserId], [DateCreated], [GameIconId], [PhotoUrl], [Keywords]) VALUES (12, N'Birthday Candle', 1, N'', N'Let the time it takes for a birthday candle to burn dictate the length of the practice session!', 2, N'Get a set of birthday candles.', N'Light a birthday candle (make some type of holder) and have that be the length of the practice session.', N'Suzuki Association of the Americas', N'https://static1.squarespace.com/static/590a327459cc68c870460707/t/59c14d990abd04286b87c33b/1505840540058/Practicing+Games-A+Collection.pdf', 1, CAST(N'2020-01-01T00:00:00.000' AS DateTime), 31, N'https://cdn.pixabay.com/photo/2018/07/22/16/36/muffin-3554917_1280.jpg', N'Home, House')
GO
INSERT [dbo].[Games] ([Id], [Name], [IsActive], [Songs], [Description], [PreworkLevelId], [Prework], [Instructions], [Credit], [WebsiteUrl], [SubmittedByUserId], [DateCreated], [GameIconId], [PhotoUrl], [Keywords]) VALUES (13, N'"6" things a day', 1, N'', N'Pick 6 things to practice, and that’s your practice session for the day!', 1, N'None', N'Pick 6 things to practice. For example—10 perfect bow holds (counts as 1 thing), some drill work on the working piece, 3 review pieces, preview for next piece.', N'Suzuki Association of the Americas', N'https://static1.squarespace.com/static/590a327459cc68c870460707/t/59c14d990abd04286b87c33b/1505840540058/Practicing+Games-A+Collection.pdf', 2, CAST(N'2020-01-01T00:00:00.000' AS DateTime), 2, N'https://cdn.pixabay.com/photo/2014/09/07/15/35/number-437924__480.jpg', N'Practice Spot, Review')
GO
INSERT [dbo].[Games] ([Id], [Name], [IsActive], [Songs], [Description], [PreworkLevelId], [Prework], [Instructions], [Credit], [WebsiteUrl], [SubmittedByUserId], [DateCreated], [GameIconId], [PhotoUrl], [Keywords]) VALUES (14, N'Student as Parent', 1, N'', N'Let the student be the parent for one day of practice.', 1, N'None', N'Let the student be the parent for one day of practice.', N'Suzuki Association of the Americas', N'https://static1.squarespace.com/static/590a327459cc68c870460707/t/59c14d990abd04286b87c33b/1505840540058/Practicing+Games-A+Collection.pdf', 3, CAST(N'2020-01-01T00:00:00.000' AS DateTime), 57, N'https://cdn.pixabay.com/photo/2016/08/17/04/27/mother-1599653__480.jpg', N'Practice Spot, Review, Student-Led')
GO
INSERT [dbo].[Games] ([Id], [Name], [IsActive], [Songs], [Description], [PreworkLevelId], [Prework], [Instructions], [Credit], [WebsiteUrl], [SubmittedByUserId], [DateCreated], [GameIconId], [PhotoUrl], [Keywords]) VALUES (15, N'25 minutes = 25 cents', 1, N'', N'Practice for 25 minutes, earn 25 cents.', 1, N'None', N'Let the student cash in on their practices!', N'Suzuki Association of the Americas', N'https://static1.squarespace.com/static/590a327459cc68c870460707/t/59c14d990abd04286b87c33b/1505840540058/Practicing+Games-A+Collection.pdf', 4, CAST(N'2020-01-01T00:00:00.000' AS DateTime), 40, N'https://cdn.pixabay.com/photo/2017/11/02/18/55/jar-2912135__480.jpg', N'Money')
GO
INSERT [dbo].[Games] ([Id], [Name], [IsActive], [Songs], [Description], [PreworkLevelId], [Prework], [Instructions], [Credit], [WebsiteUrl], [SubmittedByUserId], [DateCreated], [GameIconId], [PhotoUrl], [Keywords]) VALUES (16, N'Family Recital', 1, N'', N'Plan a recital for stuffed animals, friends, family, etc.', 2, N'1. Pick a time and date. 
 2. Have the child make and send out invitations if inviting family members. 
 3. Have the child make a program and decorate it. 
 4. Let the child pick refreshments to serve.', N'1. Send out invitations. 
 2. Let the child select the pieces that will be played.
 3. Practice for a week in preparation. 
 4. Set up a stage and make a spotlight!', N'Suzuki Association of the Americas', N'https://static1.squarespace.com/static/590a327459cc68c870460707/t/59c14d990abd04286b87c33b/1505840540058/Practicing+Games-A+Collection.pdf', 5, CAST(N'2020-01-01T00:00:00.000' AS DateTime), 13, N'https://cdn.pixabay.com/photo/2016/08/24/19/18/violin-1617787__480.jpg', N'Recital, Show, Family')
GO
INSERT [dbo].[Games] ([Id], [Name], [IsActive], [Songs], [Description], [PreworkLevelId], [Prework], [Instructions], [Credit], [WebsiteUrl], [SubmittedByUserId], [DateCreated], [GameIconId], [PhotoUrl], [Keywords]) VALUES (17, N'Roll the Dice Version 1', 1, N'', N'Roll a dice to determine the number of repetitions of a piece or for drill work.', 2, N'Buy a package of math dice—these dice have more sides with higher numbers.', N'Roll a dice to determine the number of repetitions of a piece or for drill work (ex—play this section the number of times you roll on the dice.) Or, roll the dice to determine which measure to play and repeat a certain number of times.', N'Suzuki Association of the Americas', N'https://static1.squarespace.com/static/590a327459cc68c870460707/t/59c14d990abd04286b87c33b/1505840540058/Practicing+Games-A+Collection.pdf', 6, CAST(N'2020-01-01T00:00:00.000' AS DateTime), 1, N'https://cdn.pixabay.com/photo/2015/03/25/23/45/cube-689618__480.jpg', N'Dice, Practice Spot')
GO
INSERT [dbo].[Games] ([Id], [Name], [IsActive], [Songs], [Description], [PreworkLevelId], [Prework], [Instructions], [Credit], [WebsiteUrl], [SubmittedByUserId], [DateCreated], [GameIconId], [PhotoUrl], [Keywords]) VALUES (18, N'Choose a Card', 1, N'', N'Pick a card from a deck to determine the number of repetitions of a piece or for drill work. Aces count as 1, face cards mean the parent has to perform the task.', 2, N'Get a deck of cards.', N'Pick a card from a deck to determine the number of repetitions of a piece or for drill work. Aces count as 1, face cards mean the parent has to perform the task.', N'Suzuki Association of the Americas', N'https://static1.squarespace.com/static/590a327459cc68c870460707/t/59c14d990abd04286b87c33b/1505840540058/Practicing+Games-A+Collection.pdf', 7, CAST(N'2020-01-01T00:00:00.000' AS DateTime), 44, N'https://cdn.pixabay.com/photo/2016/11/29/08/00/card-1868267__480.jpg', N'Cards, Practice Spot')
GO
INSERT [dbo].[Games] ([Id], [Name], [IsActive], [Songs], [Description], [PreworkLevelId], [Prework], [Instructions], [Credit], [WebsiteUrl], [SubmittedByUserId], [DateCreated], [GameIconId], [PhotoUrl], [Keywords]) VALUES (19, N'Draw Song', 1, N'', N'Write the piece names on pieces of paper. Put in a hat and draw to determine piece to play and order. Or put practice item on paper (bow holds, scales, etc.)', 2, N'Write the piece names on pieces of paper.', N'Put all the song names in a hat and draw to determine piece to play and order. Or put practice item on paper (bow holds, scales, etc.)', N'Suzuki Association of the Americas', N'https://static1.squarespace.com/static/590a327459cc68c870460707/t/59c14d990abd04286b87c33b/1505840540058/Practicing+Games-A+Collection.pdf', 8, CAST(N'2020-01-01T00:00:00.000' AS DateTime), 44, N'https://cdn.pixabay.com/photo/2019/04/04/15/52/hare-4103102__480.jpg', N'Cards, Review')
GO
INSERT [dbo].[Games] ([Id], [Name], [IsActive], [Songs], [Description], [PreworkLevelId], [Prework], [Instructions], [Credit], [WebsiteUrl], [SubmittedByUserId], [DateCreated], [GameIconId], [PhotoUrl], [Keywords]) VALUES (20, N'Silly Cards', 1, N'', N'Make silly cards and let child draw a silly card as a reward. Ex—stand on one foot, stick out your tongue, sing the piece, play pizzicato. For example, if child needs to play Twinkle and draws “stick out your tongue,” must play twinkle with tongue out the whole time. It’s quite amusing.', 2, N'With the child, make the cards.', N'Make silly cards and let child draw a silly card as a reward. Ex—stand on one foot, stick out your tongue, sing the piece, play pizzicato. For example, if child needs to play Twinkle and draws “stick out your tongue,” must play twinkle with tongue out the whole time. It’s quite amusing.', N'Suzuki Association of the Americas', N'https://static1.squarespace.com/static/590a327459cc68c870460707/t/59c14d990abd04286b87c33b/1505840540058/Practicing+Games-A+Collection.pdf', 9, CAST(N'2020-01-01T00:00:00.000' AS DateTime), 49, N'https://cdn.pixabay.com/photo/2015/07/08/19/36/person-836793__480.jpg', N'Cards, Review')
GO
INSERT [dbo].[Games] ([Id], [Name], [IsActive], [Songs], [Description], [PreworkLevelId], [Prework], [Instructions], [Credit], [WebsiteUrl], [SubmittedByUserId], [DateCreated], [GameIconId], [PhotoUrl], [Keywords]) VALUES (21, N'Make a Video', 1, N'', N'Regularly video tape your child playing her instrument. You’ll be amazed at the progress she makes.', 1, N'None', N'Regularly video tape your child playing her instrument.', N'Suzuki Association of the Americas', N'https://static1.squarespace.com/static/590a327459cc68c870460707/t/59c14d990abd04286b87c33b/1505840540058/Practicing+Games-A+Collection.pdf', 1, CAST(N'2020-01-01T00:00:00.000' AS DateTime), 10, N'https://cdn.pixabay.com/photo/2018/09/25/19/00/autumn-3702845__480.jpg', N'Record')
GO
INSERT [dbo].[Games] ([Id], [Name], [IsActive], [Songs], [Description], [PreworkLevelId], [Prework], [Instructions], [Credit], [WebsiteUrl], [SubmittedByUserId], [DateCreated], [GameIconId], [PhotoUrl], [Keywords]) VALUES (22, N'Chip Game', 1, N'', N'Practice difficult spots and make it a competition of who wins the most chips or tokens! Will it be the parent or the child?', 2, N'Get together the “chips” you want to use.', N'1. Set a goal—for example, keeping thumb bent while playing piece or keeping a good 5 posture for entire piece. 2. Give child and parent 5 chips each. 
 3. If child meets goal, gets a chip from parent. If misses goal, parent gets a chip. 
 4. Keep playing until someone has all of the chips.', N'Suzuki Association of the Americas', N'https://static1.squarespace.com/static/590a327459cc68c870460707/t/59c14d990abd04286b87c33b/1505840540058/Practicing+Games-A+Collection.pdf', 2, CAST(N'2020-01-01T00:00:00.000' AS DateTime), 16, N'https://cdn.pixabay.com/photo/2016/06/03/05/03/tokens-1432747__480.jpg', N'Review, Skills, Practice Spot')
GO
INSERT [dbo].[Games] ([Id], [Name], [IsActive], [Songs], [Description], [PreworkLevelId], [Prework], [Instructions], [Credit], [WebsiteUrl], [SubmittedByUserId], [DateCreated], [GameIconId], [PhotoUrl], [Keywords]) VALUES (23, N'Cheating Chess', 1, N'', N'I like to play chess (and Cheating Chess is good alliteration) but you can adapt most two player games. Noughts and crosses (X-O) is probably the simplest game to use with young children, although you may have to get used to losing a lot of games!', 2, N'Get the game you want to use ready.', N'The rules are simple. 1. Divide the new piece or section to be learned into smaller sections (the teacher may do this during the lesson). 2. The student makes their first move. 3. The student then plays one of the phrases. If the notes are 100% correct, they get another move. Note that if they are just learning this piece it is the notes that need to be 100% correct. They may hesitate or stop and work notes out while playing. 4. The student then plays the same phrase again. If the notes are 100% correct, they move again. 5. Each section is played five times. If the student gets 100% correct notes all five times... a bonus move is awarded! This game is great for making sure students are playing with 100% correct notes right from the start when learning new pieces. It also gently gives them some early experience of playing under pressure. Each time they play correctly they are one step nearer to the bonus move so the pressure they are playing under is gradually, but subtly increased. As they progress through the week extra restrictions may be added such as 100% notes and correct timing at a certain metronome speeds, inclusion of dynamics etc. Some people have asked me about playing the learning new pieces games for money with the students. They earn money for each time they get it 100% correct. I am not a great fan of using money to encourage practice, because the money becomes the reason for practice, not the progress in playing. Having said that, if you were to do this I would advise making it count towards something musical such as an upgrade to their instrument, new music, CDs, an iPod or similar. The student does not actually get the money - it is put into the instrument upgrade fund. Additionally, to preserve the gradually increasing pressure the amount needs to go up slightly for each time the section is played correctly.', N'Simon Horsey via Suzuki Association of the Americas', N'https://static1.squarespace.com/static/590a327459cc68c870460707/t/59c14d990abd04286b87c33b/1505840540058/Practicing+Games-A+Collection.pdf', 3, CAST(N'2020-01-01T00:00:00.000' AS DateTime), 5, N'https://cdn.pixabay.com/photo/2014/04/05/11/40/chess-316657__480.jpg', N'Review, Skills, Practice Spot')
GO
INSERT [dbo].[Games] ([Id], [Name], [IsActive], [Songs], [Description], [PreworkLevelId], [Prework], [Instructions], [Credit], [WebsiteUrl], [SubmittedByUserId], [DateCreated], [GameIconId], [PhotoUrl], [Keywords]) VALUES (24, N'Just a Minute', 1, N'', N'The aim of this game is very simple: to see how many times can you play a section with 100% correct notes in a minute when learning new pieces.', 1, N'None', N'This can be played with somebody timing you or on your own if you have a countdown timer on your watch or mobile • Divide the piece or section into smaller sections • Either set a countdown timer for a minute or, if possible, have somebody with a stopwatch to time you • Play through a section as many times as you can with 100% correct notes in a minute. You can stop to work notes out if you are not sure - in fact, this is encouraged as you would lose 2 points for getting a note wrong! • Score 1 point for each time you play correctly and minus 2 points for each time you make a mistake (that is getting even a single note wrong by-the-way!) • Check your score on all sections you are learning. There are various options for winning this game. You or a teacher can set a target score to achieve for each section, you can play against one or more friends to see who gets the highest score or you can find which section has the highest score and have a target of getting all sections to that score.', N'Simon Horsey via Suzuki Association of the Americas', N'https://static1.squarespace.com/static/590a327459cc68c870460707/t/59c14d990abd04286b87c33b/1505840540058/Practicing+Games-A+Collection.pdf', 4, CAST(N'2020-01-01T00:00:00.000' AS DateTime), 38, N'https://cdn.pixabay.com/photo/2014/06/18/13/23/time-371226__480.jpg', N'Review, Skills, Practice Spot')
GO
INSERT [dbo].[Games] ([Id], [Name], [IsActive], [Songs], [Description], [PreworkLevelId], [Prework], [Instructions], [Credit], [WebsiteUrl], [SubmittedByUserId], [DateCreated], [GameIconId], [PhotoUrl], [Keywords]) VALUES (25, N'Collect the Animals', 1, N'', N'For this game you need some pictures of animals printed. Eight should usually be enough. Try to pick animals your child/student likes. Use picture - not just the word written on a piece of paper. One enterprising parent said she played this with silhouettes and the student got extra points for recognizing the shapes! You could also play this game with cards using a single suit or the picture cards. Anything collectable. The aim of the game is to collect all the animals.', 2, N'Collect the animals or cards or toys you want to use.', N'The rules of the game are • Divide the piece to be learned into small sections (2 - 4 bars each depending on the length of the piece) • Label each section as one of the animals (cards, etc.) you have • The student chooses which animal they will attempt. Once this decision is made they cannot go back and change until that animal is achieved. • To win the animal they must play the section five times in a row 100% correctly. • One an animal is achieved they have to play the section 3 times in a row correctly to keep it on subsequent days. If they make a mistake during those three times the animal goes back and they have to win it again. • Organize some kind of prize or treat (it could be animal related!) if they have all the animals at the end of the week. If they have them all in the middle but lose them by the end there is no prize • Optional: They can lose an animal for each day they d not practice during the week. This is a great way to keep them working if they manage to collect them all early in the week! One of the keys to success when learning new pieces is constant review. Playing practice games when learning new pieces helps the time go quicker and makes practice a positive experience. Having early positive experiences when practicing is essential as students progress much further and faster if they have a positive attitude to practice.', N'Simon Horsey via Suzuki Association of the Americas', N'https://static1.squarespace.com/static/590a327459cc68c870460707/t/59c14d990abd04286b87c33b/1505840540058/Practicing+Games-A+Collection.pdf', 5, CAST(N'2020-01-01T00:00:00.000' AS DateTime), 44, N'https://cdn.pixabay.com/photo/2017/03/22/14/01/toys-2165123__480.jpg', N'Review, Skills, Practice Spot, Animals')
GO
INSERT [dbo].[Games] ([Id], [Name], [IsActive], [Songs], [Description], [PreworkLevelId], [Prework], [Instructions], [Credit], [WebsiteUrl], [SubmittedByUserId], [DateCreated], [GameIconId], [PhotoUrl], [Keywords]) VALUES (26, N'Loopy Loops', 1, N'', N'Playing something over and over is known as a repetition or a loop. Loops are very important for training your fingers and your muscles.', 1, N'None', N'Here are ways to make your repetitions fun: • Play each repetition while also doing a funny trick like: sticking out your tongue, standing on one foot, closing both eyes, closing one eye, doing a fish mouth, laying down on the floor, or wiggling as you play. For a bonus, see if you can do more than one of these tricks at the same time! • For each repetition, place a random object on top of your head. See how many you can fit. This will probably look pretty silly, but with each new repetition, you get to put something new on your head. In addition to being fun, keeping things balanced on your head can be a great way to improve your posture! • Sometimes moving to different locations makes practicing more fun. Make numbered cards and place them around the room or around the house and stand by them or on them, in order, for each repetition. Number your cards 1-5 or 1-10 depending on how many repetitions you’re going to play. Save the cards for future practicing. • Roll one or two dice to see how many times to repeat a passage. You can also use this idea to see which song to play during review sessions. (The number on the dice equals the song number in the book.)', N'Stephanie Railsback via Suzuki Association of the Americas', N'https://static1.squarespace.com/static/590a327459cc68c870460707/t/59c14d990abd04286b87c33b/1505840540058/Practicing+Games-A+Collection.pdf', 6, CAST(N'2020-01-01T00:00:00.000' AS DateTime), 19, N'https://cdn.pixabay.com/photo/2015/06/08/15/02/rollercoaster-801833__480.jpg', N'Review, Skills, Practice Spot')
GO
INSERT [dbo].[Games] ([Id], [Name], [IsActive], [Songs], [Description], [PreworkLevelId], [Prework], [Instructions], [Credit], [WebsiteUrl], [SubmittedByUserId], [DateCreated], [GameIconId], [PhotoUrl], [Keywords]) VALUES (27, N'Music Director', 1, N'', N'Have your parent video tape you while you play. Then, watch the video to see what improvements you can make. If you were the teacher, what would you say was good about your performance and what needs improvement?', 1, N'None', N'Have your parent video tape you while you play. Then, watch the video to see what improvements you can make. If you were the teacher, what would you say was good about your performance and what needs improvement?', N'Stephanie Railsback via Suzuki Association of the Americas', N'https://static1.squarespace.com/static/590a327459cc68c870460707/t/59c14d990abd04286b87c33b/1505840540058/Practicing+Games-A+Collection.pdf', 7, CAST(N'2020-01-01T00:00:00.000' AS DateTime), 11, N'https://media.istockphoto.com/photos/young-women-watching-movie-on-a-laptop-at-home-picture-id1182930194?b=1&k=6&m=1182930194&s=170667a&w=0&h=4pSzlP1iqpKLsuQRgMGJAjMZfMBinmqKF4kyrhnehfY=', N'Review, Skills, Practice Spot, Video, Record')
GO
INSERT [dbo].[Games] ([Id], [Name], [IsActive], [Songs], [Description], [PreworkLevelId], [Prework], [Instructions], [Credit], [WebsiteUrl], [SubmittedByUserId], [DateCreated], [GameIconId], [PhotoUrl], [Keywords]) VALUES (28, N'Parent Treasure Hunt', 1, N'', N'Child plans a treasure hunt for the parent!', 1, N'None', N'With your mom or dad out of the room, hide your rosin, pencil, or metronome. When your parent returns, tell them what you hid. (But, don’t tell them where!!) Their goal will be to find the hidden item. • Start playing repetitions of your song. Play louder when your parent gets closer to the hidden object and play softer when they get farther away from it. Keep up this pattern until they find the hidden object. • This is a fun way to review pieces and to practice playing different dynamics!', N'Stephanie Railsback via Suzuki Association of the Americas', N'https://static1.squarespace.com/static/590a327459cc68c870460707/t/59c14d990abd04286b87c33b/1505840540058/Practicing+Games-A+Collection.pdf', 8, CAST(N'2020-01-01T00:00:00.000' AS DateTime), 7, N'https://cdn.pixabay.com/photo/2018/04/04/19/25/3-3290798__480.jpg', N'Review, Skills, Practice Spot, Treasure Hunt')
GO
INSERT [dbo].[Games] ([Id], [Name], [IsActive], [Songs], [Description], [PreworkLevelId], [Prework], [Instructions], [Credit], [WebsiteUrl], [SubmittedByUserId], [DateCreated], [GameIconId], [PhotoUrl], [Keywords]) VALUES (29, N'Five Pairs in a Row', 1, N'', N'Find five pairs of matching cards.', 2, N'Get a memory game.', N'Line up one card from each pair on a table or on the floor. Keep the other cards. • Each time you play through a song successfully, put down a matching card to make a pair. You win the game when all five pairs are matched.', N'Stephanie Railsback via Suzuki Association of the Americas', N'https://static1.squarespace.com/static/590a327459cc68c870460707/t/59c14d990abd04286b87c33b/1505840540058/Practicing+Games-A+Collection.pdf', 9, CAST(N'2020-01-01T00:00:00.000' AS DateTime), 59, N'https://target.scene7.com/is/image/Target/GUEST_8a6590b9-a5c7-4bfb-87f9-25c49ec836a8?wid=253&hei=253&qlt=80&fmt=webp', N'Review, Skills, Practice Spot, Cards')
GO
INSERT [dbo].[Games] ([Id], [Name], [IsActive], [Songs], [Description], [PreworkLevelId], [Prework], [Instructions], [Credit], [WebsiteUrl], [SubmittedByUserId], [DateCreated], [GameIconId], [PhotoUrl], [Keywords]) VALUES (30, N'Envelope/Cup Game', 1, N'', N'Keep it interesting - hide prizes and they’ll keep practicing ‘till they get them all!', 2, N'Get the prizes ready.', N'Place a variety of envelopes out for view, but put a candy/gum/prize in one envelope. For every repetition that meets a practice goal, the student can open an envelope. You can do the same thing with inverted cups. Repetitions continue until the prize is found!', N'Suzuki Association of the Americas', N'https://static1.squarespace.com/static/590a327459cc68c870460707/t/59c14d990abd04286b87c33b/1505840540058/Practicing+Games-A+Collection.pdf', 1, CAST(N'2020-01-01T00:00:00.000' AS DateTime), 43, N'https://cdn.pixabay.com/photo/2017/02/21/22/11/candy-2087625__480.jpg', N'Review, Skills, Practice Spot, Prizes')
GO
INSERT [dbo].[Games] ([Id], [Name], [IsActive], [Songs], [Description], [PreworkLevelId], [Prework], [Instructions], [Credit], [WebsiteUrl], [SubmittedByUserId], [DateCreated], [GameIconId], [PhotoUrl], [Keywords]) VALUES (31, N'Balancing Game', 1, N'', N'Let them laugh with you!', 1, N'None', N'For the kids that are getting grumpy and grumbly about repetitions, I will sometimes place a random object on top of my head for each correct repetition of practice goal they complete. This sounds and looks ridiculous, but that is the whole point— the kids will do an unearthly number of repetitions just to see how many folders you can stick on your head. They will also then want to do it themselves, which will help improve posture!!', N'Suzuki Association of the Americas', N'https://static1.squarespace.com/static/590a327459cc68c870460707/t/59c14d990abd04286b87c33b/1505840540058/Practicing+Games-A+Collection.pdf', 2, CAST(N'2020-01-01T00:00:00.000' AS DateTime), 9, N'https://cdn.pixabay.com/photo/2015/10/26/01/48/girl-1006574__480.jpg', N'Silly')
GO
INSERT [dbo].[Games] ([Id], [Name], [IsActive], [Songs], [Description], [PreworkLevelId], [Prework], [Instructions], [Credit], [WebsiteUrl], [SubmittedByUserId], [DateCreated], [GameIconId], [PhotoUrl], [Keywords]) VALUES (32, N'Multitasking Game', 1, N'', N'Let them be silly!', 1, N'None', N'Have the child do each repetition doing a different physical thing; sticking out tongue, closing eyes, standing on one foot, doing fishy mouth, mouth wide open, one eye closed, making rabbit face, wiggling bottom etc. For a silly bonus rep have them try to do all of the things at the same time……', N'Suzuki Association of the Americas', N'https://static1.squarespace.com/static/590a327459cc68c870460707/t/59c14d990abd04286b87c33b/1505840540058/Practicing+Games-A+Collection.pdf', 3, CAST(N'2020-01-01T00:00:00.000' AS DateTime), 9, N'https://cdn.pixabay.com/photo/2015/02/04/14/36/child-623851__480.jpg', N'Silly')
GO
INSERT [dbo].[Games] ([Id], [Name], [IsActive], [Songs], [Description], [PreworkLevelId], [Prework], [Instructions], [Credit], [WebsiteUrl], [SubmittedByUserId], [DateCreated], [GameIconId], [PhotoUrl], [Keywords]) VALUES (33, N'Musical Hopscotch', 1, N'', N'Hop to it!', 2, N'With the child, draw the hopscotch game.', N'After making a list of ten things that need practicing, the child tosses a pair of rolled up socks or a coin. The child hops out and retrieves the object and then plays a given goal/exercise/phrase/activity corresponding to the number. This game is time-consuming so plan accordingly. Hope you have fun.', N'Suzuki Association of the Americas', N'https://static1.squarespace.com/static/590a327459cc68c870460707/t/59c14d990abd04286b87c33b/1505840540058/Practicing+Games-A+Collection.pdf', 4, CAST(N'2020-01-01T00:00:00.000' AS DateTime), 51, N'https://cdn.pixabay.com/photo/2016/04/13/01/13/hopscotch-1325854__480.jpg', N'Review, Skills, Practice Spot, Outdoors')
GO
INSERT [dbo].[Games] ([Id], [Name], [IsActive], [Songs], [Description], [PreworkLevelId], [Prework], [Instructions], [Credit], [WebsiteUrl], [SubmittedByUserId], [DateCreated], [GameIconId], [PhotoUrl], [Keywords]) VALUES (34, N'Question Game', 1, N'', N'Based on a game Dr Suzuki used to play with his students.', 1, N'None', N'“Play for me the first Twinkle variation (or any piece, really – it depends on the student’s age and level), and while you are playing you have to answer my questions, without stopping or making a mistake.”
 “Ok, that’s easy!”
 We begin playing the piece together. (I’ve got to be able to ask the questions while softly playing, too.)
 After half a phrase I call out, “How many eyes have you got?”
 “Two!”
 Big smiles. “How many ears have you got?”
 “Two!”
 “How many feet?”
 “Two!!”
 “How many hands?”
 “Two!!”
 (Can you see what’s coming?)
 “How many noses have you got?”
 Bigger smiles now, and the little violinist answers, “Two!!!“ or just looks at me, laughing and trying to keep playing, while giggles and guffaws break out from the parents.
 Once they’ve got used to how the game works, I venture more complicated questions such as, “How old are you at your next birthday? What’s 11 plus 3?” and finally, “What is your telephone number at home – backwards?”', N'John Berger', N'https://teachsuzukiviolin.com/category/games/', 5, CAST(N'2020-01-01T00:00:00.000' AS DateTime), 42, N'https://cdn.pixabay.com/photo/2015/06/28/21/21/person-824921__480.jpg', N'Review, Skills, Practice Spot')
GO
INSERT [dbo].[Games] ([Id], [Name], [IsActive], [Songs], [Description], [PreworkLevelId], [Prework], [Instructions], [Credit], [WebsiteUrl], [SubmittedByUserId], [DateCreated], [GameIconId], [PhotoUrl], [Keywords]) VALUES (35, N'Bingo Game', 1, N'', N'B-I-N-G-O!', 2, N'Make your own bingo cards with different notes and rhythms on each square and pass them out to students.', N'After you play a note or rhythm, students will check their board to see if it’s present. If it is, they will place a penny on the appropriate square. The first person with five pennies in a row wins!', N'TakeLessons', N'https://takelessons.com/blog/violin-games-for-kids-z08', 6, CAST(N'2020-01-01T00:00:00.000' AS DateTime), 18, N'https://takelessons.com/blog/wp-content/uploads/2015/09/2.Bingo_.jpg', N'Practice Spot, Review, Bingo')
GO
INSERT [dbo].[Games] ([Id], [Name], [IsActive], [Songs], [Description], [PreworkLevelId], [Prework], [Instructions], [Credit], [WebsiteUrl], [SubmittedByUserId], [DateCreated], [GameIconId], [PhotoUrl], [Keywords]) VALUES (36, N'What Note Am I?', 1, N'', N'This violin game is very similar to the game “Who Am I?” but instead of guessing what famous person they are, students will guess what note they are.', 3, N'Start by making large cards with notes.', N'Hand out a card to each student and have them place it on their forehead without peeking. Then have the students ask each other questions to find out what note is on their card; for example, “Do I have a stem?”', N'TakeLessons', N'https://takelessons.com/blog/violin-games-for-kids-z08', 7, CAST(N'2020-01-01T00:00:00.000' AS DateTime), 11, N'https://takelessons.com/blog/wp-content/uploads/2015/09/3.-What-Note-Am-I.jpg', N'Music Reading, Notes, Car, Travel')
GO
INSERT [dbo].[Games] ([Id], [Name], [IsActive], [Songs], [Description], [PreworkLevelId], [Prework], [Instructions], [Credit], [WebsiteUrl], [SubmittedByUserId], [DateCreated], [GameIconId], [PhotoUrl], [Keywords]) VALUES (37, N'Who Am I? Version 1', 1, N'', N'Show students photos of composers and have them guess their names and where they are from.', 2, N'Print pictures of composers.', N'Show students photos of composers and have them guess their names and where they are from.', N'Andra Prewett', N'', 8, CAST(N'2020-01-01T00:00:00.000' AS DateTime), 56, N'https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/Chevalier_de_Saint-Georges.JPG/440px-Chevalier_de_Saint-Georges.JPG', N'Music History, Composers, Car, Travel')
GO
INSERT [dbo].[Games] ([Id], [Name], [IsActive], [Songs], [Description], [PreworkLevelId], [Prework], [Instructions], [Credit], [WebsiteUrl], [SubmittedByUserId], [DateCreated], [GameIconId], [PhotoUrl], [Keywords]) VALUES (38, N'Simon Says', 1, N'', N'Repetition is the mother of learning!', 1, N'None', N'Take on the role of “Simon” and issue instructions to the student(s). For example, when you play A on the 5, the kids have to sit down, or when you play E, the kids have to stand up. You can go as slow or fast as you want depending on the skill level of the group
 For more advanced students > you can play parts of a song and have them imitate', N'TakeLessons', N'https://takelessons.com/blog/5-games-for-kids-z08', 9, CAST(N'2020-01-01T00:00:00.000' AS DateTime), 48, N'https://takelessons.com/blog/wp-content/uploads/2015/09/4.-Simon-Says.jpg', N'Repetition, Notes, Review Songs, For the parent who plays')
GO
INSERT [dbo].[Games] ([Id], [Name], [IsActive], [Songs], [Description], [PreworkLevelId], [Prework], [Instructions], [Credit], [WebsiteUrl], [SubmittedByUserId], [DateCreated], [GameIconId], [PhotoUrl], [Keywords]) VALUES (39, N'Pass the Cup', 1, N'', N'Pass the cup with your bow!', 1, N'None', N'Start by having one student place a small, clear plastic cup over the tip of his or her 5 bow. The student will then pass the cup to the next person in line. The student can only pass the cup if the receiving student’s bow is pointed up toward the ceiling and has a proper bow hold.', N'TakeLessons', N'https://takelessons.com/blog/violin-games-for-kids-z08', 3, CAST(N'2020-01-01T00:00:00.000' AS DateTime), 28, N'https://takelessons.com/blog/wp-content/uploads/2015/09/11.Pass-the-Cup.jpg', N'Bow')
GO
INSERT [dbo].[Games] ([Id], [Name], [IsActive], [Songs], [Description], [PreworkLevelId], [Prework], [Instructions], [Credit], [WebsiteUrl], [SubmittedByUserId], [DateCreated], [GameIconId], [PhotoUrl], [Keywords]) VALUES (40, N'Spot the Mistake', 1, N'', N'Let your child correct you!', 1, N'None', N'Start by showing students the proper bow hold, then ask them to close their eyes while you set up your bow hold with one obvious mistake; for example, a straight thumb. Once you’re ready, ask students to open their eyes and spot the mistake.', N'TakeLessons', N'https://takelessons.com/blog/violin-games-for-kids-z08', 4, CAST(N'2020-01-01T00:00:00.000' AS DateTime), 30, N'https://takelessons.com/blog/wp-content/uploads/2015/09/12.-Spot-the-Mistake.jpg', N'Bow, For the parent who plays')
GO
INSERT [dbo].[Games] ([Id], [Name], [IsActive], [Songs], [Description], [PreworkLevelId], [Prework], [Instructions], [Credit], [WebsiteUrl], [SubmittedByUserId], [DateCreated], [GameIconId], [PhotoUrl], [Keywords]) VALUES (41, N'The Alphabet Game', 1, N'', N'Teach the right posture in a fun way!', 1, N'None', N'Gently help the student get into the correct position. Then ask him or her to freeze in this position until you sing the entire alphabet song forward and backward. The student will enjoy hearing you fumble while trying to sing the alphabet backwards.', N'TakeLessons', N'https://takelessons.com/blog/violin-games-for-kids-z08', 5, CAST(N'2020-01-01T00:00:00.000' AS DateTime), 62, N'https://takelessons.com/blog/wp-content/uploads/2015/09/7.The-Alphabet-Game.jpg', N'Position, Posture')
GO
INSERT [dbo].[Games] ([Id], [Name], [IsActive], [Songs], [Description], [PreworkLevelId], [Prework], [Instructions], [Credit], [WebsiteUrl], [SubmittedByUserId], [DateCreated], [GameIconId], [PhotoUrl], [Keywords]) VALUES (42, N'Roll the Dice Version 2', 1, N'', N'Practice notes', 2, N'Cover a large square box with white construction paper to look like a life-sized dice. On each side of the dice, draw a note or a rhythm.', N'Have your students stand in one big circle and give each one a chance to roll the dice. Students will have to play whatever note or rhythm is rolled.', N'TakeLessons', N'https://takelessons.com/blog/violin-games-for-kids-z08', 6, CAST(N'2020-01-01T00:00:00.000' AS DateTime), 1, N'https://takelessons.com/blog/wp-content/uploads/2015/09/15.Roll-the-Dice.jpg', N'Notes')
GO
INSERT [dbo].[Games] ([Id], [Name], [IsActive], [Songs], [Description], [PreworkLevelId], [Prework], [Instructions], [Credit], [WebsiteUrl], [SubmittedByUserId], [DateCreated], [GameIconId], [PhotoUrl], [Keywords]) VALUES (43, N'Who Am I? Version 2', 1, N'', N'Let them learn and teach each other!', 1, N'None', N'Every week, assign a famous 5 player or composer to a student. After researching the individual, the student will stand in front of the class while others students ask him or her questions about the individual. The student must answer the questions as if he or she were the famous violin player or composer.', N'TakeLessons', N'https://takelessons.com/blog/violin-games-for-kids-z08', 7, CAST(N'2020-01-01T00:00:00.000' AS DateTime), 60, N'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6a/Johann_Sebastian_Bach.jpg/440px-Johann_Sebastian_Bach.jpg', N'Composers, Music History')
GO
INSERT [dbo].[Games] ([Id], [Name], [IsActive], [Songs], [Description], [PreworkLevelId], [Prework], [Instructions], [Credit], [WebsiteUrl], [SubmittedByUserId], [DateCreated], [GameIconId], [PhotoUrl], [Keywords]) VALUES (44, N'PowerPoint', 1, N'', N'Prompt your child’s practice not with handwritten notes but with a PowerPoint presentation. Some kids might even want to create their own PowerPoint practice file. (Make sure they include all the exercises they are supposed to do.)', 3, N'1. Make the PowerPoint - or help the student make it.
 2. They can even include sound files, pictures or small videos. (Grasp that opportunity and have them show off their best violin playing, bow hold etc. for the camera or for the sound recorder.)', N'Use the PowerPoint to guide practices.', N'Suzuki Community', N'https://en.wikibooks.org/wiki/Practice_Ideas_for_Suzuki_Students', 8, CAST(N'2020-01-01T00:00:00.000' AS DateTime), 12, N'https://cdn.pixabay.com/photo/2013/04/22/07/04/girl-106428__480.jpg', N'Video, Review Songs')
GO
INSERT [dbo].[Games] ([Id], [Name], [IsActive], [Songs], [Description], [PreworkLevelId], [Prework], [Instructions], [Credit], [WebsiteUrl], [SubmittedByUserId], [DateCreated], [GameIconId], [PhotoUrl], [Keywords]) VALUES (45, N'Ping Pong Review', 1, N'', N'This is a fun practice idea for students who are a bit more advanced and already have more pieces to review than they can keep track of.', 3, N'Purchase a pack of ping pong balls. You need as many balls as you have review pieces. Using a permanent marker, write the names of the review pieces one on every ball. Put the balls in a non-transparent bag (a pillow case does fine).', N'For the practice, let the child randomly pull a ball out of the bag and play the piece.
 To make sure that every review piece will be played sooner or later, don’t put the used balls back into the bag, but keep them aside until the bag is empty.', N'Suzuki Community', N'https://en.wikibooks.org/wiki/Practice_Ideas_for_Suzuki_Students', 9, CAST(N'2020-01-01T00:00:00.000' AS DateTime), 50, N'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f3/Ping_Pong_Review.jpg/440px-Ping_Pong_Review.jpg', N'Review')
GO
INSERT [dbo].[Games] ([Id], [Name], [IsActive], [Songs], [Description], [PreworkLevelId], [Prework], [Instructions], [Credit], [WebsiteUrl], [SubmittedByUserId], [DateCreated], [GameIconId], [PhotoUrl], [Keywords]) VALUES (46, N'Dice Game Review', 1, N'', N'Make them want to review!', 4, N'Order large foam dice from an educational supplier or make your own with cardboard box. Make up laminated cards (the size of the face of the large dice) with name of song from relevant books and a picture to represent the song. Stick Velcro dots to the faces of the die and the opposite part of the Velcro dots to the back of the song cards and attach 6 songs to the faces of the dice (you can play with one die or two or more dice).', N'The child rolls the die to see what song to play for review. You can change the song cards each week as appropriate.', N'Suzuki Community', N'https://en.wikibooks.org/wiki/Practice_Ideas_for_Suzuki_Students', 1, CAST(N'2020-01-01T00:00:00.000' AS DateTime), 1, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1c7beDomqkTTYMURh2T3NgLbGNhJXNF4DNw&usqp=CAU', N'Review, Dice')
GO
INSERT [dbo].[Games] ([Id], [Name], [IsActive], [Songs], [Description], [PreworkLevelId], [Prework], [Instructions], [Credit], [WebsiteUrl], [SubmittedByUserId], [DateCreated], [GameIconId], [PhotoUrl], [Keywords]) VALUES (47, N'Hire a Puppet', 1, N'', N'Tired of reminding your six-year-old for the gazillionth time that she can use more of her bow than just an inch and that her tone will sound so much better? You need a time out. A teacher assistant or visiting teacher should take over. Hire a puppet or a stuffed animal. Puppets make awesome teacher assistants. They are low-maintenance, they might be more patient and relaxed than you are and kids love them and listen to them.', 2, N'Find a puppet.', N'Introduce the puppet to the child as an “expert” for the problem that needs to be tackled (“Meet Professor Long Bow”).', N'Suzuki Community', N'https://en.wikibooks.org/wiki/Practice_Ideas_for_Suzuki_Students', 2, CAST(N'2020-01-01T00:00:00.000' AS DateTime), 52, N'https://upload.wikimedia.org/wikipedia/commons/thumb/4/48/Sockcat.jpg/280px-Sockcat.jpg', N'Bow, Posture, Practice Spots')
GO
INSERT [dbo].[Games] ([Id], [Name], [IsActive], [Songs], [Description], [PreworkLevelId], [Prework], [Instructions], [Credit], [WebsiteUrl], [SubmittedByUserId], [DateCreated], [GameIconId], [PhotoUrl], [Keywords]) VALUES (48, N'Moods', 1, N'', N'Change moods as you play through a number of review songs!', 2, N'Find a puppet, doll, etc.', N'Create scenarios to guide your child: 
 Professor Long Bow has the unfortunate tendency to get a fly in his eye. In order to help him to get that fly out, the child can make him cry. The best way to do so is to play something sad, like Go, Tell Aunt Rhody. The sadder the expression, the better. If the child does well, Professor Long Bow will probably be sobbing, and his eye will be okay again. But he is so sad now, that he needs some cheering up. As you could have guessed, the child has to play something cheerful, like Allegro. The happier the expression, the better.', N'Suzuki Community', N'https://en.wikibooks.org/wiki/Practice_Ideas_for_Suzuki_Students', 3, CAST(N'2020-01-01T00:00:00.000' AS DateTime), 49, N'https://cdn.pixabay.com/photo/2015/02/18/16/46/doll-640995__480.jpg', N'Review')
GO
INSERT [dbo].[Games] ([Id], [Name], [IsActive], [Songs], [Description], [PreworkLevelId], [Prework], [Instructions], [Credit], [WebsiteUrl], [SubmittedByUserId], [DateCreated], [GameIconId], [PhotoUrl], [Keywords]) VALUES (49, N'Piggy Back Ride', 1, N'', N'This is a fun exercise to improve the left hand position.', 1, N'None', N'You child can only use her left hand efficiently when the fingers are in a nice position hovering above the strings.
 The middle sections of your child’s fingers need to be in a horizontal position. You can call it ""tables"".
 To practice this position, you can have your child play an A scale with a Mississippi Hotdog rhythm, and on each finger that she is setting down, you set some sort of a little object, like a cheerio or a button or a little toy like in the picture. The goal is not to let that object fall down while she is playing.', N'Suzuki Community', N'https://en.wikibooks.org/wiki/Practice_Ideas_for_Suzuki_Students', 4, CAST(N'2020-01-01T00:00:00.000' AS DateTime), 60, N'https://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/Piggies_for_violin_practice.jpg/440px-Piggies_for_violin_practice.jpg', N'Violin Hand, Posture, Practice Spots')
GO
INSERT [dbo].[Games] ([Id], [Name], [IsActive], [Songs], [Description], [PreworkLevelId], [Prework], [Instructions], [Credit], [WebsiteUrl], [SubmittedByUserId], [DateCreated], [GameIconId], [PhotoUrl], [Keywords]) VALUES (50, N'House of Music', 1, N'', N'The following is a fun project that can be used as an introduction to music reading.', 4, N'Take a sheet of paper, the larger the better. Design a tall apartment house in cross section view. The house must be a split-level-building with 9 apartments on the left side, and 8 apartments on the right (17 half-levels overall). The 9 apartments on the left represent the spaces between the staff lines, while the 8 apartments to the right represent the staff lines themselves. Add a roof that marks the upper levels as attics, and brick walls or a horizontal base line that mark the lower levels as basements. If you want to, you can add balconies, window sills or other decorations to the apartments that represent the area of the actual staff lines.', N'In the second and last step, make families move into the apartments. The A-apartment (between 2nd and 3rd line) could house an alligator for example, or an ant or antelope; no baby animals in this apartment, because A is an open string and no fingers used. In the F#-apartment (5th line) there might live a fly, a fish or a flamingo, but make sure that they have 1 child, since F# is being played with the 1st finger. Etc.', N'Suzuki Community', N'https://en.wikibooks.org/wiki/Practice_Ideas_for_Suzuki_Students', 5, CAST(N'2020-01-01T00:00:00.000' AS DateTime), 63, N'https://upload.wikimedia.org/wikipedia/commons/c/c1/House_of_Music.JPG', N'Notes, Home, House')
GO
INSERT [dbo].[Games] ([Id], [Name], [IsActive], [Songs], [Description], [PreworkLevelId], [Prework], [Instructions], [Credit], [WebsiteUrl], [SubmittedByUserId], [DateCreated], [GameIconId], [PhotoUrl], [Keywords]) VALUES (51, N'Music Notes Flash Cards', 1, N'', N'On long terms, it is a bad habit to refer to tones in terms like “open A” or “first finger on E-string”. Tones have names: A, F sharp, etc., and they have a notation: between the 2nd and 3rd line, on the 5th line, etc. A convenient way to teach and practice these references is with flash cards.', 2, N'There are prefabricated flash cards available, or you can make your own.', N'There are many possible things that can be done with the flash cards. If you have 2 students, you can even play games:
  Show a flash card (with a note) to the first child. The child plays the tone on his violin. The second child who can hear and see the sibling but not the flash card has to write the note down. If the notes are identical, the children score; otherwise, you score.', N'Suzuki Community', N'https://en.wikibooks.org/wiki/Practice_Ideas_for_Suzuki_Students', 6, CAST(N'2020-01-01T00:00:00.000' AS DateTime), 11, N'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5e/Violin_Music_Reading_Cards.JPG/440px-5_Music_Reading_Cards.JPG', N'Notes, Cards')
GO
INSERT [dbo].[Games] ([Id], [Name], [IsActive], [Songs], [Description], [PreworkLevelId], [Prework], [Instructions], [Credit], [WebsiteUrl], [SubmittedByUserId], [DateCreated], [GameIconId], [PhotoUrl], [Keywords]) VALUES (52, N'Musical Rummy', 1, N'', N'This card game helps beginning music readers to establish and to internalize the association between a particular note (for example C#) and the corresponding fingering on the violin (2nd finger on A-string).', 3, N'You need a self-made deck of cards that matches every note that you want to teach with the corresponding fingering (the latter either in words or in graphic). For a beginning student, 8 pairs will probably do. Later you can add more, until the whole 1st position is covered.', N'Here come the rules for the game:
 The dealer deals 4 cards to each player (if you have 16 or more pairs, deal at least 6 cards).
 The extra cards go on a pile, face down.
 The first player takes 1 card from the pile and adds it to his hand. If he can match any pairs, he puts them on the table, face up. Last, he chooses 1 card from his hand that he does not need and puts it on a new pile, face up.
 The second player takes 1 card either from the covered or from the open pile. Etc.
 Winner is the player who is the first to get rid of all of his cards.
 There are many variations possible, depending on what particular skill you want to practice. If you also want to establish the names of the notes (for example “C#”), you can use triplet cards instead of pairs, or you can declare that every player who puts a pair on the table must say the name.', N'Suzuki Community', N'https://en.wikibooks.org/wiki/Practice_Ideas_for_Suzuki_Students', 7, CAST(N'2020-01-01T00:00:00.000' AS DateTime), 44, N'https://upload.wikimedia.org/wikipedia/commons/5/5e/Violin_Music_Reading_Cards.JPG', N'Notes, Cards, 5 Hand, Finger Position')
GO
INSERT [dbo].[Games] ([Id], [Name], [IsActive], [Songs], [Description], [PreworkLevelId], [Prework], [Instructions], [Credit], [WebsiteUrl], [SubmittedByUserId], [DateCreated], [GameIconId], [PhotoUrl], [Keywords]) VALUES (53, N'Recognize Pitch', 1, N'', N'Another important aspect of learning to play piano relates to pitch.', 1, N'None', N'For small children, you can try fun games on the piano like asking your child to play what Papa, Mama and Baby Bear sound like (low, medium, high).', N'Belinda Williams for Roland Corporation Australia', N'https://rolandcorp.com.au/blog/piano-games-to-play-with-your-child', 9, CAST(N'2020-01-01T00:00:00.000' AS DateTime), 11, N'https://cdn.pixabay.com/photo/2016/08/29/17/27/cute-girl-playing-piano-1628763__480.jpg', N'Pitch')
GO
INSERT [dbo].[Games] ([Id], [Name], [IsActive], [Songs], [Description], [PreworkLevelId], [Prework], [Instructions], [Credit], [WebsiteUrl], [SubmittedByUserId], [DateCreated], [GameIconId], [PhotoUrl], [Keywords]) VALUES (54, N'Intervals', 1, N'', N'Older and more advanced children will appreciate scale games and interval recognition.', 1, N'None', N'Start by playing a scale and then stop on a certain note, asking them to identify which note you stopped on using solfége syllables: do, re, mi, fa, so, la, ti, do. They can sing it back to help them determine the correct note. After they have mastered this skill, you can have them name intervals such as major seconds and major thirds. Let them test you for some extra fun!', N'Belinda Williams for Roland Corporation Australia', N'https://rolandcorp.com.au/blog/piano-games-to-play-with-your-child', 1, CAST(N'2020-01-01T00:00:00.000' AS DateTime), 48, N'https://cdn.pixabay.com/photo/2013/02/06/11/12/3-78492__480.jpg', N'Scales, Notes')
GO
SET IDENTITY_INSERT [dbo].[Games] OFF
GO
SET IDENTITY_INSERT [dbo].[Instruments] ON 
GO
INSERT [dbo].[Instruments] ([Id], [Name], [IconUrl]) VALUES (1, N'All', N'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/universal-access.svg')
GO
INSERT [dbo].[Instruments] ([Id], [Name], [IconUrl]) VALUES (2, N'Cello', NULL)
GO
INSERT [dbo].[Instruments] ([Id], [Name], [IconUrl]) VALUES (3, N'Piano', NULL)
GO
INSERT [dbo].[Instruments] ([Id], [Name], [IconUrl]) VALUES (4, N'Viola', NULL)
GO
INSERT [dbo].[Instruments] ([Id], [Name], [IconUrl]) VALUES (5, N'Violin', NULL)
GO
INSERT [dbo].[Instruments] ([Id], [Name], [IconUrl]) VALUES (6, N'Ukelele', NULL)
GO
INSERT [dbo].[Instruments] ([Id], [Name], [IconUrl]) VALUES (7, N'Other', NULL)
GO
SET IDENTITY_INSERT [dbo].[Instruments] OFF
GO
SET IDENTITY_INSERT [dbo].[PracticePlanGames] ON 
GO
INSERT [dbo].[PracticePlanGames] ([Id], [Name], [PracticePlanId], [GameId], [PracticeDate], [UserNotes], [IsCompleted], [IsActive]) VALUES (1, N'Our version', 1, 1, CAST(N'2021-01-03T00:00:00.000' AS DateTime), N'"This is where I will add notes for our practices in January.', 1, 0)
GO
INSERT [dbo].[PracticePlanGames] ([Id], [Name], [PracticePlanId], [GameId], [PracticeDate], [UserNotes], [IsCompleted], [IsActive]) VALUES (2, N'Our version', 1, 2, CAST(N'2021-01-04T00:00:00.000' AS DateTime), N'"This is where I will add notes for our practices in January.', 0, 0)
GO
INSERT [dbo].[PracticePlanGames] ([Id], [Name], [PracticePlanId], [GameId], [PracticeDate], [UserNotes], [IsCompleted], [IsActive]) VALUES (3, N'Our version', 1, 3, CAST(N'2021-01-05T00:00:00.000' AS DateTime), N'"This is where I will add notes for our practices in January.', 0, 0)
GO
INSERT [dbo].[PracticePlanGames] ([Id], [Name], [PracticePlanId], [GameId], [PracticeDate], [UserNotes], [IsCompleted], [IsActive]) VALUES (4, N'Our version', 1, 1, CAST(N'2021-01-06T00:00:00.000' AS DateTime), N'"This is where I will add notes for our practices in January.', 0, 0)
GO
INSERT [dbo].[PracticePlanGames] ([Id], [Name], [PracticePlanId], [GameId], [PracticeDate], [UserNotes], [IsCompleted], [IsActive]) VALUES (5, N'Our version', 1, 2, CAST(N'2021-01-07T00:00:00.000' AS DateTime), N'"This is where I will add notes for our practices in January.', 0, 1)
GO
INSERT [dbo].[PracticePlanGames] ([Id], [Name], [PracticePlanId], [GameId], [PracticeDate], [UserNotes], [IsCompleted], [IsActive]) VALUES (6, N'Our version', 1, 3, CAST(N'2021-01-08T00:00:00.000' AS DateTime), N'"This is where I will add notes for our practices in January.', 0, 1)
GO
INSERT [dbo].[PracticePlanGames] ([Id], [Name], [PracticePlanId], [GameId], [PracticeDate], [UserNotes], [IsCompleted], [IsActive]) VALUES (7, N'Our version', 1, 4, CAST(N'2021-01-09T00:00:00.000' AS DateTime), N'"This is where I will add notes for our practices in January.', 0, 0)
GO
INSERT [dbo].[PracticePlanGames] ([Id], [Name], [PracticePlanId], [GameId], [PracticeDate], [UserNotes], [IsCompleted], [IsActive]) VALUES (8, N'Our version', 2, 1, CAST(N'2021-01-10T00:00:00.000' AS DateTime), N'"This is where I will add notes for our practices in January.', 0, 1)
GO
INSERT [dbo].[PracticePlanGames] ([Id], [Name], [PracticePlanId], [GameId], [PracticeDate], [UserNotes], [IsCompleted], [IsActive]) VALUES (9, N'Our version', 2, 5, CAST(N'2021-01-11T00:00:00.000' AS DateTime), N'"This is where I will add notes for our practices in January.', 0, 1)
GO
INSERT [dbo].[PracticePlanGames] ([Id], [Name], [PracticePlanId], [GameId], [PracticeDate], [UserNotes], [IsCompleted], [IsActive]) VALUES (10, N'Our version', 2, 5, CAST(N'2021-01-12T00:00:00.000' AS DateTime), N'"This is where I will add notes for our practices in January.', 0, 1)
GO
INSERT [dbo].[PracticePlanGames] ([Id], [Name], [PracticePlanId], [GameId], [PracticeDate], [UserNotes], [IsCompleted], [IsActive]) VALUES (11, N'Our version', 2, 6, CAST(N'2021-01-13T00:00:00.000' AS DateTime), N'"This is where I will add notes for our practices in January.', 0, 1)
GO
INSERT [dbo].[PracticePlanGames] ([Id], [Name], [PracticePlanId], [GameId], [PracticeDate], [UserNotes], [IsCompleted], [IsActive]) VALUES (12, N'Our version', 2, 7, CAST(N'2021-01-14T00:00:00.000' AS DateTime), N'"This is where I will add notes for our practices in January.', 0, 1)
GO
INSERT [dbo].[PracticePlanGames] ([Id], [Name], [PracticePlanId], [GameId], [PracticeDate], [UserNotes], [IsCompleted], [IsActive]) VALUES (13, N'Our version', 2, 8, CAST(N'2021-01-15T00:00:00.000' AS DateTime), N'"This is where I will add notes for our practices in January.', 0, 1)
GO
INSERT [dbo].[PracticePlanGames] ([Id], [Name], [PracticePlanId], [GameId], [PracticeDate], [UserNotes], [IsCompleted], [IsActive]) VALUES (14, N'Our version', 2, 9, CAST(N'2021-01-16T00:00:00.000' AS DateTime), N'"This is where I will add notes for our practices in January.', 0, 1)
GO
INSERT [dbo].[PracticePlanGames] ([Id], [Name], [PracticePlanId], [GameId], [PracticeDate], [UserNotes], [IsCompleted], [IsActive]) VALUES (15, N'Our version', 3, 1, CAST(N'2021-01-17T00:00:00.000' AS DateTime), N'"This is where I will add notes for our practices in January.', 0, 1)
GO
INSERT [dbo].[PracticePlanGames] ([Id], [Name], [PracticePlanId], [GameId], [PracticeDate], [UserNotes], [IsCompleted], [IsActive]) VALUES (16, N'Our version', 4, 5, CAST(N'2021-01-24T00:00:00.000' AS DateTime), N'"This is where I will add notes for our practices in January.', 0, 1)
GO
INSERT [dbo].[PracticePlanGames] ([Id], [Name], [PracticePlanId], [GameId], [PracticeDate], [UserNotes], [IsCompleted], [IsActive]) VALUES (17, N'Our version', 5, 10, CAST(N'2020-07-01T00:00:00.000' AS DateTime), N'Went great!', 1, 1)
GO
INSERT [dbo].[PracticePlanGames] ([Id], [Name], [PracticePlanId], [GameId], [PracticeDate], [UserNotes], [IsCompleted], [IsActive]) VALUES (18, N'Our version', 5, 14, CAST(N'2020-07-02T00:00:00.000' AS DateTime), N'Pretty well!', 1, 1)
GO
INSERT [dbo].[PracticePlanGames] ([Id], [Name], [PracticePlanId], [GameId], [PracticeDate], [UserNotes], [IsCompleted], [IsActive]) VALUES (19, N'Our version', 5, 15, CAST(N'2020-07-03T00:00:00.000' AS DateTime), N'', 1, 1)
GO
INSERT [dbo].[PracticePlanGames] ([Id], [Name], [PracticePlanId], [GameId], [PracticeDate], [UserNotes], [IsCompleted], [IsActive]) VALUES (20, N'Our version', 5, 16, CAST(N'2020-07-04T00:00:00.000' AS DateTime), N'"Loved to add some change to the piggy bank!"', 1, 1)
GO
INSERT [dbo].[PracticePlanGames] ([Id], [Name], [PracticePlanId], [GameId], [PracticeDate], [UserNotes], [IsCompleted], [IsActive]) VALUES (21, N'Our version', 5, 14, CAST(N'2020-07-05T00:00:00.000' AS DateTime), N'', 1, 1)
GO
INSERT [dbo].[PracticePlanGames] ([Id], [Name], [PracticePlanId], [GameId], [PracticeDate], [UserNotes], [IsCompleted], [IsActive]) VALUES (22, N'Our version', 5, 15, CAST(N'2020-07-06T00:00:00.000' AS DateTime), N'', 0, 1)
GO
INSERT [dbo].[PracticePlanGames] ([Id], [Name], [PracticePlanId], [GameId], [PracticeDate], [UserNotes], [IsCompleted], [IsActive]) VALUES (23, N'Our version', 5, 9, CAST(N'2020-07-07T00:00:00.000' AS DateTime), N'"Worked great for traveling in the car!"', 0, 0)
GO
INSERT [dbo].[PracticePlanGames] ([Id], [Name], [PracticePlanId], [GameId], [PracticeDate], [UserNotes], [IsCompleted], [IsActive]) VALUES (24, N'Our version', 5, 10, CAST(N'2020-07-07T00:00:00.000' AS DateTime), N'"Worked great for traveling in the car!"', 1, 1)
GO
INSERT [dbo].[PracticePlanGames] ([Id], [Name], [PracticePlanId], [GameId], [PracticeDate], [UserNotes], [IsCompleted], [IsActive]) VALUES (25, N'New game for our practice in Jan', 1, 10, CAST(N'2021-01-03T00:00:00.000' AS DateTime), N'"This is where I will add notes for our practices in January.', 0, 1)
GO
INSERT [dbo].[PracticePlanGames] ([Id], [Name], [PracticePlanId], [GameId], [PracticeDate], [UserNotes], [IsCompleted], [IsActive]) VALUES (26, N'New game for our practice in Jan', 2, 10, CAST(N'2021-01-13T00:00:00.000' AS DateTime), N'"This is where I will add notes for our practices in January.', 0, 1)
GO
INSERT [dbo].[PracticePlanGames] ([Id], [Name], [PracticePlanId], [GameId], [PracticeDate], [UserNotes], [IsCompleted], [IsActive]) VALUES (27, N'', 25, 10, CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'', 0, 1)
GO
INSERT [dbo].[PracticePlanGames] ([Id], [Name], [PracticePlanId], [GameId], [PracticeDate], [UserNotes], [IsCompleted], [IsActive]) VALUES (28, N'', 26, 5, CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'', 0, 1)
GO
INSERT [dbo].[PracticePlanGames] ([Id], [Name], [PracticePlanId], [GameId], [PracticeDate], [UserNotes], [IsCompleted], [IsActive]) VALUES (29, N'', 27, 1, CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'', 0, 1)
GO
INSERT [dbo].[PracticePlanGames] ([Id], [Name], [PracticePlanId], [GameId], [PracticeDate], [UserNotes], [IsCompleted], [IsActive]) VALUES (30, N'', 29, 3, CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'', 0, 1)
GO
INSERT [dbo].[PracticePlanGames] ([Id], [Name], [PracticePlanId], [GameId], [PracticeDate], [UserNotes], [IsCompleted], [IsActive]) VALUES (31, N'', 30, 4, CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'', 0, 0)
GO
INSERT [dbo].[PracticePlanGames] ([Id], [Name], [PracticePlanId], [GameId], [PracticeDate], [UserNotes], [IsCompleted], [IsActive]) VALUES (32, N'Music Tour', 30, 4, CAST(N'2020-12-08T06:02:26.180' AS DateTime), N'', 0, 1)
GO
INSERT [dbo].[PracticePlanGames] ([Id], [Name], [PracticePlanId], [GameId], [PracticeDate], [UserNotes], [IsCompleted], [IsActive]) VALUES (34, N'Number Game', 34, 5, CAST(N'2020-12-08T00:00:00.000' AS DateTime), N'', 0, 0)
GO
INSERT [dbo].[PracticePlanGames] ([Id], [Name], [PracticePlanId], [GameId], [PracticeDate], [UserNotes], [IsCompleted], [IsActive]) VALUES (35, N'Treasure Hunt', 35, 6, CAST(N'2020-12-08T00:00:00.000' AS DateTime), N'', 0, 1)
GO
INSERT [dbo].[PracticePlanGames] ([Id], [Name], [PracticePlanId], [GameId], [PracticeDate], [UserNotes], [IsCompleted], [IsActive]) VALUES (36, N'Board Game', 36, 7, CAST(N'2020-12-08T00:00:00.000' AS DateTime), N'', 0, 1)
GO
INSERT [dbo].[PracticePlanGames] ([Id], [Name], [PracticePlanId], [GameId], [PracticeDate], [UserNotes], [IsCompleted], [IsActive]) VALUES (37, N'Music Tour', 38, 4, CAST(N'2020-12-08T00:00:00.000' AS DateTime), N'', 0, 1)
GO
INSERT [dbo].[PracticePlanGames] ([Id], [Name], [PracticePlanId], [GameId], [PracticeDate], [UserNotes], [IsCompleted], [IsActive]) VALUES (38, N'Treasure Hunt', 39, 6, CAST(N'2020-12-08T00:00:00.000' AS DateTime), N'', 0, 1)
GO
INSERT [dbo].[PracticePlanGames] ([Id], [Name], [PracticePlanId], [GameId], [PracticeDate], [UserNotes], [IsCompleted], [IsActive]) VALUES (39, N'Student as Parent', 41, 14, CAST(N'2020-12-08T00:00:00.000' AS DateTime), N'', 0, 1)
GO
INSERT [dbo].[PracticePlanGames] ([Id], [Name], [PracticePlanId], [GameId], [PracticeDate], [UserNotes], [IsCompleted], [IsActive]) VALUES (40, N'Music Tour', 44, 4, CAST(N'2020-12-08T00:00:00.000' AS DateTime), N'', 0, 1)
GO
INSERT [dbo].[PracticePlanGames] ([Id], [Name], [PracticePlanId], [GameId], [PracticeDate], [UserNotes], [IsCompleted], [IsActive]) VALUES (41, N'Number Game', 45, 5, CAST(N'2020-12-08T00:00:00.000' AS DateTime), N'', 0, 1)
GO
INSERT [dbo].[PracticePlanGames] ([Id], [Name], [PracticePlanId], [GameId], [PracticeDate], [UserNotes], [IsCompleted], [IsActive]) VALUES (42, N'Music Tour', 47, 4, CAST(N'2020-12-08T00:00:00.000' AS DateTime), N'', 0, 1)
GO
INSERT [dbo].[PracticePlanGames] ([Id], [Name], [PracticePlanId], [GameId], [PracticeDate], [UserNotes], [IsCompleted], [IsActive]) VALUES (43, N'Music Tour', 48, 4, CAST(N'2020-12-08T00:00:00.000' AS DateTime), N'', 0, 0)
GO
INSERT [dbo].[PracticePlanGames] ([Id], [Name], [PracticePlanId], [GameId], [PracticeDate], [UserNotes], [IsCompleted], [IsActive]) VALUES (44, N'Music Tour', 49, 4, CAST(N'2020-12-08T00:00:00.000' AS DateTime), N'', 0, 0)
GO
INSERT [dbo].[PracticePlanGames] ([Id], [Name], [PracticePlanId], [GameId], [PracticeDate], [UserNotes], [IsCompleted], [IsActive]) VALUES (45, N'Treasure Hunt', 49, 6, CAST(N'2020-12-08T00:00:00.000' AS DateTime), N'', 0, 0)
GO
INSERT [dbo].[PracticePlanGames] ([Id], [Name], [PracticePlanId], [GameId], [PracticeDate], [UserNotes], [IsCompleted], [IsActive]) VALUES (46, N'Review Songs Card Game', 49, 2, CAST(N'2020-12-08T00:00:00.000' AS DateTime), N'', 0, 0)
GO
INSERT [dbo].[PracticePlanGames] ([Id], [Name], [PracticePlanId], [GameId], [PracticeDate], [UserNotes], [IsCompleted], [IsActive]) VALUES (47, N'Music Tour', 49, 4, CAST(N'2020-12-08T00:00:00.000' AS DateTime), N'', 0, 0)
GO
INSERT [dbo].[PracticePlanGames] ([Id], [Name], [PracticePlanId], [GameId], [PracticeDate], [UserNotes], [IsCompleted], [IsActive]) VALUES (48, N'Music Tour', 50, 4, CAST(N'2020-12-08T00:00:00.000' AS DateTime), N'', 0, 1)
GO
INSERT [dbo].[PracticePlanGames] ([Id], [Name], [PracticePlanId], [GameId], [PracticeDate], [UserNotes], [IsCompleted], [IsActive]) VALUES (49, N'Treasure Hunt', 50, 6, CAST(N'2020-12-08T00:00:00.000' AS DateTime), N'', 0, 1)
GO
INSERT [dbo].[PracticePlanGames] ([Id], [Name], [PracticePlanId], [GameId], [PracticeDate], [UserNotes], [IsCompleted], [IsActive]) VALUES (50, N'Music Tour', 51, 4, CAST(N'2020-12-08T00:00:00.000' AS DateTime), N'', 0, 1)
GO
INSERT [dbo].[PracticePlanGames] ([Id], [Name], [PracticePlanId], [GameId], [PracticeDate], [UserNotes], [IsCompleted], [IsActive]) VALUES (51, N'Violin Parts Song', 51, 9, CAST(N'2020-12-08T00:00:00.000' AS DateTime), N'', 0, 1)
GO
INSERT [dbo].[PracticePlanGames] ([Id], [Name], [PracticePlanId], [GameId], [PracticeDate], [UserNotes], [IsCompleted], [IsActive]) VALUES (52, N'Sing it!', 21, 10, CAST(N'2021-12-08T00:00:00.000' AS DateTime), N'', 0, 0)
GO
INSERT [dbo].[PracticePlanGames] ([Id], [Name], [PracticePlanId], [GameId], [PracticeDate], [UserNotes], [IsCompleted], [IsActive]) VALUES (53, N'Violin Parts Song', 21, 9, CAST(N'2021-12-08T00:00:00.000' AS DateTime), N'', 0, 0)
GO
INSERT [dbo].[PracticePlanGames] ([Id], [Name], [PracticePlanId], [GameId], [PracticeDate], [UserNotes], [IsCompleted], [IsActive]) VALUES (54, N'Clap Clap Clap Your Hands', 21, 11, CAST(N'2021-12-08T00:00:00.000' AS DateTime), N'', 0, 0)
GO
INSERT [dbo].[PracticePlanGames] ([Id], [Name], [PracticePlanId], [GameId], [PracticeDate], [UserNotes], [IsCompleted], [IsActive]) VALUES (55, N'25 minutes = 25 cents', 21, 15, CAST(N'2020-12-08T00:00:00.000' AS DateTime), N'', 0, 0)
GO
INSERT [dbo].[PracticePlanGames] ([Id], [Name], [PracticePlanId], [GameId], [PracticeDate], [UserNotes], [IsCompleted], [IsActive]) VALUES (56, N'Countdown to Valentine’s Day Practice Chart', 52, 1, CAST(N'2021-01-10T00:00:00.000' AS DateTime), N'test', 0, 1)
GO
INSERT [dbo].[PracticePlanGames] ([Id], [Name], [PracticePlanId], [GameId], [PracticeDate], [UserNotes], [IsCompleted], [IsActive]) VALUES (57, N'Treasure Hunt', 53, 6, CAST(N'2021-01-08T00:00:00.000' AS DateTime), N'', 0, 1)
GO
INSERT [dbo].[PracticePlanGames] ([Id], [Name], [PracticePlanId], [GameId], [PracticeDate], [UserNotes], [IsCompleted], [IsActive]) VALUES (58, N'Music Tour', 54, 4, CAST(N'2020-12-08T00:00:00.000' AS DateTime), N'', 0, 1)
GO
INSERT [dbo].[PracticePlanGames] ([Id], [Name], [PracticePlanId], [GameId], [PracticeDate], [UserNotes], [IsCompleted], [IsActive]) VALUES (59, N'Treasure Hunt', 54, 6, CAST(N'2020-12-08T00:00:00.000' AS DateTime), N'', 0, 1)
GO
INSERT [dbo].[PracticePlanGames] ([Id], [Name], [PracticePlanId], [GameId], [PracticeDate], [UserNotes], [IsCompleted], [IsActive]) VALUES (60, N'Treasure Hunt', 7, 6, CAST(N'2020-12-08T00:00:00.000' AS DateTime), N'', 0, 0)
GO
INSERT [dbo].[PracticePlanGames] ([Id], [Name], [PracticePlanId], [GameId], [PracticeDate], [UserNotes], [IsCompleted], [IsActive]) VALUES (61, N'"6" things a day', 7, 13, CAST(N'2020-12-08T00:00:00.000' AS DateTime), N'', 0, 0)
GO
INSERT [dbo].[PracticePlanGames] ([Id], [Name], [PracticePlanId], [GameId], [PracticeDate], [UserNotes], [IsCompleted], [IsActive]) VALUES (62, N'Sing it!', 7, 10, CAST(N'2020-12-08T00:00:00.000' AS DateTime), N'', 0, 0)
GO
INSERT [dbo].[PracticePlanGames] ([Id], [Name], [PracticePlanId], [GameId], [PracticeDate], [UserNotes], [IsCompleted], [IsActive]) VALUES (63, N'Music Tour', 55, 4, CAST(N'2020-12-08T00:00:00.000' AS DateTime), N'', 0, 1)
GO
INSERT [dbo].[PracticePlanGames] ([Id], [Name], [PracticePlanId], [GameId], [PracticeDate], [UserNotes], [IsCompleted], [IsActive]) VALUES (64, N'Board Game', 56, 7, CAST(N'2020-12-08T00:00:00.000' AS DateTime), N'', 0, 1)
GO
INSERT [dbo].[PracticePlanGames] ([Id], [Name], [PracticePlanId], [GameId], [PracticeDate], [UserNotes], [IsCompleted], [IsActive]) VALUES (65, N'Number Game', 57, 5, CAST(N'2020-12-08T00:00:00.000' AS DateTime), N'', 0, 1)
GO
INSERT [dbo].[PracticePlanGames] ([Id], [Name], [PracticePlanId], [GameId], [PracticeDate], [UserNotes], [IsCompleted], [IsActive]) VALUES (66, N'Number Game', 58, 5, CAST(N'2020-12-08T00:00:00.000' AS DateTime), N'', 0, 0)
GO
INSERT [dbo].[PracticePlanGames] ([Id], [Name], [PracticePlanId], [GameId], [PracticeDate], [UserNotes], [IsCompleted], [IsActive]) VALUES (67, N'Number Game', 7, 5, CAST(N'2020-12-08T00:00:00.000' AS DateTime), N'', 0, 0)
GO
INSERT [dbo].[PracticePlanGames] ([Id], [Name], [PracticePlanId], [GameId], [PracticeDate], [UserNotes], [IsCompleted], [IsActive]) VALUES (68, N'Board Game', 8, 7, CAST(N'2020-12-08T00:00:00.000' AS DateTime), N'', 0, 0)
GO
INSERT [dbo].[PracticePlanGames] ([Id], [Name], [PracticePlanId], [GameId], [PracticeDate], [UserNotes], [IsCompleted], [IsActive]) VALUES (69, N'Number Game', 8, 5, CAST(N'2020-12-08T00:00:00.000' AS DateTime), N'', 0, 0)
GO
INSERT [dbo].[PracticePlanGames] ([Id], [Name], [PracticePlanId], [GameId], [PracticeDate], [UserNotes], [IsCompleted], [IsActive]) VALUES (70, N'Birthday Candle', 8, 12, CAST(N'2020-12-08T00:00:00.000' AS DateTime), N'', 0, 0)
GO
INSERT [dbo].[PracticePlanGames] ([Id], [Name], [PracticePlanId], [GameId], [PracticeDate], [UserNotes], [IsCompleted], [IsActive]) VALUES (71, N'Board Game', 8, 7, CAST(N'2020-12-08T00:00:00.000' AS DateTime), N'', 0, 0)
GO
INSERT [dbo].[PracticePlanGames] ([Id], [Name], [PracticePlanId], [GameId], [PracticeDate], [UserNotes], [IsCompleted], [IsActive]) VALUES (72, N'Number Game', 8, 5, CAST(N'2020-12-08T00:00:00.000' AS DateTime), N'', 1, 1)
GO
INSERT [dbo].[PracticePlanGames] ([Id], [Name], [PracticePlanId], [GameId], [PracticeDate], [UserNotes], [IsCompleted], [IsActive]) VALUES (73, N'Countdown to Valentine’s Day Practice Chart', 8, 1, CAST(N'2020-12-08T00:00:00.000' AS DateTime), N'', 1, 1)
GO
INSERT [dbo].[PracticePlanGames] ([Id], [Name], [PracticePlanId], [GameId], [PracticeDate], [UserNotes], [IsCompleted], [IsActive]) VALUES (74, N'"6" things a day', 8, 13, CAST(N'2020-12-08T00:00:00.000' AS DateTime), N'', 0, 1)
GO
INSERT [dbo].[PracticePlanGames] ([Id], [Name], [PracticePlanId], [GameId], [PracticeDate], [UserNotes], [IsCompleted], [IsActive]) VALUES (75, N'Treasure Hunt', 16, 6, CAST(N'2020-12-08T00:00:00.000' AS DateTime), N'', 1, 1)
GO
INSERT [dbo].[PracticePlanGames] ([Id], [Name], [PracticePlanId], [GameId], [PracticeDate], [UserNotes], [IsCompleted], [IsActive]) VALUES (76, N'Cheating Chess', 29, 23, CAST(N'2020-12-10T00:00:00.000' AS DateTime), N'', 0, 1)
GO
INSERT [dbo].[PracticePlanGames] ([Id], [Name], [PracticePlanId], [GameId], [PracticeDate], [UserNotes], [IsCompleted], [IsActive]) VALUES (77, N'Choose a Card', 29, 18, CAST(N'2021-12-10T00:00:00.000' AS DateTime), N'', 0, 1)
GO
INSERT [dbo].[PracticePlanGames] ([Id], [Name], [PracticePlanId], [GameId], [PracticeDate], [UserNotes], [IsCompleted], [IsActive]) VALUES (78, N'Birthday Candle', 59, 12, CAST(N'2020-12-13T00:00:00.000' AS DateTime), N'', 0, 0)
GO
INSERT [dbo].[PracticePlanGames] ([Id], [Name], [PracticePlanId], [GameId], [PracticeDate], [UserNotes], [IsCompleted], [IsActive]) VALUES (79, N'Board Game', 59, 7, CAST(N'2020-12-15T00:00:00.000' AS DateTime), N'', 0, 0)
GO
INSERT [dbo].[PracticePlanGames] ([Id], [Name], [PracticePlanId], [GameId], [PracticeDate], [UserNotes], [IsCompleted], [IsActive]) VALUES (80, N'Bingo Game', 59, 35, CAST(N'2020-12-12T00:00:00.000' AS DateTime), N'', 1, 0)
GO
INSERT [dbo].[PracticePlanGames] ([Id], [Name], [PracticePlanId], [GameId], [PracticeDate], [UserNotes], [IsCompleted], [IsActive]) VALUES (81, N'Birthday Candle', 61, 12, CAST(N'2021-01-05T00:00:00.000' AS DateTime), N'', 1, 1)
GO
INSERT [dbo].[PracticePlanGames] ([Id], [Name], [PracticePlanId], [GameId], [PracticeDate], [UserNotes], [IsCompleted], [IsActive]) VALUES (82, N'Board Game', 62, 7, CAST(N'2020-12-12T00:00:00.000' AS DateTime), N'', 1, 1)
GO
INSERT [dbo].[PracticePlanGames] ([Id], [Name], [PracticePlanId], [GameId], [PracticeDate], [UserNotes], [IsCompleted], [IsActive]) VALUES (83, N'Board Game', 62, 7, CAST(N'2020-12-12T00:00:00.000' AS DateTime), N'', 0, 1)
GO
INSERT [dbo].[PracticePlanGames] ([Id], [Name], [PracticePlanId], [GameId], [PracticeDate], [UserNotes], [IsCompleted], [IsActive]) VALUES (84, N'Bow Parts Song', 65, 8, CAST(N'2020-12-12T00:00:00.000' AS DateTime), N'', 1, 1)
GO
INSERT [dbo].[PracticePlanGames] ([Id], [Name], [PracticePlanId], [GameId], [PracticeDate], [UserNotes], [IsCompleted], [IsActive]) VALUES (85, N'Cheating Chess', 66, 23, CAST(N'2020-12-12T00:00:00.000' AS DateTime), N'', 1, 1)
GO
INSERT [dbo].[PracticePlanGames] ([Id], [Name], [PracticePlanId], [GameId], [PracticeDate], [UserNotes], [IsCompleted], [IsActive]) VALUES (86, N'Bow Parts Song', 67, 8, CAST(N'2020-12-12T00:00:00.000' AS DateTime), N'', 1, 1)
GO
INSERT [dbo].[PracticePlanGames] ([Id], [Name], [PracticePlanId], [GameId], [PracticeDate], [UserNotes], [IsCompleted], [IsActive]) VALUES (87, N'Board Game', 68, 7, CAST(N'2020-12-12T00:00:00.000' AS DateTime), N'', 1, 0)
GO
INSERT [dbo].[PracticePlanGames] ([Id], [Name], [PracticePlanId], [GameId], [PracticeDate], [UserNotes], [IsCompleted], [IsActive]) VALUES (88, N'Cheating Chess', 69, 23, CAST(N'2020-12-12T00:00:00.000' AS DateTime), N'', 1, 1)
GO
INSERT [dbo].[PracticePlanGames] ([Id], [Name], [PracticePlanId], [GameId], [PracticeDate], [UserNotes], [IsCompleted], [IsActive]) VALUES (89, N'Bow Parts Song', 70, 8, CAST(N'2020-12-12T00:00:00.000' AS DateTime), N'', 0, 1)
GO
INSERT [dbo].[PracticePlanGames] ([Id], [Name], [PracticePlanId], [GameId], [PracticeDate], [UserNotes], [IsCompleted], [IsActive]) VALUES (90, N'Clap Clap Clap Your Hands', 70, 11, CAST(N'2020-12-12T00:00:00.000' AS DateTime), N'', 1, 1)
GO
INSERT [dbo].[PracticePlanGames] ([Id], [Name], [PracticePlanId], [GameId], [PracticeDate], [UserNotes], [IsCompleted], [IsActive]) VALUES (91, N'Choose a Card', 71, 18, CAST(N'2020-12-12T00:00:00.000' AS DateTime), N'', 1, 1)
GO
INSERT [dbo].[PracticePlanGames] ([Id], [Name], [PracticePlanId], [GameId], [PracticeDate], [UserNotes], [IsCompleted], [IsActive]) VALUES (92, N'Bingo Game', 72, 35, CAST(N'2020-12-16T00:00:00.000' AS DateTime), N'use it', 1, 0)
GO
INSERT [dbo].[PracticePlanGames] ([Id], [Name], [PracticePlanId], [GameId], [PracticeDate], [UserNotes], [IsCompleted], [IsActive]) VALUES (93, N'25 minutes = 25 cents', 73, 15, CAST(N'2020-12-19T00:00:00.000' AS DateTime), N'testing', 1, 0)
GO
INSERT [dbo].[PracticePlanGames] ([Id], [Name], [PracticePlanId], [GameId], [PracticeDate], [UserNotes], [IsCompleted], [IsActive]) VALUES (94, N'Bow Parts Song our version', 73, 8, CAST(N'2020-12-20T00:00:00.000' AS DateTime), N'my notes', 1, 0)
GO
INSERT [dbo].[PracticePlanGames] ([Id], [Name], [PracticePlanId], [GameId], [PracticeDate], [UserNotes], [IsCompleted], [IsActive]) VALUES (95, N'Bow Parts Song', 62, 8, CAST(N'2020-12-19T00:00:00.000' AS DateTime), N'', 0, 1)
GO
INSERT [dbo].[PracticePlanGames] ([Id], [Name], [PracticePlanId], [GameId], [PracticeDate], [UserNotes], [IsCompleted], [IsActive]) VALUES (96, N'Dice Game Review - pick the last 5 songs', 74, 46, CAST(N'2020-12-21T00:00:00.000' AS DateTime), N'my notes', 0, 0)
GO
INSERT [dbo].[PracticePlanGames] ([Id], [Name], [PracticePlanId], [GameId], [PracticeDate], [UserNotes], [IsCompleted], [IsActive]) VALUES (97, N'Birthday Candle', 74, 12, CAST(N'2020-12-22T00:00:00.000' AS DateTime), N'my notes', 1, 0)
GO
INSERT [dbo].[PracticePlanGames] ([Id], [Name], [PracticePlanId], [GameId], [PracticeDate], [UserNotes], [IsCompleted], [IsActive]) VALUES (98, N'Cheating Chess', 74, 23, CAST(N'2020-12-19T00:00:00.000' AS DateTime), N'', 0, 0)
GO
SET IDENTITY_INSERT [dbo].[PracticePlanGames] OFF
GO
SET IDENTITY_INSERT [dbo].[PracticePlans] ON 
GO
INSERT [dbo].[PracticePlans] ([Id], [Name], [UserId], [StartDate], [EndDate], [IsActive]) VALUES (1, N'January Week 1 NEW YEAR YEAH', 1, CAST(N'2021-01-06T00:00:00.000' AS DateTime), CAST(N'2021-01-11T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[PracticePlans] ([Id], [Name], [UserId], [StartDate], [EndDate], [IsActive]) VALUES (2, N'January Week 2', 1, CAST(N'2021-01-10T00:00:00.000' AS DateTime), CAST(N'2021-01-16T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[PracticePlans] ([Id], [Name], [UserId], [StartDate], [EndDate], [IsActive]) VALUES (3, N'January Week 3', 1, CAST(N'2021-01-17T00:00:00.000' AS DateTime), CAST(N'2021-01-23T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[PracticePlans] ([Id], [Name], [UserId], [StartDate], [EndDate], [IsActive]) VALUES (4, N'January Week 4', 1, CAST(N'2021-01-24T00:00:00.000' AS DateTime), CAST(N'2021-01-30T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[PracticePlans] ([Id], [Name], [UserId], [StartDate], [EndDate], [IsActive]) VALUES (5, N'Smokies Vacation', 2, CAST(N'2020-07-01T00:00:00.000' AS DateTime), CAST(N'2020-07-07T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[PracticePlans] ([Id], [Name], [UserId], [StartDate], [EndDate], [IsActive]) VALUES (6, N'Pensacola Trip', 2, CAST(N'2021-05-20T00:00:00.000' AS DateTime), CAST(N'2021-05-27T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[PracticePlans] ([Id], [Name], [UserId], [StartDate], [EndDate], [IsActive]) VALUES (7, N'Practice Challenge - September', 3, CAST(N'2020-09-01T00:00:00.000' AS DateTime), CAST(N'2020-09-30T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[PracticePlans] ([Id], [Name], [UserId], [StartDate], [EndDate], [IsActive]) VALUES (8, N'Practice Challenge - October', 3, CAST(N'2020-10-01T00:00:00.000' AS DateTime), CAST(N'2020-10-31T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[PracticePlans] ([Id], [Name], [UserId], [StartDate], [EndDate], [IsActive]) VALUES (9, N'Christmas Recital Prep', 4, CAST(N'2020-12-15T00:00:00.000' AS DateTime), CAST(N'2020-12-24T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[PracticePlans] ([Id], [Name], [UserId], [StartDate], [EndDate], [IsActive]) VALUES (10, N'Halloween School Recital Prep', 4, CAST(N'2020-10-20T00:00:00.000' AS DateTime), CAST(N'2020-10-30T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[PracticePlans] ([Id], [Name], [UserId], [StartDate], [EndDate], [IsActive]) VALUES (11, N'Feb', 1, CAST(N'2021-02-01T00:00:00.000' AS DateTime), CAST(N'2021-02-28T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[PracticePlans] ([Id], [Name], [UserId], [StartDate], [EndDate], [IsActive]) VALUES (12, N'March', 1, CAST(N'2021-03-01T00:00:00.000' AS DateTime), CAST(N'2021-03-31T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[PracticePlans] ([Id], [Name], [UserId], [StartDate], [EndDate], [IsActive]) VALUES (13, N'April', 1, CAST(N'2021-04-01T00:00:00.000' AS DateTime), CAST(N'2021-04-30T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[PracticePlans] ([Id], [Name], [UserId], [StartDate], [EndDate], [IsActive]) VALUES (16, N'May', 3, CAST(N'2021-05-01T00:00:00.000' AS DateTime), CAST(N'2021-05-31T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[PracticePlans] ([Id], [Name], [UserId], [StartDate], [EndDate], [IsActive]) VALUES (17, N'test', 3, CAST(N'2020-12-10T00:00:00.000' AS DateTime), CAST(N'2020-12-24T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[PracticePlans] ([Id], [Name], [UserId], [StartDate], [EndDate], [IsActive]) VALUES (18, N'January Practices', 3, CAST(N'2021-01-01T00:00:00.000' AS DateTime), CAST(N'2021-01-31T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[PracticePlans] ([Id], [Name], [UserId], [StartDate], [EndDate], [IsActive]) VALUES (19, N'test', 3, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'2020-12-10T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[PracticePlans] ([Id], [Name], [UserId], [StartDate], [EndDate], [IsActive]) VALUES (20, N'test', 3, CAST(N'2020-12-01T00:00:00.000' AS DateTime), CAST(N'2020-12-10T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[PracticePlans] ([Id], [Name], [UserId], [StartDate], [EndDate], [IsActive]) VALUES (21, N'test CHANGED', 3, CAST(N'2021-12-01T00:00:00.000' AS DateTime), CAST(N'2021-12-31T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[PracticePlans] ([Id], [Name], [UserId], [StartDate], [EndDate], [IsActive]) VALUES (22, N'December', 1, CAST(N'2020-12-10T00:00:00.000' AS DateTime), CAST(N'2020-12-31T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[PracticePlans] ([Id], [Name], [UserId], [StartDate], [EndDate], [IsActive]) VALUES (23, N'testing December', 1, CAST(N'2020-12-15T00:00:00.000' AS DateTime), CAST(N'2020-12-31T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[PracticePlans] ([Id], [Name], [UserId], [StartDate], [EndDate], [IsActive]) VALUES (24, N'Dec Part 2', 1, CAST(N'2020-12-15T00:00:00.000' AS DateTime), CAST(N'2020-12-31T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[PracticePlans] ([Id], [Name], [UserId], [StartDate], [EndDate], [IsActive]) VALUES (25, N'test', 1, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'2020-12-10T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[PracticePlans] ([Id], [Name], [UserId], [StartDate], [EndDate], [IsActive]) VALUES (26, N'test', 1, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'2020-12-08T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[PracticePlans] ([Id], [Name], [UserId], [StartDate], [EndDate], [IsActive]) VALUES (27, N'test', 1, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[PracticePlans] ([Id], [Name], [UserId], [StartDate], [EndDate], [IsActive]) VALUES (28, N'', 1, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[PracticePlans] ([Id], [Name], [UserId], [StartDate], [EndDate], [IsActive]) VALUES (29, N'testing', 1, CAST(N'2021-01-01T00:00:00.000' AS DateTime), CAST(N'2021-01-10T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[PracticePlans] ([Id], [Name], [UserId], [StartDate], [EndDate], [IsActive]) VALUES (30, N'testing!!!', 1, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'2020-12-09T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[PracticePlans] ([Id], [Name], [UserId], [StartDate], [EndDate], [IsActive]) VALUES (31, N'test', 1, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[PracticePlans] ([Id], [Name], [UserId], [StartDate], [EndDate], [IsActive]) VALUES (32, N'', 1, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[PracticePlans] ([Id], [Name], [UserId], [StartDate], [EndDate], [IsActive]) VALUES (33, N'', 1, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[PracticePlans] ([Id], [Name], [UserId], [StartDate], [EndDate], [IsActive]) VALUES (34, N'', 1, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[PracticePlans] ([Id], [Name], [UserId], [StartDate], [EndDate], [IsActive]) VALUES (35, N'test', 1, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[PracticePlans] ([Id], [Name], [UserId], [StartDate], [EndDate], [IsActive]) VALUES (36, N'', 1, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[PracticePlans] ([Id], [Name], [UserId], [StartDate], [EndDate], [IsActive]) VALUES (37, N'', 1, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[PracticePlans] ([Id], [Name], [UserId], [StartDate], [EndDate], [IsActive]) VALUES (38, N'test', 1, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[PracticePlans] ([Id], [Name], [UserId], [StartDate], [EndDate], [IsActive]) VALUES (39, N'', 1, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[PracticePlans] ([Id], [Name], [UserId], [StartDate], [EndDate], [IsActive]) VALUES (40, N'', 1, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[PracticePlans] ([Id], [Name], [UserId], [StartDate], [EndDate], [IsActive]) VALUES (41, N'', 1, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[PracticePlans] ([Id], [Name], [UserId], [StartDate], [EndDate], [IsActive]) VALUES (42, N'', 1, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[PracticePlans] ([Id], [Name], [UserId], [StartDate], [EndDate], [IsActive]) VALUES (43, N'', 1, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[PracticePlans] ([Id], [Name], [UserId], [StartDate], [EndDate], [IsActive]) VALUES (44, N'', 1, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[PracticePlans] ([Id], [Name], [UserId], [StartDate], [EndDate], [IsActive]) VALUES (45, N'', 3, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[PracticePlans] ([Id], [Name], [UserId], [StartDate], [EndDate], [IsActive]) VALUES (46, N'', 3, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[PracticePlans] ([Id], [Name], [UserId], [StartDate], [EndDate], [IsActive]) VALUES (47, N'', 3, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[PracticePlans] ([Id], [Name], [UserId], [StartDate], [EndDate], [IsActive]) VALUES (48, N'', 3, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[PracticePlans] ([Id], [Name], [UserId], [StartDate], [EndDate], [IsActive]) VALUES (49, N'', 3, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[PracticePlans] ([Id], [Name], [UserId], [StartDate], [EndDate], [IsActive]) VALUES (50, N'', 3, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[PracticePlans] ([Id], [Name], [UserId], [StartDate], [EndDate], [IsActive]) VALUES (51, N'last test', 3, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[PracticePlans] ([Id], [Name], [UserId], [StartDate], [EndDate], [IsActive]) VALUES (52, N'Maria''s new plan', 3, CAST(N'2021-01-01T00:00:00.000' AS DateTime), CAST(N'2021-01-10T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[PracticePlans] ([Id], [Name], [UserId], [StartDate], [EndDate], [IsActive]) VALUES (53, N'maria TEST AGAIN', 3, CAST(N'2021-01-01T00:00:00.000' AS DateTime), CAST(N'2021-01-05T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[PracticePlans] ([Id], [Name], [UserId], [StartDate], [EndDate], [IsActive]) VALUES (54, N'testing 123', 3, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'2020-12-09T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[PracticePlans] ([Id], [Name], [UserId], [StartDate], [EndDate], [IsActive]) VALUES (55, N'test', 3, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'2020-12-08T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[PracticePlans] ([Id], [Name], [UserId], [StartDate], [EndDate], [IsActive]) VALUES (56, N'test again and again!!!', 3, CAST(N'2020-12-08T00:00:00.000' AS DateTime), CAST(N'2020-12-20T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[PracticePlans] ([Id], [Name], [UserId], [StartDate], [EndDate], [IsActive]) VALUES (57, N'new plan', 3, CAST(N'2020-12-08T00:00:00.000' AS DateTime), CAST(N'2020-12-31T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[PracticePlans] ([Id], [Name], [UserId], [StartDate], [EndDate], [IsActive]) VALUES (58, N'', 3, CAST(N'2020-12-08T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[PracticePlans] ([Id], [Name], [UserId], [StartDate], [EndDate], [IsActive]) VALUES (59, N'Dec recital', 6, CAST(N'2020-12-12T00:00:00.000' AS DateTime), CAST(N'2020-12-24T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[PracticePlans] ([Id], [Name], [UserId], [StartDate], [EndDate], [IsActive]) VALUES (60, N'Dec recital', 6, CAST(N'2020-12-12T00:00:00.000' AS DateTime), CAST(N'2020-12-24T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[PracticePlans] ([Id], [Name], [UserId], [StartDate], [EndDate], [IsActive]) VALUES (61, N'Jan', 6, CAST(N'2021-01-02T00:00:00.000' AS DateTime), CAST(N'2021-01-15T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[PracticePlans] ([Id], [Name], [UserId], [StartDate], [EndDate], [IsActive]) VALUES (62, N'test', 6, CAST(N'2020-12-12T00:00:00.000' AS DateTime), CAST(N'2020-12-31T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[PracticePlans] ([Id], [Name], [UserId], [StartDate], [EndDate], [IsActive]) VALUES (63, N'test', 6, CAST(N'2020-12-12T00:00:00.000' AS DateTime), CAST(N'2020-12-31T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[PracticePlans] ([Id], [Name], [UserId], [StartDate], [EndDate], [IsActive]) VALUES (64, N'test2', 6, CAST(N'2020-12-12T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[PracticePlans] ([Id], [Name], [UserId], [StartDate], [EndDate], [IsActive]) VALUES (65, N'test3', 6, CAST(N'2020-12-12T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[PracticePlans] ([Id], [Name], [UserId], [StartDate], [EndDate], [IsActive]) VALUES (66, N'test4', 6, CAST(N'2020-12-12T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[PracticePlans] ([Id], [Name], [UserId], [StartDate], [EndDate], [IsActive]) VALUES (67, N'test5', 6, CAST(N'2020-12-12T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[PracticePlans] ([Id], [Name], [UserId], [StartDate], [EndDate], [IsActive]) VALUES (68, N'test6', 6, CAST(N'2020-12-12T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[PracticePlans] ([Id], [Name], [UserId], [StartDate], [EndDate], [IsActive]) VALUES (69, N'test7', 6, CAST(N'2020-12-12T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[PracticePlans] ([Id], [Name], [UserId], [StartDate], [EndDate], [IsActive]) VALUES (70, N'test8', 6, CAST(N'2020-12-12T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[PracticePlans] ([Id], [Name], [UserId], [StartDate], [EndDate], [IsActive]) VALUES (71, N'test9', 6, CAST(N'2020-12-12T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[PracticePlans] ([Id], [Name], [UserId], [StartDate], [EndDate], [IsActive]) VALUES (72, N'Dec recital', 6, CAST(N'2020-12-16T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[PracticePlans] ([Id], [Name], [UserId], [StartDate], [EndDate], [IsActive]) VALUES (73, N'Today!! the most important', 6, CAST(N'2020-12-19T00:00:00.000' AS DateTime), CAST(N'2020-12-20T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[PracticePlans] ([Id], [Name], [UserId], [StartDate], [EndDate], [IsActive]) VALUES (74, N'New Year''s recital - family recital', 6, CAST(N'2020-12-20T00:00:00.000' AS DateTime), CAST(N'2020-12-31T00:00:00.000' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[PracticePlans] OFF
GO
SET IDENTITY_INSERT [dbo].[PreworkLevels] ON 
GO
INSERT [dbo].[PreworkLevels] ([Id], [Name], [IconUrl]) VALUES (1, N'None', N'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/brands/creative-commons-zero.svg')
GO
INSERT [dbo].[PreworkLevels] ([Id], [Name], [IconUrl]) VALUES (2, N'Low (<1 hour)', N'')
GO
INSERT [dbo].[PreworkLevels] ([Id], [Name], [IconUrl]) VALUES (3, N'Medium (1-4 hours)', N'')
GO
INSERT [dbo].[PreworkLevels] ([Id], [Name], [IconUrl]) VALUES (4, N'High (>4 hours)', N'')
GO
SET IDENTITY_INSERT [dbo].[PreworkLevels] OFF
GO
SET IDENTITY_INSERT [dbo].[UserChildren] ON 
GO
INSERT [dbo].[UserChildren] ([Id], [UserId], [ChildName], [ChildBirthday], [ChildOrder]) VALUES (1, 1, N'Austin', CAST(N'2010-01-01T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[UserChildren] ([Id], [UserId], [ChildName], [ChildBirthday], [ChildOrder]) VALUES (2, 1, N'Madison', CAST(N'2015-03-01T00:00:00.000' AS DateTime), 2)
GO
INSERT [dbo].[UserChildren] ([Id], [UserId], [ChildName], [ChildBirthday], [ChildOrder]) VALUES (3, 2, N'Jenn', CAST(N'2016-07-01T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[UserChildren] ([Id], [UserId], [ChildName], [ChildBirthday], [ChildOrder]) VALUES (4, 3, N'Sam', CAST(N'2013-10-01T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[UserChildren] ([Id], [UserId], [ChildName], [ChildBirthday], [ChildOrder]) VALUES (5, 4, N'Victoria', CAST(N'2010-02-15T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[UserChildren] ([Id], [UserId], [ChildName], [ChildBirthday], [ChildOrder]) VALUES (6, 4, N'Veronica', CAST(N'2012-04-15T00:00:00.000' AS DateTime), 2)
GO
INSERT [dbo].[UserChildren] ([Id], [UserId], [ChildName], [ChildBirthday], [ChildOrder]) VALUES (7, 4, N'Vincent', CAST(N'2015-07-01T00:00:00.000' AS DateTime), 3)
GO
INSERT [dbo].[UserChildren] ([Id], [UserId], [ChildName], [ChildBirthday], [ChildOrder]) VALUES (8, 5, N'Greta', CAST(N'2008-02-01T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[UserChildren] ([Id], [UserId], [ChildName], [ChildBirthday], [ChildOrder]) VALUES (9, 6, N'Marcus', CAST(N'2007-06-15T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[UserChildren] ([Id], [UserId], [ChildName], [ChildBirthday], [ChildOrder]) VALUES (10, 7, N'Gina', CAST(N'2007-06-01T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[UserChildren] ([Id], [UserId], [ChildName], [ChildBirthday], [ChildOrder]) VALUES (11, 8, N'Mary', CAST(N'2008-07-01T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[UserChildren] ([Id], [UserId], [ChildName], [ChildBirthday], [ChildOrder]) VALUES (12, 9, N'Olivia', CAST(N'2009-09-01T00:00:00.000' AS DateTime), 1)
GO
SET IDENTITY_INSERT [dbo].[UserChildren] OFF
GO
SET IDENTITY_INSERT [dbo].[UserPhotos] ON 
GO
INSERT [dbo].[UserPhotos] ([Id], [UserId], [GameId], [Comment], [PhotoUrl], [IsActive], [DateCreated]) VALUES (1, 1, 1, N'My daughter.', N'https://takelessons.com/blog/wp-content/uploads/2014/04/student-violins.jpg', 1, CAST(N'2020-03-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[UserPhotos] ([Id], [UserId], [GameId], [Comment], [PhotoUrl], [IsActive], [DateCreated]) VALUES (2, 2, 1, N'My niece', N'https://www.violinist.com/art/blog/21322.jpg', 1, CAST(N'2020-08-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[UserPhotos] ([Id], [UserId], [GameId], [Comment], [PhotoUrl], [IsActive], [DateCreated]) VALUES (3, 3, 2, N'My daugher enjoyed trying this with her son!', N'https://previews.123rf.com/images/pahham/pahham1209/pahham120900011/15278606-young-boy-plays-violin-on-white-background.jpg', 1, CAST(N'2020-02-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[UserPhotos] ([Id], [UserId], [GameId], [Comment], [PhotoUrl], [IsActive], [DateCreated]) VALUES (4, 4, 4, N'Teaching her grampie!', N'https://dnan0fzjxntrj.cloudfront.net/Pictures/780xany/8/7/0/12870_gzaszilvay_222236.jpg', 1, CAST(N'2020-03-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[UserPhotos] ([Id], [UserId], [GameId], [Comment], [PhotoUrl], [IsActive], [DateCreated]) VALUES (5, 3, 5, N'', N'https://secure.i.telegraph.co.uk/multimedia/archive/03085/violin_3085517b.jpg', 1, CAST(N'2020-02-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[UserPhotos] ([Id], [UserId], [GameId], [Comment], [PhotoUrl], [IsActive], [DateCreated]) VALUES (6, 5, 49, N'', N'https://i.ytimg.com/vi/68o-m4EcDAc/maxresdefault.jpg', 1, CAST(N'2020-07-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[UserPhotos] ([Id], [UserId], [GameId], [Comment], [PhotoUrl], [IsActive], [DateCreated]) VALUES (7, 6, 47, N'', N'https://1.bp.blogspot.com/-QbXZzMtD5SA/Ux9MUCauO6I/AAAAAAAABek/mNZmov_uPM0/s1600/IMG_4319.JPG', 1, CAST(N'2020-07-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[UserPhotos] ([Id], [UserId], [GameId], [Comment], [PhotoUrl], [IsActive], [DateCreated]) VALUES (8, 7, 38, N'', N'https://lh3.googleusercontent.com/proxy/-gGnGgfNoOLv2xkf0V6C-rqlJYKQZ4xU5RrHmqUatC2U-0cbT1MBTni6tDsfDUk0vGdxWRBRR7fhSy5-tx2gJ8ZyKYn_Jaan-I2oyQ', 1, CAST(N'2020-07-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[UserPhotos] ([Id], [UserId], [GameId], [Comment], [PhotoUrl], [IsActive], [DateCreated]) VALUES (9, 7, 50, N'', N'https://davidschoolofmusic.com/wp-content/uploads/2020/07/043263541-teacher-helping-young-female-p.jpeg', 1, CAST(N'2020-07-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[UserPhotos] ([Id], [UserId], [GameId], [Comment], [PhotoUrl], [IsActive], [DateCreated]) VALUES (10, 8, 50, N'Fantastic game.', N'https://www.connollymusic.com/hs-fs/hubfs/Comparing-Popular-Violin-Teaching-Methods-Blog.jpg?width=760&name=Comparing-Popular-Violin-Teaching-Methods-Blog.jpg', 1, CAST(N'2020-08-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[UserPhotos] ([Id], [UserId], [GameId], [Comment], [PhotoUrl], [IsActive], [DateCreated]) VALUES (11, 8, 47, N'Easy to do!', N'https://previews.123rf.com/images/pahham/pahham1009/pahham100900028/7761571-happy-young-boy-shows-his-violin.jpg', 1, CAST(N'2020-08-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[UserPhotos] ([Id], [UserId], [GameId], [Comment], [PhotoUrl], [IsActive], [DateCreated]) VALUES (12, 7, 41, N'He enjoyed the Alphabet Game! Was not so easy for dad to sing it backwards! LOL', N'https://lh3.googleusercontent.com/proxy/gGaUcTcgPWwJwWGETCzJVPzROB-f1H1oDx09-2luA2XR0gN4yMlAmh01M1s51E9am3Z-fTOXLZAtAc6_KBXTqdo6OCqxsAadixvGPGMS8TWIbGfEOhMmAvLoPU4KZeCB5RJ3GOA4-o4GW0xhRNxnJxG_1Gw', 1, CAST(N'2020-08-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[UserPhotos] ([Id], [UserId], [GameId], [Comment], [PhotoUrl], [IsActive], [DateCreated]) VALUES (13, 11, 30, N'', N'https://n2o-music.com/wp-content/uploads/2020/01/Violin-Lessons-for-Kids.jpg', 1, CAST(N'2020-08-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[UserPhotos] ([Id], [UserId], [GameId], [Comment], [PhotoUrl], [IsActive], [DateCreated]) VALUES (14, 12, 31, N'', N'https://i.guim.co.uk/img/media/b0cc3b05df4b50ec6a46402a0ee9338cbfab3ec6/0_1039_4798_2875/master/4798.jpg?width=1200&height=900&quality=85&auto=format&fit=crop&s=af1d1d0a4ee5c2577bedb6bb1ffc490a', 1, CAST(N'2020-08-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[UserPhotos] ([Id], [UserId], [GameId], [Comment], [PhotoUrl], [IsActive], [DateCreated]) VALUES (15, 13, 32, N'', N'https://www.dynamicrhythms.com.au/wp-content/uploads/2016/05/dynamic-rhythms-violinist.jpg', 1, CAST(N'2020-08-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[UserPhotos] ([Id], [UserId], [GameId], [Comment], [PhotoUrl], [IsActive], [DateCreated]) VALUES (16, 11, 33, N'', N'https://thehappyviolinist.com/wp-content/uploads/2017/06/mi21042-kids-electronic-violin-PRODUCT-b.jpg', 1, CAST(N'2020-03-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[UserPhotos] ([Id], [UserId], [GameId], [Comment], [PhotoUrl], [IsActive], [DateCreated]) VALUES (17, 12, 34, N'', N'https://www.musikalessons.com/blog/wp-content/uploads/2016/03/suzukiviolinboyclassroom.jpg', 1, CAST(N'2020-07-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[UserPhotos] ([Id], [UserId], [GameId], [Comment], [PhotoUrl], [IsActive], [DateCreated]) VALUES (18, 13, 14, N'', N'https://maestromusicianslexington.com/wp-content/uploads/2018/03/Boy-playing-violin.jpg', 1, CAST(N'2020-08-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[UserPhotos] ([Id], [UserId], [GameId], [Comment], [PhotoUrl], [IsActive], [DateCreated]) VALUES (19, 10, 54, N'"Scales are a bitt easier to swallow with this game"', N'https://www.acmusic.org/wp-content/uploads/2016/01/Christy_kid.jpg', 1, CAST(N'2020-08-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[UserPhotos] ([Id], [UserId], [GameId], [Comment], [PhotoUrl], [IsActive], [DateCreated]) VALUES (20, 11, 53, N'Nice!', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFu2nQ-dpyYm_yw_hLeh2YtlII9JyELPfAgzzKMNBwyv923Q4RCrlOWGQoe5fFmO5pUugfWBfy3zDY1zrl6Q_lkCmQZthkJMQ&usqp=CAU&ec=45732301', 1, CAST(N'2020-03-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[UserPhotos] ([Id], [UserId], [GameId], [Comment], [PhotoUrl], [IsActive], [DateCreated]) VALUES (21, 10, 53, N'She loved it!', N'https://perfectpraisemusic.com/wp-content/uploads/2018/03/piano-lessons-for-kids-L1.jpg', 1, CAST(N'2020-03-01T00:00:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[UserPhotos] OFF
GO
SET IDENTITY_INSERT [dbo].[UserReviews] ON 
GO
INSERT [dbo].[UserReviews] ([Id], [UserId], [GameId], [Comment], [IsActive], [DateCreated]) VALUES (1, 1, 1, N'I am a big fan of these charts for repetitions. My daughter loves to add a sticker to each square to check it off. It is fun to go through our sticker book and pick a variety of stickers as we cound up to 100!', 1, CAST(N'2020-03-08T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[UserReviews] ([Id], [UserId], [GameId], [Comment], [IsActive], [DateCreated]) VALUES (2, 2, 1, N'This was not a great game for us. It seemed too much trouble to look for the stickers each day so then we would end up only adding them once a week and it felt more like a chore than a reward.', 1, CAST(N'2020-08-08T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[UserReviews] ([Id], [UserId], [GameId], [Comment], [IsActive], [DateCreated]) VALUES (3, 3, 2, N'My son loved this - gave him a bit of independence! Will definitely be using this again!', 1, CAST(N'2020-04-08T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[UserReviews] ([Id], [UserId], [GameId], [Comment], [IsActive], [DateCreated]) VALUES (4, 3, 3, N'"My son loved this - gave him a bit of independence! Will definitely be using this again!"', 1, CAST(N'2020-04-08T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[UserReviews] ([Id], [UserId], [GameId], [Comment], [IsActive], [DateCreated]) VALUES (5, 4, 4, N'Absolutely wonderful idea! Just make sure you have the time for this! You do not want to rush the tour before you have to go pick up groceries for dinner!', 1, CAST(N'2020-03-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[UserReviews] ([Id], [UserId], [GameId], [Comment], [IsActive], [DateCreated]) VALUES (6, 3, 5, N'"My son loved this - gave him a bit of independence! Will definitely be using this again!"', 1, CAST(N'2020-02-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[UserReviews] ([Id], [UserId], [GameId], [Comment], [IsActive], [DateCreated]) VALUES (7, 5, 12, N'First impressions are 10 out of 10. My daughter loved trying to get one more review song in before the candle blew out!', 1, CAST(N'2020-07-08T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[UserReviews] ([Id], [UserId], [GameId], [Comment], [IsActive], [DateCreated]) VALUES (8, 6, 33, N'If you do not like being physical, then this game is not for you. However, if you do not mind getting in on the action with your child, this game offers a fun musically-charged workout.', 1, CAST(N'2020-07-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[UserReviews] ([Id], [UserId], [GameId], [Comment], [IsActive], [DateCreated]) VALUES (9, 7, 36, N'This can be a very dynamic and fun game. Definitely add it to your list of games to try!', 1, CAST(N'2020-07-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[UserReviews] ([Id], [UserId], [GameId], [Comment], [IsActive], [DateCreated]) VALUES (10, 7, 50, N'This game is so innovative that it makes up for the slightly extensive amount of prework you have to do. Kids love  it!', 1, CAST(N'2020-07-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[UserReviews] ([Id], [UserId], [GameId], [Comment], [IsActive], [DateCreated]) VALUES (11, 8, 50, N'Fantastic game,', 1, CAST(N'2020-08-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[UserReviews] ([Id], [UserId], [GameId], [Comment], [IsActive], [DateCreated]) VALUES (12, 8, 47, N'So easy to make this work! Try it with their favorite doll or stuffed animal. A puppet reserved for this role can be a special addition, for sure!', 1, CAST(N'2020-08-10T00:00:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[UserReviews] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([Id], [IsActive], [FirebaseUid], [Email], [Password], [FirstName], [LastName], [PhotoUrl], [DateCreated]) VALUES (1, 1, N'4oOhDpuITbcXDL26btC0O7ba95M2', N'felix.jordan@gmail.com', N'test123', N'Felix', N'Jordan', N'https://images.squarespace-cdn.com/content/v1/530a77dee4b035db71736c02/1570812709805-UW9CYAKYVXKSTO845HHI/ke17ZwdGBToddI8pDm48kMFiMyT1nneRMhnmfuSfpxZ7gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z4YTzHvnKhyp6Da-NYroOW3ZGjoBKy3azqku80C789l0mlM0or4nqX7jrn5yWu0hA1QXedaIFqnAbw_tQShHbKg4-O_KAc44ak5jGzrnn7f3A/Connecticut+headshots+-+lawyer+headshot+-+Seshu+Badrinath.jpg', CAST(N'2020-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Users] ([Id], [IsActive], [FirebaseUid], [Email], [Password], [FirstName], [LastName], [PhotoUrl], [DateCreated]) VALUES (2, 1, N'u2jL7hczu5eEXYboHvPj5tPzeC02', N'georgia.knox@gmail.com', N'test123', N'Georgia', N'Knox', N'https://i1.wp.com/findingmyinnerbombshell.com/wp-content/uploads/2014/03/IMG_2638.jpg', CAST(N'2020-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Users] ([Id], [IsActive], [FirebaseUid], [Email], [Password], [FirstName], [LastName], [PhotoUrl], [DateCreated]) VALUES (3, 1, N'jS4wajUO1chmdNr0FY064lO6NtQ2', N'maria.paxton@gmail.com', N'test123', N'Maria', N'Paxton', N'https://truestudios.biz/images/headshots/Free_Headshot_Columbus_7.jpg', CAST(N'2020-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Users] ([Id], [IsActive], [FirebaseUid], [Email], [Password], [FirstName], [LastName], [PhotoUrl], [DateCreated]) VALUES (4, 1, N'xxrUWYaPYIai6I5O91ph7K5nOVY2', N'jonathan.mcknight@gmail.com', N'test123', N'Jonathan', N'McKnight', N'https://thumbs.dreamstime.com/z/son-kissing-dad-cheek-383476.jpg', CAST(N'2020-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Users] ([Id], [IsActive], [FirebaseUid], [Email], [Password], [FirstName], [LastName], [PhotoUrl], [DateCreated]) VALUES (5, 1, N'cUMl8dLyeKaPdz8Bc2rW5Ztiopc2', N'tony.pizzicato@gmail.com', N'test123', N'Tony', N'Pizzicato', N'https://cdn.pixabay.com/photo/2012/04/26/14/32/man-42645__480.png', CAST(N'2020-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Users] ([Id], [IsActive], [FirebaseUid], [Email], [Password], [FirstName], [LastName], [PhotoUrl], [DateCreated]) VALUES (6, 1, N'jQ9Z76R9THNKB28rYhr7iCofFHM2', N'angela.andantino@gmail.com', N'test123', N'Angela', N'Andantino', N'https://cdn.pixabay.com/photo/2016/06/15/23/20/woman-1460150__480.jpg', CAST(N'2020-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Users] ([Id], [IsActive], [FirebaseUid], [Email], [Password], [FirstName], [LastName], [PhotoUrl], [DateCreated]) VALUES (7, 1, N'Er9YmHOjInX949aKkOZ2kfwWQOu1', N'theresa.fiorelli@gmail.com', N'test123', N'Theresa', N'Fiorelli', N'https://cdn.pixabay.com/photo/2019/10/04/13/19/woman-4525646__480.jpg', CAST(N'2020-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Users] ([Id], [IsActive], [FirebaseUid], [Email], [Password], [FirstName], [LastName], [PhotoUrl], [DateCreated]) VALUES (8, 1, N'D2NcMfu5hIaQy54h049CDebnI3v2', N'fred.allegro@gmail.com', N'test123', N'Fred', N'Allegro', N'https://cdn.pixabay.com/photo/2016/08/11/02/57/headshot-1584735__480.jpg', CAST(N'2020-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Users] ([Id], [IsActive], [FirebaseUid], [Email], [Password], [FirstName], [LastName], [PhotoUrl], [DateCreated]) VALUES (9, 1, N'D5RHmOIR00SEdgEo0GWqkBjedm22', N'jeremy.ritardando@gmail.com', N'test123', N'Jeremy', N'Ritardando', N'https://static1.squarespace.com/static/518081cfe4b0809658b43e0b/518086dfe4b00b4503d890ba/5952c7c3b8a79b67220ddd3d/1587514772680/bellingham-lifestyle-photographer-katheryn-moran-father-daughter-lego-73.jpg?format=1500w', CAST(N'2020-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Users] ([Id], [IsActive], [FirebaseUid], [Email], [Password], [FirstName], [LastName], [PhotoUrl], [DateCreated]) VALUES (10, 1, N'rjjwESZYmgPl33dZgFyKk2y4wk33', N'martin.nelson@gmail.com', N'test123', N'Martina', N'Nelson', N'https://cdn.pixabay.com/photo/2017/02/16/23/10/smile-2072907__480.jpg', CAST(N'2020-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Users] ([Id], [IsActive], [FirebaseUid], [Email], [Password], [FirstName], [LastName], [PhotoUrl], [DateCreated]) VALUES (11, 1, N'dd66fmZdohgm0QqLpjjRXmmsG1m1', N'arthur.coal@gmail.com', N'test123', N'Arthur', N'Coal', N'https://cdn.pixabay.com/photo/2017/09/25/13/12/man-2785071_1280.jpg', CAST(N'2020-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Users] ([Id], [IsActive], [FirebaseUid], [Email], [Password], [FirstName], [LastName], [PhotoUrl], [DateCreated]) VALUES (12, 1, N'DBmo2uOuzGanVNzY9VwHqMtYcko1', N'sylvan.mcwheeler@gmail.com', N'test123', N'Sylvan', N'McWheeler', N'https://cdn.pixabay.com/photo/2015/03/03/18/58/girl-657753__480.jpg', CAST(N'2020-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Users] ([Id], [IsActive], [FirebaseUid], [Email], [Password], [FirstName], [LastName], [PhotoUrl], [DateCreated]) VALUES (13, 1, N'O41tF7qW31NbiKCjxCiH52cBD5j2', N'stephanie.plum@gmail.com', N'test123', N'Stephanie', N'Plum', N'https://ca-times.brightspotcdn.com/dims4/default/2f4d391/2147483647/strip/true/crop/3200x4000+0+0/resize/840x1050!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2F80%2Fa4%2F6ee9ea8e4c1382bb213f66b19f59%2Fla-photos-handouts-la-ca-twisted-twenty-six-book-111.JPG', CAST(N'2020-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Users] ([Id], [IsActive], [FirebaseUid], [Email], [Password], [FirstName], [LastName], [PhotoUrl], [DateCreated]) VALUES (16, 1, N'abc123', N'testing@gmail.com', N'test123', N'TEST', N'TEST LAST NAME', N'https://cdn.pixabay.com/photo/2019/12/20/01/11/headshot-4707400_1280.jpg', CAST(N'2020-12-04T19:04:49.353' AS DateTime))
GO
INSERT [dbo].[Users] ([Id], [IsActive], [FirebaseUid], [Email], [Password], [FirstName], [LastName], [PhotoUrl], [DateCreated]) VALUES (17, 1, N'abc123', N'testing@gmail.com', N'test123', N'TEST2', N'TEST2 LAST NAME', N'https://cdn.pixabay.com/photo/2019/12/20/01/11/headshot-4707400_1280.jpg', CAST(N'2020-12-04T21:27:51.087' AS DateTime))
GO
INSERT [dbo].[Users] ([Id], [IsActive], [FirebaseUid], [Email], [Password], [FirstName], [LastName], [PhotoUrl], [DateCreated]) VALUES (18, 1, N'abcd111', N'abc@gmail.com', N'test123', N'frank', N'jones', N'frankie photo', CAST(N'2020-12-04T21:29:20.633' AS DateTime))
GO
INSERT [dbo].[Users] ([Id], [IsActive], [FirebaseUid], [Email], [Password], [FirstName], [LastName], [PhotoUrl], [DateCreated]) VALUES (19, 1, N'abc123', N'testing@gmail.com', N'test123', N'TEST4', N'TEST4 LAST NAME', N'https://cdn.pixabay.com/photo/2019/12/20/01/11/headshot-4707400_1280.jpg', CAST(N'2020-12-04T21:49:33.610' AS DateTime))
GO
INSERT [dbo].[Users] ([Id], [IsActive], [FirebaseUid], [Email], [Password], [FirstName], [LastName], [PhotoUrl], [DateCreated]) VALUES (20, 1, N'abcd111', N'abc@gmail.com', N'test123', N'frank2', N'jones2', N'frankie photo', CAST(N'2020-12-04T21:50:37.767' AS DateTime))
GO
INSERT [dbo].[Users] ([Id], [IsActive], [FirebaseUid], [Email], [Password], [FirstName], [LastName], [PhotoUrl], [DateCreated]) VALUES (21, 1, N'abc123', N'testing@gmail.com', N'test123', N'TEST5', N'TEST5 LAST NAME', N'https://cdn.pixabay.com/photo/2019/12/20/01/11/headshot-4707400_1280.jpg', CAST(N'2020-12-05T10:14:29.443' AS DateTime))
GO
INSERT [dbo].[Users] ([Id], [IsActive], [FirebaseUid], [Email], [Password], [FirstName], [LastName], [PhotoUrl], [DateCreated]) VALUES (22, 1, NULL, N'test@gmail.com', N'test123', N'test10', N'test', N'test', CAST(N'2020-12-05T10:26:13.397' AS DateTime))
GO
INSERT [dbo].[Users] ([Id], [IsActive], [FirebaseUid], [Email], [Password], [FirstName], [LastName], [PhotoUrl], [DateCreated]) VALUES (23, 1, N'rdfrJO9qfHVccm0HqGgsuF1ps0I3', N'test11@gmail.com', N'test123', N'test11', N'', N'', CAST(N'2020-12-05T10:30:01.683' AS DateTime))
GO
INSERT [dbo].[Users] ([Id], [IsActive], [FirebaseUid], [Email], [Password], [FirstName], [LastName], [PhotoUrl], [DateCreated]) VALUES (24, 1, N'MFnnKbJi3uP5ynhBMctQAuR9Ywh1', N'test12@gmail.com', N'test123', N'test12', N'', N'', CAST(N'2020-12-05T10:45:09.023' AS DateTime))
GO
INSERT [dbo].[Users] ([Id], [IsActive], [FirebaseUid], [Email], [Password], [FirstName], [LastName], [PhotoUrl], [DateCreated]) VALUES (25, 1, N'8LoFpOCQSiNPvAedoYuIlyRmhRN2', N'test13@gmail.com', N'test123', N'test13', N'', N'', CAST(N'2020-12-05T10:47:23.660' AS DateTime))
GO
INSERT [dbo].[Users] ([Id], [IsActive], [FirebaseUid], [Email], [Password], [FirstName], [LastName], [PhotoUrl], [DateCreated]) VALUES (27, 1, N'abc123', N'testing@gmail.com', N'test123', N'TEST99', N'TEST99 LAST NAME', N'https://cdn.pixabay.com/photo/2019/12/20/01/11/headshot-4707400_1280.jpg', CAST(N'2020-12-05T11:01:45.230' AS DateTime))
GO
INSERT [dbo].[Users] ([Id], [IsActive], [FirebaseUid], [Email], [Password], [FirstName], [LastName], [PhotoUrl], [DateCreated]) VALUES (28, 1, N'FBd6N7almmU7YQFIfcUXyGvvfMw1', N'test100@gmail.com', N'test123', N'test100', N'', N'', CAST(N'2020-12-05T11:03:29.370' AS DateTime))
GO
INSERT [dbo].[Users] ([Id], [IsActive], [FirebaseUid], [Email], [Password], [FirstName], [LastName], [PhotoUrl], [DateCreated]) VALUES (29, 1, N'abc123', N'testing@gmail.com', N'test123', N'TEST98', N'TEST98 LAST NAME', N'https://cdn.pixabay.com/photo/2019/12/20/01/11/headshot-4707400_1280.jpg', CAST(N'2020-12-05T11:04:07.200' AS DateTime))
GO
INSERT [dbo].[Users] ([Id], [IsActive], [FirebaseUid], [Email], [Password], [FirstName], [LastName], [PhotoUrl], [DateCreated]) VALUES (30, 1, N'ouzQ2SZ1MJRMPArooPBm4Cs04x83', N'test101@gmail.com', N'test123', N'test101', N'', N'', CAST(N'2020-12-05T11:23:56.460' AS DateTime))
GO
INSERT [dbo].[Users] ([Id], [IsActive], [FirebaseUid], [Email], [Password], [FirstName], [LastName], [PhotoUrl], [DateCreated]) VALUES (31, 1, N'ASSoRo6qRafvyI0vSTtv0ThGgi02', N'melody.foresight@gmail.com', N'test123', N'Melody', N'Foresight', N'https://cf.ltkcdn.net/family/images/std/260525-675x450-Mom_and_son_hugging.jpg', CAST(N'2020-12-19T10:55:02.197' AS DateTime))
GO
INSERT [dbo].[Users] ([Id], [IsActive], [FirebaseUid], [Email], [Password], [FirstName], [LastName], [PhotoUrl], [DateCreated]) VALUES (32, 1, N'iDFOPM0kxPYNCEcWSo13xOW7GeH3', N'jamie.martin@gmail.com', N'test123', N'Jamie', N'Martin', N'https://www.journalpioneer.com/media/photologue/photos/cache/TEL-WEB-12062019-Cindy_Grant_large.JPG', CAST(N'2020-12-19T11:04:03.953' AS DateTime))
GO
INSERT [dbo].[Users] ([Id], [IsActive], [FirebaseUid], [Email], [Password], [FirstName], [LastName], [PhotoUrl], [DateCreated]) VALUES (33, 1, N'KC3GmJmcgQXS3HlqytArw9LbS5g2', N'martina.fanta@gmail.com', N'test123', N'Martina', N'Fanta', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQUtjzr0p3w3EjU8fgy4f1bUS4OvpWxXSH1jA&usqp=CAU', CAST(N'2020-12-19T11:08:12.470' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[GameAges]  WITH CHECK ADD FOREIGN KEY([AgeId])
REFERENCES [dbo].[Ages] ([Id])
GO
ALTER TABLE [dbo].[GameAges]  WITH CHECK ADD FOREIGN KEY([GameId])
REFERENCES [dbo].[Games] ([Id])
GO
ALTER TABLE [dbo].[GameInstruments]  WITH CHECK ADD FOREIGN KEY([GameId])
REFERENCES [dbo].[Games] ([Id])
GO
ALTER TABLE [dbo].[GameInstruments]  WITH CHECK ADD FOREIGN KEY([InstrumentId])
REFERENCES [dbo].[Instruments] ([Id])
GO
ALTER TABLE [dbo].[Games]  WITH CHECK ADD FOREIGN KEY([GameIconId])
REFERENCES [dbo].[GameIcons] ([Id])
GO
ALTER TABLE [dbo].[Games]  WITH CHECK ADD FOREIGN KEY([PreworkLevelId])
REFERENCES [dbo].[PreworkLevels] ([Id])
GO
ALTER TABLE [dbo].[Games]  WITH CHECK ADD FOREIGN KEY([SubmittedByUserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[PracticePlanGames]  WITH CHECK ADD FOREIGN KEY([GameId])
REFERENCES [dbo].[Games] ([Id])
GO
ALTER TABLE [dbo].[PracticePlanGames]  WITH CHECK ADD FOREIGN KEY([PracticePlanId])
REFERENCES [dbo].[PracticePlans] ([Id])
GO
ALTER TABLE [dbo].[PracticePlans]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UserChildren]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UserPhotos]  WITH CHECK ADD FOREIGN KEY([GameId])
REFERENCES [dbo].[Games] ([Id])
GO
ALTER TABLE [dbo].[UserPhotos]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UserRatings]  WITH CHECK ADD FOREIGN KEY([GameId])
REFERENCES [dbo].[Games] ([Id])
GO
ALTER TABLE [dbo].[UserRatings]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UserReviews]  WITH CHECK ADD FOREIGN KEY([GameId])
REFERENCES [dbo].[Games] ([Id])
GO
ALTER TABLE [dbo].[UserReviews]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
USE [master]
GO
ALTER DATABASE [BackendCapstone] SET  READ_WRITE 
GO
