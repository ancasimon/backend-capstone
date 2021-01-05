CREATE TABLE [dbo].[Files](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FileName] [varchar](500) NOT NULL,
	[FileContent] [varbinary](max) NOT NULL,
	[FileContentType] [varchar](255) NOT NULL,
	[FileLength] [int] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

select *
from Files

-- Add a new column in the Users table to track the ID of the file the user uploaded so we can associate with their user ID and display it:
 ALTER TABLE Users
 Add ImageFileId int null