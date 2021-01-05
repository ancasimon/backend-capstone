CREATE TABLE [dbo].[Files](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FileName] [varchar](500) NOT NULL,
	[FileContent] [varbinary](max) NOT NULL,
	[FileContentType] [varchar](255) NOT NULL,
	[FileLength] [int] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]