USE [QProject]
GO
/****** Object:  Table [dbo].[Blog]    Script Date: 2023/4/13 16:16:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](256) NOT NULL,
	[Content] [text] NOT NULL,
	[CreateUserId] [int] NOT NULL,
	[CreatedTime] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FileStore]    Script Date: 2023/4/13 16:16:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FileStore](
	[FCID] [varchar](100) NOT NULL,
	[Name] [varchar](100) NULL,
	[SuffixName] [varchar](100) NULL,
	[FilePath] [varchar](max) NULL,
	[FilePathByte] [varbinary](max) NULL,
 CONSTRAINT [PK_FileStore] PRIMARY KEY CLUSTERED 
(
	[FCID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProjectFileInfo]    Script Date: 2023/4/13 16:16:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectFileInfo](
	[FIID] [nvarchar](100) NOT NULL,
	[FCID] [nvarchar](100) NULL,
	[FlieName] [nvarchar](100) NULL,
	[UploadName] [nvarchar](100) NULL,
	[IdCardInform] [nvarchar](100) NULL,
	[Unit] [nvarchar](100) NULL,
	[CreateTime1] [datetime] NULL,
	[EndTime] [datetime] NULL,
 CONSTRAINT [PK_ProjectFileInform] PRIMARY KEY CLUSTERED 
(
	[FIID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProjectFileMean]    Script Date: 2023/4/13 16:16:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectFileMean](
	[FCID] [varchar](50) NOT NULL,
	[FatherNode] [varchar](50) NULL,
	[ListName] [varchar](256) NOT NULL,
	[ListMenuCode] [varchar](50) NOT NULL,
	[MenuLevel] [int] NULL,
	[CreateTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
 CONSTRAINT [PK_ProjectFileMean] PRIMARY KEY CLUSTERED 
(
	[FCID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 2023/4/13 16:16:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](64) NOT NULL,
	[Birthday] [datetime] NULL,
	[CreatedTime] [datetime] NOT NULL,
 CONSTRAINT [PK__User__3214EC07687BC3C8] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserBlog]    Script Date: 2023/4/13 16:16:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserBlog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[BlogId] [int] NOT NULL,
	[StarStarte] [int] NULL,
 CONSTRAINT [PK__UserBlog__3214EC07C7AD2AA9] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Blog] ADD  DEFAULT (getdate()) FOR [CreatedTime]
GO
ALTER TABLE [dbo].[ProjectFileInfo] ADD  CONSTRAINT [DF_ProjectFileInfo_CreateTime1]  DEFAULT (getdate()) FOR [CreateTime1]
GO
ALTER TABLE [dbo].[ProjectFileInfo] ADD  CONSTRAINT [DF_ProjectFileInfo_EndTime]  DEFAULT (getdate()) FOR [EndTime]
GO
ALTER TABLE [dbo].[ProjectFileMean] ADD  CONSTRAINT [DF_ProjectFileMean_CreateTime]  DEFAULT (getdate()) FOR [CreateTime]
GO
ALTER TABLE [dbo].[ProjectFileMean] ADD  CONSTRAINT [DF_ProjectFileMean_EndTime]  DEFAULT (getdate()) FOR [EndTime]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF__User__CreatedTim__49C3F6B7]  DEFAULT (getdate()) FOR [CreatedTime]
GO
ALTER TABLE [dbo].[Blog]  WITH CHECK ADD  CONSTRAINT [FK_Blog_User] FOREIGN KEY([CreateUserId])
REFERENCES [dbo].[User] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Blog] CHECK CONSTRAINT [FK_Blog_User]
GO
ALTER TABLE [dbo].[UserBlog]  WITH CHECK ADD  CONSTRAINT [FK_UserBlog_Blog] FOREIGN KEY([BlogId])
REFERENCES [dbo].[Blog] ([Id])
GO
ALTER TABLE [dbo].[UserBlog] CHECK CONSTRAINT [FK_UserBlog_Blog]
GO
ALTER TABLE [dbo].[UserBlog]  WITH CHECK ADD  CONSTRAINT [FK_UserBlog_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[UserBlog] CHECK CONSTRAINT [FK_UserBlog_User]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FileStore', @level2type=N'COLUMN',@level2name=N'FCID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FileStore', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件后缀名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FileStore', @level2type=N'COLUMN',@level2name=N'SuffixName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件以byte格式存储' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FileStore', @level2type=N'COLUMN',@level2name=N'FilePathByte'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProjectFileInfo', @level2type=N'COLUMN',@level2name=N'FCID'
GO
