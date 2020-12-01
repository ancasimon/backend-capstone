CREATE TABLE Ages (
	Id int Identity(1,1) Primary Key not null,
	[Name] nvarchar(25) not null,
	IconUrl nvarchar(1000) null
);

CREATE TABLE Instruments (
	Id int Identity(1,1) Primary Key not null,
	[Name] nvarchar(25) not null,
	IconUrl nvarchar(1000) null
);

CREATE TABLE PreworkLevels (
	Id int Identity(1,1) Primary Key not null,
	[Name] nvarchar(25) not null,
	IconUrl nvarchar(1000) null
);

CREATE TABLE GameIcons (
	Id int Identity(1,1) Primary Key not null,
	[Name] nvarchar(25) not null,
	IconUrl nvarchar(1000) null
);

CREATE TABLE Users (
	Id int Identity(1,1) Primary Key not null,
	IsActive bit not null,
	FirebaseUid nvarchar(50) null,
	Email nvarchar(100) not null,
	[Password] nvarchar(50) not null,
	FirstName nvarchar(50) not null,
	LastName nvarchar(50) not null,
	PhotoUrl nvarchar(1000) null,
	DateCreated datetime not null,
);

CREATE TABLE Games (
	Id int Identity(1,1) Primary Key not null,
	[Name] nvarchar(250) not null,
	IsActive bit not null,
	Songs nvarchar(1000) null,
	[Description] nvarchar(1000) null,
	PreworkLevelId int not null,
	FOREIGN KEY(PreworkLevelId) REFERENCES PreworkLevels(Id),
	Prework nvarchar(1000) null, 
	Instructions nvarchar(1000) null, 
	Credit nvarchar(1000) null, 
	WebsiteUrl nvarchar(1000) null, 
	SubmittedByUserId int null,
	FOREIGN KEY(SubmittedByUserId) REFERENCES Users(Id),
	DateCreated datetime not null, 
	GameIconId int null, 
	FOREIGN KEY(GameIconId) REFERENCES GameIcons(Id),
);

-- ADDED later:
ALTER TABLE Games
ADD PhotoUrl nvarchar(1000) null,
	Keywords nvarchar(1000) null

CREATE TABLE GameAges (
	Id int Identity(1,1) Primary Key not null, 
	GameId int not null, 
	FOREIGN KEY(GameId) REFERENCES Games(Id),
	AgeId int not null, 
	FOREIGN KEY(AgeId) REFERENCES Ages(Id),
);

CREATE TABLE GameInstruments (
	Id int Identity(1,1) Primary Key not null, 
	GameId int not null,
	FOREIGN KEY(GameId) REFERENCES Games(Id),
	InstrumentId int not null, 
	FOREIGN KEY(InstrumentId) REFERENCES Instruments(Id),
);

CREATE TABLE UserReviews (
	Id int Identity(1,1) Primary Key not null,
	UserId int not null,
	FOREIGN KEY(UserId) REFERENCES Users(Id),
	GameId int not null, 
	FOREIGN KEY(GameId) REFERENCES Games(Id),
	Comment nvarchar(1000) not null, 
	IsActive bit not null, 
	DateCreated datetime not null, 
);

CREATE TABLE UserPhotos (
	Id int Identity(1,1) Primary Key not null,
	UserId int not null,
	FOREIGN KEY(UserId) REFERENCES Users(Id),
	GameId int not null, 
	FOREIGN KEY(GameId) REFERENCES Games(Id),
	Comment nvarchar(1000) not null, 
	PhotoUrl nvarchar(1000) not null, 
	IsActive bit not null, 
	DateCreated datetime not null, 
);

CREATE TABLE UserRatings (
	Id int Identity(1,1) Primary Key not null,
	UserId int not null,
	FOREIGN KEY(UserId) REFERENCES Users(Id),
	GameId int not null, 
	FOREIGN KEY(GameId) REFERENCES Games(Id),
	Value int not null, 
	IsActive bit not null, 
	DateCreated datetime not null, 
);

CREATE TABLE UserChildren (
	Id int Identity(1,1) Primary Key not null, 
	UserId int not null, 
	FOREIGN KEY(UserId) REFERENCES Users(Id),
	ChildName nvarchar(100) not null, 
	ChildBirthday datetime null, 
	ChildOrder int null,
);

CREATE TABLE PracticePlans (
	Id int Identity(1,1) Primary Key not null, 
	Name nvarchar(500) not null, 
	UserId int not null, 
	FOREIGN KEY(UserId) REFERENCES Users(Id),
	StartDate datetime null, 
	EndDate datetime null,
	IsActive bit not null,
);

CREATE TABLE PracticePlanGames (
	Id int Identity(1,1) Primary Key not null, 
	Name nvarchar(250) not null, 
	PracticePlanId int not null, 
	FOREIGN KEY(PracticePlanId) REFERENCES PracticePlans(Id),
	GameId int not null,
	FOREIGN KEY(GameId) REFERENCES Games(Id), 
	PracticeDate datetime null, 
	UserNotes nvarchar(1000) null, 
	IsCompleted bit not null,
	IsActive bit not null,
);

INSERT INTO Ages([Name],IconUrl)
VALUES('Preschool', 'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/child.svg')

INSERT INTO Ages([Name],IconUrl)
VALUES('Elementary', 'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/brands/etsy.svg')

INSERT INTO Ages([Name],IconUrl)
VALUES('Middle School', 'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/brands/monero.svg')


INSERT INTO Ages([Name],IconUrl)
VALUES('High School', 'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/heading.svg')


INSERT INTO Ages([Name],IconUrl)
VALUES('All', 'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/universal-access.svg')




INSERT INTO Instruments([Name],IconUrl)
VALUES('All', 'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/universal-access.svg')

INSERT INTO Instruments([Name])
VALUES('Cello')

INSERT INTO Instruments([Name])
VALUES('Piano')

INSERT INTO Instruments([Name])
VALUES('Viola')

INSERT INTO Instruments([Name])
VALUES('Violin')

INSERT INTO Instruments([Name])
VALUES('Ukelele')

INSERT INTO Instruments([Name])
VALUES('Other')



INSERT INTO PreworkLevels([Name], IconUrl)
VALUES('None', 'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/brands/creative-commons-zero.svg')

INSERT INTO PreworkLevels([Name], IconUrl)
VALUES('Low (<1 hour)', '')

INSERT INTO PreworkLevels([Name], IconUrl)
VALUES('Medium (1-4 hours)', '')

INSERT INTO PreworkLevels([Name], IconUrl)
VALUES('High (>4 hours)', '')

insert into Users(firstName, lastName,email,dateCreated,password,IsActive,photoUrl,firebaseUid)
values('Felix', 'Jordan', 'felix.jordan@gmail.com', '2020', 'password123', 1,'https://cdn.pixabay.com/photo/2019/12/20/01/11/headshot-4707400_1280.jpg','')

insert into Users(firstName, lastName,email,dateCreated,password,IsActive,photoUrl,firebaseUid)
values('Georgia', 'Knox', 'georgia.knox@gmail.com', '2020', 'password123', 1, 'https://cdn.pixabay.com/photo/2015/03/04/19/41/woman-659348__480.jpg','')

insert into Users(firstName, lastName,email,dateCreated,password,IsActive,photoUrl,firebaseUid)
values('Maria', 'Paxton', 'maria.paxton@gmail.com', '2020', 'password123', 1,'https://cdn.pixabay.com/photo/2015/03/04/19/43/woman-659354__480.jpg','')

insert into Users(firstName, lastName,email,dateCreated,password,IsActive,photoUrl,firebaseUid)
values('Jonathan', 'McKnight', 'jonathan.mcknight@gmail.com', '2020', 'password123', 1,'https://cdn.pixabay.com/photo/2016/11/08/00/21/autumn-1807190__480.jpg','')

insert into Users(firstName, lastName,email,dateCreated,password,IsActive,photoUrl,firebaseUid)
values('Tony', 'Pizzicato', 'tony.pizzicato@gmail.com', '2020', 'password123', 1,'https://cdn.pixabay.com/photo/2012/04/26/14/32/man-42645__480.png','')

insert into Users(firstName, lastName,email,dateCreated,password,IsActive,photoUrl,firebaseUid)
values('Angela', 'Andantino', 'angela.andantino@gmail.com', '2020', 'password123', 1,'https://cdn.pixabay.com/photo/2016/06/15/23/20/woman-1460150__480.jpg','')

insert into Users(firstName, lastName,email,dateCreated,password,IsActive,photoUrl,firebaseUid)
values('Theresa', 'Fiorelli', 'theresa.fiorelli@gmail.com', '2020', 'password123', 1,'https://cdn.pixabay.com/photo/2019/10/04/13/19/woman-4525646__480.jpg','')

insert into Users(firstName, lastName,email,dateCreated,password,IsActive,photoUrl,firebaseUid)
values('Fred', 'Allegro', 'fred.allegro@gmail.com', '2020', 'password123', 1,'https://cdn.pixabay.com/photo/2016/08/11/02/57/headshot-1584735__480.jpg','')

insert into Users(firstName, lastName,email,dateCreated,password,IsActive,photoUrl,firebaseUid)
values('Jeremy', 'Ritardando', 'jeremy.ritardando@gmail.com', '2020', 'password123', 1,'https://cdn.pixabay.com/photo/2016/09/24/03/20/people-1690965__480.jpg','')

insert into Users(firstName, lastName,email,dateCreated,password,IsActive,photoUrl,firebaseUid)
values('Martina', 'Nelson', 'martin.nelson@gmail.com', '2020', 'password123', 1,'https://cdn.pixabay.com/photo/2017/02/16/23/10/smile-2072907__480.jpg','')

insert into Users(firstName, lastName,email,dateCreated,password,IsActive,photoUrl,firebaseUid)
values('Arthur', 'Coal', 'arthur.coal@gmail.com', '2020', 'password123', 1,'https://cdn.pixabay.com/photo/2017/09/25/13/12/man-2785071_1280.jpg','')

insert into Users(firstName, lastName,email,dateCreated,password,IsActive,photoUrl,firebaseUid)
values('Sylvan', 'McWheeler', 'sylvan.mcwheeler@gmail.com', '2020', 'password123', 1,'https://cdn.pixabay.com/photo/2015/03/03/18/58/girl-657753__480.jpg','')

insert into Users(firstName, lastName,email,dateCreated,password,IsActive,photoUrl,firebaseUid)
values('Stephanie', 'Plum', 'stephanie.plum@gmail.com', '2020', 'password123', 1,'https://ca-times.brightspotcdn.com/dims4/default/2f4d391/2147483647/strip/true/crop/3200x4000+0+0/resize/840x1050!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2F80%2Fa4%2F6ee9ea8e4c1382bb213f66b19f59%2Fla-photos-handouts-la-ca-twisted-twenty-six-book-111.JPG','')





INSERT INTO GameIcons([Name],[IconUrl])
VALUES('Dice', 'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/dice.svg')

INSERT INTO GameIcons([Name],[IconUrl])
VALUES('Dice-six', 'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/dice-six.svg')

INSERT INTO GameIcons([Name],[IconUrl])
VALUES('Dice-one', 'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/dice-one.svg')

INSERT INTO GameIcons([Name],[IconUrl])
VALUES('Hands', 'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/hands.svg')

INSERT INTO GameIcons([Name],[IconUrl])
VALUES('Chess-knight', 'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/chess-knight.svg')

INSERT INTO GameIcons([Name],[IconUrl])
VALUES('Puzzle-piece', 'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/puzzle-piece.svg')

INSERT INTO GameIcons([Name],[IconUrl])
VALUES('Trophy', 'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/trophy.svg')

INSERT INTO GameIcons([Name],[IconUrl])
VALUES('Heart', 'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/heart.svg')

INSERT INTO GameIcons([Name],[IconUrl])
VALUES('Hat-wizard', 'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/hat-wizard.svg')

INSERT INTO GameIcons([Name],[IconUrl])
VALUES('Video', 'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/video.svg')

INSERT INTO GameIcons([Name],[IconUrl])
VALUES('Music', 'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/music.svg')

INSERT INTO GameIcons([Name],[IconUrl])
VALUES('Play-circle', 'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/play-circle.svg')

INSERT INTO GameIcons([Name],[IconUrl])
VALUES('Drum', 'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/drum.svg')

INSERT INTO GameIcons([Name],[IconUrl])
VALUES('Clipboard-list', 'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/clipboard-list.svg')

INSERT INTO GameIcons([Name],[IconUrl])
VALUES('Sleigh', 'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/sleigh.svg')

INSERT INTO GameIcons([Name],[IconUrl])
VALUES('Exclamation-triangle', 'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/exclamation-triangle.svg')

INSERT INTO GameIcons([Name],[IconUrl])
VALUES('History', 'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/history.svg')

INSERT INTO GameIcons([Name],[IconUrl])
VALUES('Vector-square', 'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/vector-square.svg')

INSERT INTO GameIcons([Name],[IconUrl])
VALUES('Hourglass-half', 'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/hourglass-half.svg')

INSERT INTO GameIcons([Name],[IconUrl])
VALUES('Globe', 'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/globe.svg')

INSERT INTO GameIcons([Name],[IconUrl])
VALUES('Map-signs', 'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/map-signs.svg')

INSERT INTO GameIcons([Name],[IconUrl])
VALUES('Map-pin', 'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/map-pin.svg')

INSERT INTO GameIcons([Name],[IconUrl])
VALUES('Directions', 'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/directions.svg')

INSERT INTO GameIcons([Name],[IconUrl])
VALUES('Street-view', 'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/street-view.svg')

INSERT INTO GameIcons([Name],[IconUrl])
VALUES('Traffic-light', 'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/traffic-light.svg')

INSERT INTO GameIcons([Name],[IconUrl])
VALUES('Binoculars', 'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/binoculars.svg')

INSERT INTO GameIcons([Name],[IconUrl])
VALUES('Key', 'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/key.svg')

INSERT INTO GameIcons([Name],[IconUrl])
VALUES('Gift', 'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/gift.svg')

INSERT INTO GameIcons([Name],[IconUrl])
VALUES('Gifts', 'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/gifts.svg')

INSERT INTO GameIcons([Name],[IconUrl])
VALUES('Eye', 'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/eye.svg')

INSERT INTO GameIcons([Name],[IconUrl])
VALUES('Birthday-cake', 'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/birthday-cake.svg')

INSERT INTO GameIcons([Name],[IconUrl])
VALUES('Plane-departure', 'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/plane-departure.svg')

INSERT INTO GameIcons([Name],[IconUrl])
VALUES('Snowman', 'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/snowman.svg')

INSERT INTO GameIcons([Name],[IconUrl])
VALUES('Shapes', 'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/shapes.svg')

INSERT INTO GameIcons([Name],[IconUrl])
VALUES('Robot', 'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/robot.svg')

INSERT INTO GameIcons([Name],[IconUrl])
VALUES('Ice-cream', 'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/ice-cream.svg')

INSERT INTO GameIcons([Name],[IconUrl])
VALUES('Gem', 'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/regular/gem.svg')

INSERT INTO GameIcons([Name],[IconUrl])
VALUES('Clock', 'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/regular/clock.svg')

INSERT INTO GameIcons([Name],[IconUrl])
VALUES('Lock-open', 'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/lock-open.svg')

INSERT INTO GameIcons([Name],[IconUrl])
VALUES('Money-bill-alt', 'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/regular/money-bill-alt.svg')

INSERT INTO GameIcons([Name],[IconUrl])
VALUES('Camera', 'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/camera.svg')

INSERT INTO GameIcons([Name],[IconUrl])
VALUES('Star', 'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/regular/star.svg')

INSERT INTO GameIcons([Name],[IconUrl])
VALUES('Bell', 'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/regular/bell.svg')

INSERT INTO GameIcons([Name],[IconUrl])
VALUES('Layer-group', 'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/layer-group.svg')

INSERT INTO GameIcons([Name],[IconUrl])
VALUES('Ethereum', 'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/brands/ethereum.svg')

INSERT INTO GameIcons([Name],[IconUrl])
VALUES('Rainbow', 'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/rainbow.svg')

INSERT INTO GameIcons([Name],[IconUrl])
VALUES('Sun', 'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/sun.svg')

INSERT INTO GameIcons([Name],[IconUrl])
VALUES('Users', 'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/users.svg')

INSERT INTO GameIcons([Name],[IconUrl])
VALUES('Grin-stars', 'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/grin-stars.svg')

INSERT INTO GameIcons([Name],[IconUrl])
VALUES('Medal', 'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/medal.svg')

INSERT INTO GameIcons([Name],[IconUrl])
VALUES('Magic', 'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/magic.svg')

INSERT INTO GameIcons([Name],[IconUrl])
VALUES('Dragon','https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/dragon.svg')

INSERT INTO GameIcons([Name],[IconUrl])
VALUES('Grin-beam','https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/grin-beam.svg')

INSERT INTO GameIcons([Name],[IconUrl])
VALUES('Grin-hearts', 'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/grin-hearts.svg')

INSERT INTO GameIcons([Name],[IconUrl])
VALUES('Anchor', 'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/anchor.svg')

INSERT INTO GameIcons([Name],[IconUrl])
VALUES('User-circle', 'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/user-circle.svg')

INSERT INTO GameIcons([Name],[IconUrl])
VALUES('Chalkboard-teacher', 'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/chalkboard-teacher.svg')

INSERT INTO GameIcons([Name],[IconUrl])
VALUES('Balance-scale','https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/balance-scale.svg')

INSERT INTO GameIcons([Name],[IconUrl])
VALUES('User-friends', 'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/user-friends.svg')

INSERT INTO GameIcons([Name],[IconUrl])
VALUES('User-cog', 'https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/svgs/solid/user-cog.svg')







INSERT INTO PracticePlans(Name, UserId, StartDate,EndDate,IsActive)
VALUES('January Week 1', 1, 2021-01-03,2021-01-09,1)

INSERT INTO PracticePlans(Name, UserId, StartDate,EndDate,IsActive)
VALUES('January Week 2', 1, 2021-01-10,2021-01-16,1)

INSERT INTO PracticePlans(Name, UserId, StartDate,EndDate,IsActive)
VALUES('January Week 3', 1, 2021-01-17,2021-01-23,1)

INSERT INTO PracticePlans(Name, UserId, StartDate,EndDate,IsActive)
VALUES('January Week 4', 1, 2021-01-24,2021-01-30,1)

INSERT INTO PracticePlans(Name, UserId, StartDate,EndDate,IsActive)
VALUES('Smokies Vacation', 2, 2020-07-01,2020-07-07,1)

INSERT INTO PracticePlans(Name, UserId, StartDate,EndDate,IsActive)
VALUES('Pensacola Trip', 2, 2021-05-20,2021-05-27,1)

INSERT INTO PracticePlans(Name, UserId, StartDate,EndDate,IsActive)
VALUES('Practice Challenge - September', 3, 2020-09-01,2020-09-30,1)

INSERT INTO PracticePlans(Name, UserId, StartDate,EndDate,IsActive)
VALUES('Practice Challenge - October', 3, 2020-10-01,2020-10-31,1)

INSERT INTO PracticePlans(Name, UserId, StartDate,EndDate,IsActive)
VALUES('Christmas Recital Prep', 4, 2020-12-15,2020-12-24,1)

INSERT INTO PracticePlans(Name, UserId, StartDate,EndDate,IsActive)
VALUES('Halloween School Recital Prep', 4, 2020-10-20,2020-10-30,1)




INSERT INTO UserChildren(UserId, ChildName, ChildBirthday,ChildOrder)
VALUES(1,'Austin',2010-01-01,1)

INSERT INTO UserChildren(UserId, ChildName, ChildBirthday,ChildOrder)
VALUES(1,'Madison',2015-03-01,2)

INSERT INTO UserChildren(UserId, ChildName, ChildBirthday,ChildOrder)
VALUES(2,'Jenn',2016-07-01,1)

INSERT INTO UserChildren(UserId, ChildName, ChildBirthday,ChildOrder)
VALUES(3,'Sam',2013-10-01,1)

INSERT INTO UserChildren(UserId, ChildName, ChildBirthday,ChildOrder)
VALUES(4,'Victoria',2010-02-15,1)

INSERT INTO UserChildren(UserId, ChildName, ChildBirthday,ChildOrder)
VALUES(4,'Veronica',2012-04-15,2)

INSERT INTO UserChildren(UserId, ChildName, ChildBirthday,ChildOrder)
VALUES(4,'Vincent',2015-07-01,3)

INSERT INTO UserChildren(UserId, ChildName, ChildBirthday,ChildOrder)
VALUES(5,'Greta',2008-02-01,1)

INSERT INTO UserChildren(UserId, ChildName, ChildBirthday,ChildOrder)
VALUES(6,'Marcus',2007-06-15,1)

INSERT INTO UserChildren(UserId, ChildName, ChildBirthday,ChildOrder)
VALUES(7,'Gina',2007-06-01,1)

INSERT INTO UserChildren(UserId, ChildName, ChildBirthday,ChildOrder)
VALUES(8,'Mary',2008-07-01,1)

INSERT INTO UserChildren(UserId, ChildName, ChildBirthday,ChildOrder)
VALUES(9,'Olivia',2009-09-01,1)




INSERT INTO [dbo].[Games]
           ([Name],[IsActive],[Songs],[Description],[PreworkLevelId],[Prework],[Instructions],[Credit],[WebsiteUrl],[SubmittedByUserId],[DateCreated],[GameIconId],[PhotoUrl],[Keywords])
     VALUES('Countdown to Valentine�s Day Practice Chart',1,'','Improve a specific set of skills or difficult spot by working on it 100 times!',1,'Print the chart and pick a reward to give the student.','1. Print the chart. 
 2. Pick a set of skills to focus on. 
 3. Have the student mark down every time they practice that specific skill set or difficult spot.
 4. Reward the student when they read 100 practices for this skill set!','Suzuki Violin Practice Shop','https://www.teacherspayteachers.com/Product/Suzuki-5-Practice-Chart-Valentines-Day-3592686',1,2020-01-01,1,'https://ecdn.teacherspayteachers.com/thumbitem/Suzuki-5-Practice-Chart-Valentine-s-Day-3592686-1554897191/original-3592686-1.jpg','Practice Chart, Valentine�s Day,')
GO



INSERT INTO [dbo].[Games]
           ([Name],[IsActive],[Songs],[Description],[PreworkLevelId],[Prework],[Instructions],[Credit],[WebsiteUrl],[SubmittedByUserId],[DateCreated],[GameIconId],[PhotoUrl],[Keywords])
     VALUES('Review Songs Card Game',1,'','Reviewing past repertoire songs is an important component of a child�s ongoing development given that all new songs build on skills learned in prior songs. But reviewing past songs doesn�t have to be a bore!',2,'Buy the cards (or make them).','1. Shuffle cards.
 2. Let child pick 2 review song cards to practice that day /week.','Suzuki 5 Practice Shop','https://www.teacherspayteachers.com/Product/Valentines-Day-Suzuki-5-Review-Cards-Book-1-3588897',2,2020-01-01,2,'https://ecdn.teacherspayteachers.com/thumbitem/Valentine-s-Day-Suzuki-5-Review-Cards-Book-1-3588897-1551559262/original-3588897-2.jpg','Review, Cards, Valentine�s Day')
GO

INSERT INTO [dbo].[Games]
           ([Name],[IsActive],[Songs],[Description],[PreworkLevelId],[Prework],[Instructions],[Credit],[WebsiteUrl],[SubmittedByUserId],[DateCreated],[GameIconId],[PhotoUrl],[Keywords])
     VALUES('Task Cards',1,'','Help your student practice specific skills with new or past songs while giving them the independence of picking the skill to work on themselves and the fun surprise element of not knowing which one they will pick!',2,'Buy the cards (or make them).','1. Shuffle cards.
 2. Let child pick 2 review song cards to practice that day /week.','Suzuki 5 Practice Shop','https://www.teacherspayteachers.com/Product/Suzuki-5-Valentines-Cards-3631183',3,2020-01-01,3,'https://ecdn.teacherspayteachers.com/thumbitem/Suzuki-5-Valentine-s-Cards-3631183-1581247051/original-3631183-3.jpg','Review, Cards, Valentine�s Day')
GO

INSERT INTO [dbo].[Games]
           ([Name],[IsActive],[Songs],[Description],[PreworkLevelId],[Prework],[Instructions],[Credit],[WebsiteUrl],[SubmittedByUserId],[DateCreated],[GameIconId],[PhotoUrl],[Keywords])
     VALUES('Music Tour',1,'','Take the student �on tour� �playing something different in each room of the house, on the front or back porch or in a different places in the yard.',1,'None','1. Ask the student to pick 5 (or the number of songs they need to play) places in the house / neighborhood where they would like to practice. 
 1. Go to each location and play.
 1. Notice how the instrument sound may be different in different locations - for example, based on room size or whether it is inside or outside.','Sarah Mitchell','',4,2020-01-01,4,'https://cdn.pixabay.com/photo/2016/08/24/19/18/5-1617787_1280.jpg','Review, Home, House')
GO


INSERT INTO [dbo].[Games]
           ([Name],[IsActive],[Songs],[Description],[PreworkLevelId],[Prework],[Instructions],[Credit],[WebsiteUrl],[SubmittedByUserId],[DateCreated],[GameIconId],[PhotoUrl],[Keywords])
     VALUES(
'Number Game',1,'','Foster independence by allowing your child to pick how many times they will practice a given skill or difficult practice spot.',2,'1. Write numbers 1-9 on a set of cards.','1. Lay the cards out on the floor. 
 2. Identify the tasks the child needs to practice and start going through the task list.
 3. Let them pick a number - and that tells them how many times they need to do the next task.','Maria @ Music Teaching and Parenting','https://www.musicteachingandparenting.com/suzuki-violin-games-for-the-young-ones/',5,2020-01-01,6,'https://www.musicteachingandparenting.com/wp-content/uploads/2013/03/IMG_0373.jpg','Practice Spot, Cards')
GO

INSERT INTO [dbo].[Games]
           ([Name],[IsActive],[Songs],[Description],[PreworkLevelId],[Prework],[Instructions],[Credit],[WebsiteUrl],[SubmittedByUserId],[DateCreated],[GameIconId],[PhotoUrl],[Keywords])
     VALUES(
	 'Treasure Hunt',1,'','Who doesn�t love a good treasure hunt? The thrill of finding the next treasure will make them forget this even counts as practice!',2,'1. Tape instructions for practice assignments to little toys or candy. 
 2. Hide them throughout the house.','As the child finds each treasure, they need to complete the challenge to move on to hunt for the next treasure.','Maria @ Music Teaching and Parenting','https://www.musicteachingandparenting.com/suzuki-violin-practice-games-piano/',6,2020-01-01,7,'https://cdn.pixabay.com/photo/2015/02/01/17/06/treasure-chest-619868_1280.jpg','Practice Spot, Hunt'
)
GO

INSERT INTO [dbo].[Games]
           ([Name],[IsActive],[Songs],[Description],[PreworkLevelId],[Prework],[Instructions],[Credit],[WebsiteUrl],[SubmittedByUserId],[DateCreated],[GameIconId],[PhotoUrl],[Keywords])
     VALUES(
	 'Board Game',1,'','Make a board game that has the child advance along the board by practicing the tasks assigned by where he lands.',3,'1. Find a big piece of cardboard and colorful construction paper.
 2. Write the practice activities on different pieces of paper and tape them along the edge of the cardboard. 
 3. Fun tip: Include some extra fun unexpected activities such as hug your baby sister, kiss mom, get a cookie.
 4. Indicate the START and FINISH places.
 5. Have a die ready to go.','1. Have the child roll the die to start the game.
 2. The child has to complete the activity on which he landed before he can move to it. 
 3. You can take turns rolling the die. 
 4. Keep rolling until someone (everyone?) reaches the Finish line.','','',7,2020-01-01,8,'https://cdn.pixabay.com/photo/2017/10/01/17/22/goose-game-2806291__480.jpg','Practice Spot, Review, Game, Board Game, Dice'
)
GO

INSERT INTO [dbo].[Games]
           ([Name],[IsActive],[Songs],[Description],[PreworkLevelId],[Prework],[Instructions],[Credit],[WebsiteUrl],[SubmittedByUserId],[DateCreated],[GameIconId],[PhotoUrl],[Keywords])
     VALUES(
'Bow Parts Song',1,'Bow Parts Song','Sing the parts of the bow to make it easier to remember them.',1,'None','1. Parent asks the question: Where is the frog? And the child answers in the same note: Here is the frog. 
 2. Parent keeps asking question, raising the pitch with each question and having the child match her pitch. 
 3. Show the child how to make exaggerated dramatic No No No hand gestures to answer the last question: Where is the hair? Answer: DON�T TOUCH THE HAIR!','Sarah Mitchell','',8,2020-01-01,9,'https://cdn.pixabay.com/photo/2018/05/12/23/47/5-3394881_1280.jpg','Bow, Song, Car, Travel'
)
GO

INSERT INTO [dbo].[Games]
           ([Name],[IsActive],[Songs],[Description],[PreworkLevelId],[Prework],[Instructions],[Credit],[WebsiteUrl],[SubmittedByUserId],[DateCreated],[GameIconId],[PhotoUrl],[Keywords])
     VALUES(
'Violin Parts Song',1,'Violin Parts Song','Sing the parts of the violin to make it easier to remember them.',1,'None','1. Parent asks the question: Where is the frog? And the child answers in the same note: Here is the frog. 
 2. Parent keeps asking question, raising the pitch with each question and having the child match her pitch.','Sarah Mitchell','',9,2020-01-01,10,'https://cdn.pixabay.com/photo/2018/02/04/23/14/wood-3131120_1280.jpg','Violin, Song, Car, Travel')
GO

INSERT INTO [dbo].[Games]
           ([Name],[IsActive],[Songs],[Description],[PreworkLevelId],[Prework],[Instructions],[Credit],[WebsiteUrl],[SubmittedByUserId],[DateCreated],[GameIconId],[PhotoUrl],[Keywords])
VALUES(
'Sing it!',1,'Suzuki Curriculum Songs','Sing lyrics to the Suzuki curriculum songs to make it easier to remember them.',2,'1. Find the song lyrics online.','1. Sing the lyrics with your child when you listen to the CD.','Suzuki Practice Is Fun','http://suzukipracticeisfun.blogspot.com/2012/10/are-you-and-your-child-listening-to.html',10,2020-01-01,11,'https://media.istockphoto.com/photos/lyrics-written-on-an-old-typewriter-picture-id1011442690','Car, Travel, Lyrics, Review'
)
GO

INSERT INTO [dbo].[Games]
           ([Name],[IsActive],[Songs],[Description],[PreworkLevelId],[Prework],[Instructions],[Credit],[WebsiteUrl],[SubmittedByUserId],[DateCreated],[GameIconId],[PhotoUrl],[Keywords])
VALUES(
'Clap Clap Clap Your Hands',1,'Twinkle Variations','Listen to the Twinkle variations and clap the rhythms together.',1,'None','1. Listen to the Twinkle variations on the practice CD and clap along. 
 2. Take turns clapping a rhythm and having the child / parent guess the rhythm.','Maria @ Music Teaching and Parenting','https://www.musicteachingandparenting.com/suzuki-violin-practice-games-listening-challenge/',11,2020-01-01,12,'https://cdn.pixabay.com/photo/2013/11/24/11/11/happy-217089__480.jpg','Car, Travel'
 )
GO

VALUES(
'Birthday Candle',1,'','Let the time it takes for a birthday candle to burn dictate the length of the practice session!',2,'Get a set of birthday candles.','Light a birthday candle (make some type of holder) and have that be the length of the practice session.','Suzuki Association of the Americas','https://static1.squarespace.com/static/590a327459cc68c870460707/t/59c14d990abd04286b87c33b/1505840540058/Practicing+Games-A+Collection.pdf',1,'2020-01-01',12,'https://cdn.pixabay.com/photo/2018/07/22/16/36/muffin-3554917_1280.jpg','Home, House')
GO

INSERT INTO [dbo].[Games]
           ([Name],[IsActive],[Songs],[Description],[PreworkLevelId],[Prework],[Instructions],[Credit],[WebsiteUrl],[SubmittedByUserId],[DateCreated],[GameIconId],[PhotoUrl],[Keywords])
VALUES(
'"6" things a day',1,'','Pick 6 things to practice, and that�s your practice session for the day!',1,'None','Pick 6 things to practice. For example�10 perfect bow holds (counts as 1 thing), some drill work on the working piece, 3 review pieces, preview for next piece.','Suzuki Association of the Americas','https://static1.squarespace.com/static/590a327459cc68c870460707/t/59c14d990abd04286b87c33b/1505840540058/Practicing+Games-A+Collection.pdf',2,'2020-01-01',13,'https://cdn.pixabay.com/photo/2014/09/07/15/35/number-437924__480.jpg','Practice Spot, Review'
)
GO

INSERT INTO [dbo].[Games]
           ([Name],[IsActive],[Songs],[Description],[PreworkLevelId],[Prework],[Instructions],[Credit],[WebsiteUrl],[SubmittedByUserId],[DateCreated],[GameIconId],[PhotoUrl],[Keywords])
VALUES(
'Student as Parent',1,'','Let the student be the parent for one day of practice.',1,'None','Let the student be the parent for one day of practice.','Suzuki Association of the Americas','https://static1.squarespace.com/static/590a327459cc68c870460707/t/59c14d990abd04286b87c33b/1505840540058/Practicing+Games-A+Collection.pdf',3,'2020-01-01',14,'https://cdn.pixabay.com/photo/2016/08/17/04/27/mother-1599653__480.jpg','Practice Spot, Review, Student-Led'
)
GO

INSERT INTO [dbo].[Games]
           ([Name],[IsActive],[Songs],[Description],[PreworkLevelId],[Prework],[Instructions],[Credit],[WebsiteUrl],[SubmittedByUserId],[DateCreated],[GameIconId],[PhotoUrl],[Keywords])
VALUES(
'25 minutes = 25 cents',1,'','Practice for 25 minutes, earn 25 cents.',1,'None','Let the student cash in on their practices!','Suzuki Association of the Americas','https://static1.squarespace.com/static/590a327459cc68c870460707/t/59c14d990abd04286b87c33b/1505840540058/Practicing+Games-A+Collection.pdf',4,'2020-01-01',15,'https://cdn.pixabay.com/photo/2017/11/02/18/55/jar-2912135__480.jpg','Money'
)
GO

INSERT INTO [dbo].[Games]
           ([Name],[IsActive],[Songs],[Description],[PreworkLevelId],[Prework],[Instructions],[Credit],[WebsiteUrl],[SubmittedByUserId],[DateCreated],[GameIconId],[PhotoUrl],[Keywords])
VALUES(
'Family Recital',1,'','Plan a recital for stuffed animals, friends, family, etc.',2,'1. Pick a time and date. 
 2. Have the child make and send out invitations if inviting family members. 
 3. Have the child make a program and decorate it. 
 4. Let the child pick refreshments to serve.','1. Send out invitations. 
 2. Let the child select the pieces that will be played.
 3. Practice for a week in preparation. 
 4. Set up a stage and make a spotlight!','Suzuki Association of the Americas','https://static1.squarespace.com/static/590a327459cc68c870460707/t/59c14d990abd04286b87c33b/1505840540058/Practicing+Games-A+Collection.pdf',5,'2020-01-01',16,'https://cdn.pixabay.com/photo/2016/08/24/19/18/5-1617787__480.jpg','Recital, Show, Family'
 )
GO

INSERT INTO [dbo].[Games]
           ([Name],[IsActive],[Songs],[Description],[PreworkLevelId],[Prework],[Instructions],[Credit],[WebsiteUrl],[SubmittedByUserId],[DateCreated],[GameIconId],[PhotoUrl],[Keywords])
VALUES(
'Roll the Dice',1,'','Roll a dice to determine the number of repetitions of a piece or for drill work.',2,'Buy a package of math dice�these dice have more sides with higher numbers.','Roll a dice to determine the number of repetitions of a piece or for drill work (ex�play this section the number of times you roll on the dice.) Or, roll the dice to determine which measure to play and repeat a certain number of times.','Suzuki Association of the Americas','https://static1.squarespace.com/static/590a327459cc68c870460707/t/59c14d990abd04286b87c33b/1505840540058/Practicing+Games-A+Collection.pdf',6,'2020-01-01',17,'https://cdn.pixabay.com/photo/2015/03/25/23/45/cube-689618__480.jpg','Dice, Practice Spot'
)
GO

INSERT INTO [dbo].[Games]
           ([Name],[IsActive],[Songs],[Description],[PreworkLevelId],[Prework],[Instructions],[Credit],[WebsiteUrl],[SubmittedByUserId],[DateCreated],[GameIconId],[PhotoUrl],[Keywords])
VALUES(
'Choose a Card',1,'','Pick a card from a deck to determine the number of repetitions of a piece or for drill work. Aces count as 1, face cards mean the parent has to perform the task.',2,'Get a deck of cards.','Pick a card from a deck to determine the number of repetitions of a piece or for drill work. Aces count as 1, face cards mean the parent has to perform the task.','Suzuki Association of the Americas','https://static1.squarespace.com/static/590a327459cc68c870460707/t/59c14d990abd04286b87c33b/1505840540058/Practicing+Games-A+Collection.pdf',7,'2020-01-01',18,'https://cdn.pixabay.com/photo/2016/11/29/08/00/card-1868267__480.jpg','Cards, Practice Spot'
)
GO

INSERT INTO [dbo].[Games]
           ([Name],[IsActive],[Songs],[Description],[PreworkLevelId],[Prework],[Instructions],[Credit],[WebsiteUrl],[SubmittedByUserId],[DateCreated],[GameIconId],[PhotoUrl],[Keywords])
VALUES(
'Draw Song',1,'','Write the piece names on pieces of paper. Put in a hat and draw to determine piece to play and order. Or put practice item on paper (bow holds, scales, etc.)',2,'Write the piece names on pieces of paper.','Put all the song names in a hat and draw to determine piece to play and order. Or put practice item on paper (bow holds, scales, etc.)','Suzuki Association of the Americas','https://static1.squarespace.com/static/590a327459cc68c870460707/t/59c14d990abd04286b87c33b/1505840540058/Practicing+Games-A+Collection.pdf',8,'2020-01-01',18,'https://cdn.pixabay.com/photo/2019/04/04/15/52/hare-4103102__480.jpg','Cards, Review'
)
GO

INSERT INTO [dbo].[Games]
           ([Name],[IsActive],[Songs],[Description],[PreworkLevelId],[Prework],[Instructions],[Credit],[WebsiteUrl],[SubmittedByUserId],[DateCreated],[GameIconId],[PhotoUrl],[Keywords])
VALUES(
'Silly Cards',1,'','Make silly cards and let child draw a silly card as a reward. Ex�stand on one foot, stick out your tongue, sing the piece, play pizzicato. For example, if child needs to play Twinkle and draws �stick out your tongue,� must play twinkle with tongue out the whole time. It�s quite amusing.',2,'With the child, make the cards.','Make silly cards and let child draw a silly card as a reward. Ex�stand on one foot, stick out your tongue, sing the piece, play pizzicato. For example, if child needs to play Twinkle and draws �stick out your tongue,� must play twinkle with tongue out the whole time. It�s quite amusing.','Suzuki Association of the Americas','https://static1.squarespace.com/static/590a327459cc68c870460707/t/59c14d990abd04286b87c33b/1505840540058/Practicing+Games-A+Collection.pdf',9,'2020-01-01',19,'https://cdn.pixabay.com/photo/2015/07/08/19/36/person-836793__480.jpg','Cards, Review'
)
GO

INSERT INTO [dbo].[Games]
           ([Name],[IsActive],[Songs],[Description],[PreworkLevelId],[Prework],[Instructions],[Credit],[WebsiteUrl],[SubmittedByUserId],[DateCreated],[GameIconId],[PhotoUrl],[Keywords])
VALUES(
'Make a Video',1,'','Regularly video tape your child playing her instrument. You�ll be amazed at the progress she makes.',1,'None','Regularly video tape your child playing her instrument.','Suzuki Association of the Americas','https://static1.squarespace.com/static/590a327459cc68c870460707/t/59c14d990abd04286b87c33b/1505840540058/Practicing+Games-A+Collection.pdf',1,'2020-01-01',20,'https://cdn.pixabay.com/photo/2018/09/25/19/00/autumn-3702845__480.jpg','Record')
GO

INSERT INTO [dbo].[Games]
           ([Name],[IsActive],[Songs],[Description],[PreworkLevelId],[Prework],[Instructions],[Credit],[WebsiteUrl],[SubmittedByUserId],[DateCreated],[GameIconId],[PhotoUrl],[Keywords])
VALUES(
'Chip Game',1,'','Practice difficult spots and make it a competition of who wins the most chips or tokens! Will it be the parent or the child?',2,'Get together the �chips� you want to use.','1. Set a goal�for example, keeping thumb bent while playing piece or keeping a good 5 posture for entire piece. 2. Give child and parent 5 chips each. 
 3. If child meets goal, gets a chip from parent. If misses goal, parent gets a chip. 
 4. Keep playing until someone has all of the chips.','Suzuki Association of the Americas','https://static1.squarespace.com/static/590a327459cc68c870460707/t/59c14d990abd04286b87c33b/1505840540058/Practicing+Games-A+Collection.pdf',2,'2020-01-01',21,'https://cdn.pixabay.com/photo/2016/06/03/05/03/tokens-1432747__480.jpg','Review, Skills, Practice Spot'
 )
 GO

 ALTER TABLE Games ALTER COLUMN Instructions nvarchar(2500)

 INSERT INTO [dbo].[Games]
           ([Name],[IsActive],[Songs],[Description],[PreworkLevelId],[Prework],[Instructions],[Credit],[WebsiteUrl],[SubmittedByUserId],[DateCreated],[GameIconId],[PhotoUrl],[Keywords])
VALUES(
'Cheating Chess (or any other game!)',1,'','I like to play chess (and Cheating Chess is good alliteration) but you can adapt most two player games. Noughts and crosses (X-O) is probably the simplest game to use with young children, although you may have to get used to losing a lot of games!',2,'Get the game you want to use ready.','The rules are simple. 1. Divide the new piece or section to be learned into smaller sections (the teacher may do this during the lesson). 2. The student makes their first move. 3. The student then plays one of the phrases. If the notes are 100% correct, they get another move. Note that if they are just learning this piece it is the notes that need to be 100% correct. They may hesitate or stop and work notes out while playing. 4. The student then plays the same phrase again. If the notes are 100% correct, they move again. 5. Each section is played five times. If the student gets 100% correct notes all five times... a bonus move is awarded! This game is great for making sure students are playing with 100% correct notes right from the start when learning new pieces. It also gently gives them some early experience of playing under pressure. Each time they play correctly they are one step nearer to the bonus move so the pressure they are playing under is gradually, but subtly increased. As they progress through the week extra restrictions may be added such as 100% notes and correct timing at a certain metronome speeds, inclusion of dynamics etc. Some people have asked me about playing the learning new pieces games for money with the students. They earn money for each time they get it 100% correct. I am not a great fan of using money to encourage practice, because the money becomes the reason for practice, not the progress in playing. Having said that, if you were to do this I would advise making it count towards something musical such as an upgrade to their instrument, new music, CDs, an iPod or similar. The student does not actually get the money - it is put into the instrument upgrade fund. Additionally, to preserve the gradually increasing pressure the amount needs to go up slightly for each time the section is played correctly.','Simon Horsey via Suzuki Association of the Americas','https://static1.squarespace.com/static/590a327459cc68c870460707/t/59c14d990abd04286b87c33b/1505840540058/Practicing+Games-A+Collection.pdf',3,'2020-01-01',22,'https://cdn.pixabay.com/photo/2014/04/05/11/40/chess-316657__480.jpg','Review, Skills, Practice Spot'
)
 GO

 INSERT INTO [dbo].[Games]
           ([Name],[IsActive],[Songs],[Description],[PreworkLevelId],[Prework],[Instructions],[Credit],[WebsiteUrl],[SubmittedByUserId],[DateCreated],[GameIconId],[PhotoUrl],[Keywords])
VALUES(
'Just a minute',1,'','The aim of this game is very simple: to see how many times can you play a section with 100% correct notes in a minute when learning new pieces.',1,'None','This can be played with somebody timing you or on your own if you have a countdown timer on your watch or mobile � Divide the piece or section into smaller sections � Either set a countdown timer for a minute or, if possible, have somebody with a stopwatch to time you � Play through a section as many times as you can with 100% correct notes in a minute. You can stop to work notes out if you are not sure - in fact, this is encouraged as you would lose 2 points for getting a note wrong! � Score 1 point for each time you play correctly and minus 2 points for each time you make a mistake (that is getting even a single note wrong by-the-way!) � Check your score on all sections you are learning. There are various options for winning this game. You or a teacher can set a target score to achieve for each section, you can play against one or more friends to see who gets the highest score or you can find which section has the highest score and have a target of getting all sections to that score.','Simon Horsey via Suzuki Association of the Americas','https://static1.squarespace.com/static/590a327459cc68c870460707/t/59c14d990abd04286b87c33b/1505840540058/Practicing+Games-A+Collection.pdf',4,'2020-01-01',23,'https://cdn.pixabay.com/photo/2014/06/18/13/23/time-371226__480.jpg','Review, Skills, Practice Spot'
)
 GO

 INSERT INTO [dbo].[Games]
           ([Name],[IsActive],[Songs],[Description],[PreworkLevelId],[Prework],[Instructions],[Credit],[WebsiteUrl],[SubmittedByUserId],[DateCreated],[GameIconId],[PhotoUrl],[Keywords])
VALUES(
'Collect the animals',1,'','For this game you need some pictures of animals printed. Eight should usually be enough. Try to pick animals your child/student likes. Use picture - not just the word written on a piece of paper. One enterprising parent said she played this with silhouettes and the student got extra points for recognizing the shapes! You could also play this game with cards using a single suit or the picture cards. Anything collectable. The aim of the game is to collect all the animals.',2,'Collect the animals or cards or toys you want to use.','The rules of the game are � Divide the piece to be learned into small sections (2 - 4 bars each depending on the length of the piece) � Label each section as one of the animals (cards, etc.) you have � The student chooses which animal they will attempt. Once this decision is made they cannot go back and change until that animal is achieved. � To win the animal they must play the section five times in a row 100% correctly. � One an animal is achieved they have to play the section 3 times in a row correctly to keep it on subsequent days. If they make a mistake during those three times the animal goes back and they have to win it again. � Organize some kind of prize or treat (it could be animal related!) if they have all the animals at the end of the week. If they have them all in the middle but lose them by the end there is no prize � Optional: They can lose an animal for each day they d not practice during the week. This is a great way to keep them working if they manage to collect them all early in the week! One of the keys to success when learning new pieces is constant review. Playing practice games when learning new pieces helps the time go quicker and makes practice a positive experience. Having early positive experiences when practicing is essential as students progress much further and faster if they have a positive attitude to practice.','Simon Horsey via Suzuki Association of the Americas','https://static1.squarespace.com/static/590a327459cc68c870460707/t/59c14d990abd04286b87c33b/1505840540058/Practicing+Games-A+Collection.pdf',5,'2020-01-01',25,'https://cdn.pixabay.com/photo/2017/03/22/14/01/toys-2165123__480.jpg','Review, Skills, Practice Spot, Animals'
)
 GO

 INSERT INTO [dbo].[Games]
           ([Name],[IsActive],[Songs],[Description],[PreworkLevelId],[Prework],[Instructions],[Credit],[WebsiteUrl],[SubmittedByUserId],[DateCreated],[GameIconId],[PhotoUrl],[Keywords])
VALUES(
'Loopy Loops',1,'','Playing something over and over is known as a repetition or a loop. Loops are very important for training your fingers and your muscles.',1,'None','Here are ways to make your repetitions fun: � Play each repetition while also doing a funny trick like: sticking out your tongue, standing on one foot, closing both eyes, closing one eye, doing a fish mouth, laying down on the floor, or wiggling as you play. For a bonus, see if you can do more than one of these tricks at the same time! � For each repetition, place a random object on top of your head. See how many you can fit. This will probably look pretty silly, but with each new repetition, you get to put something new on your head. In addition to being fun, keeping things balanced on your head can be a great way to improve your posture! � Sometimes moving to different locations makes practicing more fun. Make numbered cards and place them around the room or around the house and stand by them or on them, in order, for each repetition. Number your cards 1-5 or 1-10 depending on how many repetitions you�re going to play. Save the cards for future practicing. � Roll one or two dice to see how many times to repeat a passage. You can also use this idea to see which song to play during review sessions. (The number on the dice equals the song number in the book.)','Stephanie Railsback via Suzuki Association of the Americas','https://static1.squarespace.com/static/590a327459cc68c870460707/t/59c14d990abd04286b87c33b/1505840540058/Practicing+Games-A+Collection.pdf',6,'2020-01-01',26,'https://cdn.pixabay.com/photo/2015/06/08/15/02/rollercoaster-801833__480.jpg','Review, Skills, Practice Spot'
)
 GO

 INSERT INTO [dbo].[Games]
           ([Name],[IsActive],[Songs],[Description],[PreworkLevelId],[Prework],[Instructions],[Credit],[WebsiteUrl],[SubmittedByUserId],[DateCreated],[GameIconId],[PhotoUrl],[Keywords])
VALUES(
'Music Director',1,'','Have your parent video tape you while you play. Then, watch the video to see what improvements you can make. If you were the teacher, what would you say was good about your performance and what needs improvement?',1,'None','Have your parent video tape you while you play. Then, watch the video to see what improvements you can make. If you were the teacher, what would you say was good about your performance and what needs improvement?','Stephanie Railsback via Suzuki Association of the Americas','https://static1.squarespace.com/static/590a327459cc68c870460707/t/59c14d990abd04286b87c33b/1505840540058/Practicing+Games-A+Collection.pdf',7,'2020-01-01',27,'https://media.istockphoto.com/photos/young-women-watching-movie-on-a-laptop-at-home-picture-id1182930194?b=1&k=6&m=1182930194&s=170667a&w=0&h=4pSzlP1iqpKLsuQRgMGJAjMZfMBinmqKF4kyrhnehfY=','Review, Skills, Practice Spot, Video, Record'
)
 GO

 INSERT INTO [dbo].[Games]
           ([Name],[IsActive],[Songs],[Description],[PreworkLevelId],[Prework],[Instructions],[Credit],[WebsiteUrl],[SubmittedByUserId],[DateCreated],[GameIconId],[PhotoUrl],[Keywords])
VALUES(
'Parent Treasure Hunt',1,'','Child plans a treasure hunt for the parent!',1,'None','With your mom or dad out of the room, hide your rosin, pencil, or metronome. When your parent returns, tell them what you hid. (But, don�t tell them where!!) Their goal will be to find the hidden item. � Start playing repetitions of your song. Play louder when your parent gets closer to the hidden object and play softer when they get farther away from it. Keep up this pattern until they find the hidden object. � This is a fun way to review pieces and to practice playing different dynamics!','Stephanie Railsback via Suzuki Association of the Americas','https://static1.squarespace.com/static/590a327459cc68c870460707/t/59c14d990abd04286b87c33b/1505840540058/Practicing+Games-A+Collection.pdf',8,'2020-01-01',28,'https://cdn.pixabay.com/photo/2018/04/04/19/25/3-3290798__480.jpg','Review, Skills, Practice Spot, Treasure Hunt'
)
 GO

 INSERT INTO [dbo].[Games]
           ([Name],[IsActive],[Songs],[Description],[PreworkLevelId],[Prework],[Instructions],[Credit],[WebsiteUrl],[SubmittedByUserId],[DateCreated],[GameIconId],[PhotoUrl],[Keywords])
VALUES(
'Five Pairs in a Row',1,'','Find five pairs of matching cards.',2,'Get a memory game.','Line up one card from each pair on a table or on the floor. Keep the other cards. � Each time you play through a song successfully, put down a matching card to make a pair. You win the game when all five pairs are matched.','Stephanie Railsback via Suzuki Association of the Americas','https://static1.squarespace.com/static/590a327459cc68c870460707/t/59c14d990abd04286b87c33b/1505840540058/Practicing+Games-A+Collection.pdf',9,'2020-01-01',29,'https://target.scene7.com/is/image/Target/GUEST_8a6590b9-a5c7-4bfb-87f9-25c49ec836a8?wid=253&hei=253&qlt=80&fmt=webp','Review, Skills, Practice Spot, Cards')
 GO

INSERT INTO [dbo].[Games]
           ([Name],[IsActive],[Songs],[Description],[PreworkLevelId],[Prework],[Instructions],[Credit],[WebsiteUrl],[SubmittedByUserId],[DateCreated],[GameIconId],[PhotoUrl],[Keywords])
VALUES(
'Envelope/Cup Game',1,'','Keep it interesting - hide prizes and they�ll keep practicing �till they get them all!',2,'Get the prizes ready.','Place a variety of envelopes out for view, but put a candy/gum/prize in one envelope. For every repetition that meets a practice goal, the student can open an envelope. You can do the same thing with inverted cups. Repetitions continue until the prize is found!','Suzuki Association of the Americas','https://static1.squarespace.com/static/590a327459cc68c870460707/t/59c14d990abd04286b87c33b/1505840540058/Practicing+Games-A+Collection.pdf',1,'2020-01-01',30,'https://cdn.pixabay.com/photo/2017/02/21/22/11/candy-2087625__480.jpg','Review, Skills, Practice Spot, Prizes'
)
GO

INSERT INTO [dbo].[Games]
           ([Name],[IsActive],[Songs],[Description],[PreworkLevelId],[Prework],[Instructions],[Credit],[WebsiteUrl],[SubmittedByUserId],[DateCreated],[GameIconId],[PhotoUrl],[Keywords])
VALUES(
'Balancing Game',1,'','Let them laugh with you!',1,'None','For the kids that are getting grumpy and grumbly about repetitions, I will sometimes place a random object on top of my head for each correct repetition of practice goal they complete. This sounds and looks ridiculous, but that is the whole point� the kids will do an unearthly number of repetitions just to see how many folders you can stick on your head. They will also then want to do it themselves, which will help improve posture!!','Suzuki Association of the Americas','https://static1.squarespace.com/static/590a327459cc68c870460707/t/59c14d990abd04286b87c33b/1505840540058/Practicing+Games-A+Collection.pdf',2,'2020-01-01',31,'https://cdn.pixabay.com/photo/2015/10/26/01/48/girl-1006574__480.jpg','Silly'
)
GO

INSERT INTO [dbo].[Games]
           ([Name],[IsActive],[Songs],[Description],[PreworkLevelId],[Prework],[Instructions],[Credit],[WebsiteUrl],[SubmittedByUserId],[DateCreated],[GameIconId],[PhotoUrl],[Keywords])
VALUES(
'Multitasking Game',1,'','Let them be silly!',1,'None','Have the child do each repetition doing a different physical thing; sticking out tongue, closing eyes, standing on one foot, doing fishy mouth, mouth wide open, one eye closed, making rabbit face, wiggling bottom etc. For a silly bonus rep have them try to do all of the things at the same time��','Suzuki Association of the Americas','https://static1.squarespace.com/static/590a327459cc68c870460707/t/59c14d990abd04286b87c33b/1505840540058/Practicing+Games-A+Collection.pdf',3,'2020-01-01',31,'https://cdn.pixabay.com/photo/2015/02/04/14/36/child-623851__480.jpg','Silly'
)
GO

INSERT INTO [dbo].[Games]
           ([Name],[IsActive],[Songs],[Description],[PreworkLevelId],[Prework],[Instructions],[Credit],[WebsiteUrl],[SubmittedByUserId],[DateCreated],[GameIconId],[PhotoUrl],[Keywords])
VALUES(
'Musical Hopscotch',1,'','Hop to it!',2,'With the child, draw the hopscotch game.','After making a list of ten things that need practicing, the child tosses a pair of rolled up socks or a coin. The child hops out and retrieves the object and then plays a given goal/exercise/phrase/activity corresponding to the number. This game is time-consuming so plan accordingly. Hope you have fun.','Suzuki Association of the Americas','https://static1.squarespace.com/static/590a327459cc68c870460707/t/59c14d990abd04286b87c33b/1505840540058/Practicing+Games-A+Collection.pdf',4,'2020-01-01',32,'https://cdn.pixabay.com/photo/2016/04/13/01/13/hopscotch-1325854__480.jpg','Review, Skills, Practice Spot, Outdoors'
)
GO

INSERT INTO [dbo].[Games]
           ([Name],[IsActive],[Songs],[Description],[PreworkLevelId],[Prework],[Instructions],[Credit],[WebsiteUrl],[SubmittedByUserId],[DateCreated],[GameIconId],[PhotoUrl],[Keywords])
VALUES(
'Question Game',1,'','Based on a game Dr Suzuki used to play with his students.',1,'None','�Play for me the first Twinkle variation (or any piece, really � it depends on the student�s age and level), and while you are playing you have to answer my questions, without stopping or making a mistake.�
 �Ok, that�s easy!�
 We begin playing the piece together. (I�ve got to be able to ask the questions while softly playing, too.)
 After half a phrase I call out, �How many eyes have you got?�
 �Two!�
 Big smiles. �How many ears have you got?�
 �Two!�
 �How many feet?�
 �Two!!�
 �How many hands?�
 �Two!!�
 (Can you see what�s coming?)
 �How many noses have you got?�
 Bigger smiles now, and the little violinist answers, �Two!!!� or just looks at me, laughing and trying to keep playing, while giggles and guffaws break out from the parents.
 Once they�ve got used to how the game works, I venture more complicated questions such as, �How old are you at your next birthday? What�s 11 plus 3?� and finally, �What is your telephone number at home � backwards?�','John Berger','https://teachsuzuki5.com/category/games/',5,'2020-01-01',33,'https://cdn.pixabay.com/photo/2015/06/28/21/21/person-824921__480.jpg','Review, Skills, Practice Spot'
)
GO

INSERT INTO [dbo].[Games]
           ([Name],[IsActive],[Songs],[Description],[PreworkLevelId],[Prework],[Instructions],[Credit],[WebsiteUrl],[SubmittedByUserId],[DateCreated],[GameIconId],[PhotoUrl],[Keywords])
VALUES(
'Bingo Game',1,'','B-I-N-G-O!',2,'Make your own bingo cards with different notes and rhythms on each square and pass them out to students.','After you play a note or rhythm, students will check their board to see if it�s present. If it is, they will place a penny on the appropriate square. The first person with five pennies in a row wins!','TakeLessons','https://takelessons.com/blog/5-games-for-kids-z08',6,'2020-01-01',33,'https://takelessons.com/blog/wp-content/uploads/2015/09/2.Bingo_.jpg','Practice Spot, Review, Bingo'
)
GO

GO
INSERT INTO [dbo].[Games]
           ([Name],[IsActive],[Songs],[Description],[PreworkLevelId],[Prework],[Instructions],[Credit],[WebsiteUrl],[SubmittedByUserId],[DateCreated],[GameIconId],[PhotoUrl],[Keywords])
VALUES(
'What Note Am I?',1,'','This violin game is very similar to the game �Who Am I?� but instead of guessing what famous person they are, students will guess what note they are.',3,'Start by making large cards with notes.','Hand out a card to each student and have them place it on their forehead without peeking. Then have the students ask each other questions to find out what note is on their card; for example, �Do I have a stem?�','TakeLessons','https://takelessons.com/blog/5-games-for-kids-z08',7,'2020-01-01',34,'https://takelessons.com/blog/wp-content/uploads/2015/09/3.-What-Note-Am-I.jpg','Music Reading, Notes, Car, Travel')
GO

INSERT INTO [dbo].[Games]
           ([Name],[IsActive],[Songs],[Description],[PreworkLevelId],[Prework],[Instructions],[Credit],[WebsiteUrl],[SubmittedByUserId],[DateCreated],[GameIconId],[PhotoUrl],[Keywords])
VALUES(
'Who Am I?',1,'','Show students photos of composers and have them guess their names and where they are from.',2,'Print pictures of composers.','Show students photos of composers and have them guess their names and where they are from.','Andra Prewett','',8,'2020-01-01',35,'https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/Chevalier_de_Saint-Georges.JPG/440px-Chevalier_de_Saint-Georges.JPG','Music History, Composers, Car, Travel'
)
GO

INSERT INTO [dbo].[Games]
           ([Name],[IsActive],[Songs],[Description],[PreworkLevelId],[Prework],[Instructions],[Credit],[WebsiteUrl],[SubmittedByUserId],[DateCreated],[GameIconId],[PhotoUrl],[Keywords])
VALUES(

'Simon Says',1,'','Repetition is the mother of learning!',1,'None','Take on the role of �Simon� and issue instructions to the student(s). For example, when you play A on the 5, the kids have to sit down, or when you play E, the kids have to stand up. You can go as slow or fast as you want depending on the skill level of the group
 For more advanced students > you can play parts of a song and have them imitate','TakeLessons','https://takelessons.com/blog/5-games-for-kids-z08',9,'2020-01-01',36,'https://takelessons.com/blog/wp-content/uploads/2015/09/4.-Simon-Says.jpg','Repetition, Notes, Review Songs, For the parent who plays')
GO

INSERT INTO [dbo].[Games]
           ([Name],[IsActive],[Songs],[Description],[PreworkLevelId],[Prework],[Instructions],[Credit],[WebsiteUrl],[SubmittedByUserId],[DateCreated],[GameIconId],[PhotoUrl],[Keywords])
VALUES(
'Pass the Cup',1,'','Pass the cup with your bow!',1,'None','Start by having one student place a small, clear plastic cup over the tip of his or her 5 bow. The student will then pass the cup to the next person in line. The student can only pass the cup if the receiving student�s bow is pointed up toward the ceiling and has a proper bow hold.','TakeLessons','https://takelessons.com/blog/violin-games-for-kids-z08',3,'2020-01-01',37,'https://takelessons.com/blog/wp-content/uploads/2015/09/11.Pass-the-Cup.jpg','Bow'
)
GO

INSERT INTO [dbo].[Games]
           ([Name],[IsActive],[Songs],[Description],[PreworkLevelId],[Prework],[Instructions],[Credit],[WebsiteUrl],[SubmittedByUserId],[DateCreated],[GameIconId],[PhotoUrl],[Keywords])
VALUES(
'Spot the Mistake',1,'','Let your child correct you!',1,'None','Start by showing students the proper bow hold, then ask them to close their eyes while you set up your bow hold with one obvious mistake; for example, a straight thumb. Once you�re ready, ask students to open their eyes and spot the mistake.','TakeLessons','https://takelessons.com/blog/violin-games-for-kids-z08',4,'2020-01-01',38,'https://takelessons.com/blog/wp-content/uploads/2015/09/12.-Spot-the-Mistake.jpg','Bow, For the parent who plays'
)
GO