-- ADd new table to store the photos uploaded for games:
CREATE TABLE [dbo].[GamePhotos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FileName] [varchar](500) NOT NULL,
	[FileContent] [varbinary](max) NOT NULL,
	[FileContentType] [varchar](255) NOT NULL,
	[FileLength] [int] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

-- Add a new column in the Games table to track the ID of the file the user uploaded for that game so we can associate them and display the game photo on the game details page:
 ALTER TABLE Games
 Add GamePhotoId int null

 select *
 from Games

 select *
 from GamePhotos